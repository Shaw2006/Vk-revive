local Qbcore = exports['qb-core']:GetCoreObject()
loacl isReviving = false



RegisterNetEvent('VK-revive:cl_client:beginRevive' , function(targetId)
    if isReviving then return end 
    isReviving = true

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed , "Scenario model" , 0 ,, true)
    QBcore.Functions.Notify("reviving palyer ... " , "primary" , 1000)


    -- wait 10 seconds  
    wiat (10000)
    ClearPedTasks(playerPed)

    TriggerServerEvent('Vk-revive:server:completeRevive' , targetId)
    isReviving = false
end)

RegisterNetEvent('Vk-revive:cl_client:findDead')
AddEventHandler('Vk-revive:cl_client:findDead' , function()
    local playerPed = PlayerPed()
    local coords = GetEntityCoords(playerPed)
    local players = QBcore.Functions.GetPlayers()
    local closesPlayer , closestDist = -1 , 3.0

    for i = 1 , #palyers do 
        local targetPed = GetPlayerPed(GetPlayerFromServerid(players[i]))
        if targetPed = playerPed and IsEntityDead(targetPed) then
            local dist = #(coords - GetEntityCoords(targetPed))
            if dist < closestDist then
                closestDist = dist
                closesPlayer = players[i]
            end
        end
    if closesPlayer = -1 then
        TriggerEvent ('Vk-revive:cl_client:beginRevive' , closesPlayer)
    else
        QBCore.Functions.Notify("NO Dead Player Nearby" , "error")
    end
end)