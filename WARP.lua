-- Vortex Hub | Bubble Gum Simulator Infinity
-- Made by Vortex using Fluent UI Library

-- Load Fluent UI Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Create Main Window
local Window = Fluent:CreateWindow({
    Title = "Vortex Hub | Bubble Gum Simulator Infinity",
    SubTitle = "Made by Vortex",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create Tabs
local HomeTab = Window:AddTab({ Title = "Home", Icon = "rbxassetid://4483362458" })
local FarmTab = Window:AddTab({ Title = "Farm", Icon = "rbxassetid://4483362458" })
local HatchTab = Window:AddTab({ Title = "Hatch", Icon = "rbxassetid://4483362458" })
local TeleportTab = Window:AddTab({ Title = "Teleport", Icon = "rbxassetid://4483362458" })

-- Home Tab Components
HomeTab:AddParagraph({
    Title = "Information",
    Content = "" -- Empty content for just the title
})

HomeTab:AddParagraph({
    Title = "",
    Content = "Session Time: 00:08:29\nLua Memory Consumption: 46 MB"
})

HomeTab:AddParagraph({
    Title = "Credits",
    Content = "" -- Empty content for just the title
})

HomeTab:AddButton({
    Title = "TikTok: @vortex.wrap",
    Description = "Click to copy the TikTok link",
    Callback = function()
        -- Roblox doesn't support direct URL opening, so we'll notify the user with the link
        Fluent:Notify({
            Title = "TikTok Link",
            Content = "TikTok: https://www.tiktok.com/@vortex.wrap\nPlease copy the link to visit!",
            Duration = 5
        })
    end
})

-- Farm Tab Components
FarmTab:AddToggle("AutoBubbleToggle", {
    Title = "Auto Bubble",
    Description = "Automatically blows bubbles",
    Default = false
})

FarmTab:AddToggle("AutoSellToggle", {
    Title = "Auto Sell",
    Description = "Automatically sells bubbles",
    Default = false
})

FarmTab:AddToggle("AutoCollectToggle", {
    Title = "Auto Collect Gems/Coins",
    Description = "Automatically collects gems and coins",
    Default = false
})

-- Hatch Tab Components
HatchTab:AddDropdown("EggNameDropdown", {
    Title = "Select Egg to Hatch",
    Description = "Choose an egg for auto-hatching",
    Values = {"Basic Egg", "Spotted Egg", "Striped Egg", "Volcanic Egg", "Frost Egg", "Event Egg"},
    Default = "Basic Egg"
})

HatchTab:AddToggle("AutoHatchToggle", {
    Title = "Auto Hatch",
    Description = "Automatically hatches selected egg",
    Default = false
})

HatchTab:AddToggle("SkipAnimationToggle", {
    Title = "Skip Animation",
    Description = "Skips hatching animation",
    Default = false
})

-- Teleport Tab Components
TeleportTab:AddButton({
    Title = "Teleport to Spawn",
    Description = "Teleports to the spawn area",
    Callback = function()
        -- Placeholder for teleportation functionality
    end
})

TeleportTab:AddButton({
    Title = "Teleport to Hatching Zone",
    Description = "Teleports to the hatching zone",
    Callback = function()
        -- Placeholder for teleportation functionality
    end
})

-- Show the Window
Window:SelectTab(1) -- Select the first tab by default
