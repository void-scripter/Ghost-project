local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "AbilGhostSuite"

local currentLoopTarget = "" 
local animActive = false
local godModeActive = false 
local isMainMinimised = false 
local spinGuiOpen = false
local clickCount = 0 

local function Round(obj, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = obj
end

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 310, 0, 380)
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
Round(MainFrame, 12)

local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Round(Header, 12)
Header.ZIndex = 5

local TitleLabel = Instance.new("TextLabel", Header)
TitleLabel.Size = UDim2.new(0.7, 0, 0, 25)
TitleLabel.Position = UDim2.new(0.05, 0, 0, 5)
TitleLabel.Text = "GHOST TP🎯"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 10

local SubLabel = Instance.new("TextLabel", Header)
SubLabel.Size = UDim2.new(0.7, 0, 0, 15)
SubLabel.Position = UDim2.new(0.05, 0, 0, 25)
SubLabel.Text = "Made by Gemini, and Abil"
SubLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SubLabel.BackgroundTransparency = 1
SubLabel.Font = Enum.Font.Gotham
SubLabel.TextSize = 9
SubLabel.TextXAlignment = Enum.TextXAlignment.Left
SubLabel.ZIndex = 10

local SpinFrame = Instance.new("Frame", ScreenGui)
SpinFrame.Size = UDim2.new(0, 160, 0, 120)
SpinFrame.Position = UDim2.new(0.1, 320, 0.2, 0)
SpinFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
SpinFrame.Visible = false
SpinFrame.Active = true
SpinFrame.Draggable = true
Round(SpinFrame, 10)

local SpinBorder = Instance.new("Frame", SpinFrame)
SpinBorder.Size = UDim2.new(1, 2, 1, 2)
SpinBorder.Position = UDim2.new(0, -1, 0, -1)
SpinBorder.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
SpinBorder.ZIndex = 0
Round(SpinBorder, 10)

local SpinTitle = Instance.new("TextLabel", SpinFrame)
SpinTitle.Size = UDim2.new(1, 0, 0, 25)
SpinTitle.Text = "SPIN SETTINGS 🎯"
SpinTitle.TextColor3 = Color3.new(1,1,1)
SpinTitle.BackgroundTransparency = 1
SpinTitle.Font = Enum.Font.GothamBold
SpinTitle.TextSize = 11

local SpeedBox = Instance.new("TextBox", SpinFrame)
SpeedBox.Size = UDim2.new(0.85, 0, 0, 30)
SpeedBox.Position = UDim2.new(0.075, 0, 0.25, 0)
SpeedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SpeedBox.TextColor3 = Color3.new(1,1,1)
SpeedBox.Text = "700"
Round(SpeedBox, 6)
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.TextSize = 12

local SpinToggle = Instance.new("TextButton", SpinFrame)
SpinToggle.Size = UDim2.new(0.85, 0, 0, 35)
SpinToggle.Position = UDim2.new(0.075, 0, 0.58, 0)
SpinToggle.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
SpinToggle.Text = "SPIN: OFF"
SpinToggle.TextColor3 = Color3.new(1,1,1)
Round(SpinToggle, 6)
SpinToggle.Font = Enum.Font.GothamBold
SpinToggle.TextSize = 12

local SpBtn = Instance.new("TextButton", Header)
SpBtn.Position = UDim2.new(0.73, 0, 0.2, 0)
SpBtn.Size = UDim2.new(0, 30, 0, 30)
SpBtn.Text = "SP"
SpBtn.BackgroundColor3 = Color3.fromRGB(100, 60, 180)
SpBtn.TextColor3 = Color3.new(1, 1, 1)
Round(SpBtn, 8)
SpBtn.ZIndex = 10
SpBtn.Font = Enum.Font.GothamBold
SpBtn.TextSize = 12

local MiniBtn = Instance.new("TextButton", Header)
MiniBtn.Position = UDim2.new(0.85, 0, 0.2, 0)
MiniBtn.Size = UDim2.new(0, 30, 0, 30)
MiniBtn.Text = "−"
MiniBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
MiniBtn.TextColor3 = Color3.new(1, 1, 1)
Round(MiniBtn, 8)
MiniBtn.ZIndex = 10

local Content = Instance.new("Frame", MainFrame)
Content.Size = UDim2.new(1, 0, 1, -45)
Content.Position = UDim2.new(0, 0, 0, 45)
Content.BackgroundTransparency = 1

local SearchBox = Instance.new("TextBox", Content)
SearchBox.Position = UDim2.new(0.03, 0, 0, 10)
SearchBox.Size = UDim2.new(0.4, 0, 0, 35)
SearchBox.PlaceholderText = "Search..."
SearchBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SearchBox.TextColor3 = Color3.new(1, 1, 1)
Round(SearchBox, 8)

local GodBtn = Instance.new("TextButton", Content)
GodBtn.Position = UDim2.new(0.45, 0, 0, 10)
GodBtn.Size = UDim2.new(0.25, 0, 0, 35)
GodBtn.Text = "GOD OFF"
GodBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
GodBtn.TextColor3 = Color3.new(1, 1, 1)
Round(GodBtn, 8)
GodBtn.Font = Enum.Font.GothamBold
GodBtn.TextSize = 10

local AnimBtn = Instance.new("TextButton", Content)
AnimBtn.Position = UDim2.new(0.72, 0, 0, 10)
AnimBtn.Size = UDim2.new(0.25, 0, 0, 35)
AnimBtn.Text = "ANIM OFF"
AnimBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
AnimBtn.TextColor3 = Color3.new(1, 1, 1)
Round(AnimBtn, 8)
AnimBtn.Font = Enum.Font.GothamBold
AnimBtn.TextSize = 10

local Holder = Instance.new("ScrollingFrame", Content)
Holder.Position = UDim2.new(0.03, 0, 0, 55)
Holder.Size = UDim2.new(0.94, 0, 0.8, 0)
Holder.BackgroundTransparency = 1
Holder.ScrollBarThickness = 2
Holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
local UIListLayout = Instance.new("UIListLayout", Holder)
UIListLayout.Padding = UDim.new(0, 8)

local function applyGodMode()
    if not godModeActive then return end
    local char = Player.Character or Player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    hum.MaxHealth = math.huge
    hum.Health = math.huge
    
    hum:GetPropertyChangedSignal("Health"):Connect(function()
        if godModeActive and hum.Health < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        end
    end)
end

GodBtn.MouseButton1Click:Connect(function()
    godModeActive = not godModeActive
    GodBtn.Text = godModeActive and "GOD ON" or "GOD OFF"
    GodBtn.BackgroundColor3 = godModeActive and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(50, 50, 60)
    if godModeActive then applyGodMode() else
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.MaxHealth = 100
            Player.Character.Humanoid.Health = 100
        end
    end
end)

local function updateFilter()
    local q = SearchBox.Text:lower()
    for _, item in pairs(Holder:GetChildren()) do
        if item:IsA("Frame") then
            local pName = item.Name:lower()
            local pDisplay = item:FindFirstChild("DN") and item.DN.Text:lower() or ""
            if q == "" then item.Visible = true else
                local matchName = pName:sub(1, #q) == q
                local matchDisplay = pDisplay:sub(1, #q) == q
                item.Visible = (matchName or matchDisplay)
            end
        end
    end
end
SearchBox:GetPropertyChangedSignal("Text"):Connect(updateFilter)

local function ResetButtons(btnType)
    for _, frame in pairs(Holder:GetChildren()) do
        if frame:IsA("Frame") then
            local target = frame:FindFirstChild(btnType)
            if target then target.BackgroundColor3 = Color3.fromRGB(45, 45, 55) end
        end
    end
end

local function createPlayerButton(plr)
    if plr == Player then return end
    local container = Instance.new("Frame", Holder)
    container.Name = plr.Name
    container.Size = UDim2.new(1, -5, 0, 60)
    container.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Round(container, 10)
    
    local nameLbl = Instance.new("TextLabel", container)
    nameLbl.Name = "DN"
    nameLbl.Size = UDim2.new(0.4, 0, 0.4, 0)
    nameLbl.Position = UDim2.new(0.05, 0, 0.15, 0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = plr.DisplayName
    nameLbl.TextColor3 = Color3.new(1, 1, 1)
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextSize = 10
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local userLbl = Instance.new("TextLabel", container)
    userLbl.Size = UDim2.new(0.4, 0, 0.3, 0)
    userLbl.Position = UDim2.new(0.05, 0, 0.55, 0)
    userLbl.BackgroundTransparency = 1
    userLbl.Text = "@"..plr.Name
    userLbl.TextColor3 = Color3.fromRGB(140, 140, 150)
    userLbl.Font = Enum.Font.Gotham
    userLbl.TextSize = 8
    userLbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local tp = Instance.new("TextButton", container)
    tp.Name = "TP_Btn"
    tp.Size = UDim2.new(0, 45, 0, 30)
    tp.Position = UDim2.new(0.5, 0, 0.25, 0)
    tp.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
    tp.Text = "TP"
    tp.TextColor3 = Color3.new(1,1,1)
    Round(tp, 6)
    
    local vw = Instance.new("TextButton", container)
    vw.Name = "VW_Btn"
    vw.Size = UDim2.new(0, 45, 0, 30)
    vw.Position = UDim2.new(0.66, 0, 0.25, 0)
    vw.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    vw.Text = "VW"
    vw.TextColor3 = Color3.new(1,1,1)
    Round(vw, 6)
    
    local lp = Instance.new("TextButton", container)
    lp.Name = "LP_Btn"
    lp.Size = UDim2.new(0, 45, 0, 30)
    lp.Position = UDim2.new(0.82, 0, 0.25, 0)
    lp.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    lp.Text = "LP"
    lp.TextColor3 = Color3.new(1,1,1)
    Round(lp, 6)

    vw.MouseButton1Click:Connect(function()
        if Camera.CameraSubject == (plr.Character and plr.Character:FindFirstChild("Humanoid")) then 
            Camera.CameraSubject = Player.Character:FindFirstChild("Humanoid")
            vw.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        else 
            ResetButtons("VW_Btn")
            if plr.Character and plr.Character:FindFirstChild("Humanoid") then 
                Camera.CameraSubject = plr.Character.Humanoid
                vw.BackgroundColor3 = Color3.fromRGB(50, 100, 200) 
            end 
        end
    end)
    
    lp.MouseButton1Click:Connect(function()
        if currentLoopTarget == plr.Name then 
            currentLoopTarget = ""
            lp.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        else 
            ResetButtons("LP_Btn")
            currentLoopTarget = plr.Name
            lp.BackgroundColor3 = Color3.fromRGB(50, 100, 200) 
        end
    end)
    
    tp.MouseButton1Click:Connect(function() 
        if plr.Character then Player.Character:PivotTo(plr.Character:GetPivot()) end 
    end)
end

local function refreshList()
    for _, child in pairs(Holder:GetChildren()) do if child:IsA("Frame") then child:Destroy() end end
    for _, p in pairs(Players:GetPlayers()) do createPlayerButton(p) end
    updateFilter()
end

Players.PlayerAdded:Connect(function() task.wait(1); refreshList() end)
Players.PlayerRemoving:Connect(function() task.wait(1); refreshList() end)
refreshList()

local spinning = false
SpinToggle.MouseButton1Click:Connect(function()
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    spinning = not spinning
    if spinning then
        local av = Instance.new("BodyAngularVelocity", hrp)
        av.Name = "AbilGhostSpin"
        av.MaxTorque = Vector3.new(0, math.huge, 0)
        av.AngularVelocity = Vector3.new(0, tonumber(SpeedBox.Text) or 700, 0)
        av.P = 1500
        SpinToggle.Text = "SPIN: ON"
        SpinToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 120)
    else
        if hrp:FindFirstChild("AbilGhostSpin") then hrp.AbilGhostSpin:Destroy() end
        SpinToggle.Text = "SPIN: OFF"
        SpinToggle.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
    end
end)

SpBtn.MouseButton1Click:Connect(function()
    spinGuiOpen = not spinGuiOpen
    SpinFrame.Visible = spinGuiOpen
    SpBtn.BackgroundColor3 = spinGuiOpen and Color3.fromRGB(50, 100, 200) or Color3.fromRGB(100, 60, 180)
end)

task.spawn(function()
    while true do
        if currentLoopTarget ~= "" then
            local targetPlr = Players:FindFirstChild(currentLoopTarget)
            if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character:PivotTo(targetPlr.Character.HumanoidRootPart.CFrame)
            else 
                currentLoopTarget = "" 
            end
        end
        task.wait(0.1)
    end
end)

AnimBtn.MouseButton1Click:Connect(function()
    animActive = not animActive
    AnimBtn.Text = animActive and "KAYANG ON" or "ANIM OFF"
    AnimBtn.BackgroundColor3 = animActive and Color3.fromRGB(0, 170, 120) or Color3.fromRGB(50, 50, 60)
    if not animActive and Player.Character and Player.Character:FindFirstChild("Humanoid") then 
        Player.Character.Humanoid.Health = 0 
    end
    if animActive and Player.Character then 
        local anim = Player.Character:WaitForChild("Animate", 10)
        if anim then 
            anim.walk.WalkAnim.AnimationId = "rbxassetid://88508412373927"
            anim.run.RunAnim.AnimationId = "rbxassetid://88508412373927" 
        end
    end
end)

Player.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if godModeActive then applyGodMode() end
    if animActive then 
        local anim = char:WaitForChild("Animate", 10)
        if anim then 
            anim.walk.WalkAnim.AnimationId = "rbxassetid://88508412373927"
            anim.run.RunAnim.AnimationId = "rbxassetid://88508412373927" 
        end
    end
end)

MiniBtn.MouseButton1Click:Connect(function()
    clickCount = clickCount + 1
    task.delay(0.5, function() clickCount = 0 end)
    if clickCount == 3 then
        isMainMinimised = true
        MainFrame:TweenSize(UDim2.new(0, 310, 0, 110), "Out", "Quad", 0.3, true)
        Content.Visible = true
        SearchBox.Visible = false
        AnimBtn.Visible = false
        GodBtn.Visible = false
        TitleLabel.Text = "GHOST SLIM🎯"
        SubLabel.Visible = false
        Holder.Position = UDim2.new(0.03, 0, 0, 5)
        Holder.Size = UDim2.new(0.94, 0, 0.9, 0)
        MiniBtn.Text = "≡"
    elseif clickCount == 1 then
        isMainMinimised = not isMainMinimised
        MainFrame:TweenSize(isMainMinimised and UDim2.new(0, 310, 0, 45) or UDim2.new(0, 310, 0, 380), "Out", "Quad", 0.3, true)
        Content.Visible = not isMainMinimised
        SearchBox.Visible = true
        AnimBtn.Visible = true
        GodBtn.Visible = true
        TitleLabel.Text = "GHOST TP🎯"
        SubLabel.Visible = not isMainMinimised
        Holder.Position = UDim2.new(0.03, 0, 0, 55)
        Holder.Size = UDim2.new(0.94, 0, 0.8, 0)
        MiniBtn.Text = isMainMinimised and "+" or "−"
    end
end)
