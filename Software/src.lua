-- teleport service
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/main/Software/src.lua"))()
]]



-- loader
local currentPlaceId = game.PlaceId
local supportedGames = { 
    [{16732694052}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/fish/src.lua',
    [{5610197459}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/GangUpOnPeopleSimulator/src.lua',
    [{893973440}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/FleeTheFacility/src.lua',
    [{5780309044}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Stands%20Awakening/Main/src.lua',
    [{11423467063}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Stands%20Awakening/Main/autoboss.lua',
    [{10450270085, 16379688837}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Jujutsu%20Infinite/src.lua',
    [{10260193230}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Meme%20Sea/src.lua',
    [{95284069025576}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/FishRNG/scr.lua',
    [{183364845}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/SpeedRun4/src.lua'
}
local function findScript()
    for key, scriptUrl in pairs(supportedGames) do
        if typeof(key) == "table" then
            for _, id in ipairs(key) do
                if id == currentPlaceId then
                    return scriptUrl
                end
            end
        elseif key == currentPlaceId then
            return scriptUrl
        end
    end
    return nil
end
local scriptUrl = findScript()
if scriptUrl then
    print("Infinity Hub - Game supported")
    loadstring(game:HttpGet(scriptUrl))()
else
    print("Infinity Hub - Game not supported")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/modules/Notification/Support.lua"))()
end
