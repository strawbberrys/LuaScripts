if Notification then return end

getgenv().Notification = {}

local TweenService = game:GetService('TweenService')

local NotificationUI = Instance.new("ScreenGui")
local Container = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

syn.protect_gui(NotificationUI)

NotificationUI.Name = "NotificationUI"
NotificationUI.Parent = game.CoreGui
NotificationUI.IgnoreGuiInset = true
NotificationUI.ZIndexBehavior = Enum.ZIndexBehavior.Global

Container.Name = "Container"
Container.Parent = NotificationUI
Container.AnchorPoint = Vector2.new(0.980000019, 0.980000019)
Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Container.BackgroundTransparency = 1.000
Container.Position = UDim2.new(0.980000019, 0, 0.980000019, 0)
Container.Size = UDim2.new(0.285248578, 0, 0.977886975, 0)

UIListLayout.Parent = Container
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.00999999978, 0)

function Notification:Create(Title, Description, Length, Color)
    local Color = (Color and ('rgb(%s, %s, %s)'):format(math.modf(Color.R * 255), math.modf(Color.G * 255), math.modf(Color.B * 255))) or 'rgb(3, 252, 148)'
    local Notification = Instance.new("TextButton")
    local Line = Instance.new("Frame")
    local Shadow = Instance.new("Folder")
    local Blur = Instance.new("ImageLabel")
    local Transparent = Instance.new("ImageLabel")
    local Ambient = Instance.new("ImageLabel")
    local TextContainer = Instance.new("Frame")
    local Text = Instance.new("TextLabel")

    Notification.Name = "Notification"
    Notification.Text = ""
    Notification.Parent = Container
    Notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Notification.BorderSizePixel = 0
    Notification.Position = UDim2.new(0.706601441, 0, 0.0122850118, 0)
    Notification.Size = UDim2.new(1, 0, 0.0427135676, 0)
    
    Line.Name = "Line"
    Line.Parent = Notification
    Line.AnchorPoint = Vector2.new(0, 1)
    Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0, 0, 1, 0)
    Line.Size = UDim2.new(1, 0, 0.0588235296, 0)
    
    Shadow.Name = "Shadow"
    Shadow.Parent = Notification
    
    Blur.Name = "Blur"
    Blur.Parent = Shadow
    Blur.AnchorPoint = Vector2.new(0.5, 0.5)
    Blur.BackgroundTransparency = 1.000
    Blur.Position = UDim2.new(0.5, 0, 0.5, 0)
    Blur.Size = UDim2.new(1.03, 0, 1.2, 0)
    Blur.Image = "rbxassetid://1316045217"
    Blur.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Blur.ImageTransparency = 0.860
    Blur.ScaleType = Enum.ScaleType.Slice
    Blur.SliceCenter = Rect.new(10, 10, 118, 118)
    
    Transparent.Name = "Transparent"
    Transparent.Parent = Shadow
    Transparent.AnchorPoint = Vector2.new(0.5, 0.5)
    Transparent.BackgroundTransparency = 1.000
    Transparent.Position = UDim2.new(0.5, 0, 0.5, 0)
    Transparent.Size = UDim2.new(1.03, 0, 1.2, 0)
    Transparent.Image = "rbxassetid://1316045217"
    Transparent.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Transparent.ImageTransparency = 0.880
    Transparent.ScaleType = Enum.ScaleType.Slice
    Transparent.SliceCenter = Rect.new(10, 10, 118, 118)
    
    Ambient.Name = "Ambient"
    Ambient.Parent = Shadow
    Ambient.AnchorPoint = Vector2.new(0.5, 0.5)
    Ambient.BackgroundTransparency = 1.000
    Ambient.Position = UDim2.new(0.5, 0, 0.5, 0)
    Ambient.Size = UDim2.new(1.03, 0, 1.2, 0)
    Ambient.Image = "rbxassetid://1316045217"
    Ambient.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Ambient.ImageTransparency = 0.800
    Ambient.ScaleType = Enum.ScaleType.Slice
    Ambient.SliceCenter = Rect.new(10, 10, 118, 118)
    
    TextContainer.Name = "TextContainer"
    TextContainer.Parent = Notification
    TextContainer.AnchorPoint = Vector2.new(0, 0.5)
    TextContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextContainer.BackgroundTransparency = 1.000
    TextContainer.Position = UDim2.new(0.0199999996, 0, 0.5, 0)
    TextContainer.Size = UDim2.new(0.980000019, 0, 1, 0)
    
    Text.Name = "Text"
    Text.Parent = TextContainer
    Text.AnchorPoint = Vector2.new(0, 0.5)
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(0, 0, 0.5, 0)
    Text.Size = UDim2.new(0.973760962, 0, 0.5, 0)
    Text.ZIndex = 3
    Text.Font = Enum.Font.RobotoMono
    Text.Text = ("<font color=\"%s\">%s</font><font color=\"rgb(255,255,255)\"> |</font> %s"):format(Color, Title or 'Title', Description or 'Description')
    Text.TextColor3 = Color3.fromRGB(210, 210, 210)
    Text.RichText = true
    Text.TextScaled = true
    Text.TextSize = 14.000
    Text.TextWrapped = true
    Text.TextXAlignment = Enum.TextXAlignment.Left
    
    local function CloseNotification()
        Notification:TweenSize(UDim2.fromScale(0, Notification.Size.Y.Scale), nil, Enum.EasingStyle.Linear, 0.3, nil, function()
            Notification:Destroy()
        end)

        local OldTime = os.clock()
        repeat game.RunService.Heartbeat:Wait() until os.clock() - OldTime >= 1
        
        Notification:Destroy()
    end

    Notification.MouseButton1Click:Connect(CloseNotification)

    Notification.MouseEnter:Connect(function()
        Notification.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    end)
    
    Notification.MouseLeave:Connect(function()
        Notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    end)

    local LineTween = TweenService:Create(Line, TweenInfo.new(Length or 3, Enum.EasingStyle.Linear), {Size = UDim2.fromScale(0, 0.05)})

    LineTween.Completed:Connect(CloseNotification)

    LineTween:Play()
end

-- Notification:Create('Title', 'Description', 3 -> Length, Color3.fromRGB(255, 255, 255) -> Optional custom color value
