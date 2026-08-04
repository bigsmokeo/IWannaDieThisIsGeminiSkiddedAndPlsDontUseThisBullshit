local CustomUI = {}

-- Global Farm State
getgenv().WinLoop = false
getgenv().AutoRebirth = false
getgenv().AutoHatch = false
getgenv().HellaClick = false
getgenv().TargetStage = "17"
getgenv().SpamKeybind = Enum.KeyCode.E

local LP = game:GetService("Players").LocalPlayer

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ShitsploitHub"
ScreenGui.Parent = game:GetService("CoreGui") or LP:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(0, 255, 150)
MainStroke.Parent = MainFrame

-- TITLE BAR
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundTransparency = 1
TitleBar.Parent = MainFrame

local TitleText = Instance.new("TextLabel")
TitleText.Text = "  Welcome to this shitsploit"
TitleText.Size = UDim2.new(0.7, 0, 1, 0)
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.BackgroundTransparency = 1
TitleText.Parent = TitleBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Text = "-"
MinimizeBtn.Size = UDim2.new(0, 30, 1, 0)
MinimizeBtn.Position = UDim2.new(1, -65, 0, 0)
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 18
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "X"
CloseBtn.Size = UDim2.new(0, 30, 1, 0)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = TitleBar

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    MainFrame.Size = minimized and UDim2.new(0, 520, 0, 35) or UDim2.new(0, 520, 0, 340)
end)

-- SIDEBAR (TABS)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, -85)
Sidebar.Position = UDim2.new(0, 0, 0, 35)
Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local TabList = Instance.new("UIListLayout")
TabList.Padding = UDim.new(0, 5)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Parent = Sidebar

-- CONTENT CONTAINER
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -150, 1, -45)
ContentFrame.Position = UDim2.new(0, 145, 0, 35)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- PROFILE BAR (Bottom Left)
local ProfileBar = Instance.new("Frame")
ProfileBar.Size = UDim2.new(0, 140, 0, 50)
ProfileBar.Position = UDim2.new(0, 0, 1, -50)
ProfileBar.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
ProfileBar.BorderSizePixel = 0
ProfileBar.Parent = MainFrame

local PFP = Instance.new("ImageLabel")
PFP.Size = UDim2.new(0, 36, 0, 36)
PFP.Position = UDim2.new(0, 7, 0.5, -18)
PFP.BackgroundTransparency = 1
PFP.Image = game:GetService("Players"):GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
PFP.Parent = ProfileBar

local PFPCorner = Instance.new("UICorner")
PFPCorner.CornerRadius = UDim.new(1, 0)
PFPCorner.Parent = PFP

local DispNameLabel = Instance.new("TextLabel")
DispNameLabel.Size = UDim2.new(1, -50, 0, 18)
DispNameLabel.Position = UDim2.new(0, 48, 0, 7)
DispNameLabel.Text = LP.DisplayName
DispNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DispNameLabel.Font = Enum.Font.GothamBold
DispNameLabel.TextSize = 11
DispNameLabel.TextXAlignment = Enum.TextXAlignment.Left
DispNameLabel.BackgroundTransparency = 1
DispNameLabel.Parent = ProfileBar

local UserLabel = Instance.new("TextLabel")
UserLabel.Size = UDim2.new(1, -50, 0, 14)
UserLabel.Position = UDim2.new(0, 48, 0, 25)
UserLabel.Text = "@" .. LP.Name
UserLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
UserLabel.Font = Enum.Font.Gotham
UserLabel.TextSize = 10
UserLabel.TextXAlignment = Enum.TextXAlignment.Left
UserLabel.BackgroundTransparency = 1
UserLabel.Parent = ProfileBar

-- SETTINGS CIRCLE BUTTON (Bottom Right - Green)
local SettingsBtn = Instance.new("TextButton")
SettingsBtn.Size = UDim2.new(0, 32, 0, 32)
SettingsBtn.Position = UDim2.new(1, -38, 1, -38)
SettingsBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
SettingsBtn.Text = "⚙️"
SettingsBtn.TextSize = 16
SettingsBtn.Parent = MainFrame

local SettingsCorner = Instance.new("UICorner")
SettingsCorner.CornerRadius = UDim.new(1, 0)
SettingsCorner.Parent = SettingsBtn

-- BINDS LIST WINDOW (Floating Left & Toggleable)
local BindsFrame = Instance.new("Frame")
BindsFrame.Size = UDim2.new(0, 160, 0, 120)
BindsFrame.Position = UDim2.new(0.5, -430, 0.5, -170)
BindsFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
BindsFrame.Active = true
BindsFrame.Draggable = true
BindsFrame.Visible = true -- Toggleable state
BindsFrame.Parent = ScreenGui

local BindsCorner = Instance.new("UICorner")
BindsCorner.CornerRadius = UDim.new(0, 8)
BindsCorner.Parent = BindsFrame

local BindsStroke = Instance.new("UIStroke")
BindsStroke.Thickness = 2
BindsStroke.Color = Color3.fromRGB(0, 255, 150)
BindsStroke.Parent = BindsFrame

local BindsTitle = Instance.new("TextLabel")
BindsTitle.Text = "binds list"
BindsTitle.Size = UDim2.new(1, 0, 0, 25)
BindsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BindsTitle.Font = Enum.Font.GothamBold
BindsTitle.TextSize = 12
BindsTitle.BackgroundTransparency = 1
BindsTitle.Parent = BindsFrame

local BindsLine = Instance.new("Frame")
BindsLine.Size = UDim2.new(1, -10, 0, 1)
BindsLine.Position = UDim2.new(0, 5, 0, 25)
BindsLine.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
BindsLine.Parent = BindsFrame

local BindsContainer = Instance.new("Frame")
BindsContainer.Size = UDim2.new(1, -10, 1, -35)
BindsContainer.Position = UDim2.new(0, 5, 0, 30)
BindsContainer.BackgroundTransparency = 1
BindsContainer.Parent = BindsFrame

local BindsList = Instance.new("UIListLayout")
BindsList.Padding = UDim.new(0, 4)
BindsList.Parent = BindsContainer

local BindItem = Instance.new("TextLabel")
BindItem.Size = UDim2.new(1, 0, 0, 18)
BindItem.Text = "Spammer - [ E ]"
BindItem.TextColor3 = Color3.fromRGB(200, 200, 200)
BindItem.Font = Enum.Font.Gotham
BindItem.TextSize = 11
BindItem.BackgroundTransparency = 1
BindItem.Parent = BindsContainer

-- TAB SWITCHING SYSTEM
local Tabs = {}
local function CreateTab(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -10, 0, 30)
    TabBtn.Position = UDim2.new(0, 5, 0, 0)
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextSize = 12
    TabBtn.Parent = Sidebar

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = TabBtn

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.Parent = ContentFrame

    local PageList = Instance.new("UIListLayout")
    PageList.Padding = UDim.new(0, 8)
    PageList.Parent = Page

    TabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.Page.Visible = false
            t.Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
        end
        Page.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    end)

    local tabObj = {Btn = TabBtn, Page = Page}
    table.insert(Tabs, tabObj)
    if #Tabs == 1 then
        Page.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    end
    return Page
end

-- TABS CREATION
local FarmPage = CreateTab("Farming")
local EggPage = CreateTab("Eggs")
local SpamPage = CreateTab("Spammer")
local MiscPage = CreateTab("Misc")
local SettingsPage = CreateTab("Settings")

SettingsBtn.MouseButton1Click:Connect(function()
    for _, t in pairs(Tabs) do
        t.Page.Visible = false
        t.Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    end
    SettingsPage.Visible = true
end)

-- UI BUILDERS
local function AddToggle(parent, text, default, callback)
    local state = default
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 35)
    Btn.BackgroundColor3 = state and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(30, 30, 40)
    Btn.Text = "  " .. text .. ": " .. (state and "ON" or "OFF")
    Btn.TextColor3 = state and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Btn.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.BackgroundColor3 = state and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(30, 30, 40)
        Btn.Text = "  " .. text .. ": " .. (state and "ON" or "OFF")
        Btn.TextColor3 = state and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        task.spawn(callback, state)
    end)
end

local function AddButton(parent, text, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 35)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Btn.Text = "  " .. text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Btn.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        task.spawn(callback)
    end)
end

-- ==========================================
-- HOOK UP FARMING LOGIC
-- ==========================================

AddToggle(FarmPage, "Win Flooder", false, function(state)
    getgenv().WinLoop = state
    if state then
        task.spawn(function()
            local SpawnPart = workspace:FindFirstChild("SpawnLocation", true)
            while getgenv().WinLoop do
                local stageStr = getgenv().TargetStage or "17"
                local WinPart = workspace.WinsStage:FindFirstChild(stageStr) and workspace.WinsStage[stageStr]:FindFirstChild("Wins") and workspace.WinsStage[stageStr].Wins:FindFirstChild("Part")
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if hrp and WinPart then
                    hrp.CFrame = WinPart.CFrame + Vector3.new(0, 1, 0)
                    firetouchinterest(hrp, WinPart, 0)
                    firetouchinterest(hrp, WinPart, 1)
                    task.wait(0.1)
                    if SpawnPart then hrp.CFrame = SpawnPart.CFrame + Vector3.new(0, 3, 0) end
                    task.wait(5)
                else
                    task.wait(0.5)
                end
            end
        end)
    end
end)

AddToggle(FarmPage, "Auto Rebirth", false, function(state)
    getgenv().AutoRebirth = state
    if state then
        task.spawn(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RebirthRemote = ReplicatedStorage:WaitForChild("Events"):FindFirstChild("Rebirth") or ReplicatedStorage.Events:FindFirstChild("RebirthSystem")
            while getgenv().AutoRebirth do
                if RebirthRemote then
                    if RebirthRemote:IsA("RemoteFunction") then
                        task.spawn(function() RebirthRemote:InvokeServer() end)
                    else
                        RebirthRemote:FireServer()
                    end
                end
                task.wait(0.2)
            end
        end)
    end
end)

AddToggle(EggPage, "Auto Remote Hatch", false, function(state)
    getgenv().AutoHatch = state
    if state then
        task.spawn(function()
            local Event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("EggHatch")
            while getgenv().AutoHatch do
                task.spawn(function() Event:InvokeServer("4", 1) end)
                task.wait(0.05)
            end
        end)
    end
end)

local function startSpammer()
    task.spawn(function()
        local UserInputService = game:GetService("UserInputService")
        local VIM = game:GetService("VirtualInputManager")
        while getgenv().HellaClick do
            local mousePos = UserInputService:GetMouseLocation()
            VIM:SendMouseButtonEvent(mousePos.X, mousePos.Y, 0, true, game, 0)
            task.wait(0.001)
            VIM:SendMouseButtonEvent(mousePos.X, mousePos.Y, 0, false, game, 0)
            task.wait(0.001)
        end
    end)
end

AddToggle(SpamPage, "Hyper Mouse Spammer", false, function(state)
    getgenv().HellaClick = state
    if state then startSpammer() end
end)

-- ==========================================
-- MISC TAB FEATURES
-- ==========================================

AddToggle(MiscPage, "WalkSpeed Boost (50)", false, function(state)
    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = state and 50 or 16
    end
end)

AddToggle(MiscPage, "JumpPower Boost (100)", false, function(state)
    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.JumpPower = state and 100 or 50
    end
end)

AddToggle(MiscPage, "Full Brightness", false, function(state)
    local Lighting = game:GetService("Lighting")
    if state then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)

AddButton(MiscPage, "Rejoin Server", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
end)

-- ==========================================
-- SETTINGS & ANONYMOUS MODE
-- ==========================================

AddToggle(SettingsPage, "Show Binds List Overlay", true, function(state)
    BindsFrame.Visible = state
end)

AddToggle(SettingsPage, "Anonymous / Streamer Mode", false, function(state)
    if state then
        DispNameLabel.Text = "Anonymous"
        UserLabel.Text = "@anonymous"
        PFP.Image = "rbxassetid://6077061988"
    else
        DispNameLabel.Text = LP.DisplayName
        UserLabel.Text = "@" .. LP.Name
        PFP.Image = game:GetService("Players"):GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end
end)

-- Color Customization Button
local ColorBtn = Instance.new("TextButton")
ColorBtn.Size = UDim2.new(1, -10, 0, 35)
ColorBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ColorBtn.Text = "  Change Theme Color (Pink/Green/Cyan)"
ColorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ColorBtn.TextXAlignment = Enum.TextXAlignment.Left
ColorBtn.Font = Enum.Font.GothamBold
ColorBtn.TextSize = 12
ColorBtn.Parent = SettingsPage

local ColorCorner = Instance.new("UICorner")
ColorCorner.CornerRadius = UDim.new(0, 6)
ColorCorner.Parent = ColorBtn

local colors = {
    Color3.fromRGB(0, 255, 150), -- Green
    Color3.fromRGB(255, 0, 150), -- Pink
    Color3.fromRGB(0, 200, 255)  -- Cyan
}
local colorIdx = 1

ColorBtn.MouseButton1Click:Connect(function()
    colorIdx = (colorIdx % #colors) + 1
    local newColor = colors[colorIdx]
    MainStroke.Color = newColor
    BindsStroke.Color = newColor
    BindsLine.BackgroundColor3 = newColor
    SettingsBtn.BackgroundColor3 = newColor
end)

-- Keybind listener
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == getgenv().SpamKeybind then
        getgenv().HellaClick = not getgenv().HellaClick
        BindItem.Text = "Spammer - [ " .. getgenv().SpamKeybind.Name .. " ] " .. (getgenv().HellaClick and "(ACTIVE)" or "")
        if getgenv().HellaClick then startSpammer() end
    end
end)
