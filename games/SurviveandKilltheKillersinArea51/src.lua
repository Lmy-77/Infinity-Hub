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
scriptVersion = '2.8a'



-- library settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
    Title = 'Infinity Hub - '.. scriptVersion ..' | Survive and Kill the Killers in Area 51',
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
    Esp = Window:AddTab({
        Title = "| Esp",
        Icon = "view"
    }),
}
Window:SelectTab(1)



-- source
Tabs.Game:AddSection('[ Game Cheats ]')
local CollectWeaponToggle = Tabs.Game:AddToggle("", {Title = "Collect all weapons", Description = 'Collect all weapons in map', Default = false })
CollectWeaponToggle:OnChanged(function(bool)
    weapon = bool
    if weapon then
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        teleportOldPos = oldPos
        for _, v in pairs(workspace.Weapons:GetChildren()) do
            if v:IsA('Model') then
                for _, x in pairs(v:GetChildren()) do
                    if x:IsA('Model') then
                        game.Players.LocalPlayer.Character:PivotTo(x:GetPivot())
                        wait()
                        fireproximityprompt(v.Hitbox.ProximityPrompt)
                    end
                end
            end
        end
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(teleportOldPos)
    end
end)
local FarmKillerToggle = Tabs.Game:AddToggle("", {Title = "Kill all killers", Description = 'Collect all weapons in map', Default = false })
FarmKillerToggle:OnChanged(function(bool)
    killerFarm = bool
    while killerFarm do task.wait()
        for _, v in pairs(workspace.Killers:GetChildren()) do
            local humanoid = v.Zombie or v.Humanoid
            if humanoid.Health ~= 0 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 8)
            end
        end
    end
end)
Tabs.Game:AddButton({
    Title = "Cancel kill remote",
    Description = "",
    Callback = function()
        local remote = game:GetService("ReplicatedStorage")["Character Remotes"].ClientDied
        local oldNameCall = nil
        setreadonly(game, true)
        oldNameCall = hookmetamethod(game, '__namecall', function(self, ...)
            local args = {...}
            local method = getnamecallmethod()
            if (method == 'FireServer' or method == 'InvokeServer') and self == remote  then
                return nil
            end
            return oldNameCall(self, ...)
        end)
    end
})
Tabs.Game:AddButton({
    Title = "Infnite ammo",
    Description = "",
    Callback = function()
        for _, v in pairs(getgc(true)) do
            if type(v) == 'table' and rawget(v, 'ammo') and rawget(v, 'stored_ammo') then
                rawset(v, 'ammo', math.huge)
                rawset(v, 'stored_ammo', math.huge)
            end
        end
    end
})


Tabs.Esp:AddSection('[ Game Options ]')
local EspKillerToggle = Tabs.Esp:AddToggle("", {Title = "Esp killers", Description = '', Default = false })
EspKillerToggle:OnChanged(function(bool)
    local EspPath = workspace.Killers
    local EspHighlight = Instance.new('Highlight')
    EspHighlight.Name = 'InfHub_Esp'
    espKiller = bool

    if espKiller then
        for _, v in pairs(EspPath:GetChildren()) do
            if v:IsA('Model') then
                EspHighlight.Parent = v
            end
        end
        wait()
        EspPath.ChildAdded:Connect(function(child)
            if espKiller then
                EspHighlight.Parent = child
            end
        end)
    else
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA('Highlight') and v.Name == 'InfHub_Esp' then
                v:Destroy()
            end
        end
    end
end)
