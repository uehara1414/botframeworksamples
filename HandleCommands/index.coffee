builder = require 'botbuilder'

bot = new builder.TextBot

bot.add '/',
  new builder.CommandDialog()
    .matches '^set name', builder.DialogAction.beginDialog '/profile'
    .matches '^quit', builder.DialogAction.endDialog()
    .onDefault (session) ->
      if session.userData.name is undefined
        session.beginDialog '/profile'
      else
        session.send "Hello #{session.userData.name}"

bot.add '/profile', [
  (session) ->
    if session.userData.name?
      builder.Prompts.text session, "What whould you like to change it to?"
    else
      builder.Prompts.text session, "Hi! What is your name?"
  (session, results) ->
    session.userData.name = results.response
    session.endDialog()
]

bot.listenStdin()
