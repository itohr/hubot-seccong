# Description:
#   Hubot script to call chat bot API.

module.exports = (robot) ->

  robot.hear /(.*)/i, (msg) ->
    statement = msg.match[1]
    uid = msg.message.user.id
    url = process.env.SECCONG_SERVER_URL

    request = require('request')
    request.post
      url: url
      json:
        statement: statement 
        uid: uid
      , (err, res, body) ->
        bot_resp = body["response"].join("\n")
        if body["chips"]
          chips = body["chips"].join(", ")
          bot_resp = bot_resp + "\n" + "ヒント：" + chips
        msg.send bot_resp 
