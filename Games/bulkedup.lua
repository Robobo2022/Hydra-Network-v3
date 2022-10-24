local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bulked Up", HidePremium = true, IntroText = "Hydra Network", IntroIcon = "rbxassetid://10993876141", SaveConfig = true, ConfigFolder = "OrionTest"})
getgenv().autoGems = true
getgenv().unRagdoll = true
getgenv().autocandy = true

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://7539983773",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Auto"
})

Tab:AddToggle({
	Name = "Auto Pickup Gems",
	Default = false,
	Callback = function(Value)
        autoGems = Value
	end    
})

Tab:AddToggle({
	Name = "Auto Pickup Candy",
	Default = false,
	Callback = function(Value)
        autocandy= Value
	end    
})

Tab:AddToggle({
	Name = "Auto Unragdoll",
	Default = false,
	Callback = function(Value)
        Unragdoll = Value
	end    
})

Tab:AddButton({
	Name = "Get all Trophies",
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
  	end    
})

local Section = Tab:AddSection({
	Name = "Local Player"
})

Tab:AddSlider({
	Name = "Speed Speed",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(WalkSpeed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end   
})

Tab:AddSlider({
	Name = "Jump Power",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
	end   
})

local Players = game:GetService("Players");
local vim = game:GetService("VirtualInputManager");
local replicated = game:GetService("ReplicatedStorage")
local Plr = Players.LocalPlayer;
local Char = Plr.Character or Plr.CharacterAdded:Wait();
local Backpack = Plr.Backpack;

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().autoGems then
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
        if getgenv().autocandy then
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
        if getgenv().unRagdoll then
            replicated.Events.unRagdoll:FireServer(Char)
        end
    end
end)