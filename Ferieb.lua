local library = {}

function library.CreateNew()
    local window = {}
    local player = game.Players.LocalPlayer
    local plygui = player:WaitForChild("PlayerGui")
    
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")

    ScreenGui.Parent = plygui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Frame.Size = UDim2.new(0, 300, 0, 300)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -150)
    Frame.Active = true
    Frame.Draggable = true
    
    UICorner.Parent = Frame
    UIStroke.Parent = Frame

    local tabFolder = Instance.new("Folder")
    tabFolder.Name = "newtabs"
    tabFolder.Parent = Frame

    function window:newtab()
        local tabbers = {}
        local TabFrame = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local UIListLayout = Instance.new("UIListLayout")

        TabFrame.Parent = Frame
        TabFrame.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
        TabFrame.Size = UDim2.new(0, 120, 0, 250)
        TabFrame.Position = UDim2.new(0, 10, 0, 10)

        UICorner.Parent = TabFrame

        UIListLayout.Parent = TabFrame
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)

        function tabbers:newbut(text, callback)
            local TextButton = Instance.new("TextButton")
            local UICorner = Instance.new("UICorner")

            TextButton.Parent = TabFrame
            TextButton.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
            TextButton.Size = UDim2.new(1, 0, 0, 40)
            TextButton.Font = Enum.Font.SourceSans
            TextButton.Text = text
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextSize = 18

            UICorner.Parent = TextButton
            TextButton.MouseButton1Click:Connect(function()
                callback()
            end)
        end

        return tabbers
    end

    return window
end

return library
