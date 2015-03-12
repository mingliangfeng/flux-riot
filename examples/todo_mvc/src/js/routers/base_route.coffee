riot = require 'riot'

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

regexFuncs = []
route = (path)->
  for regexFunc in regexFuncs
    if m = path.match(regexFunc[0])
      return regexFunc[1].apply null, m.slice(1)

routes = ->
  return unless arguments.length > 0
  regexFuncs.push [ '', arguments[0] ]
  for i in [1...arguments.length] by 2
    regexFuncs.push regexTransfer(arguments[i], arguments[i + 1])

riot.route.parser( (path)-> [path] )
riot.route route

module.exports =
  start: (r)-> riot.route.exec(r || route)
  routes: routes
