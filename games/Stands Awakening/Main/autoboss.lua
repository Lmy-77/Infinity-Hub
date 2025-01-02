-- library settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
    Title = 'Infinity Hub - Stands Awakenig - v8.6',
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
    Bosses = Window:AddTab({
        Title = "| Boss",
        Icon = "angry"
    }),
}
Window:SelectTab(1)



-- source
local Button = Tabs.Bosses:AddButton({
    Title = "Start auto boss",
    Description = "Starts the automatic boss kill script",
    Callback = function()
        repeat wait() until game:IsLoaded() and game:GetService("Players")
        local Players =  game:GetService("Players")
        local LocalPlayer =  Players.LocalPlayer
        local Character =  LocalPlayer.Character
        local HumanoidRootPart =  Character.HumanoidRootPart
        local Humanoid =  Character.Humanoid
        local Time =  true
        local Attacking =  game:GetService("Workspace").Dead
        local Obby =  game:GetService("Workspace").ObbyW
        local Phase =  game:GetService("Workspace").BossPhase
        local Health =  game:GetService("Workspace").TrollHealth
        if game:GetService("Workspace"):FindFirstChild("Effects") then
            game:GetService("Workspace"):FindFirstChild("Effects"):Destroy()
        end
        if game:GetService("Workspace").Map:FindFirstChild("ThunderParts") then
            game:GetService("Workspace").Map:FindFirstChild("ThunderParts"):Destroy()
        end
        if LocalPlayer.Backpack:FindFirstChild("KnightsSword") then
            LocalPlayer.Backpack["KnightsSword"].Parent = Character
            if Character:FindFirstChild("KnightsSword") then
                local Sword =  Character:FindFirstChild("KnightsSword")
                local Box =  Instance.new("SelectionBox")
                Box.Name =  "SelectionBoxCreated"
                Box.Parent =  Sword.Handle
                Box.Adornee =  Sword.Handle
                Sword.Handle.Massless =  true
                Sword.GripPos=  Vector3.new(0,0,0)
                Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                LocalPlayer.Backpack["KnightsSword"].Parent = Character
                Character.KnightsSword.Handle.Size = Vector3.new(20, 20, 500)
            end
        elseif Character:FindFirstChild("KnightsSword") then
            local Sword =  Character:FindFirstChild("KnightsSword")
            local Box =  Instance.new("SelectionBox")
            Box.Name =  "SelectionBoxCreated"
            Box.Parent =  Sword.Handle
            Box.Adornee =  Sword.Handle
            Sword.Handle.Massless =  true
            Sword.GripPos =  Vector3.new(0,0,0)
            Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            LocalPlayer.Backpack["KnightsSword"].Parent = Character
            Character.KnightsSword.Handle.Size = Vector3.new(20, 20, 500)
        end
        task.spawn(function()
            while Attacking.Value == false do task.wait()
                if Obby.Value == true then
                    HumanoidRootPart.CFrame = CFrame.new(20.4561386, 113.245972, 196.61351, 0.0634383112, 5.81675401e-08, -0.99798578, 8.29346689e-08, 1, 6.35567972e-08, 0.99798578, -8.67995524e-08, 0.0634383112)
                else
                    if Phase.Value == "None" then
                        HumanoidRootPart.CFrame = CFrame.new(-5.46999931, -4.45343876, 248.209991, 1, 1.68923409e-09, 7.63995055e-14, -1.68923409e-09, 1, 6.64721389e-09, -7.63882772e-14, -6.64721389e-09, 1)
                    else
                        HumanoidRootPart.CFrame = CFrame.new(-19.8957844, -4.77343941, 142.49881, -0.999476075, -3.27794467e-08, -0.0323671587, -3.71140274e-08, 1, 1.33318295e-07, 0.0323671587, 1.34449706e-07, -0.999476075)
                    end
                end
            end
        end)
        task.spawn(function()
            while Attacking.Value == false  do task.wait()
                if Obby.Value == false then
                    if Character:FindFirstChild("KnightsSword") then
                        Character.KnightsSword:Activate()
                    end
                end
            end
        end)
        local function Percent(First, Second)
            return(First / Second)
        end
        Health:GetPropertyChangedSignal("Value"):Connect(function()
            if Percent(Health.Value, Health.MaxHealth.Value) <= 0.003 and Percent(Health.Value, Health.MaxHealth.Value) >= 0 then
                if Time then
                    Time = false
                    Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                    wait(WaitTime)
                    LocalPlayer.Backpack["KnightsSword"].Parent = Character
                end
            end
        end)
    end
})
local Button = Tabs.Bosses:AddButton({
    Title = "Remove cooldown on sword",
    Description = "Removes the cooldown time on the sword",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/itsyouranya/free/main/Anya%20Stands%20Awakening%20Helper.lua'),true))()
    end
})
local autoFarmBossToggle = Tabs.Bosses:AddToggle("", {Title = "Esp boss", Description = 'Activate to visualise where the boss is', Default = false })
autoFarmBossToggle:OnChanged(function(bool)
    espBoss = bool
    if espBoss then
        local Esp = Instance.new("Highlight")
        Esp.Name = "EspPart"
        Esp.FillColor = Color3.new(255, 255, 255)
        Esp.Parent = game:GetService("Workspace").TrollPrism
    else
        game:GetService("Workspace").TrollPrism.EspPart:Destroy()
    end
end)
