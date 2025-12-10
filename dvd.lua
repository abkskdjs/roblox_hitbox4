local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Settings = {
    HitboxSize = 5,
    Transparency = 0.5,
    Enabled = false
}

local Hitboxes = {}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HitboxMenu"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 200)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "Hitbox Menu"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Active = true
Title.Parent = MainFrame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Position = UDim2.new(1, -25, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Text = "_"
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 14
MinimizeButton.Parent = MainFrame

local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -20, 1, -40)
Container.Position = UDim2.new(0, 10, 0, 35)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local HitboxLabel = Instance.new("TextLabel")
HitboxLabel.Name = "HitboxLabel"
HitboxLabel.Size = UDim2.new(1, 0, 0, 20)
HitboxLabel.Position = UDim2.new(0, 0, 0, 0)
HitboxLabel.BackgroundTransparency = 1
HitboxLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
HitboxLabel.Text = "Size: " .. Settings.HitboxSize
HitboxLabel.Font = Enum.Font.Gotham
HitboxLabel.TextSize = 12
HitboxLabel.TextXAlignment = Enum.TextXAlignment.Left
HitboxLabel.Parent = Container

local HitboxSlider = Instance.new("Frame")
HitboxSlider.Name = "HitboxSlider"
HitboxSlider.Size = UDim2.new(1, 0, 0, 15)
HitboxSlider.Position = UDim2.new(0, 0, 0, 20)
HitboxSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
HitboxSlider.BorderSizePixel = 0
HitboxSlider.Parent = Container

local HitboxFill = Instance.new("Frame")
HitboxFill.Name = "HitboxFill"
HitboxFill.Size = UDim2.new((Settings.HitboxSize - 1) / 19, 0, 1, 0)
HitboxFill.Position = UDim2.new(0, 0, 0, 0)
HitboxFill.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
HitboxFill.BorderSizePixel = 0
HitboxFill.Parent = HitboxSlider

local TransparencyLabel = Instance.new("TextLabel")
TransparencyLabel.Name = "TransparencyLabel"
TransparencyLabel.Size = UDim2.new(1, 0, 0, 20)
TransparencyLabel.Position = UDim2.new(0, 0, 0, 45)
TransparencyLabel.BackgroundTransparency = 1
TransparencyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TransparencyLabel.Text = "Transparency: " .. math.floor(Settings.Transparency * 10)
TransparencyLabel.Font = Enum.Font.Gotham
TransparencyLabel.TextSize = 12
TransparencyLabel.TextXAlignment = Enum.TextXAlignment.Left
TransparencyLabel.Parent = Container

local TransparencySlider = Instance.new("Frame")
TransparencySlider.Name = "TransparencySlider"
TransparencySlider.Size = UDim2.new(1, 0, 0, 15)
TransparencySlider.Position = UDim2.new(0, 0, 0, 65)
TransparencySlider.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
TransparencySlider.BorderSizePixel = 0
TransparencySlider.Parent = Container

local TransparencyFill = Instance.new("Frame")
TransparencyFill.Name = "TransparencyFill"
TransparencyFill.Size = UDim2.new(Settings.Transparency, 0, 1, 0)
TransparencyFill.Position = UDim2.new(0, 0, 0, 0)
TransparencyFill.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
TransparencyFill.BorderSizePixel = 0
TransparencyFill.Parent = TransparencySlider

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Size = UDim2.new(1, 0, 0, 20)
ToggleLabel.Position = UDim2.new(0, 0, 0, 90)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ToggleLabel.Text = "Enabled: OFF"
ToggleLabel.Font = Enum.Font.Gotham
ToggleLabel.TextSize = 12
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
ToggleLabel.Parent = Container

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 40, 0, 20)
ToggleButton.Position = UDim2.new(1, -40, 0, 90)
ToggleButton.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "OFF"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 10
ToggleButton.Parent = Container

local MinimizedFrame = Instance.new("Frame")
MinimizedFrame.Name = "MinimizedFrame"
MinimizedFrame.Size = UDim2.new(0, 40, 0, 40)
MinimizedFrame.Position = UDim2.new(0, 10, 0, 10)
MinimizedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Active = true
MinimizedFrame.Draggable = true
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui

local MinimizedTitle = Instance.new("TextLabel")
MinimizedTitle.Name = "MinimizedTitle"
MinimizedTitle.Size = UDim2.new(1, 0, 0, 40)
MinimizedTitle.Position = UDim2.new(0, 0, 0, 0)
MinimizedTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MinimizedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizedTitle.Text = "⚙"
MinimizedTitle.Font = Enum.Font.GothamBold
MinimizedTitle.TextSize = 18
MinimizedTitle.Active = true
MinimizedTitle.Parent = MinimizedFrame

local function getTeamColor(player)
    if player.Team then
        local teamName = player.Team.Name:lower()
        if teamName:find("ct") or teamName:find("swat") or teamName:find("counter") or teamName:find("blue") then
            return Color3.fromRGB(0, 120, 215)
        elseif teamName:find("t") or teamName:find("terror") or teamName:find("red") then
            return Color3.fromRGB(255, 120, 0)
        end
    end
    return Color3.fromRGB(0, 200, 100)
end

local function updateHitboxSlider(value)
    local normalized = (value - 1) / 19
    HitboxFill.Size = UDim2.new(normalized, 0, 1, 0)
    HitboxLabel.Text = "Size: " .. value
    Settings.HitboxSize = value
end

local function updateTransparencySlider(value)
    local normalized = value / 10
    TransparencyFill.Size = UDim2.new(normalized, 0, 1, 0)
    TransparencyLabel.Text = "Transparency: " .. value
    Settings.Transparency = normalized
end

local function setupDragging(frame, dragHandle)
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
    
    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

setupDragging(MainFrame, Title)
setupDragging(MinimizedFrame, MinimizedTitle)

local function setupSlider(slider, minValue, maxValue, callback)
    local dragging = false
    local isTransparency = (maxValue == 10)
    
    local function updateFromMouse()
        if not dragging then return end
        
        local absolutePosition = slider.AbsolutePosition.X
        local absoluteSize = slider.AbsoluteSize.X
        local mouseX = UserInputService:GetMouseLocation().X
        
        local relative = (mouseX - absolutePosition) / absoluteSize
        relative = math.clamp(relative, 0, 1)
        
        local value
        if isTransparency then
            value = math.floor(relative * maxValue)
        else
            value = math.floor(relative * (maxValue - minValue)) + minValue
        end
        
        callback(value)
        
        if Settings.Enabled then
            for player, hitbox in pairs(Hitboxes) do
                if hitbox and hitbox.Parent then
                    local baseWidth = 4
                    local baseHeight = 6
                    local heightMultiplier = Settings.HitboxSize * 0.5
                    local widthMultiplier = Settings.HitboxSize * 0.3
                    
                    hitbox.Size = Vector3.new(
                        baseWidth + widthMultiplier,
                        baseHeight + heightMultiplier,
                        baseWidth + widthMultiplier
                    )
                    hitbox.Transparency = Settings.Transparency
                end
            end
        end
    end
    
    slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateFromMouse()
        end
    end)
    
    slider.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            updateFromMouse()
        end
    end)
end

local function createHitbox(player)
    if not player.Character then return end
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    if Hitboxes[player] then
        Hitboxes[player]:Destroy()
        Hitboxes[player] = nil
    end
    
    local hitbox = Instance.new("BoxHandleAdornment")
    hitbox.Name = "PlayerHitbox"
    hitbox.Adornee = humanoidRootPart
    hitbox.AlwaysOnTop = true
    hitbox.ZIndex = 1
    
    local baseWidth = 4
    local baseHeight = 6
    local heightMultiplier = Settings.HitboxSize * 0.5
    local widthMultiplier = Settings.HitboxSize * 0.3
    
    hitbox.Size = Vector3.new(
        baseWidth + widthMultiplier,
        baseHeight + heightMultiplier,
        baseWidth + widthMultiplier
    )
    
    hitbox.Transparency = Settings.Transparency
    hitbox.Color3 = getTeamColor(player)
    
    hitbox.Parent = humanoidRootPart
    Hitboxes[player] = hitbox
    
    player.CharacterAdded:Connect(function()
        wait(0.5)
        if Settings.Enabled then
            createHitbox(player)
        end
    end)
end

local function toggleHitboxes()
    Settings.Enabled = not Settings.Enabled
    
    if Settings.Enabled then
        ToggleLabel.Text = "Enabled: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 150, 40)
        ToggleButton.Text = "ON"
        
        for _, player in pairs(Players:GetPlayers()) do
            createHitbox(player)
        end
    else
        ToggleLabel.Text = "Enabled: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(150, 40, 40)
        ToggleButton.Text = "OFF"
        
        for player, hitbox in pairs(Hitboxes) do
            if hitbox then
                hitbox:Destroy()
            end
        end
        Hitboxes = {}
    end
end

setupSlider(HitboxSlider, 1, 20, updateHitboxSlider)
setupSlider(TransparencySlider, 0, 10, updateTransparencySlider)

ToggleButton.MouseButton1Click:Connect(toggleHitboxes)

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinimizedFrame.Visible = true
end)

MinimizedTitle.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MinimizedFrame.Visible = false
end)

Players.PlayerAdded:Connect(function(player)
    if Settings.Enabled then
        wait(0.5)
        createHitbox(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if Hitboxes[player] then
        Hitboxes[player]:Destroy()
        Hitboxes[player] = nil
    end
end)

RunService.Heartbeat:Connect(function()
    if Settings.Enabled then
        for player, hitbox in pairs(Hitboxes) do
            if hitbox and hitbox.Parent then
                local targetSize = Vector3.new(
                    4 + (Settings.HitboxSize * 0.3),
                    6 + (Settings.HitboxSize * 0.5),
                    4 + (Settings.HitboxSize * 0.3)
                )
                
                if (hitbox.Size - targetSize).Magnitude > 0.5 then
                    hitbox.Size = targetSize
                    hitbox.Transparency = Settings.Transparency
                    hitbox.Color3 = getTeamColor(player)
                end
            end
        end
    end
end)

local success = pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)

if not success then
    success = pcall(function()
        ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end)
end
