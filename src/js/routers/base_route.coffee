riot = require 'riot'

riot.route.parser( (path)-> [path] )

regexTransfer = (mapper)->
  parts = mapper[0].split('/')
  regexParts = []
  for part in parts
    continue unless part and part.length > 0
    if part[0] == ':'
      regexParts.push '(.+?)'
    else
      regexParts.push part
  regex = ///^#{regexParts.join('\\/')}\/?$///i
  [regex, mapper[1]]

riot.route.to = (mapper_array)->
  regexFuncs = []
  regexFuncs.push(regexTransfer(mapper)) for mapper in mapper_array

  routes = (path)->
    for regexFunc in regexFuncs
      if m = path.match(regexFunc[0])
        return regexFunc[1].apply null, m.slice(1)

  riot.route routes

  { start: (r)-> riot.route.exec( r || routes) }
