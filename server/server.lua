ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

RegisterServerEvent("guille_dispatch:sendAlert")
AddEventHandler("guille_dispatch:sendAlert", function(text, coords)
    TriggerClientEvent("guille_dispatch:alertToClient", -1, text, coords)
end)

RegisterServerEvent("guille_dispatch:sendAmbuAlert")
AddEventHandler("guille_dispatch:sendAmbuAlert", function(text, coords)
    TriggerClientEvent("guille_dispatch:auxToClient", -1, text, coords)
end)

RegisterServerEvent("guille_dispatch:sendMecaAlert")
AddEventHandler("guille_dispatch:sendMecaAlert", function(text, coords)
    TriggerClientEvent("guille_dispatch:mecaToClient", -1, text, coords)
end)

RegisterServerEvent("guille_dispatch:sendVehRob")
AddEventHandler("guille_dispatch:sendVehRob", function(text, coords, model)
    TriggerClientEvent("guille_dispatch:vehToClient", -1, text, coords, model)
end)

RegisterServerEvent("guille_dispatch:sendTaxiaAlert")
AddEventHandler("guille_dispatch:sendTaxiaAlert", function(text, coords)
    TriggerClientEvent("guille_dispatch:taxiToClient", -1, text, coords)
end)

RegisterServerEvent("guille_dispatch:sendRobaAlert")
AddEventHandler("guille_dispatch:sendRobaAlert", function(type, text, coords)
    TriggerClientEvent("guille_dispatch:robberyToClient", -1, type, text, coords)
end)
