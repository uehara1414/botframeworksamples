builder = require 'botbuilder'

bot = new builder.TextBot
bot.add '/', (session) ->
    session.send 'Hello World'

bot.listenStdin()
