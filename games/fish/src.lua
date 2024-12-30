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
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
Library:Notify{
  Title = "Infinity Hub",
  Content = "Checking device...",
  Duration = 4
}
wait(4.2)
local UserInputService = game:GetService("UserInputService")
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
  Library:Notify{
      Title = "Infinity Hub",
      Content = "Service detected: Mobile",
      Duration = 3
  }
  wait(0.5)
  Library:Notify{
      Title = "Infinity Hub",
      Content = "Loaded mobile atributs",
      Duration = 3
  }
  loadstring(game:HttpGet('https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/modules/Mobile/Button/src.lua'))()
else
  Library:Notify{
      Title = "Infinity Hub",
      Content = "Service detected: Pc",
      Duration = 3
  }
  wait(0.5)
  Library:Notify{
      Title = "Infinity Hub",
      Content = "Loaded pc atributs",
      Duration = 3
  }
end
wait(3.5)



-- variables
function gethub()
  for _, v in pairs(game:GetService('Players').LocalPlayer.PlayerGui:GetChildren()) do
      if v:IsA('ScreenGui') and v.Name == 'reel' then
         return v
      end
  end
end
function getRod()
 for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA('Tool') and v.Name:lower():find('rod') then
       return v.Name
    end
 end
end
function getFish()
  local fishName = {};
  for _, v in ipairs(game:GetService("ReplicatedStorage").resources.items.fish:GetChildren()) do
      if v:IsA('Folder') then
          table.insert(fishName, v.Name)
      end
  end
  return fishName
end
function getBait()
 local baitName = {}
 for _, v in pairs(game:GetService("ReplicatedStorage").resources.replicated.fishing.bait:GetChildren()) do
     if v:IsA('Model') then
         table.insert(baitName, v.Name)
     end
 end
 return baitName
end
function getPlayers()
 local playerName = {}
 for _, v in pairs(game:GetService('Players'):GetPlayers()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
       table.insert(playerName, v.Name)
    end
 end
 return playerName
end
local waterHeight = 128
local offset = -1
local platform = nil
local function createPlatform()
  platform = Instance.new("Part")
  platform.Size = Vector3.new(10, 0.5, 10)
  platform.Transparency = 1
  platform.Anchored = true
  platform.CanCollide = true
  platform.Parent = workspace
end
local function removePlatform()
  if platform then
      platform:Destroy()
      platform = nil
  end
end
function fireprompt(Prompt)
 local PromptTime = Prompt.HoldDuration
 Prompt.HoldDuration = 0
 Prompt:InputHoldBegin()
 Prompt:InputHoldEnd()
 Prompt.HoldDuration = PromptTime
end
local function EnsureInstance(Instance: Instance?): boolean
 return (Instance and Instance:IsDescendantOf(game))
end
local Debugging = true
local function dbgwarn(...)
 if Debugging then
     warn("[Debugging]", ...)
 end
end
local Collection = {}
local function Collect(Item: RBXScriptConnection | thread)
 table.insert(Collection, Item)
end
function RefreshDropdown(DropdownName, Value)
  DropdownName:SetValues(Value)
end
local tpRods = {
 ['Rod of the depths'] = {
      sectionName = 'Depth Rod',
      cframe = CFrame.new(1704.0020751953125, -902.5270385742188, 1440.5933837890625),
      variables = {
          ['Hexed'] = {
              cframe = CFrame.new(1051.080810546875, -630.1539916992188, 1315.525146484375)
          },
          ['Abyssal'] = {
              cframe = CFrame.new(1208, -714, 1316)
          },
      }
 },
 ['Trident Rod'] = {
    sectionName = 'Trident',
    cframe = CFrame.new(-1483.3150634765625, -225.77960205078125, -2206.955322265625),
    variables = {
      ['Relic Pedestal'] = {
          cframe = CFrame.new(-1477.8162841796875, -225.71067810058594, -2350.163330078125)
      },
  }
 },
 ['Candy Cane Rod'] = {
    sectionName = 'Candy Cane',
    cframe = CFrame.new(-188.8999481201172, 367.0196533203125, -9449.46484375)
 },
 ['Phoenix Rod'] = {
    sectionName = 'Phoenix',
    cframe = CFrame.new(5971.03076171875, 270.3774108886719, 852.372314453125)
 },
 ['Aurora Rod, Nocturnal Rods'] = {
    sectionName = 'Aurora / Nocturnal',
    cframe = CFrame.new(-142.84242248535156, -515.1743774414062, 1135.65234375)
 },
 ['King Rod'] = {
    sectionName = 'King',
    cframe = CFrame.new(1383.3577880859375, -806.767578125, -307.60223388671875)
 },
 ['Magma Rod'] = {
    sectionName = 'Magma',
    cframe = CFrame.new(-1845.7042236328125, 165.71112060546875, 161.10154724121094)
 },
 ['Destiny Rod'] = {
    sectionName = 'Destiny',
    cframe = CFrame.new(979.71240234375, 131.3202362060547, -1235.07666015625)
 },
 ['Lost Rod'] = {
    sectionName = 'Lost',
    cframe = CFrame.new(2882.42431640625, 137.93795776367188, 2719.812255859375)
 },
 ['Magnet Rod'] = {
    sectionName = 'Magnet',
    cframe = CFrame.new(-198.5894775390625, 132.50001525878906, 1931.30859375)
 },
 ['Fortune, Steady, Rapid Rod'] = {
    sectionName = 'Starter Rods',
    cframe = CFrame.new(-1514.638427734375, 141.53482055664062, 764.4584350585938)
 },
}
local isLands = {'Moosewood', 'Roslit Bay', 'Snowcap Island', 'Terrapin Island', 'Statue Of Sovereignty', 'Mushgrove', 'Sunstone Island', 'Forsaken Shores', 'Vertigo', 'The Depths', 'Desolate Deep', 'Brine Pool', 'Ancient Isle', 'Ancient Archives', 'Winter Village', 'Lantern'}
local RunService = game:GetService('RunService')
local GuiService = game:GetService('GuiService')
local vim = game:GetService("VirtualInputManager")
local Signals = {"Activated", "MouseButton1Down", "MouseButton2Down", "MouseButton1Click", "MouseButton2Click"}
local scriptVersion = '2.6a'
local Utils = {}



-- library settings
local Window = Library:CreateWindow{
  Title = 'Infinity Hub - '.. scriptVersion ..' | Fish 🐟',
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
  Content = "Welcome to infinity hub, have fun ❤️",
  Duration = 4
}
local Options = Library.Options
Library:ToggleTransparency(false)



-- tabs
local Tabs = {
  FischTab = Window:AddTab({
      Title = "Fish",
      Icon = "waves"
  }),
  RodTab = Window:AddTab({
      Title = "Rods",
      Icon = "fish"
  }),
  ItemTab = Window:AddTab({
      Title = "Items",
      Icon = "anchor"
  }),
  SkinsTab = Window:AddTab({
      Title = "Skins",
      Icon = "package"
  }),
  TeleportTab = Window:AddTab({
      Title = "Teleport",
      Icon = "map-pin"
  }),
  AprraiserTab = Window:AddTab({
      Title = "Appraiser",
      Icon = "hand-coins"
  }),
  EventTab = Window:AddTab({
      Title = "Events",
      Icon = "calendar"
  }),
  TotemTab = Window:AddTab({
      Title = "Auto Totem",
      Icon = "sunrise"
  }),
  LPlayer = Window:AddTab({
      Title = "Local Player",
      Icon = "circle-user-round"
  }),
  Players = Window:AddTab({
      Title = "Players",
      Icon = "users-round"
  }),
  CreditsTab = Window:AddTab({
      Title = "Credits",
      Icon = "crown"
  }),
}
Window:SelectTab(1)



-- source
Tabs.FischTab:AddSection('[ Auto Fish ]')
local autoCastToggle = Tabs.FischTab:AddToggle("", {Title = "Auto cast", Description = 'Activate to equip and use the fishing rod automatically', Default = false })
autoCastToggle:OnChanged(function(bool)
  autoCast = bool
  while autoCast do task.wait()
     if not autoCast then return end
     for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA('Tool') and v.Name:lower():find('rod') then
           game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
     end
     wait(.5)
     for _, rod in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if rod:IsA('Tool') and rod.Name:lower():find('rod') then
           local args = {[1] = 100, [2] = 1}
           rod.events.cast:FireServer(unpack(args))
        end
     end
  end
end)
local autoShakeToggle = Tabs.FischTab:AddToggle("", {Title = "Auto shake", Description = 'Activate so that it shakes automatically', Default = false })
autoShakeToggle:OnChanged(function(bool)
  autoShake = bool
  function Utils.MountShakeUI(ShakeUI: ScreenGui)
     local SafeZone: Frame? = ShakeUI:WaitForChild("safezone", 5) :: Frame?
     local function HandleButton(Button: ImageButton)
         Button.Selectable = true
         GuiService.AutoSelectGuiEnabled = false
         GuiService.GuiNavigationEnabled = true
         if EnsureInstance(Button) then
             GuiService.SelectedObject = Button
             task.wait()
             vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
             vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
             task.wait()
         end
         GuiService.AutoSelectGuiEnabled = true
         GuiService.GuiNavigationEnabled = false
         GuiService.SelectedObject = nil
     end
     if not SafeZone then
         dbgwarn("Unable to mount shake UI.")
         return
     end
     if autoShake then
        local Connection = SafeZone.ChildAdded:Connect(function(Child)
        if Child:IsA("ImageButton") then
           local Done = false
           task.spawn(function()
                 repeat
                    RunService.RenderStepped:Wait()
                    HandleButton(Child)
                 until Done
          end)
          task.spawn(function()
              repeat
                 RunService.RenderStepped:Wait()
              until (not Child) or (not Child:IsDescendantOf(SafeZone))
                      Done = true
                  end)
              end
          end)
          repeat
              wait()
          until not SafeZone:IsDescendantOf(game.Players.LocalPlayer.PlayerGui)
          Connection:Disconnect()
      end
  end
  Collect(game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(Child: Instance)
     if Child.Name == "shakeui" and Child:IsA("ScreenGui") then
        Utils.MountShakeUI(Child)
     end
  end))
end)
local autoReelToggle = Tabs.FischTab:AddToggle("", {Title = "Auto reel", Description = 'Activate to catch any fish instantly', Default = false })
autoReelToggle:OnChanged(function(bool)
  autoReel = bool
  while autoReel do task.wait()
      game:GetService('ReplicatedStorage').events.reelfinished:FireServer(100, true)
  end
end)
local freezeToggle = Tabs.FischTab:AddToggle("", {Title = "Freeze chatacter", Description = "Freezes your character so he doesn't keep moving forward", Default = false })
freezeToggle:OnChanged(function(bool)
  freeze = bool
  local youPos = ''
  youPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
  while freeze do task.wait()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(youPos) * CFrame.Angles(0, math.rad(90), 0)
  end
end)
Tabs.FischTab:AddSection('[ Position Settings ]')
local Settings = {
  SavePos = 'nil',
}
local PositionParagraph = Tabs.FischTab:CreateParagraph("Paragraph", {
  Title = "Saved Position",
  Content = "> "..Settings.SavePos
})
Tabs.FischTab:CreateButton{
  Title = "Save position",
  Description = "Click to save your current position",
  Callback = function()
      Settings.SavePos = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position
      PositionParagraph:SetValue('> '..tostring(Settings.SavePos))
  end
}
Tabs.FischTab:CreateButton{
  Title = "Teleport to position",
  Description = "Teleports you to the saved position",
  Callback = function()
      if Settings.SavePos == 'nil' then
          Library:Notify{
              Title = "Infinity Hub",
              Content = "No position was found, make sure you have saved a position before pressing this button",
              Duration = 6
          }
      else
          game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
              Settings.SavePos
          )
      end
  end
}
Tabs.FischTab:CreateButton{
  Title = "Reset position",
  Description = "Resets the position that was saved so that you can re-save another position",
  Callback = function()
      Settings.SavePos = 'nil'
      PositionParagraph:SetValue('> '..tostring(Settings.SavePos))
  end
}


for rodName, rodData in pairs(tpRods) do
  Tabs.RodTab:AddSection(rodData.sectionName)
  Tabs.RodTab:CreateButton{
      Title = "Teleport to - " .. rodName,
      Callback = function()
          local player = game.Players.LocalPlayer
          local character = player.Character or player.CharacterAdded:Wait()
          local rootPart = character:WaitForChild("HumanoidRootPart")
          rootPart.CFrame = rodData.cframe
      end
  }
  if rodData.variables then
      for variableName, variableData in pairs(rodData.variables) do
          Tabs.RodTab:CreateButton{
              Title = "Teleport to - " .. variableName,
              Callback = function()
                  local player = game.Players.LocalPlayer
                  local character = player.Character or player.CharacterAdded:Wait()
                  local rootPart = character:WaitForChild("HumanoidRootPart")
                  rootPart.CFrame = variableData.cframe
              end
          }
      end
  end
end


Tabs.ItemTab:AddSection('[ Sell Items ]')
local autoSellAllToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto sell all", Description = "Activate to sell all your fish automatically", Default = false })
autoSellAllToggle:OnChanged(function(bool)
  sellall = bool
  if sellall then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(466.2166442871094, 150.62973022460938, 230.4716796875);
  end
  while sellall do task.wait(.5)
      if workspace.world.npcs:WaitForChild('Marc Merchant').HumanoidRootPart then
          wait(.5)
          for _, v in pairs(workspace.world.npcs:GetChildren()) do
              if v:IsA('Model') and v.Name == 'Marc Merchant' then
                  fireprompt(v.dialogprompt)
              end
          end
      end
      game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("SellAll"):InvokeServer()
  end
end)
local autoSellHandToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto sell in hand", Description = "Activate it so that it takes the fish in hand and sells them", Default = false })
autoSellHandToggle:OnChanged(function(bool)
  sellhand = bool
  if sellhand then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(466.2166442871094, 150.62973022460938, 230.4716796875);
  end
  if sellhand then
     for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA('Tool') and table.find(getFish(), v.Name) then
           if not sellhand then return end
           wait(.2)
           game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
           wait(.2)
           for _, x in pairs(workspace.world.npcs:GetChildren()) do
              if x:IsA('Model') and v.Name == 'Marc Merchant' then
                 wait(.5)
                 fireprompt(x.dialogprompt)
                 wait()
                 game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("Sell"):InvokeServer()
                 wait(.5)
              end
           end
        end
     end
  end
end)
Tabs.ItemTab:AddSection('[ Totems ]')
local TotemsDropdown = Tabs.ItemTab:AddDropdown("Dropdown", {
  Title = "Select totem",
  Description = 'Select the totem you want to buy or teleport',
  Values = {'Tempest Totem', 'Smokescreen Totem', 'Sundial Totem', 'Aurora Totem', 'Windset Totem', 'Eclipse Totem', 'Meteor Totem'},
  Multi = false,
  Default = nil,
})
TotemsDropdown:OnChanged(function(value)
  selectedTotem = value
end)
Tabs.ItemTab:CreateButton{
  Title = "Teleport to totem",
  Description = "Click to teleport to the totem you selected",
  Callback = function()
      if selectedTotem == 'Eclipse Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5965.68017578125, 274.1084899902344, 842.2765502929688)
      elseif selectedTotem == 'Windset Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2847.599365234375, 178.11056518554688, 2703.43994140625)
      elseif selectedTotem == 'Tempest Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(36.73764419555664, 132.50003051757812, 1942.5556640625)
      elseif selectedTotem == 'Smokescreen Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2791.701416015625, 139.72959899902344, -629.4711303710938)
      elseif selectedTotem == 'Sundial Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1148.489990234375, 134.49998474121094, -1073.515625)
      elseif selectedTotem == 'Aurora Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1810.869873046875, -136.9279327392578, -3281.8935546875)
      elseif selectedTotem == 'Meteor Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.051025390625, 275.3567199707031, 228.6140594482422)
      end
  end
}
Tabs.ItemTab:CreateButton{
  Title = "Use totem",
  Description = "Click if you want to use the totem you selected",
  Callback = function()
      for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
         if v:IsA('Tool') and v.Name == selectedTotem then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
         end
      end
      wait(.1)
      for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
         if v:IsA('Tool') and v.Name == selectedTotem then
             v:Activate()
         end
      end
  end
}
Tabs.ItemTab:AddSection('[ Meteor Items ]')
Tabs.ItemTab:CreateButton{
  Title = "Collect item from meteor",
  Description = "Click to automatically collect the meteor item",
  Callback = function()
      for _, v in pairs(workspace.MeteorItems:GetChildren()) do
          if v:IsA('Model') then
             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.handle.CFrame
             fireprompt(v.Center.prompt)
          end
      end
  end
}
Tabs.ItemTab:CreateButton{
  Title = "Teleport to meteor",
  Description = "Click to automatically collect the meteor item",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5692.2998046875, 166.10745239257812, 634.0999755859375)
  end
}
Tabs.ItemTab:AddSection('[ Crab Cage ]')
local autoBuyCageToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto buy crab cage", Description = "Activate to buy crab cage automatically", Default = false })
autoBuyCageToggle:OnChanged(function(bool)
  buyCage = bool
  while buyCage do task.wait()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2491.333740234375, 132.75001525878906, 1539.7252197265625)
     for _, v in pairs(workspace.world.interactables:GetDescendants()) do
        if v:IsA('Model') and v.Name == 'Crab Cage' then
           for _, x in pairs(v:GetDescendants()) do
              if x:IsA('ProximityPrompt') and x.Name == 'purchaserompt' then
                 fireproximityprompt(x)
              end
           end
        end
     end
     wait(.02)
     for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
        if v:IsA("ImageButton") or v:IsA("TextButton") and v.Name == 'confirm' then
           for i, Signal in pairs(Signals) do
               firesignal(v[Signal])
           end
       end
     end
  end
end)
local autoPlaceCageToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto place crab cage [ shift lock ]", Description = "Activate to set crab cage automatically", Default = false })
autoPlaceCageToggle:OnChanged(function(bool)
  placeCage = bool
  if placeCage then
     for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA('Tool') and v.Name == 'Crab Cage' then
           game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
     end
  end
  while placeCage do task.wait()
     for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('Tool') and v.Name == 'Crab Cage' then
           local remote = v.Deploy
           local arguments = {
              [1] = CFrame.new(-2447.393798828125, 133.7513427734375, 1566.874755859375, -0.9389709830284119, -0, -0.34399640560150146, -0, 1, -0, 0.34399640560150146, 0, -0.9389709830284119)
           }
           remote:FireServer(unpack(arguments))
           wait(.4)
        end
     end
  end
end)
local autoCollectCageToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto collect crab cage", Description = "Activate to set crab cage automatically", Default = false })
autoCollectCageToggle:OnChanged(function(bool)
  collectCage = bool
  while collectCage do task.wait()
     for _, v in pairs(workspace.active.crabcages:GetChildren()) do
        if v:IsA('Model') and v.Name == game.Players.LocalPlayer.Name then
           for _, x in pairs(v:GetChildren()) do
              if x:IsA('Part') and x.Name == 'handle' then
                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.CFrame
                 v.Prompt.HoldDuration = 0
                 fireproximityprompt(v.Prompt)
              end
           end
        end
     end
  end
end)
Tabs.ItemTab:AddSection('[ Fragments ]')
Tabs.ItemTab:CreateButton{
  Title = "Teleport to deep sea fragment",
  Description = "",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5837.34619140625, 76.7093734741211, 385.126708984375)
  end
}
Tabs.ItemTab:CreateButton{
  Title = "Teleport to earth fragment",
  Description = "",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5968.6123046875, 274.1084289550781, 846.051025390625)
  end
}
Tabs.ItemTab:CreateButton{
  Title = "Teleport to solar fragment",
  Description = "",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6076.6357421875, 443.9457702636719, 679.794189453125)
  end
}
local PositionParagraph = Tabs.ItemTab:CreateParagraph("Paragraph", {
  Title = "Ancient Fragment is caught fishing",
})
Tabs.ItemTab:AddSection('[ Auto Chest ]')
local autoRepairToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto repair map", Description = 'Activate to fix all your maps automatically', Default = false })
autoRepairToggle:OnChanged(function(bool)
  autoRepair = bool
  if autoRepair then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2827.480224609375, 214.8001708984375, 1518.3900146484375);
  end
  while autoRepair do task.wait(.2)
     if not autoRepair then return end
     if workspace.world.npcs:WaitForChild('Jack Marrow').HumanoidRootPart then
        for _, v in pairs(workspace.world.npcs:GetChildren()) do
           if v:IsA('Model') and v.Name == 'Jack Marrow' then
              for _, x in pairs(v:GetChildren()) do
                 if x:IsA('ProximityPrompt') and x.Name == 'dialogprompt' then
                    wait(.5)
                    fireprompt(x)
                    for _, z in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                       if z:IsA('Tool') and z.Name == 'Treasure Map' then
                          game.Players.LocalPlayer.Character.Humanoid:EquipTool(z)
                          wait()
                          for _, jack in pairs(workspace.world.npcs:GetChildren()) do
                             if jack:IsA('Model') and jack.Name == 'Jack Marrow' then
                               local remote = jack.treasure.repairmap
                               local arguments = {}
                               local results = remote:InvokeServer(unpack(arguments))
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
end)
local autoChestToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto open chest", Description = 'Activate to open all the baus on the map automatically', Default = false })
autoChestToggle:OnChanged(function(bool)
  autoOpen = bool
  while autoOpen do task.wait()
     for _, chest in pairs(workspace.world.chests:GetChildren()) do
        if chest:IsA('Part') then
           for _, prompt in pairs(chest:GetChildren()) do
              if prompt:IsA('ProximityPrompt') then
                 prompt.HoldDuration = 0
                 wait(.1)
                 fireproximityprompt(prompt);
              end
           end
        end
     end
  end
end)
Tabs.ItemTab:AddSection('[ Auto Enchant ]')
local EnchantsDropdown = Tabs.ItemTab:AddDropdown("Dropdown", {
  Title = "Select enchant",
  Description = 'Select the enchantment you want to put on your fishing rod',
  Values = {"Sea King", "Swift", "Ghastly", "Lucky", "Divine", "Mutated", "Unbreakable", "Steady", "Blessed", "Wormhole", "Resilient", "Controlled", "Storming", "Breezed", "Insight", "Scrapper", "Quality", "Hasty", "Noir", "Abyssal", "Clever"},
  Multi = false,
  Default = nil,
})
EnchantsDropdown:OnChanged(function(value)
  selectedEnchant = value
end)
local autoEnchantToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto enchant", Description = 'When you activate it, it tries to pick up the enchantment you selected above for your fishing rod', Default = false })
autoEnchantToggle:OnChanged(function(bool)
  autoEnchant = bool
  if autoEnchant then
    if selectedEnchant == nil then
      Library:Notify{
          Title = "Infinity Hub",
          Content = "Please check that you have selected an enchantment",
          Duration = 6
      }
        return
    end
  end
  while autoEnchant do task.wait()
     if not autoEnchant then return end
     if game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Rods[getRod()].Value == selectedEnchant then
        Library:Notify{
            Title = "Infinity Hub",
            Content = "The selected binding has been obtained, function canceled",
            Duration = 6
        }
        return
     end
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1309.2786865234375, -802.427001953125, -83.36397552490234)   
     for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA('Tool') and v.Name == 'Enchant Relic' then
           game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
     end
     wait(.2)
     for _, Enchant in pairs(workspace.world.interactables:GetChildren()) do
        if Enchant:IsA('Model') and Enchant.Name == 'Enchant Altar' then
           fireprompt(Enchant.ProximityPrompt)
           for _, Button in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
              if Button:IsA("ImageButton") or Button:IsA("TextButton") and Button.Name == 'confirm' then
                 for i, Signal in pairs(Signals) do
                     firesignal(Button[Signal])
                 end
             end
           end
        end
     end
  end
end)
Tabs.ItemTab:CreateButton{
  Title = "Teleport to altar",
  Description = "Click to teleport to the enchantment altar",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1309.2786865234375, -802.427001953125, -83.36397552490234)
  end
}
Tabs.ItemTab:AddSection('[ Merlin Shop ]')
local autoRelicToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto buy relic", Description = '', Default = false })
autoRelicToggle:OnChanged(function(bool)
  autoBuyRelic = bool
  if autoBuyRelic then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-931.4317016601562, 225.73080444335938, -993.3056030273438)
  end
  while autoBuyRelic do task.wait(.2)
      if workspace.world.npcs:WaitForChild('Merlin').HumanoidRootPart then
          wait(.5)
          for _, v in pairs(workspace.world.npcs:GetChildren()) do
              if v:IsA('Model') and v.Name == 'Merlin' then
                  fireprompt(v.dialogprompt)
              end
          end
      end
      for _, v in pairs(workspace.world.npcs:GetChildren()) do
          if v:IsA('Model') and v.Name == 'Merlin' then
              local remote = v.Merlin.power
              local arguments = {}
              local results = remote:InvokeServer(unpack(arguments))
          end
      end
  end
end)
local autoLuckToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto buy luck", Description = '', Default = false })
autoLuckToggle:OnChanged(function(bool)
  autoBuyLuck = bool
  autoBuyLuck = bool
  if autoBuyLuck then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-931.4317016601562, 225.73080444335938, -993.3056030273438)
  end
  while autoBuyLuck do task.wait()
     if workspace.world.npcs:WaitForChild('Merlin').HumanoidRootPart then
        wait(.5)
        for _, v in pairs(workspace.world.npcs:GetChildren()) do
           if v:IsA('Model') and v.Name == 'Merlin' then
              fireprompt(v.dialogprompt)
           end
        end
     end
     for _, v in pairs(workspace.world.npcs:GetChildren()) do
        if v:IsA('Model') and v.Name == 'Merlin' then
           local remote = v.Merlin.luck
           local arguments = {}
           local results = remote:InvokeServer(unpack(arguments))
        end
     end
  end
end)
Tabs.ItemTab:AddSection('[ Buy Bait ]')
local BaitDropdown = Tabs.ItemTab:AddDropdown("Dropdown", {
  Title = "Select bait",
  Description = 'Select the bait you want',
  Values = getBait(),
  Multi = false,
  Default = nil,
})
BaitDropdown:OnChanged(function(value)
  selectedBait = value
end)
Tabs.ItemTab:CreateButton{
  Title = "Equip bait",
  Description = "Equip the bait you have selected",
  Callback = function()
      local remote = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.equipment.bait.scroll.safezone.e
      local arguments = {
         [1] = selectedBait
      }
      remote:FireServer(unpack(arguments))
  end
}
local baitToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto buy bait crate", Description = '', Default = false })
baitToggle:OnChanged(function(bool)
  buybait = bool
  while buybait do task.wait()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1466.0634765625, 133.223876953125, 678.8411865234375)
     for _, v in pairs(workspace.world.interactables:GetDescendants()) do
        if v:IsA('Model') and v.Name == 'Bait Crate' then
           for _, x in pairs(v:GetDescendants()) do
              if x:IsA('ProximityPrompt') and x.Name == 'purchaserompt' then
                 fireproximityprompt(x)
              end
           end
        end
     end
     wait(.02)
     for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
        if v:IsA("ImageButton") or v:IsA("TextButton") and v.Name == 'confirm' then
           for i, Signal in pairs(Signals) do
               firesignal(v[Signal])
           end
       end
     end
  end
end)
local qualityBaitToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto buy quality bait crate", Description = '', Default = false })
qualityBaitToggle:OnChanged(function(bool)
  buyqualitybait = bool
  while buyqualitybait do task.wait()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-173.23184204101562, 143.21090698242188, 1932.7012939453125)
      for _, v in pairs(workspace.world.interactables:GetDescendants()) do
         if v:IsA('Model') and v.Name == 'Quality Bait Crate' then
            for _, x in pairs(v:GetDescendants()) do
               if x:IsA('ProximityPrompt') and x.Name == 'purchaserompt' then
                  fireproximityprompt(x)
               end
            end
         end
      end
      wait(.02)
      for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
          if v:IsA("ImageButton") or v:IsA("TextButton") and v.Name == 'confirm' then
              for i, Signal in pairs(Signals) do
                  firesignal(v[Signal])
              end
          end
      end
  end
end)
local festiveBaitToggle = Tabs.ItemTab:AddToggle("", {Title = "Auto buy festige bait crate", Description = '', Default = false })
festiveBaitToggle:OnChanged(function(bool)
  buyqualitybait = bool
  while buyqualitybait do task.wait()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13.25971508026123, 364.63580322265625, -9587.4033203125)
      for _, v in pairs(workspace.world.interactables:GetDescendants()) do
         if v:IsA('Model') and v.Name == 'Festive Bait Crate' then
            for _, x in pairs(v:GetDescendants()) do
               if x:IsA('ProximityPrompt') and x.Name == 'purchaserompt' then
                  fireproximityprompt(x)
               end
            end
         end
      end
      wait(.02)
      for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
          if v:IsA("ImageButton") or v:IsA("TextButton") and v.Name == 'confirm' then
              for i, Signal in pairs(Signals) do
                  firesignal(v[Signal])
              end
          end
      end
  end
end)
local baitsCrate = {'Bait Crate', 'Quality Bait Crate', 'Festive Bait Crate'}
local openAllBaitToggle = Tabs.ItemTab:AddToggle("", {Title = "Open all baits crate", Description = '', Default = false })
openAllBaitToggle:OnChanged(function(bool)
  autoopencrate = bool
  while autoopencrate do task.wait()
     for _, v in pairs(game:GetService('Players').LocalPlayer.Backpack:GetChildren()) do
        for _, baitName in ipairs(baitsCrate) do
           if v.Name == baitName then
              game:GetService('Players').LocalPlayer.Character.Humanoid:EquipTool(v)
           end
        end
     end
     wait(.1)
     for _, v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
        for _, baitName in ipairs(baitsCrate) do
           if v.Name == baitName then
              v:Activate()
           end
        end
     end
  end
end)


Tabs.SkinsTab:CreateSection('[ Skins Crate ]')
local skinsCrateDropdown = Tabs.SkinsTab:AddDropdown("Dropdown", {
  Title = "Select bait",
  Description = 'Select the skin crate you want to buy',
  Values = {'Moosewood', 'Ancient', 'Desolate'},
  Multi = false,
  Default = nil,
})
skinsCrateDropdown:OnChanged(function(value)
  selectedSkinCrate = value
end)
Tabs.SkinsTab:CreateButton{
  Title = "Buy",
  Description = "",
  Callback = function()
      if selectedSkinCrate == nil then
          Library:Notify{
              Title = "Infinity Hub",
              Content = "Check if you have selected any skin crate",
              Duration = 6
          }
          return
      else
          local args = {[1] = selectedSkinCrate}
          game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/SkinCrates/Purchase"):InvokeServer(unpack(args))        
      end
  end
}
Tabs.SkinsTab:CreateButton{
  Title = "Teleport to skin merchant",
  Description = "",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(414.6575622558594, 135.05563354492188, 197.09628295898438)
  end
}


Tabs.TeleportTab:AddSection('[ Teleport Islands ]')
local islandsDropdown = Tabs.TeleportTab:AddDropdown("Dropdown", {
  Title = "Select island",
  Description = 'Select the island you want to teleport',
  Values = {'Moosewood', 'Roslit Bay', 'Snowcap Island', 'Terrapin Island', 'Statue Of Sovereignty', 'Mushgrove', 'Sunstone Island', 'Forsaken Shores', 'Vertigo', 'The Depths', 'Desolate Deep', 'Brine Pool', 'Ancient Isle', 'Ancient Archives', 'Winter Village', 'Lantern'},
  Multi = false,
  Default = nil,
})
islandsDropdown:OnChanged(function(value)
  selectedIslands = value
end)
Tabs.TeleportTab:CreateButton{
  Title = "Teleport",
  Description = "",
  Callback = function()
      if selectedIslands == nil then
          Library:Notify{
              Title = "Infinity Hub",
              Content = "Check that you have selected an island",
              Duration = 6
          }
         return
      end
      if selectedIslands == 'Moosewood' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(484.861145, 294.572845, 274.825012, 1, 0, 0, 0, 1, 0, 0, 0, 1)
      elseif selectedIslands == 'Roslit Bay' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1460.5662841796875, 133.00003051757812, 696.8010864257812)
      elseif selectedIslands == 'Snowcap Island' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2596.634765625, 135.2838592529297, 2411.908935546875)
      elseif selectedIslands == 'Terrapin Island' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-201.41055297851562, 132.5, 1934.931884765625)
      elseif selectedIslands == 'Statue Of Sovereignty' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(32.57449722290039, 144.49334716796875, -1019.4222412109375)
      elseif selectedIslands == 'Mushgrove' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2435.184814453125, 130.904052734375, -681.1665649414062)
      elseif selectedIslands == 'Sunstone Island' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-927.7721557617188, 132.1951904296875, -1117.028076171875)
      elseif selectedIslands == 'Forsaken Shores' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2488.512451171875, 133.25, 1555.265869140625)
      elseif selectedIslands == 'Vertigo' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.57405090332031, -515.2993774414062, 1032.639892578125)
      elseif selectedIslands == 'The Depths' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(950.9325561523438, -711.662109375, 1226.224853515625)
      elseif selectedIslands == 'Desolate Deep' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1517.6444091796875, -234.70489501953125, -2844.056396484375)
      elseif selectedIslands == 'Brine Pool' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1796.3546142578125, -142.69384765625, -3314.6455078125)
      elseif selectedIslands == 'Ancient Isle' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6060.2119140625, 195.1801300048828, 288.9572448730469)
      elseif selectedIslands == 'Ancient Archives' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3160.580078125, -747.21044921875, 1706.7183837890625)
      elseif selectedIslands == 'Winter Village' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.33557891845703, 364.6358337402344, -9582.041015625)
      elseif selectedIslands == 'Lantern' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39.32403564453125, -246.57000732421875, 202.68121337890625)
      end
  end
}
Tabs.AprraiserTab:AddSection('[ Auto Aprraiser ]')
local FishNameIput = Tabs.AprraiserTab:CreateInput("Input", {
  Title = "Enter fish name",
  Description = 'Enter the name of the fish you want to',
  Default = "",
  Placeholder = "...",
  Numeric = false,
  Finished = false,
})
FishNameIput:OnChanged(function(value)
  fishName = value
end)
local EnchantAppraiserDropdown = Tabs.AprraiserTab:AddDropdown("Dropdown", {
  Title = "Select mutation",
  Description = 'Select the totem you want to buy or teleport',
  Values = {'Aurora', 'Amber', 'Darkened', 'Frozen', 'Nuclear', 'Subspace', 'Midas', 'Greedy', 'Glossy', 'Schorched', 'Revitalized', 'Sunken', 'Solarblaze', 'Albino', 'Purified', 'Seasonal', 'Mosaic', 'Fossilized', 'Silver', 'Atlantean', 'Sandy', 'Translucent', 'Electric', 'Sinister', 'Ghastly', 'Anomalous', 'Unsellable', 'Blessed', 'Hexed', 'Abyssal', 'Celestial', 'Mythical', 'Lunar', 'Negative', 'Festive', 'Jolly', 'Minty'},
  Multi = true,
  Default = {''},
})
EnchantAppraiserDropdown:OnChanged(function(value)
  selectedEnchantAppraiser = value
end)
local autoAppraiserToggle = Tabs.AprraiserTab:AddToggle("", {Title = "Auto appraiser", Description = 'Activate to have the fish appraiser automatically', Default = false })
autoAppraiserToggle:OnChanged(function(bool)
  autoAppraiser = bool
  if autoAppraiser then
     if fishName == '' or selectedEnchantAppraiser == '' then
        Library:Notify{
            Title = "Infinity Hub",
            Content = "Please, select a fish name or mutation first",
            Duration = 6
        }
        return
     end
  end
  while autoAppraiser do task.wait()
     for _, v in pairs(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Inventory:GetChildren()) do
        if v:IsA('StringValue') and v.Name:lower():find(fishName) then
            for _, x in pairs(v:GetChildren()) do
                if x:IsA('StringValue') and x.Name == 'Mutation' then
                   for _, value in ipairs(selectedEnchantAppraiser) do
                      if x.Value == value then
                          Library:Notify{
                              Title = "Infinity Hub",
                              Content = "Acquired enchantment",
                              Duration = 6
                          }
                          return
                      end
                   end
                end
            end
        end
     end
     for _, v in pairs(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Inventory:GetChildren()) do
         if v:IsA('StringValue') and v.Name:lower():find(fishName) then
             for _, x in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                 if x:IsA('Tool') and x.Name == v.Value then
                     game.Players.LocalPlayer.Character.Humanoid:EquipTool(x)
                 end
             end
         end
     end
     wait(.02)
     workspace.world.npcs.Appraiser.appraiser.appraise:InvokeServer()
  end
end)
Tabs.AprraiserTab:CreateButton{
  Title = "Appraiser fish [ manual ]",
  Description = "Click to appraiser the fish manually",
  Callback = function()
      if fishName == '' then
          Library:Notify{
              Title = "Infinity Hub",
              Content = "Please, select a fish name first",
              Duration = 6
          }
          return
      else
          for _, v in pairs(game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Inventory:GetChildren()) do
             if v:IsA('StringValue') and v.Name:lower():find(fishName) then
                 for _, x in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                     if x:IsA('Tool') and x.Name == v.Value then
                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(x)
                     end
                 end
             end
          end
          wait(.02)
          workspace.world.npcs.Appraiser.appraiser.appraise:InvokeServer()
      end
  end
}
Tabs.AprraiserTab:CreateButton{
  Title = "Teleport to appraiser",
  Description = "Click to teleport to appraiser npc",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(445, 151, 208)
  end
}


Tabs.EventTab:AddSection('[ Megalodon ]')
local notifyMegalodonToggle = Tabs.EventTab:AddToggle("", {Title = "Notify if megalodon spawned", Description = 'Notifies if the megalodon has spawned on the map', Default = false })
notifyMegalodonToggle:OnChanged(function(bool)
  notifyMegalodon = bool
  game.Workspace.DescendantAdded:Connect(function(Descendant)
      if notifyMegalodon and Descendant:IsA("Part") and Descendant.Name == 'Megalodon Default' then
          Library:Notify{
              Title = "Infinity Hub",
              Content = "Megalodon spawned on the map",
              Duration = 6
          }
      end
  end)
end)
local autoSpawnMegalodonToggle = Tabs.EventTab:AddToggle("", {Title = "Auto spawn megalodon", Description = 'Automatically use the sundial totem to spaw the megalodon', Default = false })
autoSpawnMegalodonToggle:OnChanged(function(bool)
  autoMegalogon = bool
  while autoMegalogon do task.wait()
     for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA('Tool') and v.Name == 'Sundial Totem' then
           game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
     end
     wait(.1)
     for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('Tool') and v.Name == 'Sundial Totem' then
            v:Activate()
        end
     end
  end
end)
Tabs.EventTab:CreateButton{
  Title = "Check megalodon",
  Description = "Check if megalodon are already spawned",
  Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
          if v:IsA('Part') and v.Name == 'Megalodon Default' then
              Library:Notify{
                  Title = "Infinity Hub",
                  Content = "Megalodon is already spawned",
                  Duration = 6
              }
          else
              Library:Notify{
                  Title = "Infinity Hub",
                  Content = "Megalodon is not spawned",
                  Duration = 6
              }
          end
      end
  end
}
Tabs.EventTab:CreateButton{
  Title = "Teleport to megalodon",
  Description = "",
  Callback = function()
      for _, v in pairs(workspace.active:GetChildren()) do
         if v.Name == 'Megalodon Default' then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
      for _, v in pairs(workspace.zones.fishing:GetDescendants()) do
         if v.Name == 'Megalodon Default' then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
  end
}
Tabs.EventTab:AddSection('[ Ancient Serpent ]')
local notifySerpentToggle = Tabs.EventTab:AddToggle("", {Title = "Notify if ancient serpent spawned", Description = 'Notifies if the ancient serpent has spawned on the map', Default = false })
notifySerpentToggle:OnChanged(function(bool)
  notifySerpent = bool
  game.Workspace.DescendantAdded:Connect(function(Descendant)
      if notifySerpent and Descendant:IsA("Part") and Descendant.Name == 'The Depths - Serpent' then
          Library:Notify{
              Title = "Infinity Hub",
              Content = "Ancient Serpent spawned on the map",
              Duration = 6
          }
      end
  end)
end)
Tabs.EventTab:CreateButton{
  Title = "Check ancient serpent",
  Description = "Check if ancient serpent are already spawned",
  Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
          if v:IsA('Part') and v.Name == 'The Depths - Serpent' then
              Library:Notify{
                  Title = "Infinity Hub",
                  Content = "Ancient Serpent is already spawned",
                  Duration = 6
              }
          end
      end
  end
}
Tabs.EventTab:CreateButton{
  Title = "Teleport to ancient serpent",
  Description = "",
  Callback = function()
      for _, v in pairs(workspace.active:GetChildren()) do
         if v.Name == 'The Depths - Serpent' then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
      for _, v in pairs(workspace.zones.fishing:GetDescendants()) do
         if v.Name == 'The Depths - Serpent' then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
  end
}
Tabs.EventTab:AddSection('[ Travelling Merchant ]')
local notifyTravellingToggle = Tabs.EventTab:AddToggle("", {Title = "Notify if travelling merchant spawned", Description = 'Notifies if the travelling merchant has spawned on the map', Default = false })
notifyTravellingToggle:OnChanged(function(bool)
  notifyMerchant = bool
  game.Workspace.DescendantAdded:Connect(function(Descendant)
      if notifyMerchant and Descendant:IsA("Part") and Descendant.Name == 'Merchant Boat' then
          Library:Notify{
              Title = "Infinity Hub",
              Content = "Merchant Boat spawned on the map",
              Duration = 6
          }
      end
  end)
end)
Tabs.EventTab:CreateButton{
  Title = "Check travelling merchant",
  Description = "Check if travelling merchant are already spawned",
  Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
          if v:IsA('Part') and v.Name == 'Merchant Boat' then
              Library:Notify{
                  Title = "Infinity Hub",
                  Content = "Travelling Merchant is already spawned",
                  Duration = 6
              }
          end
      end
  end
}
Tabs.EventTab:CreateButton{
  Title = "Teleport to travelling merchant",
  Description = "",
  Callback = function()
      for _, v in pairs(workspace.active:GetChildren()) do
         if v.Name == 'Merchant Boat' then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
      for _, v in pairs(workspace.zones.fishing:GetDescendants()) do
         if v.Name == 'Merchant Boat' then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
  end
}
Tabs.EventTab:AddSection('[ All Sharks Events ]')
local sharkEvents = {'Great White Shark', 'Great Hammerhead Shark', 'Whale Shark'}
local notifySharkEventToggle = Tabs.EventTab:AddToggle("", {Title = "Notify if travelling merchant spawned", Description = 'Notifies if the travelling merchant has spawned on the map', Default = false })
notifySharkEventToggle:OnChanged(function(bool)
  notifySharkEvent = bool
  game.Workspace.DescendantAdded:Connect(function(Descendant)
      if notifySharkEvent and Descendant:IsA("Model") and table.find(sharkEvents, Descendant.Name) then
          Library:Notify{
              Title = "Infinity Hub",
              Content = Descendant.Name.." spawned on the map",
              Duration = 6
          }
      end
  end)
end)
Tabs.EventTab:CreateButton{
  Title = "Teleport to shark event",
  Description = "",
  Callback = function()
      for _, v in pairs(workspace.active:GetChildren()) do
         if table.find(sharkEvents, v.Name) then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
      for _, v in pairs(workspace.zones.fishing:GetDescendants()) do
         if table.find(sharkEvents, v.Name) then
            if v:IsA('Part') then
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            else
               game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
            end
         end
      end
  end
}


Tabs.TotemTab:AddSection('[ Auto Use Totem ]')
local AutoTotemsDropdown = Tabs.TotemTab:AddDropdown("Dropdown", {
  Title = "Select totem",
  Description = 'Select the totem you want to use automatically',
  Values = {'Tempest Totem', 'Smokescreen Totem', 'Sundial Totem', 'Aurora Totem', 'Windset Totem', 'Eclipse Totem', 'Meteor Totem'},
  Multi = false,
  Default = nil,
})
AutoTotemsDropdown:OnChanged(function(value)
  selectedAutoTotem = value
end)
local CycleDropdown = Tabs.TotemTab:AddDropdown("Dropdown", {
  Title = "Select totem",
  Description = 'Select the cycle you want to use the totem',
  Values = {'Day', 'Night'},
  Multi = false,
  Default = nil,
})
CycleDropdown:OnChanged(function(value)
  selectedCycle = value
end)
local autoUseTotemToggle = Tabs.TotemTab:AddToggle("", {Title = "Auto use totem", Description = 'Uses the totem you selected in the desired cycle automatically', Default = false })
autoUseTotemToggle:OnChanged(function(bool)
  autousetotem = bool
  local cycle = game:GetService("ReplicatedStorage").world.cycle

  if autousetotem then
     if selectedAutoTotem == nil or selectedCycle == nil then
        Library:Notify{
            Title = "Infinity Hub",
            Content = "Please select the totem or cycle before performing this function",
            Duration = 6
        }
        return
     end
  end
  while autousetotem do task.wait()
     if selectedCycle == 'Day' then
        if cycle.Value == 'Day' then
           for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
              if v:IsA('Tool') and v.Name == selectedAutoTotem then
                 game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
              end
           end
           wait(.1)
           for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
              if v:IsA('Tool') and v.Name == selectedAutoTotem then
                 v:Activate()
              end
           end
           wait(.1)
           cycle.Value = 'Night'
        end
     elseif selectedCycle == 'Night' then
        if cycle.Value == 'Night' then
           for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
              if v:IsA('Tool') and v.Name == selectedAutoTotem then
                 game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
              end
           end
           wait(.1)
           for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
              if v:IsA('Tool') and v.Name == selectedAutoTotem then
                 v:Activate()
              end
           end
           wait(.1)
           cycle.Value = 'Day'
        end
     end
  end
end)


Tabs.LPlayer:AddSection('[ Game Cheats ]')
local OxygenToggle = Tabs.LPlayer:AddToggle("", {Title = "Infinite oxygen", Description = 'Activate this option to get infinite oxygen', Default = false })
OxygenToggle:OnChanged(function(bool)
  oxygen = bool
  if oxygen then
     game:GetService('Players').LocalPlayer.Character.client.oxygen.Enabled = false
  else
     game:GetService('Players').LocalPlayer.Character.client.oxygen.Enabled = true
  end
end)
local WalkOnWaterToggle = Tabs.LPlayer:AddToggle("", {Title = "Walk on water", Description = 'Activate to walk on water', Default = false })
WalkOnWaterToggle:OnChanged(function(bool)
  walkon = bool
  if walkon then
     createPlatform()
  else
     removePlatform()
  end
  game:GetService("RunService").RenderStepped:Connect(function()
     if walkon and platform then
        local player = game.Players.LocalPlayer
        local character = player.Character
         if character then
             local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
             if humanoidRootPart then
                 local playerPosition = humanoidRootPart.Position
                 if playerPosition.Y <= waterHeight + 5 and playerPosition.Y >= waterHeight - 10 then
                     platform.Position = Vector3.new(playerPosition.X, waterHeight + offset, playerPosition.Z)
                 end
             end
         end
     end
  end)
end)
local WalkUnderWaterToggle = Tabs.LPlayer:AddToggle("", {Title = "Walk under water", Description = 'Activate to walk under water', Default = false })
WalkUnderWaterToggle:OnChanged(function(bool)
  waklunder = bool    
  if waklunder then
      game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Swimming", false)
  else
      game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Swimming", true)
  end
end)
Tabs.LPlayer:CreateButton{
  Title = "Full brightness",
  Description = "Leaves the whole map without shadows",
  Callback = function()
      local url = 'https://raw.githubusercontent.com/InfinityMercury77/InfinityHub/refs/heads/main/modules/FullBright/source.lua'
      loadstring(game:HttpGet(url))()
  end
}
Tabs.LPlayer:CreateButton{
  Title = "Reset character",
  Description = "Click this button if a bug occurs",
  Callback = function()
      game:GetService('Players').LocalPlayer.Character.Head:Destroy()
  end
}
Tabs.LPlayer:CreateButton{
  Title = "Infinite Jump",
  Description = "Click on this button to be able to jump infinitely",
  Callback = function()
      game:GetService('UserInputService').JumpRequest:connect(function()
          game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
      end)
  end
}


Tabs.Players:AddSection('[ Trade Players ]')
local PlayersDropdown = Tabs.Players:AddDropdown("Dropdown", {
  Title = "Select player",
  Description = 'Select the player you want',
  Values = getPlayers(),
  Multi = false,
  Default = nil,
})
PlayersDropdown:OnChanged(function(value)
  selectedPlayer = value
end)
local TradeToggle = Tabs.Players:AddToggle("", {Title = "Auto trade", Description = 'take your fish and send the trade to the selected player', Default = false })
TradeToggle:OnChanged(function(bool)
  autoTrade = bool
  while autoTrade do task.wait()
     for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA('Tool') and table.find(getFish(), v.Name) then
           if not autoTrade then return end
           game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
           wait()
           local remote = game.Players.LocalPlayer.Character[v.Name].offer
           local arguments = {
              [1] = game:GetService("Players")[selectedPlayer]
           }
           remote:FireServer(unpack(arguments))
        end
     end
  end
end)
Tabs.Players:CreateButton{
  Title = "Teleport",
  Description = "Teleports to the selected player",
  Callback = function()
      game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(
          game:GetService('Players')[selectedPlayer].Character:GetPivot()
      )
  end
}
Tabs.Players:CreateButton{
  Title = "Refresh",
  Description = "",
  Callback = function()
      RefreshDropdown(PlayersDropdown, getPlayers())
  end
}


Tabs.CreditsTab:CreateParagraph("Paragraph", {
  Title = "Information",
  Content = "Script owner: Lmy77\nScripter: Lmy77\nLibrary owner: ActualMasterOogway\nScript version: "..scriptVersion
})
