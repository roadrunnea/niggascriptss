-- made by roadrunnea pls dont skid
local UserInputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Variables for the GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 414, 0, 687)
frame.Position = UDim2.new(0.5, -207, 0.5, -343)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Draggable = true
frame.Parent = screenGui

local enableButton = Instance.new("TextButton")
enableButton.Size = UDim2.new(0, 100, 0, 50)
enableButton.Position = UDim2.new(1, -105, 0, 50) -- Aligning it to the right of the frame
enableButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
enableButton.Text = "Enable"
enableButton.TextColor3 = Color3.fromRGB(255, 255, 255)
enableButton.Parent = frame

local buttonInputBox = Instance.new("TextBox")
buttonInputBox.Size = UDim2.new(0, 100, 0, 30)
buttonInputBox.Position = UDim2.new(0, 157, 0, 120)
buttonInputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
buttonInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonInputBox.PlaceholderText = "Press key (e.g. Q)"
buttonInputBox.Parent = frame

local buttonText = Instance.new("TextLabel")
buttonText.Size = UDim2.new(0, 100, 0, 30)
buttonText.Position = UDim2.new(0, 40, 0, 120)
buttonText.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
buttonText.Text = "Button"
buttonText.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonText.Parent = frame

local isEnabled = false
local traceEnabled = false
local targetKey = ""

-- Function to start/stop tracing the HumanoidRootPart
local function toggleTrace()
    if traceEnabled then
        traceEnabled = false
        print("Stopped tracing HumanoidRootPart.")
    els
