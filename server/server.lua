ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

RegisterServerEvent("guille_dispatch:sendAlert")
AddEventHandler("guille_dispatch:sendAlert", function(text, coords)
    local xPlayers = ESX.GetPlayers() 
    for i=1, #xPlayers, 1 do
        TriggerClientEvent("guille_dispatch:alertToClient", xPlayers[i], text, coords)
    end
end)

RegisterServerEvent("guille_dispatch:sendVehRob")
AddEventHandler("guille_dispatch:sendVehRob", function(text, coords, model)
    local xPlayers = ESX.GetPlayers() 
    for i=1, #xPlayers, 1 do
        TriggerClientEvent("guille_dispatch:vehToClient", xPlayers[i], text, coords, model)
    end
end)