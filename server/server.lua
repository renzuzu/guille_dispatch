ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

RegisterServerEvent("guille_dispatch:sendAlert")
AddEventHandler("guille_dispatch:sendAlert", function(text, coords, id)
    TriggerClientEvent("guille_dispatch:alertToClient", -1, text, coords, id)
end)

RegisterServerEvent("guille_dispatch:sendAmbuAlert")
AddEventHandler("guille_dispatch:sendAmbuAlert", function(text, coords, id)
    TriggerClientEvent("guille_dispatch:auxToClient", -1, text, coords, id)
end)

RegisterServerEvent("guille_dispatch:sendMecaAlert")
AddEventHandler("guille_dispatch:sendMecaAlert", function(text, coords, id)
    TriggerClientEvent("guille_dispatch:mecaToClient", -1, text, coords, id)
end)

RegisterServerEvent("guille_dispatch:sendVehRob")
AddEventHandler("guille_dispatch:sendVehRob", function(coords, model, color, id)
    TriggerClientEvent("guille_dispatch:vehToClient", -1, coords, model, color, id)
end)

RegisterServerEvent("guille_dispatch:sendTaxiaAlert")
AddEventHandler("guille_dispatch:sendTaxiaAlert", function(text, coords, id)
    TriggerClientEvent("guille_dispatch:taxiToClient", -1, text, coords, id)
end)

RegisterServerEvent("guille_dispatch:sendRobaAlert")
AddEventHandler("guille_dispatch:sendRobaAlert", function(type, coords, id)
    TriggerClientEvent("guille_dispatch:robberyToClient", -1, type, coords, id)
end)
