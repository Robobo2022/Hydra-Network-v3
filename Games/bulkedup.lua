local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bulked Up", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
getgenv().autoGems = true
getgenv().unRagdoll = true
getgenv().autocandy = true

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
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

local Section = Tab:AddSection({
	Name = "Local Player"
})

Tab:AddSlider({
	Name = "Speed Speed",
	Min = 0,
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