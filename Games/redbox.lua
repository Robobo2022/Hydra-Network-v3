getgenv().Check = false

if require then
    Check = false
else
    Check = false
end

local StarterPlayer = game:GetService("StarterPlayer")
local Workspace = game:GetService("Workspace")
local Light = game:GetService("Lighting")
local players = game.Players:GetPlayers()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Redbox",
    LoadingTitle = "Hydra network",
    LoadingSubtitle = "by hydra#8270",
    KeySystem = false,
    KeySettings = {
        Title = "Sirius Hub",
        Subtitle = "Key System",
        Note = "Join the discord (discord.gg/sirius)",
        Key = "ABCDEF"
    }
})

if Check == false then
    Rayfield:Notify("Unsupported","Your executor is not supported, some feature are now disabled",10010348543)
end

getgenv().Color = BrickColor
getgenv().HeadSize = 1
getgenv().Rootpart = 2
getgenv().Disabled = false

game:GetService('RunService').RenderStepped:connect(function()
    if Disabled == false then
        for i,v in next, game:GetService('Players'):GetPlayers() do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                pcall(function()
                    v.Character.Head.Size = Vector3.new(1,1,1)
                    v.Character.HumanoidRootPart.Size = Vector3.new(2,2,2)
                    v.Character.Head.Transparency = 0
                    v.Character.HumanoidRootPart.Transparency = 0
                    v.Character.Head.Material = "ForceField"
                    v.Character.HumanoidRootPart.Material = "Plastic"
                end)
            end
        end
    end
end)

game:GetService('RunService').RenderStepped:connect(function()
    if Disabled then
        for i,v in next, game:GetService('Players'):GetPlayers() do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                pcall(function()
                    v.Character.Head.Size = Vector3.new(HeadSize,HeadSize,HeadSize)
                    v.Character.Head.Transparency = 0.2
                    v.Character.Head.BrickColor = BrickColor.new(Color)
                    v.Character.Head.Material = "ForceField"
                    v.Character.Head.CanCollide = false
                end)
            end
        end
    end
end)

game:GetService('RunService').RenderStepped:connect(function()
    if Disabled then
        for i,v in next, game:GetService('Players'):GetPlayers() do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.Size = Vector3.new(Rootpart,Rootpart,Rootpart)
                    v.Character.HumanoidRootPart.Transparency = 0.2
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new(Color)
                    v.Character.HumanoidRootPart.Material = "ForceField"
                    v.Character.HumanoidRootPart.CanCollide = false
                end)
            end
        end
    end
end)

local T1 = Window:CreateTab("Main")
local T2 = Window:CreateTab("Player")

if Check == true then
    local Keybind = T1:CreateKeybind({
        Name = "Inf ammo(equipe Weapon before pressing)",
        CurrentKeybind = "R",
        HoldToInteract = false,
        Callback = function(Keybind)
            local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
            local m = require(Tool.toolSettings)
            game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
            game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(Tool)
            game:GetService("ReplicatedStorage").Assets.Remotes.syncAmmo:FireServer(1000000,1000000, Tool)
        end,
    })
end


if Check == true then
    local Keybind = T1:CreateKeybind({
        Name = "No Recoil",
        CurrentKeybind = "L",
        HoldToInteract = false,
        Callback = function(Keybind)
            local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
            local m = require(Tool.toolSettings)
            m.firingRecoilEnabled = false
        end,
    })
end

local Button = T2:CreateButton({
	Name = "Fullbright",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.Brightness = 5
        game.Lighting.GlobalShadows = false
	end,
})

local Slider = T1:CreateSlider({
	Name = "Hitbox (Head)",
	Range = {0, 5},
	Increment = 1,
	Suffix = "HeadSize",
	CurrentValue = 0,
	Callback = function(Value)
        HeadSize = Value
	end,
})

local Slider = T1:CreateSlider({
	Name = "Hitbox (HumanoidRootPart)",
	Range = {0, 50},
	Increment = 1,
	Suffix = "HumanoidRootPartSize",
	CurrentValue = 0,
	Callback = function(Value)
        Rootpart = Value
	end,
})

local Toggle = T1:CreateToggle({
	Name = "Hitbox Toggle",
	CurrentValue = false,
	Callback = function(Value)
        Disabled = Value
	end,
})

local Slider = T2:CreateSlider({
	Name = "Fov Slider",
	Range = {70, 120},
	Increment = 1,
	Suffix = "Fov",
	CurrentValue = 70,
	Callback = function(Value)
        game:GetService'Workspace'.Camera.FieldOfView = Value
	end,
})

local TargetWalkspeed
local Slider = T2:CreateSlider({
	Name = "WalkSpeed Slider",
	Range = {0, 500},
	Increment = 1,
	Suffix = "WalkSpeed",
	CurrentValue = 0,
	Callback = function(Value)
        TargetWalkspeed = Value
	end,
})

local Slider = T2:CreateSlider({
	Name = "JumpPower Slider",
	Range = {50, 500},
	Increment = 1,
	Suffix = "JumpPower",
	CurrentValue = 50,
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})

local Button = T1:CreateButton({
	Name = "Player esp",
	Callback = function()
        local dwEntities = game:GetService("Players")
        local dwLocalPlayer = dwEntities.LocalPlayer 
        local dwRunService = game:GetService("RunService")
        
        local settings_tbl = {
            ESP_Enabled = true,
            ESP_TeamCheck = false,
            Chams = true,
            Chams_Color = Color3.fromRGB(255, 255, 255),
            Chams_Transparency = 0.9,
            Chams_Glow_Color = Color3.fromRGB(0, 0, 0)
        }
        
        function destroy_chams(char)
            for k,v in next, char:GetChildren() do 
                if v:IsA("BasePart") and v.Transparency ~= 1 then
                    if v:FindFirstChild("Glow") and 
                    v:FindFirstChild("Chams") then
                        v.Glow:Destroy()
                        v.Chams:Destroy() 
                    end 
                end 
            end 
        end
        
        dwRunService.Heartbeat:Connect(function()
            if settings_tbl.ESP_Enabled then
                for k,v in next, dwEntities:GetPlayers() do 
                    if v ~= dwLocalPlayer then
                        if v.Character and
                        v.Character:FindFirstChild("HumanoidRootPart") and 
                        v.Character:FindFirstChild("Humanoid") and 
                        v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                            if settings_tbl.ESP_TeamCheck == false then
                                local char = v.Character 
                                for k,b in next, char:GetChildren() do 
                                    if b:IsA("BasePart") and 
                                    b.Transparency ~= 1 then
                                        if settings_tbl.Chams then
                                            if not b:FindFirstChild("Glow") and
                                            not b:FindFirstChild("Chams") then
                                                local chams_box = Instance.new("BoxHandleAdornment", b)
                                                chams_box.Name = "Chams"
                                                chams_box.AlwaysOnTop = true 
                                                chams_box.ZIndex = 4 
                                                chams_box.Adornee = b 
                                                chams_box.Color3 = settings_tbl.Chams_Color
                                                chams_box.Transparency = settings_tbl.Chams_Transparency
                                                chams_box.Size = b.Size + Vector3.new(0.02, 0.02, 0.02)
                                                local glow_box = Instance.new("BoxHandleAdornment", b)
                                                glow_box.Name = "Glow"
                                                glow_box.AlwaysOnTop = false 
                                                glow_box.ZIndex = 3 
                                                glow_box.Adornee = b 
                                                glow_box.Color3 = settings_tbl.Chams_Glow_Color
                                                glow_box.Size = chams_box.Size + Vector3.new(0.13, 0.13, 0.13)
                                            end
                                        else
                                            destroy_chams(char)
                                        end
                                    end
                                end
                            else
                                if v.Team == dwLocalPlayer.Team then
                                    destroy_chams(v.Character)
                                end
                            end
                        else
                            destroy_chams(v.Character)
                        end
                    end
                end
            else 
                for k,v in next, dwEntities:GetPlayers() do 
                    if v ~= dwLocalPlayer and 
                    v.Character and 
                    v.Character:FindFirstChild("HumanoidRootPart") and 
                    v.Character:FindFirstChild("Humanoid") and 
                    v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                        destroy_chams(v.Character)
                    end
                end
            end
        end)
	end,
})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/100)
        end
    end)
end)