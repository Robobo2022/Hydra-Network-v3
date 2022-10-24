if getgenv().Network then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "HydraNetwork",
        Text = "Hydra Network has already been executed in this game"
    })
    return
end

getgenv().Network = true

local games = ({
    [4483381587] = "baseplate.lua",
})[game.PlaceId]

if games then
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/Rework-Hydra/tree/main/Games/" .. games))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network does not support this game"
    })
end