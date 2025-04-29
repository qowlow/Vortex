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

-- Create Tabs with Emojis in Titles and No Icons
local HomeTab = Window:AddTab({ Title = "🏠 Home", Icon = "" })
local FarmTab = Window:AddTab({ Title = "🌾 Farm", Icon = "" })
local HatchTab = Window:AddTab({ Title = "🥚 Hatch", Icon = "" })
local TeleportTab = Window:AddTab({ Title = "🚀 Teleport", Icon = "" })
local SettingsTab = Window:AddTab({ Title = "⚙️ Settings", Icon = "" })

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
    Values = {
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
    Default = "Common Egg"
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

TeleportTab:AddButton({
    Title = "Unlock All Islands",
    Description = "Unlocks all islands in the game",
    Callback = function()
        -- Placeholder for unlock all islands functionality
    end
})

-- Settings Tab Components
SettingsTab:AddToggle("AutoRedeemCodesToggle", {
    Title = "Auto Redeem All Codes",
    Description = "Automatically redeems all available codes",
    Default = false
})

SettingsTab:AddToggle("DisableCurrencyPopupsToggle", {
    Title = "Disable Currency Popups",
    Description = "Disables on-screen currency popups to reduce clutter",
    Default = false
})

SettingsTab:AddToggle("DisableItemPopupsToggle", {
    Title = "Disable Item Popups",
    Description = "Disables on-screen item popups to reduce clutter",
    Default = false
})

SettingsTab:AddToggle("LowGraphicsModeToggle", {
    Title = "Enable Low Graphics Mode",
    Description = "Simplifies graphics to improve performance",
    Default = false
})

-- Show the Window
Window:SelectTab(1) -- Select the first tab by default
