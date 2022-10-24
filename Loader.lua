if getgenv().Network then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "HydraNetwork",
        Text = "Hydra Network has already been executed in this game"
    })
    return
end

getgenv().Network = true

local games = ({
    [6847090259] = "bulkedup.lua",
})[game.PlaceId]

if games then
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/Rework-Hydra/main/Games/" .. games))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network does not support this game"
    })
end