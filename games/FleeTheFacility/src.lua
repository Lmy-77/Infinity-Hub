-- variables
local ESPPC = Instance.new("Folder", workspace)
ESPPC.Name = "ESPComputer"
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
local ESPEnabled = nil
local ESPComputer = nil
local function createESP(player, color)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") and not part:FindFirstChild("ESPBox") then
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "ESPBox"
                box.Size = part.Size + Vector3.new(0.1, 0.1, 0.1)
                box.Adornee = part
                box.AlwaysOnTop = true
                box.ZIndex = 5
                box.Transparency = 0.5
                box.Color3 = color
                box.Parent = part
            end
        end
    end
end
local function removeESP(player)
    if player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                local box = part:FindFirstChild("ESPBox")
                if box then
                    box:Destroy()
                end
            end
        end
    end
end
local function updateESPColors()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Name ~= game:GetService("Players").LocalPlayer.Name then
            if player.Character then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        local box = part:FindFirstChild("ESPBox")
                        if box then
                            if player.Character:FindFirstChild("BeastPowers") then
                                box.Color3 = BeastColor
                            else
                                box.Color3 = InoccentColor
                            end
                        end
                    end
                end
            end
        end
    end
end
local function updateESP()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Name ~= game:GetService("Players").LocalPlayer.Name then
            removeESP(player)
            if ESPEnabled then
                if player.Character and player.Character:FindFirstChild("BeastPowers") then
                    createESP(player, BeastColor)
                else
                    createESP(player, InoccentColor)
                end
            end
        end
    end
end
game:GetService("Players").PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if ESPEnabled then
            updateESP()
        end
    end)
end)
game:GetService("Players").PlayerRemoving:Connect(function(player)
    removeESP(player)
end)
local map = workspace:findFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
local KeyPress = function(v)
    return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
end




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
        Icon = "layers"
    }),
    LPlayer = Window:AddTab({
        Title = "Local Player",
        Icon = 'user'
    }),
    Esp = Window:AddTab({
        Title = "Esp",
        Icon = "view"
    }),
}
Window:SelectTab(1)



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
    Title = "Teleport to computer",
    Description = "Risk of kicking, use responsibly",
    Callback = function()
        for _, v in pairs(map:GetChildren()) do
            if v:IsA('Model') and v.Name == 'ComputerTable' then
                for _, x in pairs(v:GetChildren()) do
                    if x:IsA('Part') and x.Name:lower():find('computertrigger') then
                        if x.ActionSign.Value == 20 and v.Screen.Color ~= Color3.fromRGB(40, 127, 71) then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.CFrame
                            return
                        end
                    end
                end
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
                    if v.Value == true then
                        wait(.2)
                        v.Value = false
                    end
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
    ESPEnabled = bool
    if not ESPEnabled then
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Name ~= game:GetService("Players").LocalPlayer.Name then
                removeESP(player)
            end
        end
    else
        updateESP()
    end
    while ESPEnabled do task.wait()
        updateESPColors()
    end
end)
local EspComputerToggle = Tabs.Esp:AddToggle("", {Title = "Esp Computers", Default = false })
EspComputerToggle:OnChanged(function(bool)
    ESPComputer = bool
    if ESPComputer then
        local children = map:GetChildren()
            for i =1, #children do
            if children[i].Name == "ComputerTable" then
                local Box = Instance.new("BoxHandleAdornment")
                Box.Size = GetSizeOfObject(children[i].Screen) + Vector3.new(-0.5, -0.5, -0.5)
                Box.Name = "ESPPart"
                Box.Adornee = children[i].Screen
                spawn (function()
                    while true do
                        wait(0.1)
                        Box.Color3 = children[i].Screen.Color
                    end
                end)
                Box.AlwaysOnTop = true
                Box.ZIndex = 5
                Box.Transparency = 0.4
                Box.Parent = ESPPC
            end
        end
    else
        for _, v in pairs(workspace.ESPComputer:GetChildren()) do
            if v:IsA('BoxHandleAdornment') then
                v:Destroy()
            end
        end
    end
end)
