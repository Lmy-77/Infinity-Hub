local TweenService = game:GetService("TweenService")
local Notification = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Text = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local sound = Instance.new("Sound")


sound.SoundId = "rbxassetid://8551372796"
sound.Volume = 10
sound.Looped = false
sound.Parent = workspace

Notification.Name = "Notification"
Notification.Parent = (game:GetService("CoreGui") or gethui())
Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = Notification
Background.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
Background.BackgroundTransparency = 1
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.449, 0, 0.95, 0)
Background.Size = UDim2.new(0.05, 0, 0.01, 0)

UICorner.Parent = Background

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(57, 57, 57)
UIStroke.Thickness = 1.500
UIStroke.Parent = Background

Text.Name = "Text"
Text.Parent = Background
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1
Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text.BorderSizePixel = 0
Text.Position = UDim2.new(0.05, 0, 0.1, 0)
Text.Size = UDim2.new(0.9, 0, 0.8, 0)
Text.Font = Enum.Font.SourceSans
Text.Text = "Game not supported"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextScaled = true
Text.TextSize = 14.000
Text.TextTransparency = 1
Text.TextWrapped = true

UIAspectRatioConstraint.Parent = Text
UIAspectRatioConstraint.AspectRatio = 5.208

UIAspectRatioConstraint_2.Parent = Background
UIAspectRatioConstraint_2.AspectRatio = 4.633


local targetPosition = UDim2.new(0.449, 0, 0.934, 0)
local targetSize = UDim2.new(0.13, 0, 0.05, 0)

local backgroundTweenInfo = TweenInfo.new(
    0.1,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)
local textTweenInfo = TweenInfo.new(
    0.1,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)
local backgroundTween = TweenService:Create(Background, backgroundTweenInfo, {
    Position = targetPosition,
    Size = targetSize,
    BackgroundTransparency = 0
})
local textTween = TweenService:Create(Text, textTweenInfo, {
    TextTransparency = 0
})


sound:Play()
sound.Ended:Connect(function()
    sound:Destroy()
end)

backgroundTween:Play()
backgroundTween.Completed:Connect(function()
    textTween:Play()
end)


wait(5)


Notification:Destroy()
