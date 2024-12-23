local games = {
    [{16732694052}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/fish/src.lua',
    [{5610197459}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/GangUpOnPeopleSimulator/src.lua',
    [{893973440}] = 'https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/scripts/games/FleeTheFacility/src.lua',
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
