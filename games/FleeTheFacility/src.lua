-- detect service
local UserInputService = game:GetService("UserInputService")
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	print("Mobile device")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/FleeTheFacility/Mobile/Button/src.lua",true))()
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	print("Computer device")
end



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
local function updateComputerESP()
    local map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
    if map then
        local computerTables = map:GetChildren()
        for _, table in pairs(computerTables) do
            if table:IsA("Model") and table.Name == "ComputerTable" then
                for _, screen in pairs(table:GetDescendants()) do
                    if (screen:IsA("Part") or screen:IsA("UnionOperation")) and screen.Name == "Screen" then
                        local billboardGui = screen:FindFirstChild("BillboardGui")
                        if billboardGui then
                            local imageLabel = billboardGui:FindFirstChild("ImageLabel")
                            if imageLabel then
                                billboardGui.Enabled = ESPComputer
                                if ESPComputer then
                                    imageLabel.ImageColor3 = screen.Color
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
local KeyPress = function(v)
    return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
end
local scriptVersion = '2.6a'




-- library settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
    Title = 'Infinity Hub - '.. scriptVersion ..' | Flee The Facility',
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
    EspSettings = Window:AddTab({
        Title = "Esp Settings",
        Icon = "settings"
    }),
}
Window:SelectTab(1)



-- source
Tabs.Game:AddSection('[ Game Cheats ]')
local AutoHackToggle = Tabs.Game:AddToggle("", {Title = "Auto hack", Description = 'I automatically hack computers to avoid errors', Default = false })
AutoHackToggle:OnChanged(function(bool)
    autoHack = bool
    while autoHack do task.wait()
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("SetPlayerMinigameResult",true)
    end
end)
Tabs.Game:AddButton({
    Title = "Teleport to exit foor",
    Description = "Teleports you to the exit door ",
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
    Description = "Teleports you to an uncompleted computer. Be careful, if you abuse it too much you could get kicked, use it responsibly",
    Callback = function()
        local map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
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
    Description = "Save all the players inside the capsules and then return to your position",
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
    Description = "Send a notification showing who the beast is",
    Callback = function()
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                if v.Character:findFirstChild('BeastPowers') then
                    Library:Notify{
                        Title = "Infinity Hub",
                        Content = 'Beast is '..v.Name,
                        Duration = 4
                    }
                end
            end
        end
    end
})

Tabs.LPlayer:AddSection('[ Game Options ]')
local AntiRagdollToggle = Tabs.LPlayer:AddToggle("", {Title = "Anti ragdoll (Beta)", Description = "When you're down, you'll get up automatically", Default = false })
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
    Description = 'Select one of these methods to activate the no slow mode',
    Values = {'Remote', 'Speed'},
    Multi = false,
    Default = nil,
})
MethodTONoSlow:OnChanged(function (args)
    Method = args
    print(Method)
end)
local NoSlowToggle = Tabs.LPlayer:AddToggle("", {Title = "No slow", Description = 'If your speed is slowed down, it will return to normal', Default = false })
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
local ActiveCrawlingToggle = Tabs.LPlayer:AddToggle("", {Title = "Active crawling (Beast)", Description = "When you're a beast, you'll now be able to crawling", Default = false })
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
    Description = "Your walkspeed and jumppower will be modified according to the values above in inputs",
    Callback = function()
        WalkSpeedBypass()
        JumpPowerBypass()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedValue
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPowerValue
    end
})
Tabs.LPlayer:AddButton({
    Title = "Reset ws jp",
    Description = "Reset your walkspeed and jumppower for normal",
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
    if not ESPComputer then
        local map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
        if map then
            local computerTables = map:GetChildren()
            for _, table in pairs(computerTables) do
                if table:IsA("Model") and table.Name == "ComputerTable" then
                    for _, screen in pairs(table:GetDescendants()) do
                        if (screen:IsA("Part") or screen:IsA("UnionOperation")) and screen.Name == "Screen" then
                            local billboardGui = screen:FindFirstChild("BillboardGui")
                            if billboardGui then
                                billboardGui.Enabled = false
                            end
                        end
                    end
                end
            end
        end
    else
        while ESPComputer do task.wait()
            updateComputerESP()
        end
    end
end)


Tabs.EspSettings:AddSection('[ Configurations ]')
local InoccentColorPicker = Tabs.EspSettings:AddColorpicker("Colorpicker", {
    Title = " Set the player's colour",
    Default = Color3.fromRGB(255, 255, 255)
})
InoccentColorPicker:OnChanged(function()
    InoccentColor = InoccentColorPicker.Value
end)
local BeastColorPicker = Tabs.EspSettings:AddColorpicker("Colorpicker", {
    Title = " Set the beast colour",
    Default = Color3.fromRGB(255, 0, 0)
})
BeastColorPicker:OnChanged(function()
    BeastColor = BeastColorPicker.Value
end)
Tabs.EspSettings:AddButton({
    Title = "Reset colors",
    Description = "",
    Callback = function()
        BeastColor = Color3.new(255, 0, 0)
        InoccentColor = Color3.new(255, 255, 255)
        InoccentColorPicker:SetValueRGB(Color3.fromRGB(255, 255, 255))
        BeastColorPicker:SetValueRGB(Color3.fromRGB(255, 0, 0))
    end
})
