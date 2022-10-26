if getgenv().Network then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network has already been executed in this game"
    })
    return
end

setclipboard("https://link-hub.net/488828/key-for-hydra-network")

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Key System Succes!",
    LoadingTitle = "Hydra network",
    LoadingSubtitle = "by hydra#8270",
    KeySystem = true,
    KeySettings = {
        Title = "Hydra Network",
        Subtitle = "Key System",
        Note = "Key link Copied in clipboard",
        Key = "test"
    }
})



Rayfield:Destroy()

getgenv().Network = true
local ownerId = game.CreatorId
game.Players.PlayerAdded:Connect(function(player)
    if player.UserId == ownerId then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Hydra Network",
            Text = "Owner joined! be careful with what you do."
        })
    end
end)

local games = ({
    [6847090259] = "bulkedup.lua",
    [155615604] = "prisonlife.lua",
    [4483381587] = "baseplate.lua",
    [10243982775] = "redbox.lua",
})[game.PlaceId]

if games then
    Rayfield:Destroy()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/Rework-Hydra/main/Games/" .. games))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network does not support this game"
    })
end