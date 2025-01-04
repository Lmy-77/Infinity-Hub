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
function getPlayers()
   local playersName = {};
   for _, v in pairs(game:GetService('Players'):GetChildren()) do
       if v.Name ~= game:GetService('Players').LocalPlayer.Name then
           table.insert(playersName, v.Name)
       end
   end
   return playersName
end
function getItems()
   local itemsName = {};
   for _, v in pairs(game:GetService("ReplicatedStorage").Viewports.Items:GetChildren()) do
       if v:IsA("Model") and v.Name ~= "Uncanny Pumpkin" and v.name ~= "robin" and v.Name ~= "Valentine's Day Diary" and v.Name ~= "Alien" and v.Name ~= "Solar Diary" and v.Name ~= "Nothing" then
           table.insert(itemsName, v.Name)
       end
   end
   return itemsName
end
local function EquipTool(ToolName)
   for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
       if v:IsA('Tool') and v.Name == ToolName then
           game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
       end
   end
end
local function FireTool(ToolName)
   for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
       if v.Name == ToolName then
           v.Parent = game.Players.LocalPlayer.Character
       end
   end
   for i, v in pairs (game.Players.LocalPlayer.Character:GetChildren()) do
       if v.Name == ToolName then
           v:Activate()
       end
   end
end



-- library settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
   Title = 'Infinity Hub - '.. scriptVersion ..' | Stands Awakenig',
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
   Stands = Window:AddTab({
       Title = "| Stands",
       Icon = "venetian-mask"
   }),
   LPlayer = Window:AddTab({
       Title = "| Local Player",
       Icon = "circle-user-round"
   }),
   Players = Window:AddTab({
       Title = "| Players",
       Icon = "users-round"
   }),
   Items = Window:AddTab({
       Title = "| Items",
       Icon = "hammer"
   }),
   Money = Window:AddTab({
       Title = "| Money",
       Icon = "banknote"
   }),
   Mobs = Window:AddTab({
       Title = "| Mobs",
       Icon = "ghost"
   }),
   Bosses = Window:AddTab({
       Title = "| Bosses",
       Icon = "angry"
   }),
   Keys = Window:AddTab({
       Title = "| Keys",
       Icon = "key"
   }),
}
Window:SelectTab(1)



-- source
Tabs.Stands:AddSection('[ Time Stopping ]')
local timeStopRemotesDropdown = Tabs.Stands:AddDropdown("Dropdown", {
   Title = "Select event",
   Description = 'Choose the event you want to leave at the time stop with the maximum amount of time',
   Values = {'shadowdio', 'jotaro', 'diooh', 'diego', 'theworldnew'},
   Multi = false,
   Default = nil,
})
timeStopRemotesDropdown:OnChanged(function(value)
   selectedTimeStop = value
end)
local Button = Tabs.Stands:AddButton({
   Title = "Time stop",
   Description = "Click to activate the desired time stop",
   Callback = function()
       game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, selectedTimeStop)
   end
})
local tsToggle = Tabs.Stands:AddToggle("", {Title = "Auto time stop", Description = 'Uses the desired time stop automatically', Default = false })
tsToggle:OnChanged(function(bool)
   loopTS = bool
   while loopTS do task.wait()
       game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, selectedTimeStop)
   end
end)
Tabs.Stands:AddSection('[ Damage ]')
local tsToggle = Tabs.Stands:AddToggle("", {Title = "Auto damage reflect", Description = 'Use to reflect the damage received. Only works in the goldem expirience requiem', Default = false })
tsToggle:OnChanged(function(bool)
   damageReflect = bool
   if damageReflect then
       local ohString1 = "Alternate"
       local ohString2 = "RTZ"
       local ohBoolean3 = true
       game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohBoolean3)
   end
end)
local tsToggle = Tabs.Stands:AddToggle("", {Title = "Auto damage deflect", Description = 'Use to reflect the damage received. Only works in the goldem expirience', Default = false })
tsToggle:OnChanged(function(bool)
   damageDeflect = bool
   if damageDeflect then
       repeat task.wait(.2)
           local ohString1 = "Alternate"
           local ohString2 = "Deflect"
           game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2)
       until damageDeflect == false
   end
end)
Tabs.Stands:AddSection('[ Stand Farm ]')
getgenv().WantedStand = ""
getgenv().DelayInSeconds = 8
getgenv().Webhook = ""
local standsDropdown = Tabs.Stands:AddDropdown("Dropdown", {
   Title = "Select stand",
   Description = 'Select the stand you want to obtain',
   Values = {"Anubis", "D4C", "OMT", "CrazyDiamond", "DoppioKingCrimson", "KillerQueen", "GoldExperience", "StarPlatinum", "StarPlatinumTW", "TheWorld", "HierophantGreen", "Whitesnake", "TheWorldAlternateUniverse", "WhitesnakeAU", "KingCrimsonAU", "SoftAndWetShiny", "StarPlatinumOVA", "TheWorldOVA", "NTWAU", "CreeperQueen", "SPTW", "StickyFingers", "SoftAndWet"},
   Multi = false,
   Default = nil,
})
standsDropdown:OnChanged(function(value)
   getgenv().WantedStand = value
end)
local standFarmToggle = Tabs.Stands:AddToggle("", {Title = "Start", Description = '', Default = false })
standFarmToggle:OnChanged(function(bool)
   standFarm = bool
   local HttpService = game:GetService("HttpService");
   function WebhookFunc(Message)
       local start = game:HttpGet("http://buritoman69.glitch.me");
       local biggie = "http://buritoman69.glitch.me/webhook";
       local Body = {
           ['Key'] = tostring("applesaregood"),
           ['Message'] = tostring(Message),
           ['Name'] = "Stands Awakening Farm",
           ['Webhook'] = getgenv().Webhook
       }
       Body = HttpService:JSONEncode(Body);
       local Data = game:HttpPost(biggie, Body, false, "application/json")
       return Data or nil;
   end
   local function Notification(Title, Text)
       Library:Notify{
           Title = Title,
           Content = Text,
           Duration = 8
       }
   end
   local Stands = {"Anubis", "D4C", "OMT", "CrazyDiamond", "DoppioKingCrimson", "KillerQueen", "GoldExperience", "StarPlatinum", "StarPlatinumTW", "TheWorld", "HierophantGreen", "Whitesnake", "TheWorldAlternateUniverse", "WhitesnakeAU", "KingCrimsonAU", "SoftAndWetShiny", "StarPlatinumOVA", "TheWorldOVA", "NTWAU", "CreeperQueen", "SPTW", "StickyFingers", "SoftAndWet"}
   if not table.find(Stands, getgenv().WantedStand) then
       if getgenv().Webhook ~= "" then
           return WebhookFunc("Stand name typed incorrectly.")
           else return
       end
   end
   if not getgenv().Enabled then
       getgenv().Enabled = true
       if getgenv().Webhook ~= "" then
           WebhookFunc("Running stand farm.")
           else Notification("Notification", "Running stand farm.")
       end
       else if getgenv().Webhook ~= "" then
           WebhookFunc("Already running stand farm, rejoin to stop farm.")
           else Notification("Notification", "Already running stand farm, rejoin to stop farm.")
       end
       return nil
   end
   game:GetService("ReplicatedStorage").Main.Input:FireServer("Alternate", "Dodge")
   wait(3)
   game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(workspace:FindFirstChild("Arrow"))
   game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Arrow"))
   game:GetService("ReplicatedStorage").ItemEvents.Arrow:FireServer()
   local Divided = getgenv().DelayInSeconds / 4
   local Find
   if getgenv().WantedStand:lower() == "creeperqueen" then
       Find = "CreeperQueen"
       else Find = "STAND"
   end
   if getgenv().WantedStand:lower() == "killerqueen" then
       Find = "KillerQueen"
       else Find = "STAND"
   end
   if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Value:lower() == getgenv().WantedStand:lower() or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Name:lower() == getgenv().WantedStand:lower() then
       getgenv().Enabled = false
   end
   if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Value:lower() == getgenv().WantedStand:lower() or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Name:lower() == getgenv().WantedStand:lower() then
       if getgenv().Webhook ~= "" then
           return WebhookFunc("Stand already acquired.")
           else return Notification("Notification", "Stand already acquired.")
       end
   end
   game:GetService("Players").LocalPlayer.Idled:Connect(function()
       game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
       wait(1)
       game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
   end)
   local function StandFarm()
       pcall(function()
           repeat
               wait(Divided)
               game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(workspace:FindFirstChild("Rokakaka Fruit"))
               game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka Fruit"))
               game:GetService("ReplicatedStorage").ItemEvents.Roka:FireServer()
               wait(Divided)
               game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(workspace:FindFirstChild("Arrow"))
               game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Arrow"))
               game:GetService("ReplicatedStorage").ItemEvents.Arrow:FireServer()
               wait(Divided)
               game:GetService("ReplicatedStorage").Main.Input:FireServer("Alternate", "Appear", false)
               game:GetService("ReplicatedStorage").Main.Input:FireServer("Alternate", "Dodge")
               wait(Divided)
           until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Value:lower() == getgenv().WantedStand:lower() or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Name:lower() == getgenv().WantedStand:lower()
       end)
       if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true) == nil then
           StandFarm()
       end
   end
   StandFarm()
   repeat wait()
   until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Value:lower() == getgenv().WantedStand:lower() or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Find, true).Name:lower() == getgenv().WantedStand:lower()
   getgenv().Enabled = false
   if getgenv().Webhook ~= "" then
       WebhookFunc("Stand acquired!")
       else Notification("Notification", "Stand acquired!")
   end
   game:GetService("ReplicatedStorage").Main.Input:FireServer("Alternate", "Appear", true)
end)


Tabs.LPlayer:AddSection('[ Local Player Cheats ]')
local autoBlockToggle = Tabs.LPlayer:AddToggle("", {Title = "Auto block", Description = 'With this option active, your character will take damage but the damage will count as if you were blocking', Default = false })
autoBlockToggle:OnChanged(function(bool)
   autoBlock = bool
   repeat task.wait()
       if autoBlock then
           local ohString1 = "Alternate"
           local ohString2 = "Block"
           local ohBoolean3 = true
           game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohBoolean3)
       end
   until autoBlock == false
end)
local antiTSToggle = Tabs.LPlayer:AddToggle("", {Title = "Anti time stop", Description = 'With this option active you will be immune to time stops', Default = false })
antiTSToggle:OnChanged(function(bool)
   antiTS = bool
   repeat task.wait()
       if antiTS then
           for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
               if v:IsA("BoolValue") and v.Name == "TS" then
                   if v.Value == true then
                       wait(.6)
                       v.Value = false
                   end
               end
           end
       end
   until antiTS == false
end)
local antiDiscToggle = Tabs.LPlayer:AddToggle("", {Title = "Anti ws disc", Description = 'With this option active you will be immune to the ws disc', Default = false })
antiDiscToggle:OnChanged(function(bool)
   antiDisc = bool
   repeat task.wait()
       if antiDisc then
           for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
               if v:IsA("BoolValue") and v.Name == "Disabled" then
                   if v.Value == true then wait(.25)
                       v.Value = false
                   end
               end
           end
       end
   until antiDisc == false
end)
local dodgeToggle = Tabs.LPlayer:AddToggle("", {Title = "Dodge no cooldown", Description = 'Removes the cooldown present in the dodge', Default = false })
dodgeToggle:OnChanged(function(bool)
   dodgeNoCD = bool
   repeat task.wait(.5)
       if dodgeNoCD then
           for _, v in pairs(getgc(true)) do
               if type(v) == 'table' and rawget(v, 'DodgeDebounce') then
                   rawset(v, 'DodgeDebounce', false)
               end
           end
       end
   until dodgeNoCD == false
end)
local Button = Tabs.LPlayer:AddButton({
   Title = "Aura pose",
   Description = "Click to get the aura of the pose",
   Callback = function()
       local args = {
           [1] = true
       }
       game:GetService("ReplicatedStorage").Main.Menacing:FireServer(unpack(args))
   end
})
Tabs.LPlayer:AddSection('[ Character Options ]')
local Button = Tabs.LPlayer:AddButton({
   Title = "Respawn",
   Description = "Click this button to respawn",
   Callback = function()
       game:GetService('Players').LocalPlayer.Character.Head:Destroy()
   end
})
local Button = Tabs.LPlayer:AddButton({
   Title = "Infinite jump",
   Description = "Click this button for infinite jumps",
   Callback = function()
       function Action(Object, Function) if Object ~= nil then Function(Object); end end
           game:GetService('UserInputService').InputBegan:connect(function(UserInput)
           if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
               Action(game:GetService('Players').LocalPlayer.Character.Humanoid, function(self)
                   if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                       Action(self.Parent.HumanoidRootPart, function(self)
                           self.Velocity = Vector3.new(0, 50, 0);
                       end)
                   end
               end)
           end
           end)
       end
   })
local Slider = Tabs.LPlayer:CreateSlider("Slider", {
   Title = "WalkSpeed",
   Description = "Change the value to increase the speed",
   Default = 16,
   Min = 16,
   Max = 1000,
   Rounding = 1,
   Callback = function(Value)
       game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end
})
local Slider = Tabs.LPlayer:CreateSlider("Slider", {
   Title = "JumpPower",
   Description = "Change the value to increase the jump",
   Default = 50,
   Min = 50,
   Max = 1000,
   Rounding = 1,
   Callback = function(Value)
       game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = Value
   end
})
local Button = Tabs.LPlayer:AddButton({
   Title = "Invisible tool",
   Description = "Click this button for get invisible tool",
   Callback = function()
       local offset = 1100
       local LocalPlayer = game.Players.LocalPlayer
       local Backpack = LocalPlayer.Backpack
       local Character = LocalPlayer.Character
       local invisible = false
       local grips = {}
       local heldTool
       local gripChanged
       local handle
       local weld
       function setDisplayDistance(distance)
           for _, player in pairs(game.Players:GetPlayers()) do
               if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
                   player.Character:FindFirstChildWhichIsA("Humanoid").NameDisplayDistance = distance
                   player.Character:FindFirstChildWhichIsA("Humanoid").HealthDisplayDistance = distance
               end
           end
       end
       local tool = Instance.new("Tool", Backpack)
       tool.Name = "Ghostify [Disabled]"
       tool.RequiresHandle = false
       tool.CanBeDropped = false
       tool.Equipped:Connect(function() wait()
          if not invisible then
              invisible = true
              tool.Name = "Ghostify [Enabled]"
              if handle then handle:Destroy() end if weld then weld:Destroy() end
              handle = Instance.new("Part", workspace) handle.Name = "Handle" handle.Transparency = 1 handle.CanCollide = false handle.Size = Vector3.new(2, 1, 1)
              weld = Instance.new("Weld", handle) weld.Part0 = handle weld.Part1 = Character.HumanoidRootPart weld.C0 = CFrame.new(0, offset-1.5, 0)
              setDisplayDistance(offset+100)
              workspace.CurrentCamera.CameraSubject = handle
              Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, offset, 0)
              Character.Humanoid.HipHeight = offset
              Character.Humanoid:ChangeState(11)
              for _,child in pairs(Backpack:GetChildren()) do if child:IsA("Tool") and child ~= tool then grips[child] = child.Grip end end
          elseif invisible then
              invisible = false
              tool.Name = "Ghostify [Disabled]"
              if handle then handle:Destroy() end if weld then weld:Destroy() end
              for _,child in pairs(Character:GetChildren()) do if child:IsA("Tool") then child.Parent = Backpack end end
              for tool,grip in pairs(grips) do if tool then tool.Grip = grip end end
              heldTool = nil
              setDisplayDistance(100)
              workspace.CurrentCamera.CameraSubject = Character.Humanoid
              Character.Animate.Disabled = false
              Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0, -offset, 0)
              Character.Humanoid.HipHeight = 0
              Character.Humanoid:ChangeState(11)
          end
          tool.Parent = Backpack
       end)
       Character.ChildAdded:Connect(function(child) wait()
          if invisible and child:IsA("Tool") and child ~= heldTool and child ~= tool then
              heldTool = child
              local lastGrip = heldTool.Grip
              if not grips[heldTool] then grips[heldTool] = lastGrip end
              for _,track in pairs(Character.Humanoid:GetPlayingAnimationTracks()) do track:Stop() end
              Character.Animate.Disabled = true
              heldTool.Grip = heldTool.Grip*(CFrame.new(0, offset-1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
              heldTool.Parent = Backpack
              heldTool.Parent = Character
              if gripChanged then gripChanged:Disconnect() end
              gripChanged = heldTool:GetPropertyChangedSignal("Grip"):Connect(function() wait()
                  if not invisible then gripChanged:Disconnect() end
                  if heldTool.Grip ~= lastGrip then
                      lastGrip = heldTool.Grip*(CFrame.new(0, offset-1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
                      heldTool.Grip = lastGrip
                      heldTool.Parent = Backpack
                      heldTool.Parent = Character
                  end
              end)
          end
       end)
   end
})
local Button = Tabs.LPlayer:AddButton({
   Title = "Tp tool",
   Description = "Click this button for get tp tool",
   Callback = function()
       local mouse = game.Players.LocalPlayer:GetMouse()
       local tool = Instance.new("Tool")
       tool.RequiresHandle = false
       tool.Name = "Equip to Click TP"
       tool.Activated:connect(function()
           local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
           pos = CFrame.new(pos.X, pos.Y, pos.Z)
           game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = pos
       end)
       tool.Parent = game.Players.LocalPlayer.Backpack
   end
})


Tabs.Players:AddSection('[ Kill Player ]')
local playersDropdown = Tabs.Players:AddDropdown("Dropdown", {
   Title = "Select player",
   Description = 'Select the player you want to kill',
   Values = getPlayers(),
   Multi = false,
   Default = nil,
})
playersDropdown:OnChanged(function(value)
   selectedPlayer = value
end)
local killToggle = Tabs.Players:AddToggle("", {Title = "Auto kill player", Description = 'Kills the desired player automatically', Default = false })
killToggle:OnChanged(function(bool)
   autoKill = bool
   repeat task.wait()
       if autoKill then
           for _, hrt in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
               if hrt:IsA('Part') and hrt.Name == 'HumanoidRootPart' then
                   hrt.CFrame = game:GetService('Players')[selectedPlayer].Character.HumanoidRootPart.CFrame
                   wait()
                   for _, hum in pairs(game:GetService('Players')[selectedPlayer].Character:GetChildren()) do
                       if hum.Name == 'Humanoid' then
                           local ohString1 = "Damage"
                           local ohString2 = "Punch"
                           local ohNil3 = nil
                           local ohNil4 = nil
                           local ohInstance5 = hum
                           local ohCFrame6 = CFrame.new(1038.02563, 402.826263, -684.448059, -0.192306787, -0.383487046, -0.90330255, 0.964351177, 0.0966612548, -0.24634023, 0.181782663, -0.91847384, 0.351227522)
                           local ohBoolean7 = false
                           game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohNil3, ohNil4, ohInstance5, ohCFrame6, ohBoolean7)
                       end
                   end
               end
           end
       end
   until autoKill == false
end)
local emeraldToggle = Tabs.Players:AddToggle("", {Title = "Auto kill player [ Emerald ]", Description = 'Active for spamming emerald projectile in player choosed. Need heirophant green', Default = false })
emeraldToggle:OnChanged(function(bool)
    Emerald = bool
    repeat task.wait()
        if Emerald then
            for _, v in pairs(game:GetService('Players')[selectedPlayer].Character:GetChildren()) do
                if v:IsA('Part') and v.Name == 'HumanoidRootPart' then
                    local ohString1 = "Alternate"
                    local ohString2 = "EmeraldProjectile2"
                    local ohBoolean3 = false
                    local ohCFrame4 = CFrame.new(v.Position)
                    game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohBoolean3, ohCFrame4)
                end
            end
        end
    until Emerald == false
end)
local Button = Tabs.Players:AddButton({
   Title = "Teleport player to limbo",
   Description = "Teleports and kills the desired player. Need sans",
   Callback = function()
       game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService('Players')[selectedPlayer].Character.HumanoidRootPart.CFrame
       wait(.5)
       local math = math.huge
       local ohString1 = "Alternate"
       local ohString2 = "Teleport"
       local ohBoolean3 = false
       local ohVector34 = Vector3.new(math, math, math)
       game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohBoolean3, ohVector34)
   end
})
local Button = Tabs.Players:AddButton({
   Title = "Teleport to player",
   Description = "Click for teleport to player choosed",
   Callback = function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService('Players')[selectedPlayer].Character.HumanoidRootPart.CFrame
   end
})
local Button = Tabs.Players:AddButton({
   Title = "Refresh",
   Description = "Refresh the options of the players dropdown",
   Callback = function()
       playersDropdown:SetValues(getPlayers())
   end
})


Tabs.Items:AddSection('[ Grab Items ]')
local Button = Tabs.Items:AddButton({
   Title = "Grab all items",
   Description = "Click on the button to collect all the items in the workspace",
   Callback = function()
       for _, v in pairs(workspace:GetChildren()) do
           if v:IsA("Tool") then
               game:GetService('Players').LocalPlayer.Character.Humanoid:EquipTool(v)
           end
       end
   end
})
local grabToolsToggle = Tabs.Items:AddToggle("", {Title = "Auto grab all items", Description = 'Collects all workspace items automatically', Default = false })
grabToolsToggle:OnChanged(function(bool)
   grabTools = bool
   while grabTools do task.wait(.2)
       for _, v in pairs(workspace:GetChildren()) do
           if v:IsA("Tool") then
               game:GetService('Players').LocalPlayer.Character.Humanoid:EquipTool(v)
           end
       end
   end
end)
local teleportToolsToggle = Tabs.Items:AddToggle("", {Title = "Teleport to all items", Description = 'Teleports you to all the items in the workspace', Default = false })
teleportToolsToggle:OnChanged(function(bool)
   teleportTool = bool
   while teleportTool do task.wait()
       for _, v in pairs(workspace:GetChildren()) do
           if v:IsA("Tool") then
               for _, x in pairs(v:GetChildren()) do
                   if (x:IsA('Part') or x:IsA('BasePart')) and x.Name == 'Handle' then
                       game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = x.CFrame
                   end
               end
           end
       end
   end
end)
local espToolToggle = Tabs.Items:AddToggle("", {Title = "Esp items", Description = 'Shows you all the items in the workspace', Default = false })
espToolToggle:OnChanged(function(bool)
   espTool = bool
   if espTool then
       local function createESP(tool)
           local highlight = Instance.new("Highlight")
           highlight.Name = "ToolESP"
           highlight.Adornee = tool
           highlight.Parent = tool

           local billboard = Instance.new("BillboardGui")
           billboard.Name = "ToolName"
           billboard.Size = UDim2.new(0, 200, 0, 50)
           billboard.StudsOffset = Vector3.new(0, 3, 0)
           billboard.AlwaysOnTop = true
           billboard.Parent = tool

           local textLabel = Instance.new("TextLabel")
           textLabel.Size = UDim2.new(1, 0, 1, 0)
           textLabel.BackgroundTransparency = 1
           textLabel.Text = tool.Name
           textLabel.TextColor3 = Color3.new(1, 1, 1)
           textLabel.TextScaled = true
           textLabel.Parent = billboard
       end
       for _, obj in ipairs(workspace:GetDescendants()) do
           if obj:IsA("Tool") and not obj:FindFirstChild("ToolESP") then
               createESP(obj)
           end
       end
   else
       for _, v in pairs(workspace:GetDescendants()) do
           if v:IsA('BillboardGui') and v.Name == 'ToolName' then
               v:Destroy()
           end
       end
       for _, v in pairs(workspace:GetDescendants()) do
           if v:IsA('Highlight') and v.Name == 'ToolESP' then
               v:Destroy()
           end
       end
   end
end)
Tabs.Items:AddSection('[ Item Sniper ]')
local itemSniperDropdown = Tabs.Items:AddDropdown("Dropdown", {
   Title = "Select item",
   Description = 'Select the item you want to collect',
   Values = getItems(),
   Multi = false,
   Default = nil,
})
itemSniperDropdown:OnChanged(function(value)
   selectedItemSniper = value
end)
local Button = Tabs.Items:AddButton({
   Title = "Grab item",
   Description = "Collects the item you selected ",
   Callback = function()
       for _, v in pairs(workspace:GetChildren()) do
           if v:IsA("Tool") and v.Name == selectedItemSniper then
               game:GetService('Players').LocalPlayer.Character.Humanoid:EquipTool(v)
           end
       end
   end
})
local grabSniperToolToggle = Tabs.Items:AddToggle("", {Title = "Auto grab item", Description = 'Collects the selected item automatically', Default = false })
grabSniperToolToggle:OnChanged(function(bool)
   autoSniperTool = bool
   while autoSniperTool do task.wait()
       for _, v in pairs(workspace:GetChildren()) do
           if v:IsA("Tool") and v.Name == selectedItemSniper then
               game:GetService('Players').LocalPlayer.Character.Humanoid:EquipTool(v)
           end
       end
   end
end)
local autoStorageItemToggle = Tabs.Items:AddToggle("", {Title = "Auto storage item", Description = 'Take the item and save it in the inventory automatically', Default = false })
autoStorageItemToggle:OnChanged(function(bool)
   autoStorage = bool
   while autoStorage do task.wait()
       for _, v in pairs(game:GetService('Players').LocalPlayer.Backpack:GetChildren()) do
           if v:IsA("Tool") and v.Name == selectedItemSniper then
               game:GetService('Players').LocalPlayer.Character.Humanoid:EquipTool(v)
           end
       end
       local args = {
           [1] = {
               [1] = "Inventory",
               [2] = "ItemStore"
           }
       }
       game:GetService("ReplicatedStorage"):WaitForChild("SwtwnModules"):WaitForChild("Event"):FireServer(unpack(args))
   end
end)
Tabs.Items:AddSection('[ Buy item ]')
local itemBuyDropdown = Tabs.Items:AddDropdown("Dropdown", {
   Title = "Select item",
   Description = 'Select the item you want to buy',
   Values = {'Arrow', 'Rokakaka Fruit', 'Shiny Arrow', 'Ticket'},
   Multi = false,
   Default = nil,
})
itemBuyDropdown:OnChanged(function(value)
   selectedItemBuy = value
end)
local Button = Tabs.Items:AddButton({
   Title = "Buy item",
   Description = "Purchases the selected item",
   Callback = function()
       local args = {
           [1] = selectedItemBuy
       }
       game:GetService("ReplicatedStorage").Purchase:FireServer(unpack(args))
   end
})
local autoButItemToggle = Tabs.Items:AddToggle("", {Title = "Auto buy item", Description = 'Buys the selected item automatically', Default = false })
autoButItemToggle:OnChanged(function(bool)
   autoBuyItem = bool
   while autoBuyItem do task.wait(.5)
       local args = {
           [1] = selectedItemBuy
       }
       game:GetService("ReplicatedStorage").Purchase:FireServer(unpack(args))
   end
end)


_G.banknoteFarm = {
   wait = nil,
   fireWait = nil
}
Tabs.Money:AddSection('[ Backnotes ]')
local Input = Tabs.Money:CreateInput("Input", {
   Title = "Set the waiting time",
   Description = 'Enter the time you want the loop to take',
   Default = "0",
   Placeholder = "...",
   Numeric = true,
   Finished = false,
   Callback = function(Value)
       _G.banknoteFarm.wait = Value
   end
})
local Input = Tabs.Money:CreateInput("Input", {
   Title = "Set the fire tool time",
   Description = 'Waiting time to activate the tool',
   Default = "0",
   Placeholder = "...",
   Numeric = true,
   Finished = false,
   Callback = function(Value)
       _G.banknoteFarm.fireWait = Value
   end
})
local banknoteFarmToggle = Tabs.Money:AddToggle("", {Title = "Auto grab banknote", Description = 'Starts the banknote farm automatically', Default = false })
banknoteFarmToggle:OnChanged(function(bool)
   bankNoteFarm = bool
   repeat task.wait(_G.banknoteFarm.wait)
       if bankNoteFarm then
           for _, v in pairs(workspace:GetChildren()) do
               if v:IsA('Tool') and v.Name == 'Banknote' then
                   game.Players.LocalPlayer.Character.Humanoid:EquipTool(v);
               end
           end
           wait(.1)
           EquipTool('Banknote')
           wait(_G.banknoteFarm.fireWait)
           FireTool('Banknote')
       end
   until bankNoteFarm == false
end)


_G.mobSettings = {
   Enabled = nil,
   Distance = nil,
   Skills = {
       Enabled = nil,
       skillName = {'E', 'R', 'T', 'Y', 'F', 'H', 'J'}
   }
}
Tabs.Mobs:AddSection('[ Mob Farm ]')
local mobsDropdown = Tabs.Mobs:AddDropdown("Dropdown", {
   Title = "Select mob",
   Description = 'Select the mob you want to farm',
   Values = {'Bandit', 'Skeleton', 'Vampire'},
   Multi = false,
   Default = nil,
})
mobsDropdown:OnChanged(function(value)
   selectedMob = value
end)
local autoFarmMobToggle = Tabs.Mobs:AddToggle("", {Title = "Start", Description = '', Default = false })
autoFarmMobToggle:OnChanged(function(bool)
   autoMob = bool
   local keys = _G.mobSettings.Skills.skillName
   repeat task.wait()
       if autoMob then
           for _, v in pairs(workspace:GetChildren()) do
               if v:IsA('Model') and v.Name == selectedMob then
                   for _, x in pairs(v:GetChildren()) do
                       if x:IsA('Part') and x.Name == 'Head' then
                           local modelPosition = x.Position
                           local cframe = CFrame.new(modelPosition + Vector3.new(0, 5, 0)) * CFrame.Angles(math.rad(270), 0, 0)
                           for _, hrt in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                               if hrt:IsA('Part') and hrt.Name == 'HumanoidRootPart' then
                                   if v.Humanoid.Health >= 1 then
                                       hrt.CFrame = cframe
                                       for _, hum in pairs(v:GetChildren()) do
                                           if hum.Name == 'Humanoid' then
                                               local ohString1 = "Damage"
                                               local ohString2 = "Punch"
                                               local ohNil3 = nil
                                               local ohNil4 = nil
                                               local ohInstance5 = hum
                                               local ohCFrame6 = CFrame.new(1038.02563, 402.826263, -684.448059, -0.192306787, -0.383487046, -0.90330255, 0.964351177, 0.0966612548, -0.24634023, 0.181782663, -0.91847384, 0.351227522)
                                               local ohBoolean7 = false
                                               game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohNil3, ohNil4, ohInstance5, ohCFrame6, ohBoolean7)
                                           end
                                       end
                                   end
                               end
                           end
                           if _G.mobSettings.Skills.Enabled then
                               for _, Keys in next, keys do
                                   game:GetService('VirtualInputManager'):SendKeyEvent(true, Keys, false, game)
                               end
                           end
                       end
                   end
               end
           end
       end
   until autoMob == false
end)
Tabs.Mobs:AddSection('[ Settings ]')
local Input = Tabs.Mobs:CreateInput("Input", {
   Title = "Set disctance",
   Description = 'Enter the distance mob',
   Default = "5",
   Placeholder = "...",
   Numeric = true,
   Finished = false,
   Callback = function(Value)
       _G.mobSettings.Distance = Value
   end
})
local autoUseSkillsMobToggle = Tabs.Mobs:AddToggle("", {Title = "Auto use all skills", Description = 'When it starts it will use all skills', Default = false })
autoUseSkillsMobToggle:OnChanged(function(bool)
   _G.mobSettings.Skills.Enabled = bool
end)
local autoActiveStandToggleT = Tabs.Mobs:AddToggle("", {Title = "Auto active stand", Description = 'Activates your stand automatically if it is deactivated', Default = false })
autoActiveStandToggleT:OnChanged(function(bool)
   autoActiveT = bool
   repeat task.wait()
       if autoActiveT then
           for _, v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
               if v:IsA('Model') and v.Name == 'Stand' then
                   for _, x in pairs(v:GetChildren()) do
                       if x:IsA('MeshPart') and x.Name == 'FakeHead' then
                           if x.Transparency == 1 then
                               game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Q', false, game)
                           end
                       end
                   end
               end
           end
       end
   until autoActiveT == false
end)


_G.Settings = {
   Distance = nil,
   skills = {
       Enabled = nil,
       skillName = {'E', 'R', 'T', 'Y', 'F', 'H', 'J'}
   },
}
Tabs.Bosses:AddSection('[ Farm Boss ]')
local bossesDropdown = Tabs.Bosses:AddDropdown("Dropdown", {
   Title = "Select boss",
   Description = 'Select the boss you want to farm',
   Values = {'Alucard Boss', 'Halloween Boss', 'Hamon Boss'},
   Multi = false,
   Default = nil,
})
bossesDropdown:OnChanged(function(value)
   selectedBoss = value
end)
local autoFarmBossToggle = Tabs.Bosses:AddToggle("", {Title = "Start", Description = '', Default = false })
autoFarmBossToggle:OnChanged(function(bool)
   autoBoss = bool
   local keys = _G.Settings.skills.skillName
   repeat task.wait()
       if autoBoss then
           for _, v in pairs(workspace:GetChildren()) do
               if v:IsA('Model') and v.Name == selectedBoss then
                   for _, x in pairs(v:GetChildren()) do
                       if x:IsA('Part') and x.Name == 'Head' then
                           local modelPosition = x.Position
                           local cframe = CFrame.new(modelPosition + Vector3.new(0, _G.Settings.Distance, 0)) * CFrame.Angles(math.rad(270), 0, 0)
                           for _, hrt in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
                               if hrt:IsA('Part') and hrt.Name == 'HumanoidRootPart' then
                                   hrt.CFrame = cframe
                                   for _, hum in pairs(v:GetChildren()) do
                                       if hum.Name == 'Humanoid' then
                                           local ohString1 = "Damage"
                                           local ohString2 = "Punch"
                                           local ohNil3 = nil
                                           local ohNil4 = nil
                                           local ohInstance5 = hum
                                           local ohCFrame6 = CFrame.new(1038.02563, 402.826263, -684.448059, -0.192306787, -0.383487046, -0.90330255, 0.964351177, 0.0966612548, -0.24634023, 0.181782663, -0.91847384, 0.351227522)
                                           local ohBoolean7 = false
                                           game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohNil3, ohNil4, ohInstance5, ohCFrame6, ohBoolean7)
                                       end
                                   end
                               end
                           end
                           if _G.Settings.skills.Enabled then
                               for _, Keys in next, keys do
                                   game:GetService('VirtualInputManager'):SendKeyEvent(true, Keys, false, game)
                               end
                           end
                       end
                   end
               end
           end
       end
   until autoBoss == false
end)
local emeraldBossToggle = Tabs.Bosses:AddToggle("", {Title = "Kill boss [ Emerald ]", Description = '', Default = false })
emeraldBossToggle:OnChanged(function(bool)
    emeraldBoss = bool
    repeat task.wait()
        if emeraldBoss then
            for _, v in pairs(workspace:GetChildren()) do
                if v:IsA('Model') and v.Name == selectedBoss then
                    for _, x in pairs(v:GetChildren()) do
                        if x:IsA('Part') and x.Name == 'HumanoidRootPart' then
                            local ohString1 = "Alternate"
                            local ohString2 = "EmeraldProjectile2"
                            local ohBoolean3 = false
                            local ohCFrame4 = CFrame.new(x.Position)
                            game:GetService("ReplicatedStorage").Main.Input:FireServer(ohString1, ohString2, ohBoolean3, ohCFrame4)
                        end
                    end
                end
            end
        end
    until emeraldBoss == false
end)
Tabs.Bosses:AddSection('[ Settings ]')
local Input = Tabs.Bosses:CreateInput("Input", {
   Title = "Set disctance",
   Description = 'Enter the distance boss',
   Default = "6",
   Placeholder = "...",
   Numeric = true,
   Finished = false,
   Callback = function(Value)
       _G.Settings.Distance = Value
   end
})
local autoFarmBossToggle = Tabs.Bosses:AddToggle("", {Title = "Auto use all skills", Description = 'When it starts it will use all skills', Default = false })
autoFarmBossToggle:OnChanged(function(bool)
   _G.Settings.skills.Enabled = bool
end)
local autoActiveStandToggle = Tabs.Bosses:AddToggle("", {Title = "Auto active stand", Description = 'Activates your stand automatically if it is deactivated', Default = false })
autoActiveStandToggle:OnChanged(function(bool)
   autoActive = bool
   repeat task.wait()
       if autoActive then
           for _, v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
               if v:IsA('Model') and v.Name == 'Stand' then
                   for _, x in pairs(v:GetChildren()) do
                       if x:IsA('MeshPart') and x.Name == 'FakeHead' then
                           if x.Transparency == 1 then
                               game:GetService('VirtualInputManager'):SendKeyEvent(true, 'Q', false, game)
                           end
                       end
                   end
               end
           end
       end
   until autoActive == false
end)


Tabs.Keys:AddSection('[ Keybinds ]')
local keyBindSettings = {
   Enabled = false,
}
local TsKeyBind = Tabs.Keys:CreateKeybind("Keybind", {
   Title = "Time stop - Keybind",
   Mode = "Toggle",
   Default = '...',
   Callback = function(Value)
       if keyBindSettings.Enabled then
           game:GetService("ReplicatedStorage").Main.Timestop:FireServer(20, 'shadowdio')
       end
   end,
   ChangedCallback = function(New)
       print("Keybind changed!", New)
   end
})
local ResetKeyBind = Tabs.Keys:CreateKeybind("Keybind", {
   Title = "Reset Universe - Keybind",
   Mode = "Toggle",
   Default = '...',
   Callback = function(Value)
       if keyBindSettings.Enabled then
           local args = {
               [1] = "Alternate",
               [2] = "UniverseReset"
           }
           game:GetService("ReplicatedStorage"):WaitForChild("Main"):WaitForChild("Input"):FireServer(unpack(args))
       end
   end,
   ChangedCallback = function(New)
       print("Keybind changed!", New)
   end
})
local activeKeyToggle = Tabs.Keys:AddToggle("", {Title = "Active", Description = '', Default = false })
activeKeyToggle:OnChanged(function(bool)
   keyBindSettings.Enabled = bool
end)
