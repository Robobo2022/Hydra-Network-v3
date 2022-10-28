game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
wait(1)
local WorkspacePlayers = game:GetService("Workspace").Game.Players
local Players = game:GetService('Players')
local localplayer = Players.LocalPlayer
local GuiService = game:GetService("GuiService")
local Light = game:GetService("Lighting")
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Evade",
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

getgenv().Fakemoney = false
getgenv().revivedie = false
getgenv().autowistle = false
getgenv().autochat = false
getgenv().AutoDrink = false
getgenv().Settings = {
    moneyfarm = false,
    afkfarm = false,
    NoCameraShake = false,
    Speed = 1450,
    Jump = 3,
    reviveTime = 3,
    TicketFarm = false,
}

local FindAI = function()
    for _,v in pairs(WorkspacePlayers:GetChildren()) do
        if not Players:FindFirstChild(v.Name) then
            return v
        end
    end
end

local GetDownedPlr = function()
    for i,v in pairs(WorkspacePlayers:GetChildren()) do
        if v:GetAttribute("Downed") then
            return v
        end
    end
end

local revive = function()
    local downedplr = GetDownedPlr()
    if downedplr ~= nil and downedplr:FindFirstChild('HumanoidRootPart') then
        task.spawn(function()
            while task.wait() do
                if localplayer.Character then
                    workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
                    localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(downedplr:FindFirstChild('HumanoidRootPart').Position.X, downedplr:FindFirstChild('HumanoidRootPart').Position.Y + 3, downedplr:FindFirstChild('HumanoidRootPart').Position.Z)
                    task.wait()
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), false)
                    task.wait(4.5)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), true)
                    break
                end
            end
        end)
    end
end

task.spawn(function()
    while task.wait() do
        if Settings.TicketFarm then
            for i,v in pairs(game:GetService("Workspace").Game.Effects.Tickets:GetChildren()) do
                if game.Players.LocalPlayer:GetAttribute('InMenu') ~= true then
                    localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:WaitForChild('HumanoidRootPart').Position)
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if Settings.AutoRespawn then
             if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
             end
        end

        if Settings.NoCameraShake then
            localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
        end
        if Settings.moneyfarm then
            if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
                task.wait(3)
            else
                revive()
                task.wait(1)
            end
        end
        if Settings.moneyfarm == false and Settings.afkfarm and localplayer.Character:FindFirstChild('HumanoidRootPart') ~= nil then
            localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(6007, 7005, 8005)
        end
    end
end)

task.spawn(function()
    while task.wait(6) do
        if AutoDrink == true then
            local ohString1 = "Cola"
            game:GetService("ReplicatedStorage").Events.UseUsable:FireServer(ohString1)
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
       if autowistle == true then
        local ohString1 = "Whistle"
        local ohBoolean2 = true
        game:GetService("Players").LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2)
        game:GetService("ReplicatedStorage").Events.Whistle:FireServer()
       end 
    end
end)

task.spawn(function()
    while task.wait(1) do
       if Fakemoney == true then
        local ohString1 = "Free money <font color=\"rgb(100,255,100)\">($99999)</font>"
        game:GetService("Players").LocalPlayer.PlayerGui.HUD.Messages.Use:Fire(ohString1)
       end 
    end
end)

task.spawn(function()
    while task.wait(1) do
        if autochat == true then
            local ohString1 = "Hydra Network on top"
            local ohString2 = "All"
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
        end
    end
end)

local T1 = Window:CreateTab("Main")
local T2 = Window:CreateTab("Misc")
local T3 = Window:CreateTab("Esp")
local T4 = Window:CreateTab("Tp")
local T5 = Window:CreateTab("Fun")
local T6 = Window:CreateTab("Farms")
local T7 = Window:CreateTab("Credits")

local Toggle = T6:CreateToggle({
	Name = "Afk Farm",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
        Settings.afkfarm = Value
	end,
})

local Toggle = T6:CreateToggle({
	Name = "Money farm",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
        Settings.Money = Value
	end,
})

local Toggle = T6:CreateToggle({
	Name = "Ticket Farm",
	CurrentValue = false,
	Flag = "Toggle1", 
	Callback = function(Value)
        Settings.TicketFarm = Value
	end,
})

local Paragraph = T1:CreateParagraph({Title = "Instructions", Content = "Press m on your keyboard to change the settings!"})

local TargetWalkspeed
local Slider = T1:CreateSlider({
	Name = "WalkSpeed Slider",
	Range = {0, 250},
	Increment = 1,
	Suffix = "WalkSpeed",
	CurrentValue = 0,
	Flag = "Slider1",
	Callback = function(Value)
        TargetWalkspeed = Value
	end,
})

local Slider = T1:CreateSlider({
	Name = "HipHeight Slider",
	Range = {-1.40, 250},
	Increment = 1,
	Suffix = "HipHeight",
	CurrentValue = -1.40,
	Flag = "Slider1",
	Callback = function(HipValue)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = HipValue
	end,
})

local Slider = T1:CreateSlider({
	Name = "Fov Slider",
	Range = {0, 120},
	Increment = 1,
	Suffix = "Fov",
	CurrentValue = 70,
	Flag = "Slider1",
	Callback = function(FovValue)
        local ohString1 = "FieldOfView"
        local ohNumber2 = FovValue
        game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer(ohString1, ohNumber2)
	end,
})

local Slider = T1:CreateSlider({
	Name = "JumpPower Slider",
	Range = {0, 120},
	Increment = 1,
	Suffix = "JumpPower",
	CurrentValue = 3,
	Flag = "Slider1",
	Callback = function(JumpValue)
        Settings.Jump = JumpValue
	end,
})

local Slider = T1:CreateSlider({
	Name = "Time Slider",
	Range = {0, 24},
	Increment = 0.1,
	Suffix = "Time",
	CurrentValue = 14,
	Flag = "Slider1",
	Callback = function(TimeValue)
        game.Lighting.ClockTime = TimeValue
	end,
})

local Toggle = T1:CreateToggle({
	Name = "No CameraShake",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        settings.NoCameraShake = Value
	end,
})

local Toggle = T1:CreateToggle({
	Name = "Auto respawn",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        Settings.AutoRespawn = Value
	end,
})

local Toggle = T2:CreateToggle({
	Name = "Auto Drink Cola",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        AutoDrink = Value
	end,
})

local Toggle = T2:CreateToggle({
	Name = "Auto wistle",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        autowistle = Value
	end,
})

local Toggle = T5:CreateToggle({
	Name = "Give fake money",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        Fakemoney = Value
	end,
})

local Button = T2:CreateButton({
	Name = "Chat Spy",
	Callback = function()
        enabled = true
        spyOnMyself = false
        public = false
        publicItalics = true
        privateProperties = {
            Color = Color3.fromRGB(0,255,255); 
            Font = Enum.Font.SourceSansBold;
            TextSize = 18;
        }
        local StarterGui = game:GetService("StarterGui")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
        local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
        local instance = (_G.chatSpyInstance or 0) + 1
        _G.chatSpyInstance = instance

        local function onChatted(p,msg)
            if _G.chatSpyInstance == instance then
                if p==player and msg:lower():sub(1,4)=="/spy" then
                    enabled = not enabled
                    wait(0.3)
                    privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
                    StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                elseif enabled and (spyOnMyself==true or p~=player) then
                    msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
                    local hidden = true
                    local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                        if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
                            hidden = false
                        end
                    end)
                    wait(1)
                    conn:Disconnect()
                    if hidden and enabled then
                        if public then
                            saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
                        else
                            privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
                            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                        end
                    end
                end
            end
        end

        for _,p in ipairs(Players:GetPlayers()) do
            p.Chatted:Connect(function(msg) onChatted(p,msg) end)
        end
        Players.PlayerAdded:Connect(function(p)
            p.Chatted:Connect(function(msg) onChatted(p,msg) end)
        end)
        privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
        local chatFrame = player.PlayerGui.Chat.Frame
        chatFrame.ChatChannelParentFrame.Visible = true
        chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
	end,
})

local Button = T3:CreateButton({
	Name = "Player Esp",
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

local Button = T2:CreateButton({
	Name = "Inf Jump",
	Callback = function()
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
	end,
})

local Keybind = T2:CreateKeybind({
	Name = "keybind to teleport",
	CurrentKeybind = "Q",
	HoldToInteract = false,
	Flag = "Keybind1",
	Callback = function(Keybind)
        plr = game.Players.LocalPlayer 
        hum = plr.Character.HumanoidRootPart 
        mouse = plr:GetMouse()
        mouse.KeyDown:connect(function(key)
            if mouse.Target then
                hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
                end
        end)
	end,
})

local Button = T2:CreateButton({
	Name = "Fullbright",
	Callback = function()
        Light.Ambient = Color3.new(1, 1, 1)
        Light.ColorShift_Bottom = Color3.new(1, 1, 1)
        Light.ColorShift_Top = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 0
        game.Lighting.ClockTime = 14
        game.Lighting.Brightness = 2
        game.Lighting.GlobalShadows = false
	end,
})

local Button = T2:CreateButton({
	Name = "Third person",
	Callback = function()
        local ohString1 = "ThirdPerson"
        local ohBoolean2 = true
        game:GetService("Players").LocalPlayer.PlayerScripts.Events.KeybindUsed:Fire(ohString1, ohBoolean2)
	end,
})



local Button = T3:CreateButton({
	Name = "Ticket Esp",
	Callback = function()
        while true do
            repeat wait() until game.Workspace.Game.Effects.Tickets.Ticket1
            local esp = Instance.new("Highlight")
            esp.Parent = game.Workspace.Game.Effects.Tickets.Ticket1
        end
	end,
})

local Button = T2:CreateButton({
	Name = "Test Emote (Permanant)",
	Callback = function()
        game:GetService("ReplicatedStorage").Events.UI.Purchase:InvokeServer("Emotes", "Test")
	end,
})

local Keybind = T2:CreateKeybind({
	Name = "Rejoin Server",
	CurrentKeybind = "P",
	HoldToInteract = false,
	Flag = "Keybind1",
	Callback = function(Keybind)
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
	end,
})

local Keybind = T2:CreateKeybind({
	Name = "Respawn",
	CurrentKeybind = "R",
	HoldToInteract = false,
	Flag = "Keybind1",
	Callback = function(Keybind)
        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
	end,
})

local Keybind = T2:CreateKeybind({
	Name = "Drink Cola",
	CurrentKeybind = "H",
	HoldToInteract = false,
	Flag = "Keybind1",
	Callback = function(Keybind)
		local ohString1 = "Cola"
		game:GetService("ReplicatedStorage").Events.UseUsable:FireServer(ohString1)
	end,
})

local Button = T2:CreateButton({
	Name = "Low Quality",
	Callback = function()
        local ohString1 = "LowQuality"
        local ohBoolean2 = true
        game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer(ohString1, ohBoolean2)
	end,
})

local Button = T5:CreateButton({
	Name = "Free Cam (shift + P)",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Robobo2022/script/main/Freecam.lua"))()
	end,
})

local Button = T4:CreateButton({
	Name = "Main game",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 9872472334
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T4:CreateButton({
	Name = "Casual",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10662542523
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T4:CreateButton({
	Name = "Social space",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10324347967
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T4:CreateButton({
	Name = "Big team",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10324346056
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T4:CreateButton({
	Name = "Team deathmatch",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 110539706691
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T4:CreateButton({
	Name = "Vc only",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 10808838353
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T4:CreateButton({
	Name = "Pro",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 11353528705
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T4:CreateButton({
	Name = "Infection",
	Callback = function()
        local TeleportService = game:GetService('TeleportService')
        GameId = 11353532384
        TeleportService:Teleport(GameId, game.Players.LocalPlayer)
	end,
})

local Button = T5:CreateButton({
	Name = "Spawm chat",
	Callback = function(Value)
        autochat = Value
	end,
})


local Keybind = T5:CreateKeybind({
	Name = "Random emote",
	CurrentKeybind = "Z",
	HoldToInteract = false,
	Flag = "Keybind1",
	Callback = function(Keybind)
        local number = math.random(4)
        local ohString1 = (number)
        game:GetService("ReplicatedStorage").Events.Emote:FireServer(ohString1)
	end,
})

local Keybind = T5:CreateKeybind({
	Name = "Random Vote",
	CurrentKeybind = "X",
	HoldToInteract = false,
	Flag = "Keybind1",
	Callback = function(Keybind)
        local RandomVote = math.random(4)
        local ohNumber1 = (RandomVote)
        game:GetService("ReplicatedStorage").Events.Vote:FireServer(ohNumber1)
	end,
})


local Paragraph = T7:CreateParagraph({Title = "Owner/Main Dev", Content = "hydra#8270"})
local Paragraph = T7:CreateParagraph({Title = "Credits", Content = "FeIix and ss.spooky.ss"})
local Paragraph = T7:CreateParagraph({Title = "Credits", Content = "xCLY And batusd"})
local Paragraph = T7:CreateParagraph({Title = "Credits", Content = "Truncated Cuboctahedron"})

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/250)
        end
    end)
end)