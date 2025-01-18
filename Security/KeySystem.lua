-- make folder
local url = 'https://discord.gg/emKJgWMHAr'
local key = 'Key_5E8P+5p-=pGLl@n1TEgqUQ^h@GF(m=c!QhRu=5j-@IKNbXjMuf'
if not isfolder('Infinity-Hub') then
    makefolder('Infinity-Hub')
    makefolder('Infinity-Hub/Key-System')
    makefolder('Infinity-Hub/Game')
    makefolder('Infinity-Hub/Settings')
end
if isfile('Infinity-Hub/Key-System/key.infhub') then
    if readfile('Infinity-Hub/Key-System/key.infhub') == key then
        warn('Key aleary used')
		-- loadstring script
        return 
    end
end
if not isfile('Infinity-Hub/Game/Info.infhub') then
	writefile('Infinity-Hub/Game/Info.infhub', 'Id: '..tostring(game.PlaceId)..'\nName: '..tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name))
elseif isfile('Infinity-Hub/Game/Info.infhub') then
	writefile('Infinity-Hub/Game/Info.infhub', 'Id: '..tostring(game.PlaceId)..'\nName: '..tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name))
end



-- source
local SourceURL = 'https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'
ImGui = loadstring(game:HttpGet(SourceURL))()
local KeySystem = ImGui:CreateWindow({
	Title = "Infinity Hub - v2.8a | Key system",
	TabsBar = false,
	AutoSize = "Y",
	NoCollapse = true,
	NoResize = true,
	NoClose = false
})
local Content = KeySystem:CreateTab({
	Visible = true
})
local Key = Content:InputText({
	Label = "Key",
	PlaceHolder = "Key here",
	Value = "",
})
local ButtonRow = Content:Row()
ButtonRow:Button({
	Text = "Enter",
	Callback = function()
        Key:SetLabel("Checking key...")
        writefile('Infinity-Hub/Key-System/key.infhub', Key:GetValue())
        wait(.2)
        warn('Key-System: '..readfile('Infinity-Hub/Key-System/key.infhub'))
        wait(2)
		if readfile('Infinity-Hub/Key-System/key.infhub') == key then
            Key:SetLabel("Corrent key!")
            wait(1.5)
			KeySystem:Close()
		else
			Key:SetLabel("Wrong key!")
		end
	end,
})
ButtonRow:Button({
	Text = "Get Key",
	Callback = function()
        setclipboard(tostring(url))
	end,
})
