-- function
local allowedDomains = { "example.com", "api.trustedservice.com", "github.com", "raw.githubusercontent.com" }
local originalHttpGet = game.HttpGet
local originalHttpPost = game.HttpPost
local HttpService = game:GetService("HttpService")
local function isAllowed(url)
    for _, domain in ipairs(allowedDomains) do
        if string.find(url, domain) then
            return true
        end
    end
    return false
end
local function customHttpGet(url)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "GET"
        })
    end)
    if success and response.Success then
        return response.Body
    else
        return nil
    end
end
local function customHttpPost(url, data)
    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(data)
        })
    end)
    if success and response.Success then
        return response.Body
    else
        return nil
    end
end
game.HttpGet = function(self, url, ...)
    if isAllowed(url) then
        return customHttpGet(url)
    end
    return nil
end
game.HttpPost = function(self, url, data, ...)
    if isAllowed(url) then
        return customHttpPost(url, data)
    end
    return nil
end



-- auto loader
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://gitlab.com/Lmy77/menu/-/raw/main/infinityhub"))()
]]



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



-- loader
local games = {
    [{16732694052}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/fish/src.lua',
    [{5610197459}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/GangUpOnPeopleSimulator/src.lua',
    [{893973440}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/FleeTheFacility/src.lua',
    [{5780309044}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Stands%20Awakening/Main/src.lua',
    [{11423467063}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Stands%20Awakening/Main/autoboss.lua',
    [{10450270085, 16379688837}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Jujutsu%20Infinite/src.lua'
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
