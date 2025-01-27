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
function CreateFarmZone()
    local group = Instance.new('Model', workspace)
    group.Name = 'farm zone'

    local startPart = Instance.new('Part', group)
    startPart.Name = 'farm part'
    startPart.Anchored = true
    startPart.Position = Vector3.new(82, 322, -818)
    startPart.Size = Vector3.new(10, 1, 9e9)

    local wall1 = Instance.new('Part', group)
    local wall2 = Instance.new('Part', group)
    wall1.Name = 'Wall'
    wall2.Name = 'Wall'
    wall1.Anchored = true
    wall2.Anchored = true
    wall1.Position = Vector3.new(87, 325, -813)
    wall2.Position = Vector3.new(76, 325, -813)
    wall1.Size = Vector3.new(1, 10, 9e9)
    wall2.Size = Vector3.new(1, 10, 9e9)

    local teleport1 = Instance.new('Part', group)
    teleport1.Name = 'Teleport1'
    teleport1.Anchored = true
    teleport1.Position = Vector3.new(81, 325, -1836)
    teleport1.Size = Vector3.new(12, 1, 1)
    teleport1.Touched:Connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
            local player = game.Players:GetPlayerFromCharacter(hit.Parent)
            local hrt = player.Character.HumanoidRootPart
            hrt.CFrame = CFrame.new(82, 325, -560)
        end
    end)
end
scriptVersion = '2.8a'



-- library settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
    Title = 'Infinity Hub - '.. scriptVersion ..' | Speed Run 4',
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
        Title = "| Game",
        Icon = "layers"
    }),
}
Window:SelectTab(1)



-- source
Tabs.Game:AddSection('[ Game Cheats ]')
local AutoWinToggle = Tabs.Game:AddToggle("", {Title = "Auto win / collect all", Description = 'Collects everything from the map and also completes the levels for you', Default = false })
AutoWinToggle:OnChanged(function(bool)
    autoWin = bool
    while autoWin do task.wait()
        for _, v in pairs(workspace.Levels:GetDescendants()) do
            if v:IsA('Folder') and v.Name == 'Star' then
                local model = v.Parent:FindFirstChild('Model')
                if model then
                    game.Players.LocalPlayer.Character:PivotTo(model:GetPivot())
                end
                if not model then
                   for _, x in pairs(workspace.Levels:GetDescendants()) do
                        if x:IsA('Part') and x.Name == '3' or x.Name == '2' then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, x, 0)
                            wait(.1)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, x, 1)
                        end
                    end
                end
            end
        end
    end
end)
local AutoEnergyToggle = Tabs.Game:AddToggle("", {Title = "Auto farm energy", Description = 'Activate for automatic energymaking', Default = false })
AutoEnergyToggle:OnChanged(function(bool)
    autoEnergy = bool
    if autoEnergy then
        local findZone = workspace:FindFirstChild('farm zone')
        if not findZone then
            CreateFarmZone()
        end
        wait(.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(82, 325, -560)
    else
        game.Players.LocalPlayer.Character.Head:Destroy()
    end
    while autoEnergy do task.wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
        wait(1)
        
        game:GetService("VirtualInputManager"):SendKeyEvent(true, 'W', false, game)
    end
end)
local AutoSellEnergyToggle = Tabs.Game:AddToggle("", {Title = "Auto sell energy", Description = 'Activate to sell energy automatically', Default = false })
AutoSellEnergyToggle:OnChanged(function(bool)
    autoSellEnergy = bool
    while autoSellEnergy do task.wait(.5)
        local Signals = {"Activated", "MouseButton1Down", "MouseButton2Down", "MouseButton1Click", "MouseButton2Click"}
        local button = game:GetService("Players").LocalPlayer.PlayerGui.SidebarUI.TextButton
        for _, Signal in pairs(Signals) do
            firesignal(button[Signal])
        end
    end
end)
