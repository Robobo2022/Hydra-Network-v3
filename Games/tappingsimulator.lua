local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

getgenv().autoclick = false
getgenv().autohalloween = false
getgenv().AutoHatch = false
getgenv().EggSelect = "Starter"
getgenv().Autoupgrade = false
getgenv().Upgradeselect = "rebirthUpgrades"


task.spawn(function()
    while task.wait(0.1) do
        if autoclick == true then
            local A_1 = 1
            local Event = game:GetService("ReplicatedStorage").Events.Tap
            Event:FireServer(A_1)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do 
        if Autoupgrade == true then
            local A_1 = (Upgradeselect)
            local Event = game:GetService("ReplicatedStorage").Events.Upgrade
            Event:FireServer(A_1) 
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if AutoHatch == true then
            local args = {
                [1] = {},
                [2] = (EggSelect),
                [3] = 1
            }
            game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer(unpack(args))
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if autohalloween== true then
            local A_1 = 5
            local Event = game:GetService("ReplicatedStorage").Events.Tap
            Event:FireServer(A_1)
        end
    end
end)

local Window = Rayfield:CreateWindow({
    Name = "Tapping simulator",
    LoadingTitle = "Hydra network",
    LoadingSubtitle = "by hydra#8270",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "Big Hub",
    },
    KeySystem = false,
    KeySettings = {
        Title = "Sirius Hub",
        Subtitle = "Key System",
        Note = "Join the discord (discord.gg/sirius)",
        Key = "ABCDEF"
    }
})

local T1 = Window:CreateTab("Auto")

local Toggle = T1:CreateToggle({
	Name = "Auto Click (world)",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        autoclick = Value
	end,
})

local Toggle = T1:CreateToggle({
	Name = "Auto Click (Halloween)",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        autohalloween = Value
	end,
})

local Section = T1:CreateSection("Egg")

local Dropdown = T1:CreateDropdown({
	Name = "World eggs",
	Options = {"Starter", "Coral Egg", "Jungle Egg", "Bee Egg", "Swamp Egg", "Snow Egg", "Desert Egg", "Death Egg", "Forest Egg", "Dominus Egg", "Wood Egg", "Mine Egg", "Beach Egg", "Dark Egg", "Cloud Egg", "Magma Egg", "Fire Egg", "Molten Egg", "Underworld Egg", "Blue Magma Egg", "Red Magma Egg", "Secret Magma Egg", "Purple Magma Egg", "Yellow Magma Egg","Halloween Egg","Candy Egg", "Flora Egg", "Holy Wood Egg", "Holy Bee Egg", "Holy Egg", "Castle Egg", "Asteroid Egg", "Festival Egg", "Japan Egg", "Station Egg", "Robo Egg", "Alien Egg", "Frost Alien Egg", "Toxic Alien Egg", "65M Egg", "Orange Egg", "Hallow Egg", "Hallow Egg", "Halloween Dominus Egg", "Pumpkin Egg", "Ghoul Egg", "Scrapyard Egg"},
	CurrentOption = "Starter",
	Flag = "Dropdown1",
	Callback = function(Option)
        EggSelect = Option
	end,
})

local Toggle = T1:CreateToggle({
	Name = "Auto hatch (world)",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        AutoHatch = Value
	end,
})

local Section = T1:CreateSection("Upgrade")


local Dropdown = T1:CreateDropdown({
	Name = "Upgrades",
	Options = {"rebirthUpgrades","jumps", "gemMultiplierUpgrade", "storageUpgrade"},
	CurrentOption = "rebirthUpgrades",
	Flag = "Dropdown1",
	Callback = function(Option)
        Upgradeselect = Option
	end,
})

local Toggle = T1:CreateToggle({
	Name = "Auto upgrade",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        Autoupgrade = Value
	end,
})