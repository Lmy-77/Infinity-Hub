local MobileButton = Instance.new("ScreenGui")
local Main = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIStroke = Instance.new("UIStroke")
local UIGradient_2 = Instance.new("UIGradient")
local Icon = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")


MobileButton.Name = "Mobile Button"
MobileButton.Parent = (game:GetService("CoreGui") or gethui())
MobileButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = MobileButton
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.0429799445, 0, 0.117917307, 0)
Main.Size = UDim2.new(0.0429799445, 0, 0.0612557419, 0)
Main.AutoButtonColor = false
Main.Font = Enum.Font.SourceSans
Main.Text = ""
Main.TextColor3 = Color3.fromRGB(0, 0, 0)
Main.TextSize = 14.000

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Main

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(95, 101, 106)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(54, 60, 61))}
UIGradient.Rotation = 50
UIGradient.Parent = Main

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1.200
UIStroke.Parent = Main

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(81, 87, 91)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(44, 49, 50))}
UIGradient_2.Rotation = 50
UIGradient_2.Parent = UIStroke

Icon.Name = "Icon"
Icon.Parent = Main
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.166966751, 0, 0.214989409, -1)
Icon.Size = UDim2.new(0.666666687, 0, 0.590909064, 0)
Icon.Image = "rbxassetid://10723415766"
Icon.ImageTransparency = 0.500

UIAspectRatioConstraint.Parent = Icon
UIAspectRatioConstraint.AspectRatio = 1.154

UIAspectRatioConstraint_2.Parent = Main
UIAspectRatioConstraint_2.AspectRatio = 1.023


local function SZBOR_fake_script()
	local script = Instance.new('LocalScript', Main)

	local button = script.Parent
	local guiPath = game:GetService('CoreGui')
	button.MouseButton1Click:Connect(function()
		for _, v in pairs(guiPath:GetDescendants()) do
			if v:IsA('ScreenGui') and v.Name == 'FluentRenewed_Infinity Hub - 2.8a | Flee The Facility' then
				if v.Enabled == true then
					v.Enabled = false
				elseif v.Enabled == false then
					v.Enabled = true
				end
			end
		end
	end)
end
coroutine.wrap(SZBOR_fake_script)()
local function CAGKXJ_fake_script()
	local script = Instance.new('LocalScript', Main)

	local frame = script.Parent
	local userInputService = game:GetService("UserInputService")
	
	local dragging = false
	local dragStart, startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			update(input)
		end
	end)
	
	userInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			update(input)
		end
	end)
	
end
coroutine.wrap(CAGKXJ_fake_script)()
