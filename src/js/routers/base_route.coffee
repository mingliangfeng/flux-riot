riot = require 'riot'

riot.route.parser( (path)-> [path] )

regexTransfer = (path, callback)->
  parts = path.split('/')
  regexParts = []
  for part in parts
    continue unless part and part.length > 0
    if part[0] == ':'
      regexParts.push '(.+?)'
    else
      regexParts.push part
  regex = ///^#{regexParts.join('\\/')}\/?$///i
  [regex, callback]

riot.route.to = ->
  regexFuncs = []
  for i in [0...arguments.length] by 2
    regexFuncs.push regexTransfer(arguments[i], arguments[i + 1])

  routes = (path)->
    for regexFunc in regexFuncs
      if m = path.match(regexFunc[0])
        return regexFunc[1].apply null, m.slice(1)

  riot.route routes

  { start: (r)-> riot.route.exec(r || routes) }
