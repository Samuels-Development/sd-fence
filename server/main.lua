local QBCore = exports['qb-core']:GetCoreObject()

-- Sell Items

local function getItemPrice(itemName)
    for i = 1, #Config.Items do
        local item = Config.Items[i]
        if item.item == itemName then
            return item.price
        end
    end
end

RegisterServerEvent("sd-fence:server:sellItems")
AddEventHandler("sd-fence:server:sellItems", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 0
    local itemsSold = false

    for k, item in pairs(Player.PlayerData.items) do 
        if item ~= nil then 
            for _, itemInfo in pairs(Config.Items) do
                if itemInfo.item == item.name then
                    price = price + (itemInfo.price * item.amount)
                    Player.Functions.RemoveItem(item.name, item.amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove", item.amount)
                    itemsSold = true
                    break
                end
            end
        end
    end

    if not itemsSold then
        TriggerClientEvent('QBCore:Notify', src, "You don't have anything I want..", 'error')
    else
        Player.Functions.AddMoney("cash", price)
        TriggerClientEvent('QBCore:Notify', src, "Thanks! Bring me more whenever you can!", 'success')
    end
end)