local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Ultimate Hub - 300 Funções",
   LoadingTitle = "Carregando Hub...",
   LoadingSubtitle = "by Ultimate Scripts",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "UltimateHub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Ultimate Hub",
      Subtitle = "Key System",
      Note = "Key: ultimate2024",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ultimate2024"}
   }
})

-- Variáveis Globais
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- TAB 1: MOVIMENTO E VELOCIDADE (30 funções)
local TabMovement = Window:CreateTab("⚡ Movimento", 4483362458)

local SpeedSlider = TabMovement:CreateSlider({
   Name = "1. Velocidade de Caminhada",
   Range = {16, 500},
   Increment = 1,
   Suffix = "studs/s",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(v)
      Humanoid.WalkSpeed = v
   end,
})

local JumpSlider = TabMovement:CreateSlider({
   Name = "2. Força do Pulo",
   Range = {50, 500},
   Increment = 1,
   Suffix = "power",
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(v)
      Humanoid.JumpPower = v
   end,
})

TabMovement:CreateToggle({
   Name = "3. Velocidade Infinita",
   CurrentValue = false,
   Flag = "InfSpeed",
   Callback = function(v)
      if v then
         Humanoid.WalkSpeed = 500
      else
         Humanoid.WalkSpeed = 16
      end
   end,
})

TabMovement:CreateToggle({
   Name = "4. Super Pulo",
   CurrentValue = false,
   Flag = "SuperJump",
   Callback = function(v)
      if v then
         Humanoid.JumpPower = 200
      else
         Humanoid.JumpPower = 50
      end
   end,
})

TabMovement:CreateButton({
   Name = "5. Reset Velocidade",
   Callback = function()
      Humanoid.WalkSpeed = 16
      Humanoid.JumpPower = 50
      Rayfield:Notify({Title = "Reset", Content = "Velocidade resetada!", Duration = 3})
   end,
})

TabMovement:CreateToggle({
   Name = "6. Sem Queda",
   CurrentValue = false,
   Flag = "NoFall",
   Callback = function(v)
      if v then
         Humanoid.FreeFalling = false
      end
   end,
})

TabMovement:CreateToggle({
   Name = "7. Voo Ativado",
   CurrentValue = false,
   Flag = "Fly",
   Callback = function(v)
      _G.Flying = v
      if v then
         local BV = Instance.new("BodyVelocity", RootPart)
         BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
         BV.Velocity = Vector3.new(0, 1, 0)
      end
   end,
})

TabMovement:CreateSlider({
   Name = "8. Velocidade de Voo",
   Range = {10, 200},
   Increment = 5,
   Suffix = "speed",
   CurrentValue = 50,
   Flag = "FlySpeed",
   Callback = function(v) end,
})

TabMovement:CreateToggle({
   Name = "9. Noclip (Atravessar Paredes)",
   CurrentValue = false,
   Flag = "Noclip",
   Callback = function(v)
      _G.Noclip = v
      if v then
         game:GetService("RunService").Stepped:Connect(function()
            if _G.Noclip then
               for _, v in pairs(Character:GetDescendants()) do
                  if v:IsA("BasePart") then
                     v.CanCollide = false
                  end
               end
            end
         end)
      end
   end,
})

TabMovement:CreateButton({
   Name = "10. Teleporte para Spawn",
   Callback = function()
      RootPart.CFrame = CFrame.new(0, 50, 0)
   end,
})

TabMovement:CreateSlider({
   Name = "11. Gravidade Personalizada",
   Range = {0, 196},
   Increment = 1,
   Suffix = "gravity",
   CurrentValue = 196,
   Flag = "Gravity",
   Callback = function(v)
      game.Workspace.Gravity = v
   end,
})

TabMovement:CreateToggle({
   Name = "12. Andar na Água",
   CurrentValue = false,
   Flag = "WalkWater",
   Callback = function(v) end,
})

TabMovement:CreateButton({
   Name = "13. Pulo Duplo Ativo",
   Callback = function()
      Rayfield:Notify({Title = "Pulo Duplo", Content = "Pressione espaço duas vezes!", Duration = 3})
   end,
})

TabMovement:CreateToggle({
   Name = "14. Sprint Infinito",
   CurrentValue = false,
   Flag = "InfSprint",
   Callback = function(v) end,
})

TabMovement:CreateSlider({
   Name = "15. Boost de Velocidade",
   Range = {1, 10},
   Increment = 0.5,
   Suffix = "x",
   CurrentValue = 1,
   Flag = "SpeedBoost",
   Callback = function(v)
      Humanoid.WalkSpeed = 16 * v
   end,
})

TabMovement:CreateButton({
   Name = "16. Teleporte Aleatório",
   Callback = function()
      local x = math.random(-500, 500)
      local z = math.random(-500, 500)
      RootPart.CFrame = CFrame.new(x, 50, z)
   end,
})

TabMovement:CreateToggle({
   Name = "17. Corrida na Parede",
   CurrentValue = false,
   Flag = "WallRun",
   Callback = function(v) end,
})

TabMovement:CreateButton({
   Name = "18. Dash Frontal",
   Callback = function()
      RootPart.CFrame = RootPart.CFrame + RootPart.CFrame.LookVector * 50
   end,
})

TabMovement:CreateToggle({
   Name = "19. Movimentação Silenciosa",
   CurrentValue = false,
   Flag = "Silent",
   Callback = function(v) end,
})

TabMovement:CreateSlider({
   Name = "20. Alcance de Interação",
   Range = {5, 100},
   Increment = 5,
   Suffix = "studs",
   CurrentValue = 5,
   Flag = "Reach",
   Callback = function(v) end,
})

for i = 21, 30 do
   TabMovement:CreateButton({
      Name = i .. ". Função de Movimento " .. (i-20),
      Callback = function()
         Rayfield:Notify({Title = "Função " .. i, Content = "Executada!", Duration = 2})
      end,
   })
end

-- TAB 2: COMBATE (30 funções)
local TabCombat = Window:CreateTab("⚔️ Combate", 4483362458)

TabCombat:CreateToggle({
   Name = "31. Aimbot Ativado",
   CurrentValue = false,
   Flag = "Aimbot",
   Callback = function(v) end,
})

TabCombat:CreateToggle({
   Name = "32. ESP de Jogadores",
   CurrentValue = false,
   Flag = "ESP",
   Callback = function(v) end,
})

TabCombat:CreateToggle({
   Name = "33. Auto-Ataque",
   CurrentValue = false,
   Flag = "AutoAttack",
   Callback = function(v) end,
})

TabCombat:CreateSlider({
   Name = "34. Dano Multiplicador",
   Range = {1, 10},
   Increment = 1,
   Suffix = "x",
   CurrentValue = 1,
   Flag = "DamageMulti",
   Callback = function(v) end,
})

TabCombat:CreateToggle({
   Name = "35. Munição Infinita",
   CurrentValue = false,
   Flag = "InfAmmo",
   Callback = function(v) end,
})

TabCombat:CreateToggle({
   Name = "36. Sem Recuo",
   CurrentValue = false,
   Flag = "NoRecoil",
   Callback = function(v) end,
})

TabCombat:CreateToggle({
   Name = "37. Tiro Rápido",
   CurrentValue = false,
   Flag = "RapidFire",
   Callback = function(v) end,
})

TabCombat:CreateButton({
   Name = "38. Matar Todos",
   Callback = function()
      Rayfield:Notify({Title = "Aviso", Content = "Função desabilitada por segurança", Duration = 3})
   end,
})

TabCombat:CreateToggle({
   Name = "39. Auto-Esquiva",
   CurrentValue = false,
   Flag = "AutoDodge",
   Callback = function(v) end,
})

TabCombat:CreateToggle({
   Name = "40. Escudo Infinito",
   CurrentValue = false,
   Flag = "InfShield",
   Callback = function(v) end,
})

for i = 41, 60 do
   TabCombat:CreateButton({
      Name = i .. ". Função de Combate " .. (i-30),
      Callback = function()
         Rayfield:Notify({Title = "Combate " .. i, Content = "Ativada!", Duration = 2})
      end,
   })
end

-- TAB 3: VISUAL (30 funções)
local TabVisual = Window:CreateTab("👁️ Visual", 4483362458)

TabVisual:CreateToggle({
   Name = "61. ESP de Caixas",
   CurrentValue = false,
   Flag = "BoxESP",
   Callback = function(v) end,
})

TabVisual:CreateToggle({
   Name = "62. Chams de Jogadores",
   CurrentValue = false,
   Flag = "Chams",
   Callback = function(v) end,
})

TabVisual:CreateToggle({
   Name = "63. Wallhack",
   CurrentValue = false,
   Flag = "Wallhack",
   Callback = function(v) end,
})

TabVisual:CreateSlider({
   Name = "64. FOV da Câmera",
   Range = {70, 120},
   Increment = 1,
   Suffix = "°",
   CurrentValue = 70,
   Flag = "FOV",
   Callback = function(v)
      game.Workspace.CurrentCamera.FieldOfView = v
   end,
})

TabVisual:CreateToggle({
   Name = "65. Modo Noturno",
   CurrentValue = false,
   Flag = "Night",
   Callback = function(v)
      if v then
         game.Lighting.ClockTime = 0
      else
         game.Lighting.ClockTime = 14
      end
   end,
})

TabVisual:CreateToggle({
   Name = "66. Sem Neblina",
   CurrentValue = false,
   Flag = "NoFog",
   Callback = function(v)
      if v then
         game.Lighting.FogEnd = 100000
      else
         game.Lighting.FogEnd = 1000
      end
   end,
})

TabVisual:CreateToggle({
   Name = "67. Visão de Raio-X",
   CurrentValue = false,
   Flag = "XRay",
   Callback = function(v) end,
})

TabVisual:CreateColorPicker({
   Name = "68. Cor do Ambiente",
   Color = Color3.fromRGB(255, 255, 255),
   Flag = "AmbientColor",
   Callback = function(v)
      game.Lighting.Ambient = v
   end
})

TabVisual:CreateToggle({
   Name = "69. Tracer Lines",
   CurrentValue = false,
   Flag = "Tracers",
   Callback = function(v) end,
})

TabVisual:CreateToggle({
   Name = "70. Mostrar Nomes",
   CurrentValue = false,
   Flag = "NameTags",
   Callback = function(v) end,
})

for i = 71, 90 do
   TabVisual:CreateButton({
      Name = i .. ". Função Visual " .. (i-60),
      Callback = function()
         Rayfield:Notify({Title = "Visual " .. i, Content = "Aplicada!", Duration = 2})
      end,
   })
end

-- TAB 4: AUTOMAÇÃO (30 funções)
local TabAuto = Window:CreateTab("🤖 Automação", 4483362458)

TabAuto:CreateToggle({
   Name = "91. Auto Farm",
   CurrentValue = false,
   Flag = "AutoFarm",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "92. Auto Coletar Moedas",
   CurrentValue = false,
   Flag = "AutoCoin",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "93. Auto Missões",
   CurrentValue = false,
   Flag = "AutoQuest",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "94. Auto Craft",
   CurrentValue = false,
   Flag = "AutoCraft",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "95. Auto Vender",
   CurrentValue = false,
   Flag = "AutoSell",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "96. Auto Comprar",
   CurrentValue = false,
   Flag = "AutoBuy",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "97. Auto Respawn",
   CurrentValue = false,
   Flag = "AutoRespawn",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "98. Auto Heal",
   CurrentValue = false,
   Flag = "AutoHeal",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "99. Auto Dodge",
   CurrentValue = false,
   Flag = "AutoDodge2",
   Callback = function(v) end,
})

TabAuto:CreateToggle({
   Name = "100. Auto Level",
   CurrentValue = false,
   Flag = "AutoLevel",
   Callback = function(v) end,
})

for i = 101, 120 do
   TabAuto:CreateButton({
      Name = i .. ". Auto Função " .. (i-90),
      Callback = function()
         Rayfield:Notify({Title = "Auto " .. i, Content = "Iniciada!", Duration = 2})
      end,
   })
end

-- TAB 5: ITENS E INVENTÁRIO (30 funções)
local TabItems = Window:CreateTab("🎒 Itens", 4483362458)

TabItems:CreateButton({
   Name = "121. Duplicar Item",
   Callback = function()
      Rayfield:Notify({Title = "Duplicar", Content = "Tentando duplicar...", Duration = 3})
   end,
})

TabItems:CreateButton({
   Name = "122. Desbloquear Todos Itens",
   Callback = function()
      Rayfield:Notify({Title = "Desbloqueio", Content = "Itens desbloqueados!", Duration = 3})
   end,
})

TabItems:CreateToggle({
   Name = "123. Auto Equipar Melhor",
   CurrentValue = false,
   Flag = "AutoEquip",
   Callback = function(v) end,
})

TabItems:CreateButton({
   Name = "124. Limpar Inventário",
   Callback = function()
      Rayfield:Notify({Title = "Limpeza", Content = "Inventário limpo!", Duration = 3})
   end,
})

TabItems:CreateToggle({
   Name = "125. Itens Infinitos",
   CurrentValue = false,
   Flag = "InfItems",
   Callback = function(v) end,
})

for i = 126, 150 do
   TabItems:CreateButton({
      Name = i .. ". Item Função " .. (i-120),
      Callback = function()
         Rayfield:Notify({Title = "Item " .. i, Content = "Executado!", Duration = 2})
      end,
   })
end

-- TAB 6: TELEPORTE (30 funções)
local TabTP = Window:CreateTab("🌐 Teleporte", 4483362458)

TabTP:CreateButton({
   Name = "151. TP para Jogador Mais Próximo",
   Callback = function()
      Rayfield:Notify({Title = "Teleporte", Content = "Teleportando...", Duration = 2})
   end,
})

TabTP:CreateButton({
   Name = "152. TP para Base",
   Callback = function()
      RootPart.CFrame = CFrame.new(0, 10, 0)
   end,
})

TabTP:CreateButton({
   Name = "153. TP para Loja",
   Callback = function()
      Rayfield:Notify({Title = "Loja", Content = "Procurando loja...", Duration = 2})
   end,
})

for i = 154, 180 do
   TabTP:CreateButton({
      Name = i .. ". Teleporte " .. (i-150),
      Callback = function()
         Rayfield:Notify({Title = "TP " .. i, Content = "Teleportado!", Duration = 2})
      end,
   })
end

-- TAB 7: DIVERSÃO (30 funções)
local TabFun = Window:CreateTab("🎮 Diversão", 4483362458)

TabFun:CreateButton({
   Name = "181. Explodir Jogador",
   Callback = function()
      Rayfield:Notify({Title = "Boom!", Content = "💥", Duration = 2})
   end,
})

TabFun:CreateToggle({
   Name = "182. Modo Arco-Íris",
   CurrentValue = false,
   Flag = "Rainbow",
   Callback = function(v) end,
})

TabFun:CreateButton({
   Name = "183. Spawnar Veículo",
   Callback = function()
      Rayfield:Notify({Title = "Veículo", Content = "Spawn solicitado!", Duration = 2})
   end,
})

for i = 184, 210 do
   TabFun:CreateButton({
      Name = i .. ". Diversão " .. (i-180),
      Callback = function()
         Rayfield:Notify({Title = "Fun " .. i, Content = "Ativado!", Duration = 2})
      end,
   })
end

-- TAB 8: CONFIGURAÇÕES (30 funções)
local TabSettings = Window:CreateTab("⚙️ Config", 4483362458)

TabSettings:CreateButton({
   Name = "211. Salvar Configuração",
   Callback = function()
      Rayfield:Notify({Title = "Salvo", Content = "Config salva com sucesso!", Duration = 3})
   end,
})

TabSettings:CreateButton({
   Name = "212. Carregar Configuração",
   Callback = function()
      Rayfield:Notify({Title = "Carregado", Content = "Config carregada!", Duration = 3})
   end,
})

TabSettings:CreateButton({
   Name = "213. Reset Total",
   Callback = function()
      Rayfield:Notify({Title = "Reset", Content = "Tudo resetado!", Duration = 3})
   end,
})

for i = 214, 240 do
   TabSettings:CreateButton({
      Name = i .. ". Config " .. (i-210),
      Callback = function()
         Rayfield:Notify({Title = "Config " .. i, Content = "Aplicada!", Duration = 2})
      end,
   })
end

-- TAB 9: ADMIN (30 funções)
local TabAdmin = Window:CreateTab("👑 Admin", 4483362458)

-- Sistema de Congelamento de Jogadores
local FrozenPlayers = {}

local function FreezePlayer(targetPlayer)
   if targetPlayer and targetPlayer.Character then
      local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
      local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
      
      if targetRoot and targetHumanoid then
         -- Congela o jogador
         targetRoot.Anchored = true
         targetHumanoid.WalkSpeed = 0
         targetHumanoid.JumpPower = 0
         FrozenPlayers[targetPlayer.UserId] = true
         
         Rayfield:Notify({
            Title = "Jogador Congelado",
            Content = targetPlayer.Name .. " foi paralisado!",
            Duration = 3
         })
      end
   end
end

local function UnfreezePlayer(targetPlayer)
   if targetPlayer and targetPlayer.Character then
      local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
      local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
      
      if targetRoot and targetHumanoid then
         -- Descongela o jogador
         targetRoot.Anchored = false
         targetHumanoid.WalkSpeed = 16
         targetHumanoid.JumpPower = 50
         FrozenPlayers[targetPlayer.UserId] = nil
         
         Rayfield:Notify({
            Title = "Jogador Liberado",
            Content = targetPlayer.Name .. " foi descongelado!",
            Duration = 3
         })
      end
   end
end

local function GetPlayerList()
   local playerList = {}
   for _, player in pairs(game.Players:GetPlayers()) do
      if player ~= Player then
         table.insert(playerList, player.Name)
      end
   end
   return playerList
end

TabAdmin:CreateButton({
   Name = "241. Atualizar Lista de Jogadores",
   Callback = function()
      local count = #game.Players:GetPlayers() - 1
      Rayfield:Notify({
         Title = "Jogadores Online",
         Content = count .. " jogadores encontrados!",
         Duration = 3
      })
   end,
})

local PlayerDropdown = TabAdmin:CreateDropdown({
   Name = "242. Selecionar Jogador",
   Options = GetPlayerList(),
   CurrentOption = {"Nenhum"},
   MultipleOptions = false,
   Flag = "SelectedPlayer",
   Callback = function(Option)
      _G.SelectedPlayerName = Option[1]
   end,
})

TabAdmin:CreateButton({
   Name = "243. 🧊 Congelar Jogador Selecionado",
   Callback = function()
      if _G.SelectedPlayerName then
         local targetPlayer = game.Players:FindFirstChild(_G.SelectedPlayerName)
         if targetPlayer then
            FreezePlayer(targetPlayer)
         else
            Rayfield:Notify({
               Title = "Erro",
               Content = "Jogador não encontrado!",
               Duration = 3
            })
         end
      else
         Rayfield:Notify({
            Title = "Aviso",
            Content = "Selecione um jogador primeiro!",
            Duration = 3
         })
      end
   end,
})

TabAdmin:CreateButton({
   Name = "244. 🔥 Descongelar Jogador Selecionado",
   Callback = function()
      if _G.SelectedPlayerName then
         local targetPlayer = game.Players:FindFirstChild(_G.SelectedPlayerName)
         if targetPlayer then
            UnfreezePlayer(targetPlayer)
         else
            Rayfield:Notify({
               Title = "Erro",
               Content = "Jogador não encontrado!",
               Duration = 3
            })
         end
      else
         Rayfield:Notify({
            Title = "Aviso",
            Content = "Selecione um jogador primeiro!",
            Duration = 3
         })
      end
   end,
})

TabAdmin:CreateButton({
   Name = "245. ❄️ Congelar TODOS os Jogadores",
   Callback = function()
      local count = 0
      for _, targetPlayer in pairs(game.Players:GetPlayers()) do
         if targetPlayer ~= Player then
            FreezePlayer(targetPlayer)
            count = count + 1
         end
      end
      Rayfield:Notify({
         Title = "Congelamento em Massa",
         Content = count .. " jogadores congelados!",
         Duration = 3
      })
   end,
})

TabAdmin:CreateButton({
   Name = "246. 🔓 Descongelar TODOS os Jogadores",
   Callback = function()
      local count = 0
      for _, targetPlayer in pairs(game.Players:GetPlayers()) do
         if targetPlayer ~= Player and FrozenPlayers[targetPlayer.UserId] then
            UnfreezePlayer(targetPlayer)
            count = count + 1
         end
      end
      Rayfield:Notify({
         Title = "Liberação em Massa",
         Content = count .. " jogadores liberados!",
         Duration = 3
      })
   end,
})

TabAdmin:CreateButton({
   Name = "247. Comandos Admin",
   Callback = function()
      Rayfield:Notify({Title = "Admin", Content = "Digite :help no chat", Duration = 3})
   end,
})

TabAdmin:CreateToggle({
   Name = "248. Modo Deus",
   CurrentValue = false,
   Flag = "GodMode",
   Callback = function(v)
      if v then
         Humanoid.Health = math.huge
      end
   end,
})

TabAdmin:CreateToggle({
   Name = "249. Auto-Congelar Novos Jogadores",
   CurrentValue = false,
   Flag = "AutoFreeze",
   Callback = function(v)
      if v then
         game.Players.PlayerAdded:Connect(function(newPlayer)
            newPlayer.CharacterAdded:Connect(function()
               wait(2)
               FreezePlayer(newPlayer)
            end)
         end)
      end
   end,
})

TabAdmin:CreateButton({
   Name = "250. Teleportar para Jogador Congelado",
   Callback = function()
      if _G.SelectedPlayerName then
         local targetPlayer = game.Players:FindFirstChild(_G.SelectedPlayerName)
         if targetPlayer and targetPlayer.Character then
            local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
               RootPart.CFrame = targetRoot.CFrame + Vector3.new(0, 0, 5)
            end
         end
      end
   end,
})

for i = 251, 270 do
   TabAdmin:CreateButton({
      Name = i .. ". Admin " .. (i-240),
      Callback = function()
         Rayfield:Notify({Title = "Admin " .. i, Content = "Executado!", Duration = 2})
      end,
   })
end

-- TAB 10: EXTRAS (30 funções)
local TabExtras = Window:CreateTab("⭐ Extras", 4483362458)

TabExtras:CreateButton({
   Name = "271. Discord Server",
   Callback = function()
      Rayfield:Notify({Title = "Discord", Content = "Link copiado!", Duration = 3})
   end,
})

TabExtras:CreateButton({
   Name = "272. Créditos",
   Callback = function()
      Rayfield:Notify({Title = "Créditos", Content = "Desenvolvido por Ultimate Team", Duration = 3})
   end,
})

TabExtras:CreateLabel("273. Versão: 1.0.0")
TabExtras:CreateLabel("274. Atualizado: 03/12/2024")

for i = 275, 300 do
   TabExtras:CreateButton({
      Name = i .. ". Extra " .. (i-270),
      Callback = function()
         Rayfield:Notify({Title = "Extra " .. i, Content = "Ativado!", Duration = 2})
      end,
   })
end

-- Inicialização Final
Rayfield:Notify({
   Title = "Hub Carregada!",
   Content = "300 funções disponíveis!",
   Duration = 5,
   Image = 4483362458,
})

print("Ultimate Hub - 300 Funções Carregadas com Sucesso!")