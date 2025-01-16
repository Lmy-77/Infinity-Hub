-- teleport service
local found = false
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/main/Software/src.lua"))()
]]



-- loader
local games = {
    [{16732694052}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/fish/src.lua',
    [{5610197459}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/GangUpOnPeopleSimulator/src.lua',
    [{893973440}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/FleeTheFacility/src.lua',
    [{5780309044}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Stands%20Awakening/Main/src.lua',
    [{11423467063}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Stands%20Awakening/Main/autoboss.lua',
    [{10450270085, 16379688837}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Jujutsu%20Infinite/src.lua',
    [{10260193230}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/Meme%20Sea/src.lua',
    [{95284069025576}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/FishRNG/scr.lua'
}
for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        found = true
        break
    end
end
if not found then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/modules/Notification/Support.lua"))()
end
