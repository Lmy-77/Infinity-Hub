-- variables
function GetSizeOfObject(Obj)
    if Obj:IsA("BasePart") then
        return Obj.Size
    elseif Obj:IsA("Model") then
        return Obj:GetExtentsSize()
    end
end
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local Self = Args[1]
    if getnamecallmethod() == "FireServer" and tostring(Self) == "RemoteEvent" and Args[1] == "ReportPhysicsFPS" then
        return wait(math.huge)
    end
    return OldNameCall(...)
end)
local function WalkSpeedBypass()
  local gmt = getrawmetatable(game)
  setreadonly(gmt, false)
  local oldIndex = gmt.__Index
  gmt.__Index = newcclosure(function(self, b)
    if b == 'WalkSpeed' then
      return 16
    end
    return oldIndex(self, b)
  end)
end
local function JumpPowerBypass()
  local gmt = getrawmetatable(game)
  setreadonly(gmt, false)
  local oldIndex = gmt.__Index
  gmt.__Index = newcclosure(function(self, b)
    if b == 'JumpPower' then
      return 50
    end
    return oldIndex(self, b)
  end)
end
local BeastColor = Color3.new(255, 0, 0)
local InoccentColor = Color3.new(255, 255, 255)
local CreateEsp = function()
  for _, v in pairs(game:GetService('Players'):GetChildren()) do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
      local Esp = Instance.new('Highlight', v.Character)
      Esp.Name = 'EspPlayer'
      Esp.FillTransparency = 0.5
    end
  end
end
local UpdateEsp = function()
  for _, v in pairs(game:GetService('Players'):GetChildren()) do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
      if v.Character:findFirstChild('BeastPowers') then
        v.Character.EspPlayer.FillColor = BeastColor
      else
        v.Character.EspPlayer.FillColor = InoccentColor
      end
    end
  end
end
local KeyPress = function(v)
    return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
end
local map = workspace:findFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))



-- library settings
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Infinity Hub  |  "..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
    SubTitle = "by lmy77",
    TabWidth = 120,
    Size = UDim2.fromOffset(500, 370),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.J
})
local Options = Fluent.Options
Fluent:ToggleTransparency(false)



-- tabs
local Tabs = {
    Game = Window:AddTab({
        Title = "Game",
        Icon = ""
    }),
    LPlayer = Window:AddTab({
        Title = "Local Player",
        Icon = ""
    }),
    Esp = Window:AddTab({
        Title = "Esp",
        Icon = ""
    }),
}



-- source
Tabs.Game:AddSection('[ Game Cheats ]')
local AutoHackToggle = Tabs.Game:AddToggle("", {Title = "Auto hack", Default = false })
AutoHackToggle:OnChanged(function(bool)
    autoHack = bool
    while autoHack do task.wait()
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("SetPlayerMinigameResult",true)
    end
end)
Tabs.Game:AddButton({
    Title = "Teleport to exit foor",
    Description = "",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if (v:IsA('Model') and v.Name == 'ExitDoor') then
                game:GetService('Players').LocalPlayer.Character:PivotTo(v:GetPivot())
            end
        end
    end
})
Tabs.Game:AddButton({
    Title = "Save captured players",
    Description = "",
    Callback = function()
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local TeleportOldPos = '';
        TeleportOldPos = oldPos
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if (v.Name ~= game.Players.LocalPlayer.Name) then
                if (v.TempPlayerStatsModule.Captured.Value == true) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-2.35)
                    wait(.2)
                    KeyPress('E')
                    wait(.25)
                end
            end
        end
        wait(.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TeleportOldPos)
    end
})
Tabs.Game:AddButton({
    Title = "Check beast",
    Description = "",
    Callback = function()
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                if v.Character:findFirstChild('BeastPowers') then
                    Fluent:Notify{
                        Title = "Infinity Hub - Notify",
                        Content = 'Beast is '..v.Name,
                        Duration = 4
                    }
                end
            end
        end
    end
})

Tabs.LPlayer:AddSection('[ Game Options ]')
local AntiRagdollToggle = Tabs.LPlayer:AddToggle("", {Title = "Anti ragdoll (Beta)", Default = false })
AntiRagdollToggle:OnChanged(function(bool)
    antiRagdoll = bool
    if antiRagdoll then
        while antiRagdoll do task.wait()
            for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
                if (v:IsA('BoolValue') and v.Name == 'Ragdoll') then
                    v.Value = false
                    wait(.2) v.Value = true
                end
            end
        end
    else
        wait(.5)
        for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
            if (v:IsA('BoolValue') and v.Name == 'Ragdoll') then
                if (v.Value == true) then
                    v.Value = false
                end
            end
        end
    end
end)
local Method;
local MethodTONoSlow = Tabs.LPlayer:AddDropdown("Dropdown", {
    Title = "Method:",
    Values = {'Remote', 'Speed'},
    Multi = false,
    Default = 1,
})
MethodTONoSlow:OnChanged(function (args)
    Method = args
    print(Method)
end)
local NoSlowToggle = Tabs.LPlayer:AddToggle("", {Title = "No slow", Default = false })
NoSlowToggle:OnChanged(function(bool)
    NoSlow = bool
    if NoSlow then
        if Method == 'Remote' then
            local oldnc
            oldnc = hookmetamethod(game, "__namecall", newcclosure(function(name, ...)
                   local Args = {...}
                   if not checkcaller() and tostring(name) == "PowersEvent" and Args[1] == "Jumped" then
                       return wait(9e9)
                   end
                   return oldnc(name, unpack(Args))
            end))
        elseif Method == 'Speed' then
            WalkSpeedBypass()
            while NoSlow do task.wait()
                while NoSlow do task.wait()
                    if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 16 then
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    end
                end
            end
        end
    end
end)
local ActiveCrawlingToggle = Tabs.LPlayer:AddToggle("", {Title = "Active Crawling (Beast)", Default = false })
ActiveCrawlingToggle:OnChanged(function(bool)
    antiveCrawling = bool
    while antiveCrawling do task.wait()
        for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
            if (v:IsA('BoolValue') and v.Name == 'DisableCrawl') then
                v.Value = false
            end
        end
    end
end)
Tabs.LPlayer:AddButton({
    Title = "No cooldown hammer (Beast)",
    Description = "read the text box after clicking",
    Callback = function()
        Window:Dialog({
            Title = "Infinity Hub - Prompt",
            Content = "Once activated, there's no way back to normal. Are you sure you want to activate it?",
            Buttons = {
                {
                    Title = "Execute",
                    Callback = function()
                        wait = task.wait
                        local a = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:wait()
                        while wait() do
                            local b = a:FindFirstChildOfClass("Humanoid") or a:FindFirstChildOfClass("AnimationController")
                            if not b or not a then continue end
                            for c, d in next, b:GetPlayingAnimationTracks() do
                                d:AdjustSpeed(15)
                            end
                        end
                    end
                },
                {
                    Title = 'Cancel',
                    Callback = function()
                        print('Function canceled')
                    end
                }
            }
        })
    end
})
Tabs.LPlayer:AddSection('[ Character Options ]')
local Input = Tabs.LPlayer:AddInput("Input", {
    Title = "WalkSpeed",
    Default = "...",
    Placeholder = "",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        WalkSpeedValue = Value
    end
})
local Input = Tabs.LPlayer:AddInput("Input", {
    Title = "JumpPower",
    Default = "...",
    Placeholder = "",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        JumpPowerValue = Value
    end
})
Tabs.LPlayer:AddButton({
    Title = "Set ws and jp",
    Description = "",
    Callback = function()
        WalkSpeedBypass()
        JumpPowerBypass()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedValue
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPowerValue
    end
})
Tabs.LPlayer:AddButton({
    Title = "Reset ws jp",
    Description = "",
    Callback = function()
        WalkSpeedBypass()
        JumpPowerBypass()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
})


Tabs.Esp:AddSection('[ Esp Settings ]')
local EspPlayerToggle = Tabs.Esp:AddToggle("", {Title = "Esp Players", Default = false })
EspPlayerToggle:OnChanged(function(bool)
    PlayersEsp = bool
    if PlayersEsp then
        CreateEsp()
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                v.ChildAdded:Connect(function(child)
                    if PlayersEsp then
                        local Esp = Instance.new('Highlight', child.Character)
                        Esp.Name = 'EspPlayer'
                        Esp.FillTransparency = 0.5
                    else
                        for _, z in pairs(child.Character:GetChildren()) do
                            if z:IsA('Highlight') and z.Name == 'EspPlayer' then
                                z:Destroy()
                            end
                        end
                    end
                end)
            end
        end
        while PlayersEsp do task.wait()
            UpdateEsp()
        end
    else
        for _, x in pairs(workspace:GetDescendants()) do
            if x:IsA('Highlight') and x.Name == 'EspPlayer' then
                x:Destroy()
            end
        end
    end
end)
local EspComputerToggle = Tabs.Esp:AddToggle("", {Title = "Esp Computers", Default = false })
EspComputerToggle:OnChanged(function(bool)
    CumputersEsp = bool
    if CumputersEsp then
        for _, v in pairs(map:GetChildren()) do
            if v:IsA('Model') and v.Name == 'ComputerTable' then
                v.Screen.BillboardGui.Enabled = true
                task.spawn(function ()
                    while true do task.wait()
                        v.Screen.BillboardGui.ImageLabel.ImageColor3 = v.Screen.Color
                    end
                end)
            end
        end
    else
        for _, v in pairs(map:GetChildren()) do
            if v:IsA('Model') and v.Name == 'ComputerTable' then
                v.Screen.BillboardGui.Enabled = false
            end
        end
    end
end)



-- Select Tab
Window:SelectTab(1)
