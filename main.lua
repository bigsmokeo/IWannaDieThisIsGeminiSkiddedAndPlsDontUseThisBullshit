local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Ultimate Farmer Hub",
    Icon = "rbxassetid://4483345998",
    Author = "Gemini",
    Folder = "FarmerHubConfig"
})

-- Global Flags
getgenv().WinLoop = false
getgenv().AutoRebirth = false
getgenv().AutoHatch = false
getgenv().HellaClick = false
getgenv().TargetStage = "17"

-- Tabs
local FarmTab = Window:Tab({ Title = "Farming", Icon = "rbxassetid://4483345998" })
local EggTab = Window:Tab({ Title = "Eggs", Icon = "rbxassetid://4483345998" })
local SpamTab = Window:Tab({ Title = "Spammer", Icon = "rbxassetid://4483345998" })

-- FARMING TAB
FarmTab:Slider({
    Title = "Target Stage",
    Min = 1,
    Max = 18,
    Default = 17,
    Callback = function(val)
        getgenv().TargetStage = tostring(val)
    end
})

FarmTab:Toggle({
    Title = "Win Flooder",
    Default = false,
    Callback = function(state)
        getgenv().WinLoop = state
        if state then
            task.spawn(function()
                local LP = game:GetService("Players").LocalPlayer
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
    end
})

FarmTab:Toggle({
    Title = "Auto Rebirth",
    Default = false,
    Callback = function(state)
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
    end
})

-- EGGS TAB
EggTab:Toggle({
    Title = "Auto Remote Hatch",
    Default = false,
    Callback = function(state)
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
    end
})

-- SPAMMER TAB
SpamTab:Toggle({
    Title = "Hyper Mouse Spammer",
    Default = false,
    Callback = function(state)
        getgenv().HellaClick = state
        if state then
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
    end
})
