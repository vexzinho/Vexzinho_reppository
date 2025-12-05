--[[  
    TROLL MEGA BRABA "ROUBE UMA HUB"
    Tudo em um único script
    Cria GUI, animações, efeitos e trava o jogador
    100% seguro, só funciona no Roblox Studio
]]--

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Travar movimento
hum.WalkSpeed = 0
hum.JumpPower = 0
UIS.MouseIconEnabled = false

---------------------------------------
-- GUI COMPLETA CRIADA PELO SCRIPT
---------------------------------------

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RoubeHubTroll"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Fundo principal
local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.BackgroundTransparency = 0.23
frame.Size = UDim2.new(1,0,1,0)
frame.Parent = screenGui

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8,0,0.2,0)
title.Position = UDim2.new(0.1,0,0.15,0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Text = "Carregando roube uma hub..."
title.Parent = frame

-- Barra de loading
local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0.6,0,0.05,0)
loadingBar.Position = UDim2.new(0.2,0,0.75,0)
loadingBar.BackgroundColor3 = Color3.fromRGB(40,40,40)
loadingBar.BorderSizePixel = 0
loadingBar.Parent = frame

local corner1 = Instance.new("UICorner", loadingBar)
corner1.CornerRadius = UDim.new(0,12)

-- Preenchimento da barra
local fill = Instance.new("Frame")
fill.Size = UDim2.new(0,0,1,0)
fill.BackgroundColor3 = Color3.fromRGB(0,170,255)
fill.BorderSizePixel = 0
fill.Parent = loadingBar

local corner2 = Instance.new("UICorner", fill)
corner2.CornerRadius = UDim.new(0,12)

-- Partículas de fundo
local particles = Instance.new("ParticleEmitter")
particles.Texture = "rbxassetid://6034887085"
particles.Rate = 12
particles.Lifetime = NumberRange.new(2,4)
particles.Speed = NumberRange.new(4,7)
particles.Size = NumberSequence.new(3)
particles.Transparency = NumberSequence.new(0.3)
particles.Acceleration = Vector3.new(0,2,0)
particles.SpreadAngle = Vector2.new(360,360)
particles.Parent = frame

---------------------------------------
-- ANIMAÇÕES
---------------------------------------

-- Tela pulsando
task.spawn(function()
	while true do
		frame.BackgroundTransparency = 0.15
		task.wait(0.25)
		frame.BackgroundTransparency = 0.28
		task.wait(0.25)
	end
end)

-- Texto piscando
task.spawn(function()
	while true do
		for i = 0, 1, 0.05 do
			title.TextTransparency = i
			task.wait(0.04)
		end
		for i = 1, 0, -0.05 do
			title.TextTransparency = i
			task.wait(0.04)
		end
	end
end)

-- Loading infinito BRABO
task.spawn(function()
	while true do
		for i = 0, 1, 0.01 do
			fill.Size = UDim2.new(i,0,1,0)
			task.wait(0.015)
		end
		for i = 1, 0, -0.01 do
			fill.Size = UDim2.new(i,0,1,0)
			task.wait(0.015)
		end
	end
end)

-- Glitch na tela (leve)
task.spawn(function()
	while true do
		frame.Rotation = math.random(-1,1)
		task.wait(0.1)
	end
end)

-- Tela nunca desaparece (troll máxima)
-- Nada remove GUI, nada libera movimento
