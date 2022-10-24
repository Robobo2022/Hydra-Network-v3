if getgenv().Network then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "HydraNetwork",
        Text = "Hydra Network has already been executed in this game"
    })
    return
end

getgenv().Network = true