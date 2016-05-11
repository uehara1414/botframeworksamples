Botkit = require 'botkit'
builder = require 'botbuilder'

controller = Botkit.slackbot()
bot = controller.spawn {
  token: "your SlackBot API Token"
}

slackBot = new builder.SlackBot controller, bot
slackBot.add '/', (session) ->
  session.send 'Hello World'

slackBot.listenForMentions()

bot.startRTM (err, bot, payload) ->
  if err
    throw new Error 'Could not connect to Slack'
