-- start
print[[

 _____            __   _           _   _               _    _           _     
|_   _|          / _| (_)         (_) | |             | |  | |         | |    
  | |    _ __   | |_   _   _ __    _  | |_   _   _    | |__| |  _   _  | |__  
  | |   | '_ \  |  _| | | | '_ \  | | | __| | | | |   |  __  | | | | | | '_ \ 
 _| |_  | | | | | |   | | | | | | | | | |_  | |_| |   | |  | | | |_| | | |_) |
|_____| |_| |_| |_|   |_| |_| |_| |_|  \__|  \__, |   |_|  |_|  \__,_| |_.__/ 
                                              __/ |                           
                                             |___/    
]]



-- variables
function getTools()
   local toolName = {};
   for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
       if v:IsA('Tool') then
           table.insert(toolName, v.Name)
       end
   end
   return toolName
end
local selectedWeapon = ''
local scriptVersion = '2.8a'
local mobsFolder = workspace:FindFirstChild("Objects"):FindFirstChild("Mobs")



-- library settings
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/library/Rayfield/src.lua'))()
local Window = Rayfield:CreateWindow({
   Name = "Infinity Hub - ".. scriptVersion .." | Jujutsu Infinite",
   Icon = 'infinity',
   LoadingTitle = "Infinity Hub",
   LoadingSubtitle = "by lmy77",
   Theme = "DarkBlue",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = 'Infinity-Hub/Jujutsu-Infinite/Saved-Settings',
      FileName = "Settings.infh"
   },
})



-- tabs
local Mobs = Window:CreateTab("Mobs")
local Bosses = Window:CreateTab("Boss")
local Spam = Window:CreateTab("Spam")
local Settings = Window:CreateTab("Settings")



-- source
local Section = Mobs:CreateSection("[ Mob Farm ]")
local Toggle = Mobs:CreateToggle({
    Name = "Auto take quest",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        autoQuest = bool
        while autoQuest do task.wait(1)
            local tempData = game:GetService("Players").LocalPlayer.ReplicatedTempData
            local questFolder = tempData:FindFirstChild('quest')
            if not questFolder then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-509, 4470, -15616)
            end
        end
    end,
})
local Toggle = Mobs:CreateToggle({
    Name = "Auto attack",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        teleportMob = bool
        if teleportMob then
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA('Tool') and v.Name == selectedWeapon then
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
    end,
})
local Toggle = Mobs:CreateToggle({
    Name = "Insta kill",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
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
                                    mob.Humanoid.Health = 0
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
})


local Section = Bosses:CreateSection("[ Boss Farm ]")
local Toggle = Bosses:CreateToggle({
    Name = "Insta kill",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        autoFarmBoss = bool
        while autoFarmBoss do task.wait()
            for _, mob in ipairs(mobsFolder:GetChildren()) do
                if mob:IsA("Model") then
                    mob.Humanoid.Health = 0
                end
            end
        end
    end,
})
local Toggle = Bosses:CreateToggle({
    Name = "Auto attack",
    CurrentValue = false,
    Flag = "",
    Callback = function(bool)
        attackBoss = bool
        if attackBoss then
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA('Tool') and v.Name == selectedWeapon then
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
    end,
})
local Button = Bosses:CreateButton({
    Name = "Spawn boss",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Objects.Spawns.BossSpawn.CFrame
    end,
})


local Section = Spam:CreateSection("[ Spam Skills ]")
local Button = Spam:CreateButton({
    Name = "Maximum: Jacob's Ladder",
    Callback = function()
        local ohString1 = "Maximum: Jacob's Ladder"
        game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(ohString1)
    end,
})
local Button = Bosses:CreateButton({
    Name = "Maximum: Six Eyes",
    Callback = function()
        local ohString1 = "Maximum: Six Eyes"
        game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(ohString1)
    end,
})
local Button = Bosses:CreateButton({
    Name = "Domain Expansion: Malevolent Shrine",
    Callback = function()
        local ohString1 = "Domain Expansion: Malevolent Shrine"
        game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(ohString1)
    end,
})
local Button = Bosses:CreateButton({
    Name = "Domain Expansion: Unlimited Void",
    Callback = function()
        local ohString1 = "Domain Expansion: Unlimited Void"
        game:GetService("ReplicatedStorage").Remotes.Server.Combat.Skill:FireServer(ohString1)
    end,
})


local Section = Settings:CreateSection("[ Farm Settings ]")
local selectedWeaponDropdown = Settings:CreateDropdown({
    Name = "Select weapon",
    Options = getTools(),
    CurrentOption = {"Innates"},
    MultipleOptions = false,
    Flag = "",
    Callback = function(Options)
        selectedWeapon = Options
    end,
})
local Button = Settings:CreateButton({
    Name = "Spawn boss",
    Callback = function()
        selectedWeaponDropdown:Refresh(getTools())
    end,
})
