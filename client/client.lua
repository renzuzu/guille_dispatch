local calls = {}
local callnum = 0
local config = false
local showed = false
local PlayerData = {}

ESX = nil 

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterCommand("showalerts", function()
    if PlayerData.job and PlayerData.job.name == 'police' then
        if not showed then
            SendNUIMessage({
                show = true;
            })
            showed = true
        else
            SendNUIMessage({
                show = false;
            })
            showed = false
        end
    else
        ESX.ShowNotification('No eres policia')
    end
end, false)

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Citizen.Wait(2000)
        SendNUIMessage({
            callnum = 0;
        })
    end
end)

RegisterNetEvent("guille_dispatch:alertToClient")
AddEventHandler("guille_dispatch:alertToClient", function(text, coords)
    callnum = callnum + 1
    SendNUIMessage({
        content = text;
        callnum = callnum;
        newalert = true;
    })
    table.insert(calls, {text = text, coords = coords})
end)

RegisterNetEvent("guille_dispatch:vehToClient")
AddEventHandler("guille_dispatch:vehToClient", function(text, coords, model)
    callnum = callnum + 1
    SendNUIMessage({
        content = text;
        callnum = callnum;
        pic = true;
        model = model;
        newalert = true;

    })
    table.insert(calls, {text = text, coords = coords, model = model})
end)

RegisterCommand("forzar", function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        local coords = GetEntityCoords(PlayerPedId())
        local text = "Un hombre ha robado un vehiculo modelo " ..model.. ", he conseguido una foto del vehículo. Atrapad a ese tonto"
        TriggerServerEvent("guille_dispatch:sendVehRob", text, coords, model)
    end
end, false)

RegisterCommand("entorno", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("guille_dispatch:sendAlert", text, coords)
    --update911s()
end, false)


RegisterCommand("right", function()
    if calls[callnum + 1] ~= nil then
        local num = callnum + 1
        if calls[callnum + 1]['model'] ~= nil then
            SendNUIMessage({
                content = calls[callnum + 1]['text'];
                callnum = num;
                right = true;
                pic = true;
                model = calls[callnum + 1]['model'];
            })
        else
            SendNUIMessage({
                content = calls[callnum + 1]['text'];
                callnum = num;
                right = true;
            })
        end
        callnum = callnum + 1 
    end
end, false)

RegisterCommand("left", function()
    if calls[callnum - 1] ~= nil then
        local num = callnum - 1
        if calls[callnum - 1]['model'] ~= nil then
            SendNUIMessage({
                content = calls[callnum - 1]['text'];
                callnum = num;
                left = true;
                pic = true;
                model = calls[callnum - 1]['model'];
            })
        else
            SendNUIMessage({
                content = calls[callnum - 1]['text'];
                callnum = num;
                left = true;
            })
        end
        callnum = callnum - 1 
    end
end, false)

RegisterCommand("mover", function(source, args)
    SetNuiFocus(true, true)
    SendNUIMessage({
        inConfig = true;
    })
end, false)

RegisterCommand("accept", function(source, args)
    if callnum ~= 0 then
        SetNewWaypoint(calls[callnum]['coords'])
        ESX.ShowNotification('Se ha marcado la posición en tu ~r~GPS')
        SendNUIMessage({
            avkey = true;
        })
    end
end, false)

RegisterKeyMapping("mover", ("tus muertos"), 'keyboard', 'i')

RegisterKeyMapping("right", ("tus muertos"), 'keyboard', 'right')

RegisterKeyMapping("left", ("tus muertos"), 'keyboard', 'left')

RegisterKeyMapping("accept", ("tus muertos"), 'keyboard', 'pageup')

RegisterKeyMapping("showalerts", ("tus muertos"), 'keyboard', 'f4')

RegisterNUICallback("exit", function()
    SetNuiFocus(false, false)
   
    if calls[callnum]['model'] ~= nil then
        SendNUIMessage({
            content = calls[callnum]['text'];
            callnum = num;
            pic = true;
            model = calls[callnum]['model'];
        })
    else
        SendNUIMessage({
            content = calls[callnum]['text'];
            callnum = num;
        })
    end
end)