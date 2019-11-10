require "discordcr"
require "json"
require "dotenv"

Dotenv.load

PREFIX = "!"
dicioFile = File.read("assets/dicio.json")
dicio = Hash(String, String).from_json(dicioFile)
client = Discord::Client.new(token: "Bot #{ENV["DISCORD_KEY"]}", client_id: ENV["CLIENT_ID"].to_u64)

client.on_message_create do |payload|
  command = payload.content
  case command
  when PREFIX + "help"
    client.create_message(client.create_dm(payload.author.id).id, "Ainda sem ajuda")
  when PREFIX + "about"
    block = "```\nBot developed by discordcr\n```"
    client.create_message(payload.channel_id, block)
  when .starts_with? PREFIX + "dicio"
    suffix = command.split(' ')[1..-1].join(" ").downcase
    client.create_message(payload.channel_id, dicio[suffix]? ? dicio[suffix] : "Sei fala esse trem nao")
  end
end

client.run
