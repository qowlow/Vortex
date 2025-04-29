-- Vortex Hub for Bubble Gum Simulator Infinity
-- Full Script with GUI and Functional Tabs

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Vortex Hub",
    LoadingTitle = "Vortex Hub",
    LoadingSubtitle = "by qowlow",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "VortexHub",
        FileName = "VortexConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = false
    },
    KeySystem = false,
})

-- Tabs
local HomeTab = Window:CreateTab("Home", nil)
local FarmTab = Window:CreateTab("Farm", nil)
local HatchTab = Window:CreateTab("Hatch", nil)
local TeleportTab = Window:CreateTab("Teleport", nil)
local SettingsTab = Window:CreateTab("Settings", nil)

-- Farm Tab
local autoBubble = false
FarmTab:CreateToggle({
    Name = "Auto Bubble",
    CurrentValue = false,
    Callback = function(val)
        autoBubble = val
        while autoBubble do
            game:GetService("ReplicatedStorage").Remotes.BlowBubble:FireServer()
            task.wait(0.1)
        end
    end,
})

local autoSell = false
FarmTab:CreateToggle({
    Name = "Auto Sell",
    CurrentValue = false,
    Callback = function(val)
        autoSell = val
        while autoSell do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Sell.CFrame
            task.wait(5)
        end
    end,
})

local autoCollect = false
FarmTab:CreateToggle({
    Name = "Auto Collect Gems/Coins",
    CurrentValue = false,
    Callback = function(val)
        autoCollect = val
        while autoCollect do
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") and v.Parent:IsA("BasePart") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                end
            end
            task.wait(1)
        end
    end,
})

-- Hatch Tab
local selectedEgg = "Common Egg"
HatchTab:CreateDropdown({
    Name = "Select Egg to Hatch",
    Options = {
        "Common Egg",
        "Spotted Egg",
        "Iceshard Egg",
        "Spikey Egg",
        "Magma Egg",
        "Crystal Egg",
        "Lunar Egg",
        "Void Egg",
        "Hell Egg",
        "Nightmare Egg",
        "Rainbow Egg",
        "Infinity Egg"
    },
    CurrentOption = "Common Egg",
    Callback = function(option)
        selectedEgg = option
    end,
})

local autoHatch = false
HatchTab:CreateToggle({
    Name = "Auto Hatch",
    CurrentValue = false,
    Callback = function(val)
        autoHatch = val
        while autoHatch do
            game:GetService("ReplicatedStorage").Remotes.HatchEgg:InvokeServer(selectedEgg, 1)
            task.wait(1.5)
        end
    end,
})

HatchTab:CreateToggle({
    Name = "Skip Animation",
    CurrentValue = false,
    Callback = function(val)
        game:GetService("ReplicatedStorage").Remotes.ToggleAnimation:FireServer(val)
    end,
})

-- Teleport Tab
TeleportTab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 5, 0))
    end,
})

TeleportTab:CreateButton({
    Name = "Teleport to Hatching Zone",
    Callback = function()
        local zone = workspace:FindFirstChild("HatchingZone") or workspace:FindFirstChild("EggZone")
        if zone then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = zone.CFrame + Vector3.new(0, 5, 0)
        else
            warn("Hatching zone not found")
        end
    end,
})

TeleportTab:CreateButton({
    Name = "Unlock All Islands",
    Callback = function()
        for _, v in pairs(workspace.Islands:GetChildren()) do
            if v:IsA("Part") and v:FindFirstChild("Touched") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                task.wait(0.1)
            end
        end
    end,
})

-- Settings Tab
SettingsTab:CreateButton({
    Name = "Auto Redeem All Codes",
    Callback = function()
        local codes = {
            "Release", "FreePet", "Update1", "FreeCoins", "LuckyDay",
            "UltraLuck", "ShinyTime", "Boosts", "SuperGum", "MegaHatch"
        }
        for _, code in ipairs(codes) do
            game:GetService("ReplicatedStorage").Remotes.RedeemCode:InvokeServer(code)
            task.wait(0.1)
        end
    end,
})

SettingsTab:CreateToggle({
    Name = "Disable Currency Popups",
    CurrentValue = false,
    Callback = function(state)
        local popups = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("CurrencyPopups")
        if popups then
            popups.Enabled = not state
        end
    end,
})

SettingsTab:CreateToggle({
    Name = "Disable Item Popups",
    CurrentValue = false,
    Callback = function(state)
        local gui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        local popups = gui:FindFirstChild("ItemPopups") or gui:FindFirstChild("HatchPopups")
        if popups then
            popups.Enabled = not state
        end
    end,
})

SettingsTab:CreateToggle({
    Name = "Enable Low Graphics Mode",
    CurrentValue = false,
    Callback = function(state)
        if state then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                    obj.Enabled = false
                elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                    obj.Enabled = false
                end
            end
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").FogEnd = 100000
        end
    end,
})
