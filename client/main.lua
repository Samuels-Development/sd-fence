local QBCore = exports['qb-core']:GetCoreObject()

local spawnedPeds = {}

-- Time Check

RegisterNetEvent('sd-fence:client:TimeCheck', function()
    local hours = GetClockHours()
    -- print(hours)
    if hours >= Config.MaximumTime or hours <= Config.MinimumTime then
        TriggerServerEvent('sd-fence:server:sellItems')
    else
        QBCore.Functions.Notify("Wait till it gets a bit darker..", "error")
    end
end)

-- Blip Creation

CreateThread(function()
    if Config.Blip.Enable then
        local blip = AddBlipForCoord(Config.Blip.Location)
        SetBlipSprite(blip, Config.Blip.Sprite)
        SetBlipDisplay(blip, Config.Blip.Display)
        SetBlipScale(blip, Config.Blip.Scale)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, Config.Blip.Colour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Blip.Name)
        EndTextCommandSetBlipName(blip)
    end
end)

-- Ped Creation

Citizen.CreateThread(function()
    for i, fence in pairs(Config.fenceNPC) do
        local hash = GetHashKey(fence.model)
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(100)
        end
    
        fence.ped = CreatePed(0, hash, fence.location, false, false)
        SetEntityAsMissionEntity(fence.ped, true, true)
        FreezeEntityPosition(fence.ped, true)
        SetEntityInvincible(fence.ped, true)
        SetBlockingOfNonTemporaryEvents(fence.ped, true)
        SetEntityHeading(fence.ped, fence.heading)
        exports['qb-target']:AddTargetEntity(Config.fenceNPC[i].ped, {
            options = {
                {
                    icon = "fas fa-hand",
                    label = 'Sell to Fence',
                    canInteract = function()
                        return true
                    end,
                    action = function()
                        TriggerEvent('sd-fence:client:TimeCheck')
                    end
                }
            },
            distance = 3.0
        })
    end
end)