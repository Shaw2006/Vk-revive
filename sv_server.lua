local QBcore = exports['qb-core']:GetCoreObject()

Qbcore.Functions.CreateUseableItem("medkit" , function (source , item)
    local Player = Qbcore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem("medkit" , 1 ) then 
        TriggerClientEvent ('Vk-revive:cl_client:findDead' , source)
    else 
        TriggerClientEvent('QBCore:Notify' , source ,"You Dont Have a Medkit" ,"error")
    end
end)

RegisterNetEvent('Vk-revive:sv_server:completeRevive', function (targetId)
    local src = source
    local Target = QBcore.Functions.GetPlayer(targetId)


    if Target then 
        TriggerClientEvent('hospital:cl_client:revive')
        TriggerClientEvent('QBcore:Notify' , targetId , "You have been Revived by Another player ! " ,"success")
        TriggerClientEvent('QBcore:Notify' , src ,"You revived the player " , "Success")

end)