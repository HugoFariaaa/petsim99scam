local HttpService = game:GetService("HttpService")

-- Substitua estas informações pelas suas
local discordBotToken = "MTI3NDY4ODgzNjU5NjY2NjQwMQ.GAEurY.qntp064Jjdn43jwpK-bhj91tpYz3L24YJzhOho"
local discordChannelId = "1283220715373461661"

-- Função para enviar a mensagem para o canal do Discord
local function sendDiscordMessage(playerName, playerLink)
  local messageData = {
    content = "",
    embeds = {
      {
        title = "Novo Jogador!",
        description = "O jogador " .. playerName .. " executou o script!",
        url = playerLink,
        color = 0x00FF00,
        fields = {
          {
            name = "Nome do Jogador",
            value = playerName,
            inline = true
          },
          {
            name = "Link do Perfil",
            value = playerLink,
            inline = true
          }
        }
      }
    }
  }

  local headers = {
    ["Content-Type"] = "application/json",
    ["Authorization"] = "Bot " .. discordBotToken
  }

  local url = "https://discord.com/api/v10/channels/" .. discordChannelId .. "/messages"

  HttpService:PostAsync(url, HttpService:JSONEncode(messageData), headers)
end

-- Função que é executada quando o script é iniciado
function onStarted()
  local player = game.Players.LocalPlayer
  local playerName = player.Name
  local playerLink = "https://www.roblox.com/users/" .. player.UserId

  sendDiscordMessage(playerName, playerLink)
end

-- Chame a função onStarted quando o script é iniciado
onStarted()
