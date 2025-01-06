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
local scriptVersion = '2.8a'
local Players = game:GetService("Players")
local player = Players.LocalPlayer
function teleportMob(name, distance)
 for _, v in pairs(workspace.Monster:GetChildren()) do
     if v:IsA('Model') and v.Name == name then
         for _, x in pairs(v:GetChildren()) do
             if x:IsA('Part') and x.Name == 'Head' then
                 local modelPosition = x.Position
                 local cframe = CFrame.new(modelPosition + Vector3.new(0, distance, 0)) * CFrame.Angles(math.rad(270), 0, 0)
                 for _, hrt in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                     if hrt:IsA('Part') and hrt.Name == 'HumanoidRootPart' then
                         for _, hum in pairs(v:GetChildren()) do
                             if hum.Name == 'Humanoid' then
                                 if hum.Health ~= 0 then
                                     hrt.CFrame = cframe
                                 end
                             end
                         end
                     end
                 end
             end
         end
     end
 end
end
function getQuest(name)
 for _, v in pairs(workspace.Location.QuestLocaion:GetChildren()) do
     if v:IsA('Part') and v.Name == name then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
     end
 end
 for _, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
     if v:IsA('Model') and v.Name == name then
         for _, x in pairs(v:GetDescendants()) do
             if x:IsA('ProximityPrompt') and x.Name == 'QuestPrompt' then
                 fireproximityprompt(x)
             end
         end
     end
 end
end
function teleportToQuest(name)
 for _, v in pairs(workspace.Location.QuestLocaion:GetChildren()) do
     if v:IsA('Part') and v.Name == name then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
     end
 end
end
function fireTool(name)
 for _, fireWeapon in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
     if fireWeapon:IsA('Tool') and fireWeapon.Name == name then
         fireWeapon:Activate()
     end
 end
end
function upgradeStats(name, amount)
 local args = {
     [1] = {
         ["Target"] = name,
         ["Action"] = "UpgradeStats",
         ["Amount"] = amount
     }
 }
 game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("StatsFunction"):InvokeServer(unpack(args))    
end
function simulateKeyPress(keyCode)
 game:GetService("VirtualInputManager"):SendKeyEvent(true, keyCode, false, nil)
 game:GetService("VirtualInputManager"):SendKeyEvent(false, keyCode, false, nil)
end
function useSkills()
 simulateKeyPress(Enum.KeyCode.Z)
 simulateKeyPress(Enum.KeyCode.X)
 simulateKeyPress(Enum.KeyCode.C)
 simulateKeyPress(Enum.KeyCode.V)
end
function getTools()
 local toolsName = {}
 for _, v in pairs(game:GetService("Players").LocalPlayer.StarterGear:GetChildren()) do
     if v:IsA('Tool') then
         table.insert(toolsName, v.Name);
     end
 end
 return toolsName
end
function teleportPlayersTo(pivotTo, model, cframe, x, y, z)
 if pivotTo then
     game.Players.LocalPlayer.Character:PivotTo(model:GetPivot())
 end
 if cframe then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
 end
end



-- libray settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
Title = 'Infinity Hub - '.. scriptVersion ..' | Meme Sea',
SubTitle = "by lmy77",
TabWidth = 120,
Size = UDim2.fromOffset(830, 525),
Resize = true,
MinSize = Vector2.new(470, 380),
Acrylic = false,
Theme = "United GNOME",
MinimizeKey = Enum.KeyCode.K
}
local Options = Library.Options
Library:ToggleTransparency(false)



-- tabs
local Tabs = {
 AutoFarm = Window:AddTab({
     Title = "| Auto Farm",
     Icon = "coins"
 }),
 Stats = Window:AddTab({
     Title = "| Stats",
     Icon = "biceps-flexed"
 }),
 Shop = Window:AddTab({
     Title = "| Shop",
     Icon = "hand-coins"
 }),
 Quest = Window:AddTab({
     Title = "| Quest",
     Icon = "scroll-text"
 }),
 RaidBoss = Window:AddTab({
     Title = "| Raid Boss",
     Icon = "angry"
 }),
 Misc = Window:AddTab({
     Title = "| Misc",
     Icon = "layers"
 }),
}
Window:SelectTab(1)



-- source
Tabs.AutoFarm:AddSection('[ Level Farm ]')
_G.Skills = false
_G.Weapon = ''
_G.IgnoreBoss = false
local T1 = Tabs.AutoFarm:AddToggle("", {Title = "Auto farm level", Description = 'Active for farm level automatically', Default = false })
T1:OnChanged(function(bool)
autoFarm = bool
  if autoFarm then
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              game.Players.LocalPlayer.Character.Humanoid:EquipTool(weapon)
          end
      end
   else
       game:GetService("VirtualInputManager"):SendKeyEvent(true, 'Q', false, nil)
  end
  repeat task.wait()
       if autoFarm then
          for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
              if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
                  for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                      if x.Name == 'Humanoid' then
                          x:EquipTool(weapon)
                      end
                  end
              end
          end
          if player:FindFirstChild("PlayerData") and player.PlayerData:FindFirstChild("Level") then
              local level = player.PlayerData.Level.Value

              if level >= 1 and level <= 50 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 1')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Floppa')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Floppa', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 1')
                      end
                  end
              end
              if level >= 50 and level <= 100 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 2')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Golden Floppa')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Golden Floppa', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 2')
                      end
                  end
              end
              if level >= 100 and level <= 150 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 3')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Big Floppa')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Big Floppa', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 3')
                      end
                  end
              end
              if level >= 150 and level <= 200 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 4')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Doge')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Doge', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 4')
                      end
                  end
              end
              if level >= 200 and level <= 250 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 5')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Cheems')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Cheems', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 5')
                      end
                  end
              end
              if level >= 250 and level <= 300 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 6')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Walter Dog')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Walter Dog', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 6')
                      end
                  end
              end
              if level >= 300 and level <= 350 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 7')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Staring Fish')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Staring Fish', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 7')
                      end
                  end
              end
              if level >= 350 and level <= 400 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 8')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Hamster')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Hamster', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 8')
                      end
                  end
              end
              if level >= 400 and level <= 450 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 9')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Snow Tree')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Snow Tree', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 9')
                      end
                  end
              end
              if level >= 450 and level <= 500 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 10')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('The Rock')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('The Rock', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 10')
                      end
                  end
              end
              if level >= 500 and level <= 550 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 11')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Banana Cat')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Banana Cat', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 11')
                      end
                  end
              end
              if level >= 550 and level <= 600 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 12')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Sus Face')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Sus Face', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 12')
                      end
                  end
              end
              if level >= 600 and level <= 650 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 13')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Egg Dog')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Egg Dog', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 13')
                      end
                  end
              end
              if level >= 650 and level <= 700 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 14')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Popcat')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Popcat', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 14')
                      end
                  end
              end
              if level >= 700 and level <= 750 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 15')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Gorilla King')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Gorilla King', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 15')
                      end
                  end
              end
              if level >= 750 and level <= 800 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 16')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Smiling Cat')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Smiling Cat', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 16')
                      end
                  end
              end
              if level >= 800 and level <= 850 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 17')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Killerfish')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Killerfish', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 17')
                      end
                  end
              end
              if level >= 850 and level <= 900 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 18')
                   else
                      local mob = game.Workspace.Monster:FindFirstChild('Bingus')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Bingus', 5.5)
                          fireTool(_G.Weapon)
                      end
                          teleportToQuest('Floppa Quest 18')
                      end
                  end
              end
              local level = player.PlayerData.Level.Value
              if level >= 900 and level <= 950 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 19')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Obamid')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Obamid', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 19')
                      end
                  end
              end
              if level >= 950 and level <= 1000 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 20')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Floppy')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Floppy', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 20')
                      end
                  end
              end
              if level >= 1000 and level <= 1050 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 21')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Creepy Head')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Creepy Head', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 21')
                      end
                  end
              end
              if level >= 1050 and level <= 1150 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 22')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Scary Skull')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Scary Skull', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 22')
                      end
                  end
              end
              if not _G.IgnoreBoss then
                  if level >= 1100 and level <= 1150 then
                      local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                      if currentQuest.Value == 0 then
                          for _, v in pairs(workspace.Island.PumpkinIsland:GetChildren()) do
                              if v:IsA('Model') and v.Name == 'Summon1' then
                                  for _, x in pairs(v:GetDescendants()) do
                                      if x:IsA('ProximityPrompt') and x.Name == 'SummonPrompt' then
                                          fireproximityprompt(x);
                                      end
                                  end
                              end
                          end
                          getQuest('Floppa Quest 23')
                      else
                          local mob = game.Workspace.Monster:FindFirstChild('Giant Pumpkin')
                          local health = mob:FindFirstChild('Humanoid').Health
                          if mob and health ~= 0 then
                              if _G.Skills then
                                  useSkills()
                              end
                              teleportMob('Giant Pumpkin', 5.5)
                              fireTool(_G.Weapon)
                          else
                              teleportToQuest('Floppa Quest 23')
                          end
                      end
                  end
              end
              if level >= 1150 and level <= 1200 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 24')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Pink Absorber')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Pink Absorber', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 24')
                          game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Q', false, yes)
                      end
                  end
              end
              if level >= 1200 and level <= 1250 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 25')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Troll Face')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Troll Face', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 25')
                      end
                  end
              end
              if level >= 1250 and level <= 1300 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 26')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Uncanny Cat')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Uncanny Cat', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 26')
                      end
                  end
              end
              if level >= 1300 and level <= 1350 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 27')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Quandale Dingle')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Quandale Dingle', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 27')
                      end
                  end
              end
              if level >= 1350 and level <= 1450 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 28')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Moai')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Moai', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 28')
                      end
                  end
              end
              if not _G.IgnoreBoss then
                  if level >= 1400 and level <= 1450 then
                      local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                      if currentQuest.Value == 0 then
                          getQuest('Floppa Quest 29')
                      else
                          local mob = game.Workspace.Monster:FindFirstChild('Evil Noob')
                          local health = mob:FindFirstChild('Humanoid').Health
                          if mob and health ~= 0 then
                              if _G.Skills then
                                  useSkills()
                              end
                              teleportMob('Evil Noob', 5.5)
                              fireTool(_G.Weapon)
                          else
                              teleportToQuest('Floppa Quest 29')
                          end
                      end
                  end
              end
              if level >= 1450 and level <= 1500 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 30')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Red Sus')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Red Sus', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 30')
                      end
                  end
              end
              if level >= 1500 and level <= 1700 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 31')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Sus Duck')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Sus Duck', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 31')
                      end
                  end
              end
              if not _G.IgnoreBoss then
                  if level >= 1550 and level <= 1700 then
                      local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                      if currentQuest.Value == 0 then
                          getQuest('Floppa Quest 32')
                      else
                          local mob = game.Workspace.Monster:FindFirstChild('Lord Sus')
                          local health = mob:FindFirstChild('Humanoid').Health
                          if mob and health ~= 0 then
                              if _G.Skills then
                                  useSkills()
                              end
                              teleportMob('Lord Sus', 5.5)
                              fireTool(_G.Weapon)
                          else
                              teleportToQuest('Floppa Quest 32')
                          end
                      end
                  end
              end
              if level >= 1700 and level <= 1750 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 33')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Sigma Man')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Sigma Man', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 33')
                      end
                  end
              end
              if level >= 1750 and level <= 1800 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 34')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Dancing Cat')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Dancing Cat', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 34')
                      end
                  end
              end
              if level >= 1800 and level <= 1850 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 35')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Toothless Dragon')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Toothless Dragon', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 35')
                      end
                  end
              end
              if level >= 1850 and level <= 1900 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 36')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Manly Nugget')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Manly Nugget', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 36')
                      end
                  end
              end
              if level >= 1900 and level <= 1950 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 37')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Huh Cat')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Huh Cat', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 37')
                      end
                  end
              end
              if level >= 1950 and level <= 2000 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 38')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Mystical Tree')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Mystical Tree', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 38')
                      end
                  end
              end
              if level >= 2000 and level <= 2050 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 39')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Old Man')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Old Man', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 39')
                      end
                  end
              end
              if level >= 2050 and level <= 2100 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 40')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Nyan Cat')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Nyan Cat', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 40')
                      end
                  end
              end
              if level >= 2100 and level <= 2150 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 41')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Baller')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Baller', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 41')
                      end
                  end
              end
              if level >= 2150 and level <= 2200 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 42')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Slicer')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Slicer', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 42')
                      end
                  end
              end
              if level >= 2200 and level <= 2250 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 43')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Rick Roller')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Rick Roller', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 43')
                      end
                  end
              end
              if level >= 2250 and level <= 2300 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 44')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('Gigachad')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('Gigachad', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 44')
                      end
                  end
              end
              if level >= 2300 and level <= 2350 then
                  local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
                  if currentQuest.Value == 0 then
                      getQuest('Floppa Quest 45')
                  else
                      local mob = game.Workspace.Monster:FindFirstChild('MrBeast')
                      local health = mob:FindFirstChild('Humanoid').Health
                      if mob and health ~= 0 then
                          if _G.Skills then
                              useSkills()
                          end
                          teleportMob('MrBeast', 5.5)
                          fireTool(_G.Weapon)
                      else
                          teleportToQuest('Floppa Quest 45')
                      end
                  end
              end
              if level >= 2350 and level <= 2400 then
               local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
               if currentQuest.Value == 0 then
                   getQuest('Floppa Quest 46')
               else
                   local mob = game.Workspace.Monster:FindFirstChild('Handsome Man')
                   local health = mob:FindFirstChild('Humanoid').Health
                   if mob and health ~= 0 then
                       if _G.Skills then
                           useSkills()
                       end
                       teleportMob('Handsome Man', 5.5)
                       fireTool(_G.Weapon)
                   else
                       teleportToQuest('Floppa Quest 46')
                   end
               end
           end
       end
  until autoFarm == false
end)
local Button = Tabs.AutoFarm:AddButton({
 Title = "Reset farm",
 Description = "If any bug happen, click this button",
 Callback = function()
     local args = {
         [1] = "Abandon_Quest",
         [2] = {
             ["QuestSlot"] = "QuestSlot1"
         }
     }
     game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("QuestEvents"):WaitForChild("Quest"):FireServer(unpack(args))
 end
})
Tabs.AutoFarm:AddSection('[ Farm Settings ]')
local D1 = Tabs.AutoFarm:AddDropdown("Dropdown", {
Title = "Select weapon",
Description = 'Choose the weapon you want to farm npcs',
Values = getTools(),
Multi = false,
Default = 'Combat',
})
D1:OnChanged(function(value)
_G.Weapon = value
end)
local T2 = Tabs.AutoFarm:AddToggle("", {Title = "Use skills", Description = 'Active this if you want use skills in farm level', Default = false })
T2:OnChanged(function(bool)
 _G.Skills = bool
end)
local T14 = Tabs.AutoFarm:AddToggle("", {Title = "Use instinct", Description = 'Active this if you want use instinct automatically', Default = false })
T14:OnChanged(function(bool)
instinct = bool
 while instinct do task.wait()
   local UserInputService = game:GetService("UserInputService")
   if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
     if game:GetService("Lighting").Instinct.TintColor == Color3.fromRGB(255, 255, 255) then
       game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
       wait(.5)
       game:GetService('VirtualInputManager'):SendKeyEvent(false, 'E', false, game)
     end
   elseif UserInputService.KeyboardEnabled then
     if game:GetService("Lighting").Instinct.TintColor == Color3.fromRGB(255, 255, 255) then
       game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game)
       wait(.5)
       game:GetService('VirtualInputManager'):SendKeyEvent(false, 'E', false, game)
     end
   end
 end
end)
local T7 = Tabs.AutoFarm:AddToggle("", {Title = "Ignore raid bosses quest", Description = 'Active this if you want ignore raid boss', Default = false })
T7:OnChanged(function(bool)
 _G.IgnoreBoss = bool
end)


Tabs.Stats:AddSection('[ Set Points ]')
local T3 = Tabs.Stats:AddToggle("", {Title = "Auto upgrade melee", Description = 'Active if you want your stats point go to melee', Default = false })
T3:OnChanged(function(bool)
 autoMelee = bool
 while autoMelee do task.wait()
     upgradeStats('MeleeLevel', 1)
 end
end)
local T4 = Tabs.Stats:AddToggle("", {Title = "Auto upgrade defense", Description = 'Active if you want your stats point go to defense', Default = false })
T4:OnChanged(function(bool)
 autoMelee = bool
 while autoMelee do task.wait()
     upgradeStats('DefenseLevel', 1)
 end
end)
local T5 = Tabs.Stats:AddToggle("", {Title = "Auto upgrade sword", Description = 'Active if you want your stats point go to sword', Default = false })
T5:OnChanged(function(bool)
 autoMelee = bool
 while autoMelee do task.wait()
     upgradeStats('SwordLevel', 1)
 end
end)
local T6 = Tabs.Stats:AddToggle("", {Title = "Auto upgrade power", Description = 'Active if you want your stats point go to power', Default = false })
T6:OnChanged(function(bool)
 autoMelee = bool
 while autoMelee do task.wait()
     upgradeStats('MemePowerLevel', 1)
 end
end)


Tabs.Shop:AddSection('[ Gacha Shop ]')
local D2 = Tabs.Shop:AddDropdown("Dropdown", {
Title = "Select pet",
Description = 'Choose the amount open to gacha',
Values = {'Floppa Gacha', 'Doge Gacha'},
Multi = false,
Default = nil,
})
D2:OnChanged(function(value)
selectedPet = value
end)
local D3 = Tabs.Shop:AddDropdown("Dropdown", {
Title = "Select amount",
Description = 'Choose the amount open to gacha',
Values = {'Once', 'Triple', 'Decuple'},
Multi = false,
Default = nil,
})
D3:OnChanged(function(value)
selectedAmount = value
end)
local Button = Tabs.Shop:AddButton({
 Title = "Buy power",
 Description = "Click to buy power",
 Callback = function()
     if selectedPet == 'Floppa Gacha' then
         local ohString1 = "Random_Power"
         local ohTable2 = {
             ["Type"] = selectedAmount,
             ["NPCName"] = "Floppa Gacha",
             ["GachaType"] = "Money"
         }
         game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(ohString1, ohTable2)
     elseif selectedPet == 'Doge Gacha' then
         local ohString1 = "Random_Power"
         local ohTable2 = {
             ["Type"] = selectedAmount,
             ["NPCName"] = "Doge Gacha",
             ["GachaType"] = "Gem"
         }
         game:GetService("ReplicatedStorage").OtherEvent.MainEvents.Modules:FireServer(ohString1, ohTable2)
     end
 end
})
Tabs.Shop:AddSection('[ Fighting Style ]')
local Button = Tabs.Shop:AddButton({
 Title = "Buy combat",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 56, 3, -617)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy baller",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 1713, -76, -4727)
 end
})
Tabs.Shop:AddSection('[ Ability Trainer ]')
local Button = Tabs.Shop:AddButton({
 Title = "Buy obs haki",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 973, 44, -549)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy aura",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 6962, 31, 4923)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy flash step",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, -3063, -79, -2065)
 end
})
Tabs.Shop:AddSection('[ Shop Npc ]')
local Button = Tabs.Shop:AddButton({
 Title = "Buy pumpkin",
 Description = "1x Nugget Man and $3.500.000",
 Callback = function()
     teleportPlayersTo(false, nil, true, -982, -92, 1285)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy flame katana",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 114, -5, -1579)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy katana",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 383, -37, -852)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy hanger",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 208, 5, -1272)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy bonk",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 1673, -35, -5247)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy popcat",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, 3494, 24, -1567)
 end
})
local Button = Tabs.Shop:AddButton({
 Title = "Buy banana",
 Description = "",
 Callback = function()
     teleportPlayersTo(false, nil, true, -2893, -64, 349)
 end
})


Tabs.Quest:AddSection('[ Auto Quest ]')
local T12 = Tabs.Quest:AddToggle("", {Title = "Auto - Cool Floppa Quest", Description = '', Default = false })
T12:OnChanged(function(bool)
 autoCoolFloppa = bool
 if autoCoolFloppa then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(755, -30, -426)
 end
 repeat task.wait()
     if autoCoolFloppa then
         local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
         if currentQuest.Value == 0 then
             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(755, -30, -426)
             for _, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
                 if v:IsA('Model') and v.Name == 'Cool Floppa Quest' then
                     for _, x in pairs(v:GetDescendants()) do
                         if x:IsA('ProximityPrompt') and x.Name == 'QuestPrompt' then
                             fireproximityprompt(x)
                         end
                     end
                 end
             end
         else
             for _, v in pairs(workspace.Island.FloppaIsland:GetChildren()) do
                 if v:IsA('Model') and v.Name == 'Lava Floppa' then
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.ClickPart.CFrame
                     for _, x in pairs(v:GetDescendants()) do
                         if x:IsA('ProximityPrompt') and x.Name == 'ProximityPrompt' then
                             fireproximityprompt(x)
                         end
                     end
                 end
             end
         end
     end
 until autoCoolFloppa == false
end)
local T13 = Tabs.Quest:AddToggle("", {Title = "Auto - Dancing Banana Quest", Description = '', Default = false })
T13:OnChanged(function(bool)
  dancingBanana = bool
  if dancingBanana then
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              game.Players.LocalPlayer.Character.Humanoid:EquipTool(weapon)
          end
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2623, -77, -2005)
  end
  repeat task.wait()
      if dancingBanana then
          for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
              if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
                  for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                      if x.Name == 'Humanoid' then
                          x:EquipTool(weapon)
                      end
                  end
              end
          end
          local currentQuest = game:GetService("Players").LocalPlayer.PlayerData.CurrentQuest
          if currentQuest.Value == 0 then
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2623, -77, -2005)
              for _, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
                  if v:IsA('Model') and v.Name == 'Dancing Banana Quest' then
                      for _, x in pairs(v:GetDescendants()) do
                          if x:IsA('ProximityPrompt') and x.Name == 'QuestPrompt' then
                              fireproximityprompt(x)
                          end
                      end
                  end
              end
          else
              if _G.Skills then
                  useSkills()
              end
              teleportMob('Sogga', 5.5)
              fireTool(_G.Weapon)
          end
      end
  until dancingBanana == false
end)


Tabs.RaidBoss:AddSection('[ Raid Bosses Farm ]')
local T8 = Tabs.RaidBoss:AddToggle("", {Title = "Auto giant pumpkin", Description = '', Default = false })
T8:OnChanged(function(bool)
  giantPumpkin = bool
  if giantPumpkin then
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              game.Players.LocalPlayer.Character.Humanoid:EquipTool(weapon)
          end
      end
  end
 while giantPumpkin do task.wait()
      local backpack = game.Players.LocalPlayer.Backpack
      local character = game.Players.LocalPlayer.Character
      local tool = backpack:FindFirstChild(_G.Weapon)
      local ctool = character:FindFirstChild(_G.Weapon)
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') then
              for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if x.Name == 'Humanoid' then
                      if not tool and not ctool then
                          x.Health = 0
                      else
                          x:EquipTool(tool)
                      end
                  end
              end
          end
      end
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if x.Name == 'Humanoid' then
                      x:EquipTool(weapon)
                  end
              end
          end
      end
      teleportMob('Giant Pumpkin', 5.5)
      fireTool(_G.Weapon)
 end
end)
local T9 = Tabs.RaidBoss:AddToggle("", {Title = "Auto evil noob", Description = '', Default = false })
T9:OnChanged(function(bool)
  evilNoob = bool
  if evilNoob then
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              game.Players.LocalPlayer.Character.Humanoid:EquipTool(weapon)
          end
      end
  end
  while evilNoob do task.wait()
      local backpack = game.Players.LocalPlayer.Backpack
      local character = game.Players.LocalPlayer.Character
      local tool = backpack:FindFirstChild(_G.Weapon)
      local ctool = character:FindFirstChild(_G.Weapon)
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') then
              for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if x.Name == 'Humanoid' then
                      if not tool and not ctool then
                          x.Health = 0
                      else
                          x:EquipTool(tool)
                      end
                  end
              end
          end
      end
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if x.Name == 'Humanoid' then
                      x:EquipTool(weapon)
                  end
              end
          end
      end
      teleportMob('Evil Noob', 5.5)
      fireTool(_G.Weapon)
  end
end)
local T10 = Tabs.RaidBoss:AddToggle("", {Title = "Auto lord sus", Description = '', Default = false })
T10:OnChanged(function(bool)
  lordSus = bool
  if lordSus then
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              game.Players.LocalPlayer.Character.Humanoid:EquipTool(weapon)
          end
      end
  end
  while lordSus do task.wait()
      local backpack = game.Players.LocalPlayer.Backpack
      local character = game.Players.LocalPlayer.Character
      local tool = backpack:FindFirstChild(_G.Weapon)
      local ctool = character:FindFirstChild(_G.Weapon)
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') then
              for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if x.Name == 'Humanoid' then
                      if not tool and not ctool then
                          x.Health = 0
                      else
                          x:EquipTool(tool)
                      end
                  end
              end
          end
      end
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
              for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if x.Name == 'Humanoid' then
                      x:EquipTool(weapon)
                  end
              end
          end
      end
      teleportMob('Evil Noob', 5.5)
      fireTool(_G.Weapon)
  end
end)
local T11 = Tabs.RaidBoss:AddToggle("", {Title = "Auto meme beast", Description = '', Default = false })
T11:OnChanged(function(bool)
  memeBeast = bool
  if memeBeast then
     for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
         if weapon:IsA('Tool') and weapon.Name == _G.Weapon then
             game.Players.LocalPlayer.Character.Humanoid:EquipTool(weapon)
         end
     end
  end
  while memeBeast do task.wait()
      local backpack = game.Players.LocalPlayer.Backpack
      local character = game.Players.LocalPlayer.Character
      local tool = backpack:FindFirstChild(_G.Weapon)
      local ctool = character:FindFirstChild(_G.Weapon)
      for _, weapon in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
          if weapon:IsA('Tool') then
              for _, x in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                  if x.Name == 'Humanoid' then
                      if not tool and not ctool then
                          x.Health = 0
                      else
                          x:EquipTool(tool)
                      end
                  end
              end
          end
      end
      if _G.Skills then
          useSkills()
      end
      teleportMob('Meme Beast', 5.5)
      fireTool(_G.Weapon)
  end
end)


Tabs.Misc:AddSection('[ Others Options ]')
local Button = Tabs.Misc:AddButton({
 Title = "Reedem all codes",
 Description = "Click this button for reedem all codes in game",
 Callback = function()
      local codes = {'100MVisits', '100KLikes', '100KFavorites', '100KActive', '70KActive', '40KActive', '20KActive', '10KActive', '10KMembers', 'Update4', '4KActive', '10KLikes', '10MVisits', '9MVisits', '8MVisits', '100KACTIVE', '100KFavorites', '100KLikes', '100MVisits'}
      for _, v in next, codes do  
          local args = {
              [1] = v
          }
          game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Code"):InvokeServer(unpack(args))
      end
 end
})



-- update dropdowns
game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function()
 D1:SetValues(getTools())
end)
game.Players.LocalPlayer.Backpack.ChildRemoved:Connect(function()
 D1:SetValues(getTools())
end)
