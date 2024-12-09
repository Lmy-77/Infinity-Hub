-- detect service
local UserInputService = game:GetService("UserInputService")
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	print('[infinity Hub]: [   SUCCESS   ] - Script loaded 🟢')
   print('[infinity Hub]: [   GAME   ] - Fisch 🐟')
   print('[infinity Hub]: [   SERVICE   ] - Mobile 📱')
else
	print('[infinity Hub]: [   SUCCESS   ] - Script loaded 🟢')
   print('[infinity Hub]: [   GAME   ] - Fisch 🐟')
   print('[infinity Hub]: [   SERVICE   ] - Computer 💻')
end



-- variables
function getRod()
   for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
      if v:IsA('Tool') and v.Name:lower():find('rod') then
         return v.Name
      end
   end
end
getgenv().Fish = {"Abyssacuda", "Acanthodii", "Alligator", "Alligator Gar", "Amberjack", "Amblypterus", "Amethyst", "Anchovy", "Ancient Depth Serpent", "Ancient Eel", "Ancient Fragment", "Ancient Megalodon", "Ancient Serpent Skull", "Ancient Serpent Spine", "Ancient Wood", "Angelfish", "Anglerfish", "Anomalocaris", "Arapaima", "Arctic Char", "Aurora Pearl", "Axolotl", "Baby Pond Emperor", "Bait Crate", "Banditfish", "Barbed Shark", "Barracuda", "Barracuda's Spine", "Barreleye Fish", "Basalt", "Birgeria", "Black Dragon Fish", "Blackfish", "Blue Tang", "Bluefin Tuna", "Bluefish", "Bluegill", "Bone", "Boot", "Bowfin", "Bream", "Brine Phantom", "Brine Shrimp", "Buccaneer Barracuda", "Bull Shark", "Burbot", "Butterflyfish", "Candy Fish", "Captain's Goldfish", "Carbon Crate", "Carp", "Catfish", "Chinfish", "Chinook Salmon", "Chub", "Cladoselache", "Clam", "Claw Gill", "Clownfish", "Cobia", "Cockatoo Squid", "Cod", "Coelacanth", "Colossal Squid", "Common Crate", "Cookiecutter Shark", "Coral Geode", "Corsair Grouper", "Crab", "Crown Bass", "Cursed Eel", "Cutlass Fish", "Deep Pearl", "Deep Sea Fragment", "Deep-sea Dragonfish", "Deep-sea Hatchetfish", "Depth Octopus", "Destroyed Fossil", "Diplurus", "Dolphin", "Driftwood", "Dumbo Octopus", "Dunkleosteus", "Dweller Catfish", "Earth Fragment", "Eel", "Ember Perch", "Ember Snapper", "Emperor Jellyfish", "Enchant Relic", "Eyefestation", "Fangborn Gar", "Fish Barrel", "Floppy", "Flounder", "Flying Fish", "Fossil Fan", "Frilled Shark", "Fungal Cluster", "Galleon Goliath", "Gazerfish", "Ghoulfish", "Gilded Pearl", "Ginsu Shark", "Glacier Pike", "Glacierfish", "Glassfish", "Globe Jellyfish", "Goblin Shark", "Golden Sea Pearl", "Golden Seahorse", "Golden Smallmouth Bass", "Goldfish", "Grayling", "Great Hammerhead Shark", "Great White Shark", "Grey Carp", "Gudgeon", "Haddock", "Halibut", "Hallucigenia", "Handfish", "Helicoprion", "Herring", "Horseshoe Crab", "Hyneria", "Ice", "Inferno Wood", "Isonade", "Keepers Guardian", "King Oyster", "Lapis Lazuli", "Lapisjack", "Largemouth Bass", "Leedsichthys", "Lepidotes", "Lingcod", "Lobster", "Log", "Longtail Bass", "Luminescent Minnow", "Lurkerfish", "Mackerel", "Magma Tang", "Mahi Mahi", "Manta Ray", "Marsh Gar", "Mauve Pearl", "Meg's Fang", "Meg's Spine", "Megalodon", "Midnight Axolotl", "Minnow", "Molten Banshee", "Moon Wood", "Moonfish", "Moonstone", "Mosasaurus", "Mullet", "Mushgrove Crab", "Mussel", "Mutated Shark", "Mythic Fish", "Napoleonfish", "Nautilus", "Nessie", "Nessie's Spine", "Night Shrimp", "Nurse Shark", "Oarfish", "Obsidian Salmon", "Obsidian Swordfish", "Olm", "Onychodus", "Opal", "Oyster", "Palaeoniscum", "Palaeoniscus", "Pale Tang", "Pearl", "Perch", "Phanerorhynchus", "Phantom Megalodon", "Phantom Ray", "Pike", "Piranha", "Pollock", "Pond Emperor", "Porgy", "Prawn", "Pufferfish", "Pumpkinseed", "Pyrogrub", "Quality Bait Crate", "Rabbitfish", "Red Drum", "Red Snapper", "Red Tang", "Redeye Bass", "Reefrunner Snapper", "Ribbon Eel", "Ringle", "Rock", "Rockstar Hermit Crab", "Rose Pearl", "Rubber Ducky", "Ruby", "Sailfish", "Salmon", "Sand Dollar", "Sardine", "Sawfish", "Scallop", "Scrap Metal", "Scurvy Sailfish", "Sea Bass", "Sea Mine", "Sea Pickle", "Sea Snake", "Sea Turtle", "Sea Urchin", "Seaweed", "Shark Fang", "Shipwreck Barracuda", "Shortfin Mako Shark", "Shrimp", "Skelefish", "Skipjack Tuna", "Slate Tuna", "Small Spine Chimera", "Smallmouth Bass", "Snook", "Sockeye Salmon", "Solar Fragment", "Spectral Serpent", "Spider Crab", "Spiderfish", "Spine Blade", "Spine Bone", "Spined Fin", "Squid", "Stalactite", "Starfish", "Stingray", "Sturgeon", "Suckermouth Catfish", "Sunfish", "Swamp Bass", "Swamp Scallop", "Sweetfish", "Swordfish", "The Depths Key", "Three-eyed Fish", "Tire", "Trout", "Trumpetfish", "Turkey", "Twilight Eel", "Umbral Shark", "Void Wood", "Voidfin Mahi", "Volcanic Geode", "Voltfish", "Walleye", "Whale Shark", "Whiptail Catfish", "Whisker Bill", "White Bass", "White Perch", "Wiifish", "Xiphactinus", "Yellow Boxfish", "Yellowfin Tuna", "Zombiefish"}
local _Fish = getgenv().Fish
function getFish()
   local fishesName = {}
   for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
      if v:IsA('Tool') and table.find(_Fish, v.Name) then
         table.insert(fishesName, v.Name)
      end
   end
   return fishesName
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
function SafeZone()
   local safeZone = Instance.new('Part')
   safeZone.Name = 'safeZone'
   safeZone.Parent = workspace
   safeZone.Anchored = true
   safeZone.CFrame = CFrame.new(3345, 136, -165)
   safeZone.Size = Vector3.new(10, 1, 10)
end
SafeZone()
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
local vim = game:GetService("VirtualInputManager")
local Signals = {"Activated", "MouseButton1Down", "MouseButton2Down", "MouseButton1Click", "MouseButton2Click"}
local scriptVersion = '2.0'
local x = 580
local y = 350



-- library settings
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/InfinityMercury77/Library/refs/heads/main/Rayfield/source.lua'))()
local Window = Rayfield:CreateWindow({
   Name = "Infinity Hub | Fisch 🐟",
   Icon = 0,
   LoadingTitle = "Infinity Hub v2",
   LoadingSubtitle = "by Lmy77",
   Theme = 'AmberGlow',
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = false,
})
Rayfield:Notify({
   Title = "Infinity Hub",
   Content = "Hello ".. game.Players.LocalPlayer.Name ..", I hope you enjoy using Infinity Hub, have fun! ❤️",
   Duration = 8,
   Image = 10723415766
})



-- tabs
local FischTab = Window:CreateTab("Fish")
local RodTab = Window:CreateTab("Rod")
local ItemTab = Window:CreateTab("Item")
local NotifyTab = Window:CreateTab("Notify")
local TeleportTab = Window:CreateTab("Teleport")
local LPlayerTab = Window:CreateTab("Local Player")
local PlayersTab = Window:CreateTab("Players")
local VisualTab = Window:CreateTab("Visual")
local SettingsTab = Window:CreateTab("Settings")


-- code
local Section = FischTab:CreateSection("[ Fish Farm ]")
local Toggle = FischTab:CreateToggle({
   Name = "Auto cast",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autocast = bool
      while autocast do task.wait()
         if not autocast then return end
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
   end,
})
local Toggle = FischTab:CreateToggle({
   Name = "Auto shake",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autoshake = bool
      game.Players.LocalPlayer.PlayerGui.DescendantAdded:Connect(function(Descendant)
         if autoshake then
             if Descendant.Name == 'button' and Descendant.Parent.Name == 'safezone' then
                 task.wait(0.24)
                 game:GetService('GuiService').SelectedObject = Descendant
                 vim:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                 vim:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                 task.wait(0.1)
                 game:GetService('GuiService').SelectedObject = nil
             end
         end
      end)
   end,
})
local Toggle = FischTab:CreateToggle({
   Name = "Auto reel",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autoreel = bool
      while autoreel do task.wait()
         game:GetService('ReplicatedStorage').events.reelfinished:FireServer(100, true)
      end
   end,
})
local Section = FischTab:CreateSection("[ Position Settings ]")
SavePos = '';
local PositionLabel = FischTab:CreateLabel("-> Saved position: ", false)
local Button = FischTab:CreateButton({
   Name = "Save position",
   Callback = function()
      SavePos = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position
      PositionLabel:Set('-> Saved position: '..tostring(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position), false)
   end,
})
local Button = FischTab:CreateButton({
   Name = "Teleport to save position",
   Callback = function()
        if SavePos == '' then
            Rayfield:Notify({
               Title = "Infinity Hub",
               Content = "no saved positions found",
               Duration = 4,
               Image = 10723415766
            })
            return
        else
            game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(SavePos)
        end
   end,
})
local Button = FischTab:CreateButton({
   Name = "Reset save position",
   Callback = function()
        SavePos = ''
        PositionLabel:Set("-> Saved position: ", false)
   end,
})



local Section = TeleportTab:CreateSection("[ Teleport Island ]")
local IslandsDropdown = TeleportTab:CreateDropdown({
   Name = "Select islands",
   Options = {'Moosewood', 'Roslit Bay', 'Snowcap Island', 'Terrapin Island', 'Statue Of Sovereignty', 'Mushgrove', 'Sunstone Island', 'Forsaken Shores', 'Vertigo', 'The Depths', 'Desolate Deep', 'Brine Pool', 'Ancient Isle', 'Ancient Archives', 'Lantern'},
   CurrentOption = '',
   MultipleOptions = false,
   Flag = "",
   Callback = function()
   end,
})
local Button = TeleportTab:CreateButton({
   Name = "Teleport to island",
   Callback = function()
      local islands = table.unpack(IslandsDropdown.CurrentOption)
      if islands == '' then
          Rayfield:Notify({
             Title = "Infinity Hub",
             Content = "select island first",
             Duration = 4,
             Image = 10723415766
         })
         return
      end
      if islands == 'Moosewood' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(484.861145, 294.572845, 274.825012, 1, 0, 0, 0, 1, 0, 0, 0, 1)
      elseif islands == 'Roslit Bay' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1460.5662841796875, 133.00003051757812, 696.8010864257812)
      elseif islands == 'Snowcap Island' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2596.634765625, 135.2838592529297, 2411.908935546875)
      elseif islands == 'Terrapin Island' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-201.41055297851562, 132.5, 1934.931884765625)
      elseif islands == 'Statue Of Sovereignty' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(32.57449722290039, 144.49334716796875, -1019.4222412109375)
      elseif islands == 'Mushgrove' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2435.184814453125, 130.904052734375, -681.1665649414062)
      elseif islands == 'Sunstone Island' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-927.7721557617188, 132.1951904296875, -1117.028076171875)
      elseif islands == 'Forsaken Shores' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2488.512451171875, 133.25, 1555.265869140625)
      elseif islands == 'Vertigo' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.57405090332031, -515.2993774414062, 1032.639892578125)
      elseif islands == 'The Depths' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(950.9325561523438, -711.662109375, 1226.224853515625)
      elseif islands == 'Desolate Deep' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1517.6444091796875, -234.70489501953125, -2844.056396484375)
      elseif islands == 'Brine Pool' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1796.3546142578125, -142.69384765625, -3314.6455078125)
      elseif islands == 'Ancient Isle' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6060.2119140625, 195.1801300048828, 288.9572448730469)
      elseif islands == 'Ancient Archives' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3160.580078125, -747.21044921875, 1706.7183837890625)
      elseif islands == 'Lantern' then
         game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39.32403564453125, -246.57000732421875, 202.68121337890625)
      end
   end,
})
local Section = TeleportTab:CreateSection("[ Teleport Zones ]")
local ZonesDropdown = TeleportTab:CreateDropdown({
   Name = "Select zone",
   Options = {'Safe Whirlpool', 'Great White Shark', 'Great Hammerhead Shark', 'Whale Shark', 'The Depths - Serpent', 'Megalodon Default'},
   CurrentOption = '',
   MultipleOptions = false,
   Flag = "",
   Callback = function()
   end,
})
local Button = TeleportTab:CreateButton({
   Name = "Teleport zone",
   Callback = function()
      local zones = table.unpack(ZonesDropdown.CurrentOption)
      if zones == '' then
         Rayfield:Notify({
            Title = "Infinity Hub",
            Content = "select zone first",
            Duration = 4,
            Image = 10723415766
        })
         return
      else
         for _, v in pairs(workspace.active:GetChildren()) do
            if v.Name == zones then
               if v:IsA('Part') then
                  game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
               else
                  game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
               end
            end
         end
         for _, v in pairs(workspace.zones.fishing:GetDescendants()) do
            if v.Name == zones then
               if v:IsA('Part') then
                  game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
               else
                  game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(v:GetPivot())
               end
            end
         end
      end
   end,
})



local Section = LPlayerTab:CreateSection("[ Character Settings ]")
local WalkSpeedInput = LPlayerTab:CreateInput({
   Name = "WalkSpeed",
   CurrentValue = "",
   PlaceholderText = "16",
   RemoveTextAfterFocusLost = false,
   Flag = "",
   Callback = function(Text)
   end,
})
local JumpPowerInput = LPlayerTab:CreateInput({
   Name = "JumpPower",
   CurrentValue = "",
   PlaceholderText = "50",
   RemoveTextAfterFocusLost = false,
   Flag = "",
   Callback = function(Text)
   end,
})
local Toggle = LPlayerTab:CreateToggle({
   Name = "Set walkspeed/jumppower",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      setWalkAndJump = bool
      if setWalkAndJump then
         game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedInput.CurrentValue
         game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = JumpPowerInput.CurrentValue
      else
         game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = 16
         game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = 50
      end
   end,
})
local Section = LPlayerTab:CreateSection("[ Game Settings ]")
local Toggle = LPlayerTab:CreateToggle({
   Name = "Infinite oxygen",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      oxygen = bool
      if oxygen then
         game:GetService('Players').LocalPlayer.Character.client.oxygen.Enabled = false
      else
         game:GetService('Players').LocalPlayer.Character.client.oxygen.Enabled = true
      end
   end,
})
local Toggle = LPlayerTab:CreateToggle({
   Name = "Walk on water",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
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
   end,
})
local Toggle = LPlayerTab:CreateToggle({
   Name = "Walk under water",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      waklunder = bool
      if waklunder then
         game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Swimming", false)
      else
         game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Swimming", true)
      end
   end,
})
local Button = LPlayerTab:CreateButton({
   Name = "Full Bright",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/InfinityMercury77/InfinityHub/refs/heads/main/modules/FullBright/source.lua",true))()
   end,
})
local Section = LPlayerTab:CreateSection("[ Farm Settings ]")
local Toggle = LPlayerTab:CreateToggle({
   Name = "Anti Afk",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      afk = bool
      if afk then
         game:service'Players'.LocalPlayer.Idled:connect(function()
            game:service('VirtualUser'):CaptureController()
            game:service('VirtualUser'):ClickButton2(Vector2.new())
         end)
      end
   end,
})
local Button = LPlayerTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
      game:GetService('UserInputService').JumpRequest:connect(function()
         game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
      end)
   end,
})



local Paragraph = PlayersTab:CreateParagraph({
    Title = "Auto trade waring",
    Content = "If you sent the auto trade to a player and when you send it again it doesn't work. Just press the ‘Refresh dropdown’ button and it will work normally."
})
local Section = PlayersTab:CreateSection("[ Players Settings ]")
local PlayerDropdown = PlayersTab:CreateDropdown({
   Name = "Select Player",
   Options = getPlayers(),
   CurrentOption = '',
   MultipleOptions = false,
   Flag = "",
   Callback = function(Options)
   end,
})
local Toggle = PlayersTab:CreateToggle({
   Name = "Auto trade player",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autotrade = bool
      local playersName = table.unpack(PlayerDropdown.CurrentOption)
      while autotrade do task.wait()
         for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and table.find(getFish(), v.Name) then
               if not autotrade then return end
               game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
               wait()
               local remote = game.Players.LocalPlayer.Character[v.Name].offer
               local arguments = {
                  [1] = game:GetService("Players")[playersName]
               }
               remote:FireServer(unpack(arguments))
            end
         end
      end
   end,
})
local Button = PlayersTab:CreateButton({
   Name = "Teleport player",
   Callback = function()
      local playerTeleport = table.unpack(PlayerDropdown.CurrentOption)
      game:GetService('Players').LocalPlayer.Character.HumanoidRootPart:PivotTo(
         game:GetService('Players')[playerTeleport].Character:GetPivot()
      )
   end,
})
local Button = PlayersTab:CreateButton({
   Name = "Refresh dropdown",
   Callback = function()
      PlayerDropdown:Refresh(getPlayers())
   end,
})



local Section = RodTab:CreateSection("[ Depth Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to Rod of the depths rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1704.0020751953125, -902.5270385742188, 1440.5933837890625)
   end,
})
local Button = RodTab:CreateButton({
   Name = "Teleport to door",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5.462220668792725, -706.1237182617188, 1229.2747802734375)
   end,
})
local Button = RodTab:CreateButton({
   Name = "Teleport to abyssal",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1208, -714, 1316)
   end,
})
local Button = RodTab:CreateButton({
   Name = "Teleport to hexed",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1051.080810546875, -630.1539916992188, 1315.525146484375)
   end,
})
local Section = RodTab:CreateSection("[ Trident Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to trident rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1483.3150634765625, -225.77960205078125, -2206.955322265625)
   end,
})
local Button = RodTab:CreateButton({
   Name = "Teleport to relic pedestal",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1477.8162841796875, -225.71067810058594, -2350.163330078125)
   end,
})
local Section = RodTab:CreateSection("[ Phoenix Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to phoenix rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5971.03076171875, 270.3774108886719, 852.372314453125)
   end,
})
local Section = RodTab:CreateSection("[ Aurora Rod / Nocturnal Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to rods",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-142.84242248535156, -515.1743774414062, 1135.65234375)
   end,
})
local Section = RodTab:CreateSection("[ King Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to king rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1383.3577880859375, -806.767578125, -307.60223388671875)
   end,
})
local Section = RodTab:CreateSection("[ Magma Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to magma rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1845.7042236328125, 165.71112060546875, 161.10154724121094)
   end,
})
local Section = RodTab:CreateSection("[ Destiny Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to destiny rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(979.71240234375, 131.3202362060547, -1235.07666015625)
   end,
})
local Section = RodTab:CreateSection("[ Lost Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to destiny rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2882.42431640625, 137.93795776367188, 2719.812255859375)
   end,
})
local Section = RodTab:CreateSection("[ Magnet Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to magnet rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-198.5894775390625, 132.50001525878906, 1931.30859375)
   end,
})
local Section = RodTab:CreateSection("[ Starter Rod ]")
local Button = RodTab:CreateButton({
   Name = "Teleport to fortune, steady, rapid rod",
   Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1514.638427734375, 141.53482055664062, 764.4584350585938)
   end,
})



local Section = VisualTab:CreateSection("[ Clone Rod ]")
local Paragraph = VisualTab:CreateParagraph({
    Title = "How it works",
    Content = "You select the sticks you want below in the dropdown and it sees if anyone on the server has them. If they do, it clones them and puts them in your inventory (visual effect)."
})
getgenv().SelectedRods = {};
local RodsDropdown = VisualTab:CreateDropdown({
   Name = "Select Rods",
   Options = {'Trident Rod', 'Aurora Rod', 'Mythical Rod', 'No Life Rod', 'Kings Rod', 'Rod Of The Depths'},
   CurrentOption = '',
   MultipleOptions = false,
   Flag = "",
   Callback = function(Options)
    getgenv().SelectedRods = Options
   end,
})
local Input = VisualTab:CreateInput({
   Name = "Place enchantment",
   CurrentValue = "",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Flag = "",
   Callback = function(Text)
    getgenv().enchantment = Text
   end,
})
local Button = VisualTab:CreateButton({
   Name = "Clone rods",
   Callback = function()
      for _, v in pairs(game:GetService("ReplicatedStorage").playerstats:GetDescendants()) do
         if v:IsA('StringValue') and v.Name == tostring(table.unpack(getgenv().SelectedRods)) then
             dupeRod = v:Clone();
             dupeRod.Parent = game:GetService("ReplicatedStorage").playerstats[game:GetService('Players').LocalPlayer.Name].Rods
             if getgenv().enchantment == '' then
                dupeRod.Value = ''
             else
                dupeRod.Value = getgenv().enchantment
             end
         end
      end
   end,
})
local Button = VisualTab:CreateButton({
   Name = "Delete duped rods",
   Callback = function()
    for _, v in pairs(game:GetService("ReplicatedStorage").playerstats[game:GetService('Players').LocalPlayer.Name].Rods:GetChildren()) do
        if v:IsA('StringValue') and v.Name == tostring(dupeRod) then
            v:Destroy()
        end
    end
   end,
})
local Section = VisualTab:CreateSection("[ Character Options ]")
local oldLevel = ''
local oldLevelText = ''
local Button = VisualTab:CreateButton({
   Name = "Infinite level",
   Callback = function()
      for _, v in pairs(game:GetDescendants()) do
         if v:IsA('NumberValue') and v.Name == 'Level' then
            oldLevel = v.Value
            wait(.2)
            v.Value = 9e9
         end
      end
      oldLevelText = oldLevel
      game.Players.LocalPlayer.Character.HumanoidRootPart.user.level.Text = '9000000000'
      print(oldLevel)
      print(oldLevelText)
   end,
})
local Button = VisualTab:CreateButton({
   Name = "Infinite streak",
   Callback = function()
      workspace.Lmy7745.HumanoidRootPart.user.user.Text = '9000000000'
   end,
})



local Section = NotifyTab:CreateSection("[ Notify Options ]")
local Toggle = NotifyTab:CreateToggle({
   Name = "Notify if travelling merchant",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      notifymerchant = bool
      game:GetService('Workspace').DescendantAdded:Connect(function(Descendant)
         if notifymerchant then
            if Descendant:IsA('Model') and Descendant.Name == 'Travelling Merchant' then
               Rayfield:Notify({
                  Title = "Infinity Hub",
                  Content = "Travelling Merchant spawned!",
                  Duration = 8,
                  Image = 10723415766
               })
            end
         end
      end)
   end,
})
local Toggle = NotifyTab:CreateToggle({
   Name = "Notify if megalodon spawned",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      notifymegalodon = bool
      game:GetService('Workspace').DescendantAdded:Connect(function(Descendant)
         if notifymegalodon then
            if Descendant:IsA("Part") and Descendant.Name == 'Megalodon Default' then
               Rayfield:Notify({
                  Title = "Infinity Hub",
                  Content = "Megalodon spawned!",
                  Duration = 8,
                  Image = 10723415766
               })
            end
         end
      end)
   end,
})
local Toggle = NotifyTab:CreateToggle({
   Name = "Notify if ancient serpent",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      notifyserpent = bool
      game:GetService('Workspace').DescendantAdded:Connect(function(child)
         if notifyserpent then
            if child:IsA("Part") and child.Name == 'The Depths - Serpent' then
               Rayfield:Notify({
                  Title = "Infinity Hub",
                  Content = "Ancient Depth Serpent spawned!",
                  Duration = 8,
                  Image = 10723415766
               })
            end
         end
      end)
   end,
})



local Section = ItemTab:CreateSection("[ Auto Sell Items ]")
local Toggle = ItemTab:CreateToggle({
   Name = "Auto sell all",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      sellall = bool
      if sellall then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(466.2166442871094, 150.62973022460938, 230.4716796875);
      end
      while sellall do task.wait(.5)
         for _, v in pairs(workspace.world.npcs:GetChildren()) do
            if v:IsA('Model') and v.Name == 'Marc Merchant' then
               fireprompt(v.dialogprompt)
            end
         end
         for _, v in pairs(workspace.world.npcs:GetChildren()) do
            if v:IsA('Model') and v.Name == 'Marc Merchant' then
               v:WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
            end
         end
      end
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto sell in hand",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      sellhand = bool
      if sellhand then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(466.2166442871094, 150.62973022460938, 230.4716796875);
         for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and table.find(getFish(), v.Name) then
               if not sellhand then return end
               wait(.2)
               game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
               wait(.2)
               for _, v in pairs(workspace.world.npcs:GetChildren()) do
                  if v:IsA('Model') and v.Name == 'Marc Merchant' then
                     fireprompt(v.dialogprompt)
                     wait()
                     local remote = v.merchant.sell
                     local arguments = {}
                     local results = remote:InvokeServer(unpack(arguments))
                     wait(.5)
                  end
               end
            end
         end
      end
   end,
})
local Section = ItemTab:CreateSection("[ Buy Totems ]")
local TotemsDropdown = ItemTab:CreateDropdown({
   Name = "Select totem",
   Options = {'Tempest Totem', 'Smokescreen Totem', 'Sundial Totem', 'Aurora Totem', 'Windset Totem', 'Eclipse Totem', 'Meteor Totem'},
   CurrentOption = '',
   MultipleOptions = false,
   Flag = "",
   Callback = function(Options)
   end,
})
local Button = ItemTab:CreateButton({
   Name = "Teleport to totem",
   Callback = function()
      local totem = table.unpack(TotemsDropdown.CurrentOption)
      if totem == 'Eclipse Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5965.68017578125, 274.1084899902344, 842.2765502929688)
      elseif totem == 'Windset Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2847.599365234375, 178.11056518554688, 2703.43994140625)
      elseif totem == 'Tempest Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(36.73764419555664, 132.50003051757812, 1942.5556640625)
      elseif totem == 'Smokescreen Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2791.701416015625, 139.72959899902344, -629.4711303710938)
      elseif totem == 'Sundial Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1148.489990234375, 134.49998474121094, -1073.515625)
      elseif totem == 'Aurora Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1810.869873046875, -136.9279327392578, -3281.8935546875)
      elseif totem == 'Meteor Totem' then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1949.051025390625, 275.3567199707031, 228.6140594482422)
      end
   end,
})
local Button = ItemTab:CreateButton({
   Name = "Equip totem",
   Callback = function()
      local totem = table.unpack(TotemsDropdown.CurrentOption)
      for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
         if v:IsA('Tool') and v.Name == totem then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
         end
      end
   end,
})
local Section = ItemTab:CreateSection("[ Meteor Spawn ]")
local Button = ItemTab:CreateButton({
   Name = "Teleport to meteor",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5692.2998046875, 166.10745239257812, 634.0999755859375)
   end,
})
local Section = ItemTab:CreateSection("[ Cage Crab ]")
local Toggle = ItemTab:CreateToggle({
   Name = "Auto buy crab cage",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      buycage = bool
      while buycage do task.wait()
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
         for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
            if v:IsA("ImageButton") or v:IsA("TextButton") and v.Name == 'confirm' then
               for i, Signal in pairs(Signals) do
                   firesignal(v[Signal])
               end
           end
         end
      end
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto place crab cage (shift lock)",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      placecage = bool
      while placecage do task.wait()
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
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto collect crab cage",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      collectcage = bool
      while collectcage do task.wait()
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
   end,
})
local Section = ItemTab:CreateSection("[ Fragments Locations ]")
local Button = ItemTab:CreateButton({
   Name = "Teleport to deep sea fragment",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5837.34619140625, 76.7093734741211, 385.126708984375)
   end,
})
local Button = ItemTab:CreateButton({
   Name = "Teleport to earth fragment",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5968.6123046875, 274.1084289550781, 846.051025390625)
   end,
})
local Button = ItemTab:CreateButton({
   Name = "Teleport to solar fragment",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6076.6357421875, 443.9457702636719, 679.794189453125)
   end,
})
local PositionLabel = ItemTab:CreateLabel("Ancient Fragment is caught fishing", false)
local Section = ItemTab:CreateSection("[ Auto Chest Settings]")
local Toggle = ItemTab:CreateToggle({
   Name = "Auto repair map",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autochest = bool
      if autochest then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2827.480224609375, 214.8001708984375, 1518.3900146484375)
      end
      while autochest do task.wait(.2)
         if not autochest then return end
         for _, v in pairs(workspace.world.npcs:GetChildren()) do
            if v:IsA('Model') and v.Name == 'Jack Marrow' then
               fireprompt(v.dialogprompt)
            end
         end
         for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and v.Name == 'Treasure Map' then
               game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
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
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto open chest",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autoopen = bool
      while autoopen do task.wait()
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
   end,
})
local Button = ItemTab:CreateButton({
   Name = "Teleport to jack",
   Callback = function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2827.480224609375, 214.8001708984375, 1518.3900146484375)
   end,
})
local Section = ItemTab:CreateSection("[ Auto Enchant Settings ]")
local EnchantsDropdown = ItemTab:CreateDropdown({
   Name = "Select enchant",
   Options = {"Sea King", "Swift", "Ghastly", "Lucky", "Divine", "Mutated", "Unbreakable", "Steady", "Blessed", "Wormhole", "Resilient", "Controlled", "Storming", "Breezed", "Insight", "Scrapper", "Quality", "Hasty", "Noir", "Abyssal", "Clever"},
   CurrentOption = '',
   MultipleOptions = false,
   Flag = "",
   Callback = function(Options)
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto enchant",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autoenchant = bool
      local enchantF = table.unpack(EnchantsDropdown.CurrentOption)
      if autoenchant then
        if enchantF == '' then
            Rayfield:Notify({
               Title = "Infinity Hub",
               Content = "Please select enchant first",
               Duration = 5,
               Image = 10723415766
            })
            return
        end
      end
      while autoenchant do task.wait()
         if not autoenchant then return end
         if game:GetService("ReplicatedStorage").playerstats[game.Players.LocalPlayer.Name].Rods[getRod()].Value == enchantF then
            Rayfield:Notify({
               Title = "Infinity Hub",
               Content = "The enchantment: "..enchantF.." has been achieved!",
               Duration = 5,
               Image = 10723415766
            })
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
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto buy enchant relic",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autobuyrelic = bool
      if autobuyrelic then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-931.4317016601562, 225.73080444335938, -993.3056030273438)
      end
      while autobuyrelic do task.wait(.2)
         for _, v in pairs(workspace.world.npcs:GetChildren()) do
            if v:IsA('Model') and v.Name == 'Merlin' then
               fireprompt(v.dialogprompt)
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
   end,
})
local Button = ItemTab:CreateButton({
   Name = "Teleport to altar",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1309.2786865234375, -802.427001953125, -83.36397552490234)
   end,
})
local Section = ItemTab:CreateSection("[ Luck Settings ]")
local Toggle = ItemTab:CreateToggle({
   Name = "Auto buy luck",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
      autobuyrelic = bool
      if autobuyrelic then
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-931.4317016601562, 225.73080444335938, -993.3056030273438)
      end
      while autobuyrelic do task.wait(.2)
         for _, v in pairs(workspace.world.npcs:GetChildren()) do
            if v:IsA('Model') and v.Name == 'Merlin' then
               fireprompt(v.dialogprompt)
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
   end,
})
local Section = ItemTab:CreateSection("[ Bait Settings ]")
local BaitDropdown = ItemTab:CreateDropdown({
   Name = "Select Bait",
   Options = getBait(),
   CurrentOption = '',
   MultipleOptions = false,
   Flag = "",
   Callback = function(Options)
   end,
})
local Button = ItemTab:CreateButton({
   Name = "Equip bait",
   Callback = function()
      local _bait = table.unpack(BaitDropdown.CurrentOption)
      local remote = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.equipment.bait.scroll.safezone.e
      local arguments = {
         [1] = _bait
      }
      remote:FireServer(unpack(arguments))
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto buy bait crate",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
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
         for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
            if v:IsA("ImageButton") or v:IsA("TextButton") and v.Name == 'confirm' then
               for i, Signal in pairs(Signals) do
                   firesignal(v[Signal])
               end
           end
         end
      end
   end,
})
local Toggle = ItemTab:CreateToggle({
   Name = "Auto buy quality bait crate",
   CurrentValue = false,
   Flag = "",
   Callback = function(bool)
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
         for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.over:GetDescendants()) do
            if v:IsA("ImageButton") or v:IsA("TextButton") and v.Name == 'confirm' then
               for i, Signal in pairs(Signals) do
                   firesignal(v[Signal])
               end
           end
         end
      end
   end,
})



-- settings
local Section = SettingsTab:CreateSection("[ Information ]")
SettingsTab:CreateLabel("Owner: Lmy77")
SettingsTab:CreateLabel("Scripter: Lmy77")
SettingsTab:CreateLabel("Ui Library: Rayfield | Shlexr")
SettingsTab:CreateLabel("Script Version: "..scriptVersion)
local Section = SettingsTab:CreateSection("[ Library Settings ]")
local ThemesDropdown = SettingsTab:CreateDropdown({
   Name = "Select theme",
   Options = {'Default', 'AmberGlow', 'Amethyst', 'Bloom', 'DarkBlue', 'Green', 'Light', 'Ocean', 'Serenity'},
   CurrentOption = 'AmberGlow',
   MultipleOptions = false,
   Flag = "",
   Callback = function()
   end,
})
local Button = SettingsTab:CreateButton({
   Name = "Apply theme",
   Callback = function()
      local selectedTheme = table.unpack(ThemesDropdown.CurrentOption)
      Window.ModifyTheme(selectedTheme)
   end,
})
local Button = SettingsTab:CreateButton({
   Name = "Destroy hub",
   Callback = function()
      Rayfield:Destroy()
   end,
})
