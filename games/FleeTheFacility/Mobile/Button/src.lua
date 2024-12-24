local Mobile = Instance.new("ScreenGui")
local Button = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Icon = Instance.new("ImageButton")
local UIStroke = Instance.new("UIStroke")
local UIGradient = Instance.new("UIGradient")
local UIGradient_2 = Instance.new("UIGradient")
local Interact = Instance.new("TextButton")



Mobile.Name = "Mobile"
Mobile.Parent = (game:GetService("CoreGui") or gethui())
Mobile.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Button.Name = "Button"
Button.Parent = Mobile
Button.AnchorPoint = Vector2.new(0.5, 0.5)
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
Button.BorderSizePixel = 0
Button.LayoutOrder = 6
Button.Position = UDim2.new(0.0955775008, 0, 0.138591111, 0)
Button.Size = UDim2.new(0, 42, 0, 40)
Button.ZIndex = 150

UICorner.Parent = Button

Icon.Name = "Icon"
Icon.Parent = Button
Icon.AnchorPoint = Vector2.new(0.5, 0.5)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(27, 42, 53)
Icon.BorderSizePixel = 0
Icon.LayoutOrder = 1
Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
Icon.Size = UDim2.new(0, 24, 0, 24)
Icon.ZIndex = 150
Icon.Image = "rbxassetid://10723415766"
Icon.ImageColor3 = Color3.fromRGB(240, 240, 240)
Icon.ScaleType = Enum.ScaleType.Fit

UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.200
UIStroke.Parent = Button

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(81, 87, 91)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(44, 49, 50))}
UIGradient.Rotation = 50
UIGradient.Parent = UIStroke

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(88, 94, 99)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 43))}
UIGradient_2.Rotation = 50
UIGradient_2.Parent = Button

Interact.Name = "Interact"
Interact.Parent = Button
Interact.AnchorPoint = Vector2.new(0.5, 0.5)
Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Interact.BackgroundTransparency = 1.000
Interact.BorderColor3 = Color3.fromRGB(27, 42, 53)
Interact.BorderSizePixel = 0
Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
Interact.Size = UDim2.new(1, 0, 1, 0)
Interact.ZIndex = 155
Interact.Font = Enum.Font.SourceSans
Interact.Text = ""
Interact.TextColor3 = Color3.fromRGB(0, 0, 0)
Interact.TextSize = 14.000
Interact.TextTransparency = 1.000



local function NMBE_fake_script()
	local script = Instance.new('LocalScript', Interact)

	local button = script.Parent
	button.MouseButton1Click:Connect(function()
		game:GetService('VirtualInputManager'):SendKeyEvent(true, "J", false, game)
	end)
end
coroutine.wrap(NMBE_fake_script)()
local function XHCTHDF_fake_script()
	print('a')
end
coroutine.wrap(XHCTHDF_fake_script)()
