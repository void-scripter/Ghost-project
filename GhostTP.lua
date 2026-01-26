local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local GhostButton = Instance.new("TextButton")
local GodButton = Instance.new("TextButton")
local SpinButton = Instance.new("TextButton")
local KayangButton = Instance.new("TextButton")
local TargetBox = Instance.new("TextBox")

ScreenGui.Name = "GhostTP_v16.29"
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.Text = "GHOST TP v16.29"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.TextSize = 18

TargetBox.Name = "TargetBox"
TargetBox.Parent = MainFrame
TargetBox.PlaceholderText = "Target Name..."
TargetBox.Position = UDim2.new(0.1, 0, 0.15, 0)
TargetBox.Size = UDim2.new(0, 160, 0, 35)

GhostButton.Name = "GhostButton"
GhostButton.Parent = MainFrame
GhostButton.Text = "Ghost View"
GhostButton.Position = UDim2.new(0.1, 0, 0.3, 0)
GhostButton.Size = UDim2.new(0, 160, 0, 40)
GhostButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GhostButton.TextColor3 = Color3.fromRGB(255, 255, 255)

GodButton.Name = "GodButton"
GodButton.Parent = MainFrame
GodButton.Text = "God Mode"
GodButton.Position = UDim2.new(0.1, 0, 0.45, 0)
GodButton.Size = UDim2.new(0, 160, 0, 40)
GodButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GodButton.TextColor3 = Color3.fromRGB(255, 255, 255)

SpinButton.Name = "SpinButton"
SpinButton.Parent = MainFrame
SpinButton.Text = "Spin 700 RPM"
SpinButton.Position = UDim2.new(0.1, 0, 0.6, 0)
SpinButton.Size = UDim2.new(0, 160, 0, 40)
SpinButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpinButton.TextColor3 = Color3.fromRGB(255, 255, 255)

KayangButton.Name = "KayangButton"
KayangButton.Parent = MainFrame
KayangButton.Text = "Kayang Mode"
KayangButton.Position = UDim2.new(0.1, 0, 0.75, 0)
KayangButton.Size = UDim2.new(0, 160, 0, 40)
KayangButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KayangButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- System Features
GhostButton.MouseButton1Click:Connect(function()
    local targetName = TargetBox.Text
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if targetPlayer and targetPlayer.Character then
        workspace.CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
    end
end)

GodButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end)

SpinButton.MouseButton1Click:Connect(function()
    local p = game.Players.LocalPlayer
    local char = p.Character
    local humRoot = char:FindFirstChild("HumanoidRootPart")
    if humRoot then
        local spin = Instance.new("BodyAngularVelocity")
        spin.MaxTorque = Vector3.new(0, math.huge, 0)
        spin.AngularVelocity = Vector3.new(0, 700, 0)
        spin.Parent = humRoot
    end
end)

KayangButton.MouseButton1Click:Connect(function()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://181428919"
    local load = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
    load:Play()
end)
