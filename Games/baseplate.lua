local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Baseplate",
    LoadingTitle = "Hydra network",
    LoadingSubtitle = "by hydra#8270",
    KeySystem = false,
    KeySettings = {
        Title = "Hydra Network",
        Subtitle = "Key System",
        Note = "Get Key (https://link-hub.net/488828/key-for-hydra-network)",
        Key = "test"
    }
})
local Tab = Window:CreateTab("Main")

local player = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")

local Paragraph = Tab:CreateParagraph({Title = "Name", Content = player.Name.."."})
local Paragraph = Tab:CreateParagraph({Title = "Player id", Content = player.UserId.."."})
local Paragraph = Tab:CreateParagraph({Title = "Game", Content = game.PlaceId.."."})
local Paragraph = Tab:CreateParagraph({Title = "Walk speed", Content = player.Character.Humanoid.WalkSpeed.."."})
local Paragraph = Tab:CreateParagraph({Title = "Jump Power", Content = player.Character.Humanoid.JumpPower.."."})
local Paragraph = Tab:CreateParagraph({Title = "Hip Height", Content = player.Character.Humanoid.HipHeight.."."})
local Paragraph = Tab:CreateParagraph({Title = "Health", Content = player.Character.Humanoid.Health.."."})
local Paragraph = Tab:CreateParagraph({Title = "Max Health", Content = player.Character.Humanoid.MaxHealth.."."})
local Paragraph = Tab:CreateParagraph({Title = "Max slope angle", Content = player.Character.Humanoid.MaxSlopeAngle.."."})
local Paragraph = Tab:CreateParagraph({Title = "Jump Height", Content = player.Character.Humanoid.JumpHeight.."."})
local Paragraph = Tab:CreateParagraph({Title = "Gravity", Content = Workspace.Gravity.."."})

