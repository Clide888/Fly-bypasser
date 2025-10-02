-- PlatformStand Toggle GUI for Roblox Executor
-- Features: Draggable GUI with toggle button

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlatformStandGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 250, 0, 120)
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -60)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Add corner radius
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

-- Add shadow effect
local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 6, 1, 6)
shadow.Position = UDim2.new(0, -3, 0, -3)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.7
shadow.BorderSizePixel = 0
shadow.ZIndex = -1
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 10)
shadowCorner.Parent = shadow

-- Create title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

-- Fix bottom corners of title bar
local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 10)
titleFix.Position = UDim2.new(0, 0, 1, -10)
titleFix.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

-- Create title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -10, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Fly bypasser"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Create toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 200, 0, 40)
toggleButton.Position = UDim2.new(0.5, -100, 0, 55)
toggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
toggleButton.BorderSizePixel = 0
toggleButton.Text = "PlatformStand: OFF"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 16
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = toggleButton

-- State variable
local platformStandEnabled = false

-- Update character reference when respawning
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    platformStandEnabled = false
    humanoid.PlatformStand = false
    toggleButton.Text = "PlatformStand: OFF"
    toggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
end)

-- Toggle function
local function togglePlatformStand()
    platformStandEnabled = not platformStandEnabled
    
    if character and humanoid then
        humanoid.PlatformStand = platformStandEnabled
        
        if platformStandEnabled then
            toggleButton.Text = "PlatformStand: ON"
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
        else
            toggleButton.Text = "PlatformStand: OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        end
    end
end

-- Button click event
toggleButton.MouseButton1Click:Connect(togglePlatformStand)

-- Button hover effects
toggleButton.MouseEnter:Connect(function()
    if platformStandEnabled then
        toggleButton.BackgroundColor3 = Color3.fromRGB(60, 240, 60)
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(240, 60, 60)
    end
end)

toggleButton.MouseLeave:Connect(function()
    if platformStandEnabled then
        toggleButton.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    end
end)

-- Parent to PlayerGui
screenGui.Parent = player:WaitForChild("PlayerGui")

print("PlatformStand GUI loaded successfully!")