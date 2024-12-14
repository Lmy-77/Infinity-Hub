-- getgenv().Settings = {
--     fishName = '',
--     enchantName = '',
--     enabled = false
-- }




local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))();
local notifications = notificationLibrary.new({
    NotificationLifetime = 6,
    NotificationPosition = "Middle",
    TextFont = Enum.Font.GothamBold,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 18,
    TextStrokeTransparency = 0,
    TextStrokeColor = Color3.fromRGB(0, 0, 0)
});
notifications:BuildNotificationUI();
while getgenv().Settings.enabled do task.wait()
    for _, v in pairs(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Inventory:GetChildren()) do
        if v:IsA('StringValue') and v.Name:lower():find(getgenv().Settings.fishName) then
            for _, x in pairs(v:GetChildren()) do
                if x:IsA('StringValue') and x.Name == 'Mutation' then
                    if x.Value == getgenv().Settings.enchantName then
                        return notifications:Notify('Enchantment has been acquired')
                    end
                end
            end
        end
    end
    for _, v in pairs(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Inventory:GetChildren()) do
        if v:IsA('StringValue') and v.Name:lower():find(getgenv().Settings.fishName) then
            for _, x in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if x:IsA('Tool') and x.Name == v.Value then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(x)
                end
            end
        end
    end
    workspace.world.npcs.Appraiser.appraiser.appraise:InvokeServer()
end
