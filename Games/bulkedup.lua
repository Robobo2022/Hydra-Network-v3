local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({Name = "Bulked up"})

local Tab = Window:CreateTab("Main")
local T1 = Window:CreateTab("Credits")

getgenv().autoGems = true
getgenv().unRagdoll = true
getgenv().autocandy = true
getgenv().removefence = true
getgenv().AutoBomb = true
getgenv().meteors = false

local Paragraph = T1:CreateParagraph({Title = "Developers", Content = "hydra#8270"})

local Toggle = Tab:CreateToggle({
	Name = "Auto Pickup Gems",
	CurrentValue = false,
	Callback = function(Value)
        autoGems = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Pickup candy",
	CurrentValue = false,
	Callback = function(Value)
        autocandy = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Pickup Bombs",
	CurrentValue = false,
	Callback = function(Value)
        AutoBomb = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto Farm Meteor (need to equip something that does damage)",
	CurrentValue = false,
	Callback = function(Value)
        meteors = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "Auto unragdoll",
	CurrentValue = false,
	Callback = function(Value)
        Unragdoll = Value
	end,
})

local Button = Tab:CreateButton({
	Name = "Get all trophies",
	Callback = function()
        local ohString1 = "NeighborhoodWoods"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "CircleRoadCenter"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "LeftUnderCliff"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "RoadEnd"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "GreenScreen"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "Cliff"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "UnderCounter"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "House"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "WoodsCenter"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "Origin"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "Cabin"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "Test"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
        wait(1)
        local ohString1 = "Spawn"
        game:GetService("ReplicatedStorage").Events.TrophyPickup:FireServer(ohString1)
	end,
})

local Section = Tab:CreateSection("Local Player")

local Slider = Tab:CreateSlider({
	Name = "Walk Speed",
	Range = {16, 500},
	Increment = 1,
	Suffix = "WalkSpeed",
	CurrentValue = 16,
	Callback = function(WalkSpeed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end,
})

local Slider = Tab:CreateSlider({
	Name = "Jump Power",
	Range = {50, 500},
	Increment = 1,
	Suffix = "JumpPower",
	CurrentValue = 50,
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
	end,
})

local Players = game:GetService("Players");
local hit = game:GetService("VirtualInputManager");
local replicated = game:GetService("ReplicatedStorage")
local Plr = Players.LocalPlayer;
local Char = Plr.Character or Plr.CharacterAdded:Wait();

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().removefence then
            for i,v in pairs(workspace:GetChildren()) do
                if v:IsA("Folder") and v.Name == "Laser Fence" then
                    v:Destroy()
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().autoGems == true then
            for i,v in pairs(workspace:GetChildren()) do
                if v:IsA("Part") and v.Name == "Gem" then
                    v.CFrame = Char.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().AutoBomb == true then
            for i,v in pairs(workspace:GetChildren()) do
                if v:IsA("Part") and v.Name == "GrenadePickup" or v.Name == "Sticky BombPickup" or v.Name == "Stun GrenadePickup" or v.Name == "Plasma GrenadePickup" or v.Name == "Black Hole GrenadePickup" then
                    v.CFrame = Char.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().autocandy == true then
            for i,v in pairs(workspace:GetChildren()) do
                if v:IsA("Part") and v.Name == "Candy" then
                    v.CFrame = Char.HumanoidRootPart.CFrame
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().unRagdoll == true then
            replicated.Events.unRagdoll:FireServer(Char)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().meteors == true then
            for i,v in pairs(workspace.Meteorites:GetDescendants()) do
                if v:IsA("Part") and v.Name == "RootPart" then
                    Char.HumanoidRootPart.CFrame = v.CFrame
                    hit:SendMouseButtonEvent(4, 1, 0, true, game, 1);
                end
            end
        end
    end
end)
