local Library = {}

-- Themes
local Themes = {
    DarkTheme = {
        Background = Color3.fromRGB(30, 30, 30),
        Tab = Color3.fromRGB(50, 50, 50),
        Button = Color3.fromRGB(70, 70, 70),
        Text = Color3.fromRGB(255, 255, 255)
    },
    LightTheme = {
        Background = Color3.fromRGB(245, 245, 245),
        Tab = Color3.fromRGB(200, 200, 200),
        Button = Color3.fromRGB(220, 220, 220),
        Text = Color3.fromRGB(20, 20, 20)
    }
}

function Library.CreateLib(title, theme)
    local Theme = Themes[theme] or Themes.DarkTheme
    local Window = {}
    local Player = game.Players.LocalPlayer
    local PlayerGui = Player:WaitForChild("PlayerGui")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = PlayerGui
    ScreenGui.Name = title
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Theme.Background
    MainFrame.Active = true
    MainFrame.Draggable = true

    local TabsFolder = Instance.new("Folder")
    TabsFolder.Name = "Tabs"
    TabsFolder.Parent = MainFrame

    function Window:NewTab(name)
        local Tab = {}
        local TabFrame = Instance.new("Frame")
        TabFrame.Parent = TabsFolder
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.BackgroundColor3 = Theme.Tab
        TabFrame.Visible = true
        TabFrame.Name = name

        local Layout = Instance.new("UIListLayout")
        Layout.Padding = UDim.new(0, 10)
        Layout.Parent = TabFrame

        function Tab:NewButton(text, info, callback)
            local Button = Instance.new("TextButton")
            Button.Parent = TabFrame
            Button.Size = UDim2.new(0, 380, 0, 40)
            Button.Text = text
            Button.BackgroundColor3 = Theme.Button
            Button.TextColor3 = Theme.Text
            Button.Font = Enum.Font.SourceSans
            Button.TextSize = 18
            Button.MouseButton1Click:Connect(function()
                callback()
            end)
        end

        return Tab
    end

    return Window
end

return Library
