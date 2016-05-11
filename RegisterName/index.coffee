builder = require 'botbuilder'

bot = new builder.TextBot

bot.add '/', (session) ->
  if session.userData.name is undefined
    session.beginDialog '/profile'
  else
    session.send "Hello #{session.userData.name}"

bot.add '/profile', [
  (session) ->
    builder.Prompts.text session, 'Hi! What is your name?'
  (session, results) ->
    session.userData.name = results.response
    session.endDialog()
]

bot.listenStdin()
