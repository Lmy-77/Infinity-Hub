-- variables
local scriptVersion = '2.6a'
local mobsFolder = workspace:FindFirstChild("Objects"):FindFirstChild("Mobs")



-- library settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
    Title = 'Infinity Hub - '.. scriptVersion ..' | Jujutsu Infinite',
    SubTitle = "by lmy77",
    TabWidth = 120,
    Size = UDim2.fromOffset(830, 525),
    Resize = true,
    MinSize = Vector2.new(470, 380),
    Acrylic = false,
    Theme = "United GNOME",
    MinimizeKey = Enum.KeyCode.K
}
Library:Notify{
    Title = "Infinity Hub",
    Content = "Welcome to infinity hub".. game.Players.LocalPlayer.Name ..", have fun ❤️",
    Duration = 4
}
local Options = Library.Options
Library:ToggleTransparency(false)



-- tabs
local Tabs = {
    Mobs = Window:AddTab({
        Title = "Mobs",
        Icon = "ghost"
    }),
    Bosses = Window:AddTab({
        Title = "Bosses",
        Icon = "angry"
    }),
}
if game.PlaceId == 10450270085 then
    Window:SelectTab(1)
elseif game.PlaceId == 16379688837 then
    Window:SelectTab(2)
end



-- source
Tabs.Mobs:AddSection('[ Mob Farm ]')
local T1 = Tabs.Mobs:AddToggle("", {Title = "Auto take quest", Description = 'Collect the quests for you', Default = false })
T1:OnChanged(function(bool)
    autoQuest = bool
    while autoQuest do task.wait(1)
        local tempData = game:GetService("Players").LocalPlayer.ReplicatedTempData
        local questFolder = tempData:FindFirstChild('quest')
        if not questFolder then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-509, 4470, -15616)
        end
    end
end)
local T2 = Tabs.Mobs:AddToggle("", {Title = "Attack mobs", Description = 'Activate to farm to the mobs on your mission', Default = false })
T2:OnChanged(function(bool)
   teleportMob = bool
   if teleportMob then
       for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
           if v:IsA('Tool') and v.Name == 'Innates' then
               game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
           end
       end
   end
   while teleportMob do task.wait()
       for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
           if v:IsA('BillboardGui') and v.Name == 'QuestMarker' then
               billboardGui = v
               targetAdornee = billboardGui.Adornee
               for _, mob in ipairs(mobsFolder:GetChildren()) do
                   if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") == targetAdornee then
                       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
                       local args = {
                           [1] = 1,
                           [2] = {
                               [1] = mob.Humanoid
                           }
                       }
                       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("M1"):FireServer(unpack(args))
                   end
               end
           end
       end
   end
end)
local T3 = Tabs.Mobs:AddToggle("", {Title = "Intakill mobs", Description = 'Kills all enemies instantly', Default = false })
T3:OnChanged(function(bool)
   instaKill = bool
   while instaKill do task.wait()
       for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
           if v:IsA('BillboardGui') and v.Name == 'QuestMarker' then
               billboardGui = v
               targetAdornee = billboardGui.Adornee
               for _, mob in ipairs(mobsFolder:GetChildren()) do
                   if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") == targetAdornee then
                       for _, head in pairs(mob:GetChildren()) do
                           if head:IsA('Part') and head.Name == 'Head' then
                               head:Destroy()
                           end
                       end
                   end
               end
           end
       end
   end
end)
Tabs.Bosses:AddSection('[ Boss Farm ]')
local automaticallyToggle = Tabs.Bosses:AddToggle("", {Title = "Auto farm boss", Description = 'Kill the boss automatically', Default = false })
automaticallyToggle:OnChanged(function(bool)
    autoBoss = bool
    if autoBoss then
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and v.Name == 'Innates' then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
        wait(.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Objects.Spawns.BossSpawn.CFrame
    end
    while autoBoss do task.wait()
        for _, v in pairs(mobsFolder:GetChildren()) do
            if v:IsA('Model') then
                for _, hrt in pairs(v:GetChildren()) do
                    if hrt:IsA('Part') and hrt.Name == 'HumanoidRootPart' then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrt.CFrame
                        local args = {
                            [1] = 1,
                            [2] = {
                                [1] = v.Humanoid
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("M1"):FireServer(unpack(args))
                        wait(2.5)
                        for _, head in pairs(v:GetChildren()) do
                            if head:IsA('Part') and head.Name == 'Head' then
                                head:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end
end)
Tabs.Bosses:AddSection('[ Separate functions ]')
local T4 = Tabs.Bosses:AddToggle("", {Title = "Intakill boss", Description = 'Kills boss instantly', Default = false })
T4:OnChanged(function(bool)
    instaBoss = bool
    while instaBoss do task.wait()
        for _, mob in ipairs(mobsFolder:GetChildren()) do
            if mob:IsA("Model") then
                for _, head in pairs(mob:GetChildren()) do
                    if head:IsA('Part') and head.Name == 'Head' then
                        head:Destroy()
                    end
                end
            end
        end
    end
end)
local T5 = Tabs.Bosses:AddToggle("", {Title = "Attack boss", Description = 'Activate to farm to the bosses on your mission', Default = false })
T5:OnChanged(function(bool)
    attackBoss = bool
    if attackBoss then
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and v.Name == 'Innates' then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
    end
    while attackBoss do task.wait()
        for _, mob in ipairs(mobsFolder:GetChildren()) do
            if mob:IsA("Model") then
                for _, hrt in pairs(mob:GetChildren()) do
                    if hrt:IsA('Part') and hrt.Name == 'HumanoidRootPart' then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrt.CFrame
                        local args = {
                            [1] = 1,
                            [2] = {
                                [1] = mob.Humanoid
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("M1"):FireServer(unpack(args))
                    end
                end
            end
        end
    end
end)
local button = Tabs.Bosses:CreateButton{
    Title = 'Spawn Boss',
    Description = 'Teleport you to spawn boss',
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Objects.Spawns.BossSpawn.CFrame
    end
}
