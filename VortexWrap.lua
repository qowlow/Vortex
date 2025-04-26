-- // VORTEX WRAP | GUI by WRAP.devs (Rayfield Edition)

-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "VORTEX WRAP | Bubble Gum Infinity",
    LoadingTitle = "VORTEX WRAP",
    LoadingSubtitle = "Made by WRAP.devs",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "VortexWrap",
        FileName = "Settings"
    }
})

-- Tabs
local AutoFarmTab = Window:CreateTab("🏭 AutoFarm")
local EggTab = Window:CreateTab("🥚 Eggs")
local ShopTab = Window:CreateTab("🛒 Shop")
local PlayerTab = Window:CreateTab("🙋 Player")
local MiscTab = Window:CreateTab("🧪 Misc")

-- AutoFarm
local autoBlow = false
local autoSell = false

AutoFarmTab:CreateToggle({
    Name = "Auto Blow Bubble",
    CurrentValue = false,
    Callback = function(Value)
        autoBlow = Value
    end,
})

AutoFarmTab:CreateToggle({
    Name = "Auto Sell Bubble",
    CurrentValue = false,
    Callback = function(Value)
        autoSell = Value
    end,
})

-- Eggs
local autoHatch = false

EggTab:CreateToggle({
    Name = "Auto Hatch Common Egg",
    CurrentValue = false,
    Callback = function(Value)
        autoHatch = Value
    end,
})

-- Shop (placeholder)
ShopTab:CreateButton({
    Name = "Auto Buy Best Gum",
    Callback = function()
        print("Buying gum soon!")
    end,
})

-- Player
PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

-- Misc
MiscTab:CreateButton({
    Name = "Redeem All Codes",
    Callback = function()
        local codes = {"FREE", "RELEASE", "UPDATE1"}
        for _, code in pairs(codes) do
            pcall(function()
                game:GetService("ReplicatedStorage").Functions.RedeemCode:InvokeServer(code)
            end)
            task.wait(0.3)
        end
    end,
})

MiscTab:CreateParagraph({
    Title = "WRAP.devs",
    Content = "Thanks for using VORTEX WRAP!"
})

-- Background tasks
task.spawn(function()
    while task.wait(0.2) do
        if autoBlow then
            pcall(function()
                game:GetService("ReplicatedStorage").Events.BubbleEvent:FireServer("BlowBubble")
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(1.2) do
        if autoSell then
            pcall(function()
                game:GetService("ReplicatedStorage").Events.BubbleEvent:FireServer("SellBubble")
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(3) do
        if autoHatch then
            pcall(function()
                game:GetService("ReplicatedStorage").Functions.Eggs.Hatch:InvokeServer("CommonEgg", 1)
            end)
        end
    end
end)

Rayfield:Notify({
    Title = "VORTEX WRAP Loaded!",
    Content = "Fully operational GUI by WRAP.devs ✅",
    Duration = 6,
    Actions = {
        Ignore = {
            Name = "Okay",
            Callback = function() end,
        },
    },
})
