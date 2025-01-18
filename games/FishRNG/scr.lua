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
local KeyPress = function(v)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
    wait(.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, v, false, game)
end



-- library settings
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local Window = Library:CreateWindow{
    Title = 'Infinity Hub - '.. scriptVersion .." | Fish's RNG",
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
    Rolls = Window:AddTab({
        Title = "| Roll",
        Icon = "refresh-cw"
    }),
    Itens = Window:AddTab({
        Title = "| Itens",
        Icon = "hammer"
    }),
    Visual = Window:AddTab({
        Title = "| Visual",
        Icon = "crown"
    }),
}
Window:SelectTab(1)



-- source
local autoObby = false
Tabs.Rolls:AddSection('[ Roll Farm ]')
local rollToggle = Tabs.Rolls:AddToggle("", {Title = "Auto roll", Description = 'Activate to automatically scroll through the fish', Default = false })
rollToggle:OnChanged(function(bool)
    autoRoll = bool
    while (autoRoll) do task.wait()
        local remote = game:GetService("ReplicatedStorage").Remotes.Roll
        local arguments = {}
        local results = remote:InvokeServer(unpack(arguments))
    end
end)
local rewardToggle = Tabs.Rolls:AddToggle("", {Title = "Auto get reward", Description = 'Activate to get the obby reward', Default = false })
rewardToggle:OnChanged(function(bool)
    autoObby = bool
    while (autoObby) do task.wait()
        for _, v in pairs(workspace.ObbyReward.Coins.Reward:GetDescendants()) do
            if (v:IsA('ParticleEmitter')) then
                if (v.Enabled == true) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.ObbyReward.Coins.Reward.CFrame
                end
            end
        end
    end
end)


Tabs.Itens:AddSection('[ Auto Item ]')
local itemToggle = Tabs.Itens:AddToggle("", {Title = "Auto collect item", Description = 'Activate to get the obby reward', Default = false })
itemToggle:OnChanged(function(bool)
    itens = bool
    while (itens) do task.wait(.5)
        for _, v in pairs(workspace.RandomItemSpawn:GetChildren()) do
            if v:IsA('Model') then
                game.Players.LocalPlayer.Character:PivotTo(v:GetPivot())
                wait(.2)
                KeyPress('E')
            end
        end
    end
end)
local Button = Tabs.Itens:AddButton({
    Title = "Anti afk",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()
    end
})


Tabs.Visual:AddSection('[ Visual Options ]')
local Button = Tabs.Visual:AddButton({
    Title = "Unlock collection",
    Description = "Click if you want to release all the fish in your collection",
    Callback = function()
        for _, v in pairs(game:GetService("ReplicatedStorage").Data[game.Players.LocalPlayer.UserId].Data.Collection:GetChildren()) do
            if (v:IsA('BoolValue')) then
                if (v.Value == false) then
                    v.Value = true
                end
            end
        end
    end
})
local Button = Tabs.Visual:AddButton({
    Title = "Unlock auras",
    Description = "Click if you want to release all the fish in your auras",
    Callback = function()
        for _, v in pairs(game:GetService("ReplicatedStorage").Data[game.Players.LocalPlayer.UserId].Data.Auras:GetChildren()) do
            if (v:IsA('NumberValue')) then
                if (v.Value == 0) then
                    v.Value = 1
                end
            end
        end
    end
})
local Button = Tabs.Visual:AddButton({
    Title = "Unlock gloves",
    Description = "Click if you want to release all the fish in your gloves",
    Callback = function()
        for _, v in pairs(game:GetService("ReplicatedStorage").Data[game.Players.LocalPlayer.UserId].Data.GloveOwned:GetChildren()) do
            if (v:IsA('NumberValue')) then
                if (v.Value == false) then
                    v.Value = true
                end
            end
        end
    end
})



-- modded beta
local success, result = pcall(function()
    return require
end)
for _, v in pairs(game:GetService("ReplicatedStorage").GameStats.Items:GetChildren()) do
    if (v:IsA('ModuleScript') and v.Name:lower():find('potion')) then
        if success and type(result) == "function" then
            local mScripts = require(v)
            mScripts.Buff = 9e9
            mScripts.Time = 9e9
            mScripts.Description = 'Modded by Infinity Hub'
        end
    end
end
