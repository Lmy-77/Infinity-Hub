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
function modGun()
    for _, v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'stored_ammo') then
            rawset(v, 'ammo', math.huge)
            rawset(v, 'stored_ammo', math.huge)
            rawset(v, 'is_auto', true)
            rawset(v, 'shoot_wait', 0)
            rawset(v, 'bullet_count', 10)
            rawset(v, 'inaccuracy', 0)
        end
    end
end
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
local FarmKillerToggle = Tabs.Game:AddToggle("", {Title = "Kill all killers", Description = 'Collect all weapons in map', Default = false })
FarmKillerToggle:OnChanged(function(bool)
    killerFarm = bool
    while killerFarm do task.wait()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA('Tool') and v.Name == 'RayGun' then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
        for _, v in pairs(workspace.Killers:GetChildren()) do
            local humanoid = v:FindFirstChild('Zombie') or v:FindFirstChild('Humanoid')
            if humanoid.Health ~= 0 then
                local modelPosition = v.Head.Position
                local cframe = CFrame.new(modelPosition + Vector3.new(0, 2.5, 0)) * CFrame.Angles(math.rad(270), 0, 0)
                for _, hrt in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if hrt:IsA('Part') and hrt.Name == 'HumanoidRootPart' then
                        hrt.CFrame = cframe
                    end
                end
            end
        end
    end
end)
Tabs.Game:AddButton({
    Title = "Collect all weapons",
    Description = "",
    Callback = function()
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
})
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
        modGun()
    end
})


Tabs.Esp:AddSection('[ Game Options ]')
local EspKillerToggle = Tabs.Esp:AddToggle("", {Title = "Esp killers", Description = '', Default = false })
EspKillerToggle:OnChanged(function(bool)
    espKiller = bool
    if espKiller then
        for _, model in ipairs(workspace.Killers:GetChildren()) do
            if model:IsA("Model") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Esp Killers"
                highlight.Parent = model
            end
        end
    else
        for _, v in ipairs(workspace.Killers:GetDescendants()) do
            if v:IsA("Highlight") and v.Name == "Esp Killers" then
                v:Destroy()
            end
        end
    end
end)
