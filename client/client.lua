local calls = {}
local callnum = 0
local totalcalls = 0
local config = false
local showed = false
local PlayerData = {}
local leescupienlacaraledijelargateperraquetedenyoulocomanlaputamequeriarobarlachainnoesbromaporesodoyporculoalaschapiadoresfuckkhahkasfuckchapiadoresnoquierotuculozorraquetejodan = "crabgay"
local ifyousawwhatIdidthatdayinBrookmillParkyoudstayathomeIbackedmybladeandgrabbedhisneckIsplashedhimdownIfelthisbones = "crabgay"
local ChopabulletonyourbrainonyourchestNiggasbeefinonthatInternetshitWhentheyseemeniggasshowmerespectSivasconpussiesteconviertesengay = "crabgay"
local salgoalacalleunpococolocaoelninodepequenoamorlehafaltaosalgoconunflowqueatunovialeagustaoaminomesaludessinotehesaludao = "crabgay"
local MeescuchanenlallecaymishermanodelmoduloMihermanodiceDonttalktoomuchnohayquehablarmuchosocioSicojoatuholarevientocabronlepartoelculoendoLosmenorebuscandosucuartosololepidenfeaDios = "crabgay"
local bigrambomesudalapollaeltamanodeljambonomeestesfronteandositepilloconlacadenatelarobamosnotiransolofueronallidefrenteperoqueriaquesisinorespetansoymarroquitusoloeresunfalsomagrevibigrambomesudalapollaeltamanodeljambofuckpxrgvngboy = "eyoulokomanlaputamequerarobarlachain"
local nofacenocaseperodequeteescondessitueresunmaricon = {}
local tejuroquesolocaigounaveztejuroqueyaaprendilaleccion = {}
local scriptnigg = "Así que dile, dile que tenemo' uno' mile' Y si no me cree', pregunta cuanto' gramo' le compramo' al dealer Empaca, ve y dile Que andamo' con lo' winner' quemando kushin Dentro 'el area metro, no hay quien lo asimile Así que dile, dile que tenemo' uno' mile' Y si no me cree', pregunta cuanto' gramo' le compramo' al dealer Empaca, ve y dile Que andamo' con lo' winner' quemando kushin Dentro 'el area metro, no hay quien lo asimile"


ESX = nil 

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
    calls = {}
    callnum = 0
    totalcalls = 0
    SendNUIMessage({
        show = false;
        content = "Sin alertas";
        callnum = 0;
        totalcalls = 0;
        newalert = false;
    })
    showed = false
end)

RegisterCommand("showalerts", function()
    if PlayerData.job and PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'taxi' then
        if not showed then
            if checkTable(calls) then
                if calls[callnum]['model'] then
                    SendNUIMessage({
                        show = true;
                        pic = true;
                        model = calls[callnum]['model'];
                    })
                    showed = true
                else
                    SendNUIMessage({
                        show = true;
                    })
                    showed = true
                end
            else
                SendNUIMessage({
                    show = true;
                })
                showed = true
            end
        else
            SendNUIMessage({
                show = false;
            })
            showed = false
        end
    else
        ESX.ShowNotification('Tu trabajo no necesita central de alertas')
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
    if PlayerData.job and PlayerData.job.name == 'police' then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newalert = true;
        })
        table.insert(calls, {text = text, coords = coords})
    end
end)

RegisterNetEvent("guille_dispatch:vehToClient")
AddEventHandler("guille_dispatch:vehToClient", function(text, coords, model)
    if PlayerData.job and PlayerData.job.name == 'police' then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        if Config.enableVehiclePics then
            SendNUIMessage({
                content = text;
                callnum = callnum;
                totalcalls = totalcalls;
                pic = true;
                model = model;
                newalert = true;

            })
            table.insert(calls, {text = text, coords = coords, model = model})
        else
            SendNUIMessage({
                content = text;
                callnum = callnum;
                totalcalls = totalcalls;
                newalert = true;

            })
            table.insert(calls, {text = text, coords = coords})
        end
    end
end)

RegisterCommand("hola", function()
    TriggerEvent("guille_dispatch:robberyToClient", "pacific")
end, false)

RegisterCommand("auxilio", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("guille_dispatch:sendAmbuAlert", text, coords)
end, false)

RegisterCommand("meca", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("guille_dispatch:sendMecaAlert", text, coords)
end, false)

RegisterCommand("taxi", function(source, args)
    local text = table.concat(args, " ")
    local coords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("guille_dispatch:sendTaxiaAlert", text, coords)
end, false)

RegisterNetEvent("guille_dispatch:auxToClient")
AddEventHandler("guille_dispatch:auxToClient", function(text, coords)
    if PlayerData.job and PlayerData.job.name == 'ambulance' then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newambualert = true;
        })
        table.insert(calls, {text = text, coords = coords})
    end
    
end)
RegisterNetEvent("guille_dispatch:taxiToClient")
AddEventHandler("guille_dispatch:taxiToClient", function(text, coords)
    if PlayerData.job and PlayerData.job.name == 'taxi' then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newtaxialert = true;
        })
        table.insert(calls, {text = text, coords = coords})
    end
    
end)


RegisterNetEvent("guille_dispatch:mecaToClient")
AddEventHandler("guille_dispatch:mecaToClient", function(text, coords)
    if PlayerData.job and PlayerData.job.name == 'mechanic' then
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        SendNUIMessage({
            content = text;
            callnum = callnum;
            totalcalls = totalcalls;
            newmecaalert = true;
        })
        table.insert(calls, {text = text, coords = coords})
    end
    
end)


RegisterNetEvent("guille_dispatch:robberyToClient")
AddEventHandler("guille_dispatch:robberyToClient", function(type, coords)
    if PlayerData.job and PlayerData.job.name == 'police' then
        print("hey")
        callnum = callnum + 1
        totalcalls = totalcalls + 1
        if Config.enableRobberyPics then
            if type == "247" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un 24/7, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = 247;
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un 24/7, porfavor acudan!", coords = coords, model = 247})
            elseif type == "vangelico" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en la joyería, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "vangelico";
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en la joyería, porfavor acudan!", coords = coords, model = "vangelico"})
            elseif type == "ammunation" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un AmmuNation, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "ammunation";
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un AmmuNation, porfavor acudan!", coords = coords, model = "ammunation"})
            elseif type == "fleeca" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un Fleeca, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "fleeca";
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un Fleeca, porfavor acudan!", coords = coords, model = "fleeca"})
            elseif type == "humane" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "humane";
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!", coords = coords, model = "humane"})
            elseif type == "pacific" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en el Pacific Standard, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    pic = true;
                    model = "pacific";
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en el Pacific Standard, porfavor acudan!", coords = coords, model = "pacific"})
            end
        else
            if type == "247" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un 24/7, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un 24/7, porfavor acudan!", coords = coords})
            elseif type == "vangelico" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en la joyería, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en la joyería, porfavor acudan!", coords = coords})
            elseif type == "ammunation" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un AmmuNation, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un AmmuNation, porfavor acudan!", coords = coords})
            elseif type == "fleeca" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en un Fleeca, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en un Fleeca, porfavor acudan!", coords = coords})
            elseif type == "humane" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en los laboratorios Humane, porfavor acudan!", coords = coords})
            elseif type == "pacific" then
                SendNUIMessage({
                    content = "Se ha disparado una alarma en el Pacific Standard, porfavor acudan!";
                    callnum = callnum;
                    totalcalls = totalcalls;
                    newalert = true;

                })
                table.insert(calls, {text = "Se ha disparado una alarma en el Pacific Standard, porfavor acudan!", coords = coords})
            end
        end
    end
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
    if showed then 
        SetNuiFocus(true, true)
        SendNUIMessage({
            inConfig = true;
        })
    end
end, false)

RegisterCommand("acceptentorno", function(source, args)
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

RegisterKeyMapping("showalerts", ("tus muertos"), 'keyboard', 'f4')

RegisterKeyMapping("acceptentorno", ("tus muertos"), 'keyboard', 'o')

RegisterNUICallback("exit", function()
    SetNuiFocus(false, false)
    if checkTable(calls) then
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
    else
        if checkTable(calls) then
            SendNUIMessage({
                content = calls[callnum]['text'];
                callnum = num;
            })
        else
            SendNUIMessage({
                content = "Sin llamadas recibidas";
                callnum = num;
            })
        end
    end
end)

function checkTable(table)
    local init = false
    for k,v in pairs(calls) do
        inIt = true
    end
    if inIt then
        return true
    else
        return false
    end
end