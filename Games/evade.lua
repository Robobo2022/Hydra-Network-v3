getgenv().SecureMode = true
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



local TyphFun = {
    ["Objects"] = {},
    ["Functions"] = {},
    ["Settings"] = {
        OutlineColor = Color3.new(0,0,0),
        AccentColor = Color3.new(255, 255, 255),
        TextColor = Color3.new(255, 255, 255),
        TeamMateColor = Color3.new(0, 255, 0),
        EnemyColor = Color3.new(255, 0, 0),
        MonsterColor = Color3.new(255, 0, 0),
        TeamCheck = false,
        Distance = 1000,
        Enabled = true,
        BoxNHealth = false,
        LookLine = false,
        Line = false,
        Name = true,
        Dist = false,
        Tool = true,
    },
    ["Services"] = {
        ["RunService"] = game:GetService("RunService"),
        ["Players"] = game:GetService("Players"),
        ["Workspace"] = game:GetService("Workspace"),
        ["CoreGui"] = game:GetService("CoreGui"),
        ["LocalPlayer"] = game:GetService("Players").LocalPlayer,
        ["Camera"] = game:GetService("Workspace").CurrentCamera,
        ["ViewPort"] = workspace.CurrentCamera.ViewportSize,
        ["WorldToViewportPoint"] = game:GetService("Workspace").CurrentCamera.worldToViewportPoint,
    },
    ["ChangeableFunctions"] = {},
}

local Services = TyphFun.Services
local Objects = TyphFun.Objects
local Settings = TyphFun.Settings
local Functions = TyphFun.Functions
local Startup = TyphFun.ChangeableFunctions
local lplr = Services.LocalPlayer
local SCREEN_SIZE = Services.ViewPort

local temptable = Drawing.new("Text")
temptable.Text = "Typh.Fun ESP"
temptable.Visible = true
temptable.Position = Vector2.new(math.floor(SCREEN_SIZE.x / 16),math.floor(SCREEN_SIZE.y / 16))
temptable.Size = 13
temptable.Center = true
temptable.Color = Color3.fromRGB(142, 19, 192)
temptable.Transparency = 1
temptable.Outline = true
temptable.OutlineColor = Color3.fromRGB(142, 19, 192)

--EDITABLE FUNCTIONS
TyphFun.Functions.ValidChar = function(v)
    if v ~= nil and v:FindFirstChild("Humanoid") ~= nil and v:FindFirstChild("HumanoidRootPart") ~= nil and v.Humanoid.Health > 0 and v.HumanoidRootPart ~= nil and lplr.Character ~= nil and lplr.Character ~= v then
        return true
    else
        return false
    end
end

TyphFun.Functions.GetPlayerFromCharacter = function(v)
    for i, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character ~= nil and plr.Character == v then
            return true, plr
        end
    end
end

TyphFun.Functions.GetTeam = function(v)
    local _, plr = TyphFun.Functions.GetPlayerFromCharacter(v)
    if plr.TeamColor == lplr.TeamColor then
        return true
    else
        return false
    end
end
--EDITABLE FUNCTIONS

TyphFun.Functions.RemoveAllDrawings = function()
    for i, v in pairs(TyphFun.Objects) do
        v:Remove()
    end
    TyphFun.Objects = {}
end

TyphFun.Functions.BoxESP = function(v, BoxT, HealthT, NameT, DistT, ToolT, LineT, LookLineT)
    local camera = game:GetService("Workspace").CurrentCamera
    local CurrentCamera = workspace.CurrentCamera
    local worldToViewportPoint = CurrentCamera.worldToViewportPoint
    local HeadOff = Vector3.new(0, 0.5, 0)
    local LegOff = Vector3.new(0,3,0)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Settings["OutlineColor"]
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Settings["AccentColor"]
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Settings["OutlineColor"]
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false

    local Name = Drawing.new("Text")
    Name.Color = Settings["TextColor"]
    Name.Outline = true
    Name.Center = true
    Name.Size = 13
    Name.Font = 2

    local Misc = Drawing.new("Text")
    Misc.Color = Settings["TextColor"]
    Misc.Outline = true
    Misc.Center = true
    Misc.Size = 13
    Misc.Font = 2
    
    local Misc2 = Drawing.new("Text")
    Misc2.Color = Settings["TextColor"]
    Misc2.Outline = true
    Misc2.Center = true
    Misc2.Size = 13
    Misc2.Font = 2

    local LookLine = Drawing.new("Line")
    LookLine.Visible = true
    LookLine.Color = Settings["AccentColor"]
    LookLine.Thickness = 2
    LookLine.Transparency = 1  

    local Line = Drawing.new("Line")
    Line.Visible = true
    Line.Color = Settings["AccentColor"]
    Line.Thickness = 2
    Line.Transparency = 1
    
    TyphFun.Objects[v.Name] = {
        BoxOutline,
        Box,
        HealthBarOutline,
        HealthBar,
        Name,
        Misc,
        Misc2,
        LookLine,
        Line,
    }

    local function boxesp()
        TyphFun.Services.RunService.RenderStepped:Connect(function()
            if TyphFun.Functions.ValidChar(v) and v.HumanoidRootPart then
                local Vector, onScreen = camera:worldToViewportPoint(v.HumanoidRootPart.Position)
                local Character = v
                local RootPart = v.HumanoidRootPart
                local hum = v.Humanoid
                local RootPosition = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, RootPart.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)
                local Center = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
                local Size = (camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
                local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))
                local BottomOffset = BoxSize.Y + BoxPos.Y + 10
                
                Misc.Color = Settings["TextColor"]
                Misc2.Color = Settings["TextColor"]
                Name.Color = Settings["TextColor"]
                HealthBarOutline.Color = Settings["OutlineColor"]
                Box.Color = Settings["AccentColor"]
                BoxOutline.Color = Settings["OutlineColor"]

                if onScreen and (RootPart.Position - camera.CFrame.Position).Magnitude < Settings["Distance"] then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)


                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)


                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)


                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (hum["MaxHealth"] / math.clamp(hum["Health"], 0, hum["MaxHealth"])))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                    HealthBar.Color = Color3.fromRGB(255 - 255 / (hum["MaxHealth"] / hum["Health"]), 255 / (hum["MaxHealth"] / hum["Health"]), 0)


                    Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 40)

                    Line.From = Center
                    Line.To = Vector2.new(RootPosition.X, RootPosition.Y)
                    
                    if v:FindFirstChild("Head") then
                        local Head = v.Head
                        local LineOff = Head.CFrame * Vector3.new(0,0,-3)
                        local HeadPosition2 = worldToViewportPoint(CurrentCamera, LineOff)
                        local HeadPosition3 = worldToViewportPoint(CurrentCamera, Head.Position)
                        LookLine.From = Vector2.new(HeadPosition3.X,HeadPosition3.Y)
                        LookLine.To = Vector2.new(HeadPosition2.X,HeadPosition2.Y)
                    else
                        LookLine.Visible = false
                    end

                    local PlayerExists, Player = TyphFun.Functions.GetPlayerFromCharacter(v)
                    
                    if PlayerExists and Player.name == Player.DisplayName then
                        Name.Text = tostring(Player.name)
                    elseif PlayerExists and Player.name ~= Player.DisplayName then
                        Name.Text = tostring(Player.DisplayName) .. " (@" .. tostring(Player.name) .. ")"
                    else
                        Name.Text = tostring(v.name)
                    end


                    Misc.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    Misc.Text = math.floor((RootPart.Position - camera.CFrame.Position).Magnitude) .. "m away"


                    Misc2.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset + 16)
                    if Character:FindFirstChildOfClass("Tool") then
                        Misc2.Text = tostring(Character:FindFirstChildOfClass("Tool").Name)
                    else
                        Misc2.Text = "None"
                    end

                    if not BoxT then
                        BoxOutline.Visible = Box
                        Box.Visible = Box

                    else
                        BoxOutline.Visible = Settings["BoxNHealth"]
                        Box.Visible = Settings["BoxNHealth"]
                    end

                    if HealthT then
                        HealthBarOutline.Visible = HealthT
                        HealthBar.Visible = HealthT
                    else
                        HealthBarOutline.Visible = Settings["BoxNHealth"]
                        HealthBar.Visible = Settings["BoxNHealth"]
                    end

                    if NameT then
                        Name.Visible = NameT
                    else
                        Name.Visible = Settings["Name"]
                    end

                    if LookLineT then
                        LookLine.Visible = LookLineT
                    else
                        LookLine.Visible = Settings["LookLine"]
                    end

                    if DistT then
                        Misc.Visible = DistT
                    else
                        Misc.Visible = Settings["Misc"]
                    end

                    if ToolT then
                        Misc2.Visible = ToolT
                    else
                        Misc2.Visible = Settings["Misc"]
                    end

                    if LineT then
                        Line.Visible = LineT
                    else
                        Line.Visible = Settings["Line"]
                    end

                    local TeamMate;

                    if PlayerExists then
                        TeamMate = TyphFun.Functions.GetTeam(v)
                        if PlayerExists and TeamMate and Settings["TeamCheck"]  then
                            Box.Color = Settings["TeamMateColor"]
                            Line.Color = Settings["TeamMateColor"]
                        elseif PlayerExists and not TeamMate and Settings["TeamCheck"] then
                            Box.Color = Settings["EnemyColor"]
                            Line.Color = Settings["EnemyColor"]
                        end
                    elseif not PlayerExists then
                        Box.Color = Settings["MonsterColor"]
                        Line.Color = Settings["MonsterColor"]
                    end

                    if not Settings["Enabled"] then
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                        Name.Visible = false
                        Misc.Visible = false
                        Misc2.Visible = false
                        LookLine.Visible = false
                        Line.Visible = false
                    end
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                    Name.Visible = false
                    Misc.Visible = false
                    Misc2.Visible = false
                    LookLine.Visible = false
                    Line.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
                Name.Visible = false
                Misc.Visible = false
                Misc2.Visible = false
                LookLine.Visible = false
                Line.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end

TyphFun.Functions.AddObject = function(v, BoxT, HealthT, NameT, DistT, ToolT, LineT, LookLineT)
    TyphFun.Objects[v.Name] = {}
    table.insert(TyphFun.Objects, v)
    TyphFun.Functions.BoxESP(v, BoxT, HealthT, NameT, DistT, ToolT, LineT, LookLineT)
end

TyphFun.Functions.Startup = function()
    for i,v in pairs(game:GetService("Workspace").Game.Players:GetChildren()) do
        TyphFun.Functions.AddObject(v)
    end
    
    game:GetService("Workspace").Game.Players.ChildAdded:Connect(function(v)
        TyphFun.Functions.AddObject(v)
    end)
    game:GetService("Workspace").Game.Players.ChildRemoved:Connect(function()
        TyphFun.Functions.RemoveAllDrawings()
        for i,v in pairs(game:GetService("Workspace").Game.Players:GetChildren()) do
            TyphFun.Functions.AddObject(v)
        end
    end)
end

TyphFun.Functions.Startup()

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
        Settings.NoCameraShake = Value
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

local Button = T2:CreateButton({
	Name = "T to teleport",
	Callback = function()
        plr = game.Players.LocalPlayer 
        hum = plr.Character.HumanoidRootPart 
        mouse = plr:GetMouse()
        mouse.KeyDown:connect(function(key)
            if key == "c" then
            if mouse.Target then
                hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
                end
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

Rayfield:LoadConfiguration()