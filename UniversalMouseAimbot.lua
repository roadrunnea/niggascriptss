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
enableButton.Position = UDim2.new(0, 157, 0, 50)
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
    else
        traceEnabled = true
        print("Started tracing HumanoidRootPart.")
    end
end

-- Function to track the HumanoidRootPart of the character
local function trackHumanoidRootPart()
    local character = Player.Character or Player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    while traceEnabled do
        -- Update mouse position to follow HumanoidRootPart
        Mouse.Target = humanoidRootPart
        wait(0.1)
    end
end

-- Function to toggle the visibility of the GUI window
local function toggleWindow()
    screenGui.Enabled = not screenGui.Enabled
end

-- Button click listener for the "Enable" button
enableButton.MouseButton1Click:Connect(function()
    if buttonInputBox.Text ~= "" then
        targetKey = buttonInputBox.Text:upper()
        if targetKey then
            -- Toggle the tracing when the button is pressed and the key matches
            toggleTrace()
            if traceEnabled then
                trackHumanoidRootPart()
            end
        end
    end
end)

-- Key press listener
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    -- Check for Right Shift to toggle the window
    if input.KeyCode == Enum.KeyCode.RightShift then
        toggleWindow()
    end

    -- If the input matches the button key and Enable is active, start tracing
    if input.KeyCode.Name == targetKey then
        if isEnabled then
            toggleTrace()
        end
    end
end)
