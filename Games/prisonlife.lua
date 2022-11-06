
local Light = game:GetService("Lighting")
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Prison Life",
	LoadingTitle = "Hydra Network",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = true,
        	Invite = "YvwEyH2W6t",
        	RememberJoins = true 
        },
	KeySystem = false,
	KeySettings = {
		Title = "Hydra Network",
		Subtitle = "Key System",
		Note = "Key link copied in clipboard!",
		FileName = "SiriusKey",
		SaveKey = false,
		GrabKeyFromSite = true,
		Key = "https://pastebin.com/raw/KcaMdP0i"
	}
})

local T1 = Window:CreateTab("Main")
local T2 = Window:CreateTab("Player")

local Dropdown = T1:CreateDropdown({
	Name = "Gun spawn",
	Options = {"M9", "AK-47", "M4A1", "Remington 870"},
	CurrentOption = "",
	Callback = function(Value)
        game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Value].ITEMPICKUP)
	end,
})

local Dropdown = T1:CreateDropdown({
	Name = "Melee spawn",
	Options = {"Hammer", "Crude Knife"},
	CurrentOption = "",
	Callback = function(Value)
		local args = {
			[1] = workspace.Prison_ITEMS.single[Value].ITEMPICKUP}
		workspace.Remote.ItemHandler:InvokeServer(unpack(args))
	end,
})

local Section = T1:CreateSection("Weapon mods")

local Button = T1:CreateButton({
	Name = "Mod M9",
	Callback = function()
        s = game:GetService("Players").LocalPlayer.Backpack.M9.GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
	end,
})

local Button = T1:CreateButton({
	Name = "Mod Ak-47",
	Callback = function()
        s = game:GetService("Players").LocalPlayer.Backpack["AK-47"].GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
	end,
})

local Button = T1:CreateButton({
	Name = "Mod Remington 870",
	Callback = function()
        s = game:GetService("Players").LocalPlayer.Backpack["Remington 870"].GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
	end,
})

local Button = T1:CreateButton({
	Name = "Mod M4A1",
	Callback = function()
        s = game:GetService("Players").LocalPlayer.Backpack.M4A1.GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
	end,
})

local Section = T1:CreateSection("Other")

local Button = T1:CreateButton({
	Name = "Fullbright",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.ClockTime = 14
        game.Lighting.Brightness = 10
        game.Lighting.GlobalShadows = false
	end,
})

local speedslider = T2:CreateSlider({
	Name = "Change WalkSpeed",
	Range = {16, 500},
	Increment = 1,
	Suffix = "WalkSpeed",
	CurrentValue = 16,
	Callback = function(WalkSpeed)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end,
})

task.spawn(function()
	while task.wait(0.1) do
		if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
			speedslider:Set(16)
		end
	end
end)

local jumpslider = T2:CreateSlider({
	Name = "Change JumpPower",
	Range = {50, 500},
	Increment = 1,
	Suffix = "JumpPower",
	CurrentValue = 50,
	Callback = function(jumppower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumppower
	end,
})

task.spawn(function()
	while task.wait(0.1) do
		if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
			jumpslider:Set(50)
		end
	end
end)

local fovslider = T2:CreateSlider({
	Name = "Change Fov",
	Range = {70, 120},
	Increment = 1,
	Suffix = "Fov",
	CurrentValue = 70,
	Callback = function(Fov)
        game:GetService'Workspace'.Camera.FieldOfView = Fov
	end,
})

local gravityslider = T2:CreateSlider({
	Name = "Change Gravity",
	Range = {0, 196.2},
	Increment = 1,
	Suffix = "Gravity",
	CurrentValue = 196.2,
	Callback = function(Gravity)
        Workspace.Gravity = Gravity
	end,
})

task.spawn(function()
	while task.wait(0.1) do
		if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
			gravityslider:Set(196.2)
		end
	end
end)