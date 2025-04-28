-- VORTEX RAP LOADER
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local success, err = pcall(function()
    local loadFunc = loadstring or load
    local httpGet = game.HttpGet
    local g = game

    -- Load VORTEX RAP script
    loadFunc(httpGet(g, "https://raw.githubusercontent.com/qowlow/Vortex/main/RAP"))()
end)

if not success then
    warn("[VORTEX RAP] Failed to load script:", err)
end
