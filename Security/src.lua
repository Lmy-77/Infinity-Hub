--[[

     _____        __ _       _ _           _    _       _                      _   _    _____ _                _              ____                            
    |_   _|      / _(_)     (_) |         | |  | |     | |         /\         | | (_)  / ____| |              | |            |  _ \                           
      | |  _ __ | |_ _ _ __  _| |_ _   _  | |__| |_   _| |__      /  \   _ __ | |_ _  | |    | |__   ___  __ _| |_ ___ _ __  | |_) |_   _ _ __   __ _ ___ ___ 
      | | | '_ \|  _| | '_ \| | __| | | | |  __  | | | | '_ \    / /\ \ | '_ \| __| | | |    | '_ \ / _ \/ _` | __/ _ \ '__| |  _ <| | | | '_ \ / _` / __/ __|
     _| |_| | | | | | | | | | | |_| |_| | | |  | | |_| | |_) |  / ____ \| | | | |_| | | |____| | | |  __/ (_| | ||  __/ |    | |_) | |_| | |_) | (_| \__ \__ \
    |_____|_| |_|_| |_|_| |_|_|\__|\__, | |_|  |_|\__,_|_.__/  /_/    \_\_| |_|\__|_|  \_____|_| |_|\___|\__,_|\__\___|_|    |____/ \__, | .__/ \__,_|___/___/
                                     _/ |                                                                                            __/ | |                  
                                   |___/                                                                                            |___/|_|

    - This script is in BETA version, it's just a few codes to bypass some anti cheaters
    - The code below works because it simulates functions to try to fool the anti cheater
    - Remember, this script is in BETA and may not work in all games
    - They are just security codes for scripts
]]--






-- anti kick
local oldKick = nil
local meta = getrawmetatable(game)
local oldNameCall = meta.__namecall
setreadonly(meta, false)
oldKick = hookfunction(game.Players.LocalPlayer.Kick function(...)
    return warn('kick attempt canceled')
end)
meta.__namecall = function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" or method == "InvokeServer" then
        if tostring(self):lower():find("kick") or tostring(self):lower():find("ban") then
            warn("Suspicious remote blocked:", self.Name)
            return nil
        end
    elseif method == "Index" then
        if tostring(self):lower():find("kick") then
            warn("Suspicious access attempt:", self.Name)
            return nil
        end
    end
    return oldNamecall(self, unpack(args))
end
setreadonly(meta, true)



-- anti WalkSpeed/JumpPower anti cheater
local meta = getrawmetatable(game)
setreadonly(meta, false)
local oldIndex = meta.__Index
gmt.__Index = newcclosure(function(self, b)
    if b == 'WalkSpeed' then
        return 16
    end
    return oldIndex(self, b)
end)
gmt.__Index = newcclosure(function(self, b)
    if b == 'JumpPower' then
        return 50
    end
    return oldIndex(self, b)
end)
setreadonly(meta, true)



-- anti teleport bypass
function bypassTeleport(x, y, z)
    function teleport(target)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
        for _ = 1, math.ceil((HumanoidRootPart.Position - target).Magnitude / 2) do
            HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.Position:Lerp(target, 0.5))
            task.wait(0.05)
        end
        HumanoidRootPart.CFrame = CFrame.new(target)
    end
    local meta = getrawmetatable(game)
    local oldNamecall = meta.__namecall
    setreadonly(meta, false)
    meta.__namecall = function(self, ...)
        if getnamecallmethod() == "FireServer" or getnamecallmethod() == "InvokeServer" then
            if tostring(self):lower():find("position") then
                return nil
            end
        end
        return oldNamecall(self, ...)
    end
    setreadonly(meta, true)
    teleport(Vector3.new(x, y, z))
end
bypassTeleport(x, y ,z) -- position
