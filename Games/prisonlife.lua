local Light = game:GetService("Lighting")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Prison life", HidePremium = true, IntroText = "Hydra Network", IntroIcon = "rbxassetid://10993876141", SaveConfig = true, ConfigFolder = "OrionTest"})

local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://7539983773",
	PremiumOnly = false
})

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://2795572800",
	PremiumOnly = false
})

MainTab:AddDropdown({
	Name = "Gun",
	Default = "Choose Weapon",
	Options = {"M9", "AK-47", "M4A1", "Remington 870"},
	Callback = function(Value)
		game.Workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[Value].ITEMPICKUP)
	end    
})

MainTab:AddDropdown({
	Name = "Melee",
	Default = "Choose Weapon",
	Options = {"Hammer", "Crude Knife"},
	Callback = function(Value)
		local args = {
			[1] = workspace.Prison_ITEMS.single[Value].ITEMPICKUP}
		workspace.Remote.ItemHandler:InvokeServer(unpack(args))
	end    
})

local Section = MainTab:AddSection({
	Name = "Weapon Mod"
})

MainTab:AddButton({
	Name = "Mod M9",
	Callback = function()
		s = game:GetService("Players").LocalPlayer.Backpack.M9.GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
  	end    
})

MainTab:AddButton({
	Name = "Mod Ak-47",
	Callback = function()
		s = game:GetService("Players").LocalPlayer.Backpack["AK-47"].GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
  	end    
})

MainTab:AddButton({
	Name = "Mod Remington 870",
	Callback = function()
		s = game:GetService("Players").LocalPlayer.Backpack["Remington 870"].GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
  	end    
})

MainTab:AddButton({
	Name = "Mod M4A1",
	Callback = function()
		s = game:GetService("Players").LocalPlayer.Backpack.M4A1.GunStates
		rs = require(s)
		rs.CurrentAmmo = math.huge
		rs.MaxAmmo = math.huge
		rs.ReloadTime = 0
  	end    
})

local Section = MainTab:AddSection({
	Name = "Other"
})

MainTab:AddButton({
	Name = "Full Bright",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.ClockTime = 14
        game.Lighting.Brightness = 10
        game.Lighting.GlobalShadows = false
  	end    
})
local speedslider = PlayerTab:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(137, 207, 240),
	Increment = 1,
	ValueName = "Walk Speed",
	Callback = function(WalkSpeed)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
	end   
})

task.spawn(function()
	while task.wait(0.1) do
		if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
			speedslider:Set(16)
		end
	end
end)

local jumpslider = PlayerTab:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 500,
	Default = 50.145,
	Color = Color3.fromRGB(137, 207, 240),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(JumpPower)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPower
    end
})

task.spawn(function()
	while task.wait(0.1) do
		if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
			jumpslider:Set(50)
		end
	end
end)

local hipheightslider = PlayerTab:AddSlider({
	Name = "Hip Height",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(137, 207, 240),
	Increment = 1,
	ValueName = "Hip Height",
	Callback = function(JumpHeight)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = JumpHeight
    end
})

task.spawn(function()
	while task.wait(0.1) do
		if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
			hipheightslider:Set(0)
		end
	end
end)

PlayerTab:AddSlider({
	Name = "Fov Slider",
	Min = 1,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(137, 207, 240),
	Increment = 1,
	ValueName = "Fov",
	Callback = function(Fov)
        game:GetService'Workspace'.Camera.FieldOfView = Fov
    end
})

local gravityslider = PlayerTab:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 196.2,
	Default = 196.2,
	Color = Color3.fromRGB(137, 207, 240),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Gravity)
        Workspace.Gravity = Gravity
    end
})


task.spawn(function()
	while task.wait(0.1) do
		if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
			gravityslider:Set(196.2)
		end
	end
end)