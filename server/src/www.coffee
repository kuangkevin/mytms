#!/usr/bin/env node


app = require('./libs/app')
debug = require('debug')('src:server')
http = require('http')
config = require('./config/config')

port = config.port
console.log("port="+port)
app.set('port', port)


server = http.createServer(app)

onListening = ->
  addr = server.address()
  if typeof addr is 'string'
    bind = 'pipe ' + addr
  else
    bind =  'port ' + addr.port
  console.log(bind)
  debug('Listening on ' + bind)


onError=(error)->
  if error.syscall isnt 'listen'
    throw error
  if typeof port is 'string'
    bind = 'Pipe ' + port
  else
    bind = 'Port ' + port

  switch (error.code)
    when 'EACCES'
      console.error(bind + ' requires elevated privileges')
      process.exit(1)
      break
    when 'EADDRINUSE'
      console.error(bind + ' is already in use')
      process.exit(1)
      break
    else
      throw error


server.on('error', onError)
server.on('listening', onListening)
server.listen(port)