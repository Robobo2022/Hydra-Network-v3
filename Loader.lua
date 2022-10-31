if getgenv().Network then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hydra Network",
        Text = "Hydra Network has already been executed in this game"
    })
    return
end

getgenv().Network = true
getgenv().supported = true
getgenv().Check1 = true

if require then
    Check1 = true
else
    Check1 = false
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
        Note = "Key Copied in clipboard",
        Key = "test"
    }
})

local T1 = Window:CreateTab("Function Checker")

if Check1 == true then
    local Paragraph = T1:CreateParagraph({Title = "require", Content = "Supported"})
    supported = true
else
    local Paragraph = T1:CreateParagraph({Title = "require", Content = "Unsupported"})
    supported = false
end

if Check1 == true then
    Rayfield:Notify("Executor Supported!","You can now exploit without any problems",10010348543)
else
    Rayfield:Notify("Executor Unsupported","Your executor is not fully Supported so some games are disabled",10010348543)
end

wait(10)
Rayfield:Destroy()

local ownerId = game.CreatorId
game.Players.PlayerAdded:Connect(function(player)
    if player.UserId == ownerId then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Hydra Network",
            Text = "Owner joined! be careful with what you do."
        })
    end
end)

if supported == true then
    local games = ({
        [6847090259] = "bulkedup.lua",
        [155615604] = "prisonlife.lua",
        [4483381587] = "baseplate.lua",
        [10243982775] = "redbox.lua",
        [9498006165] = "tappingsimulator.lua",
        [9872472334] = "evade.lua",
        [10324346056] = "evade.lua",
        [10324347967] = "evade.lua",
        [10539706691] = "evade.lua",
        [10662542523] = "evade.lua",
        [10808838353] = "evade.lua",
        [11353528705] = "evade.lua",
        [11353532384] = "evade.lua",
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
end

if supported == false then
    local gamez = ({
        [6847090259] = "bulkedup.lua",
        [155615604] = "prisonlife.lua",
        [10243982775] = "redbox.lua",
        [9498006165] = "tappingsimulator.lua",
        [9872472334] = "evade.lua",
        [10324346056] = "evade.lua",
        [10324347967] = "evade.lua",
        [10539706691] = "evade.lua",
        [10662542523] = "evade.lua",
        [10808838353] = "evade.lua",
        [11353528705] = "evade.lua",
        [11353532384] = "evade.lua",
    })[game.PlaceId]
    
    if gamez then
        Rayfield:Destroy()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Robobo2022/Hydra-Network-V3/main/Games/" .. gamez))()
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Hydra Network",
            Text = "Hydra Network does not support this game"
        })
    end
end
