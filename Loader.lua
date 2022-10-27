getgenv().Check1 = true
getgenv().Check2 = true
getgenv().supexe = true
 

if firetouchinterest then
    Check1 = true
else
    Check1 = false
end

if require then
    Check2 = true
else
    Check2 = false
end

if getgenv().Network then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network has already been executed in this game"
    })
    return
end

setclipboard("test")

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
local T1 = Window:CreateTab("Function Checker")

if Check1 == true then
    local Paragraph = T1:CreateParagraph({Title = "firetouchinterest", Content = "Supported"})
else
    local Paragraph = T1:CreateParagraph({Title = "firetouchinterest", Content = "Unsupported"})
end

if Check2 == true then
    local Paragraph = T1:CreateParagraph({Title = "require", Content = "Supported"})
else
    local Paragraph = T1:CreateParagraph({Title = "require", Content = "Unsupported"})
end

if Check1 and Check2 == true then
    Rayfield:Notify("Executor Supported!","You can now exploit without any problems",10010348543)
    supexe = true
else
    Rayfield:Notify("Executor Unsupported","Your executor is not fully Supported so there might be some issues",10010348543)
    supexe = false
end

wait(10)
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
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/Hydra-Network-V3/main/Games/" .. games))()
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network does not support this game"
    })
end