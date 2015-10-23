flux_riot.BaseRouter = (function() {

  var riot = require('riot/riot')
  var regexFuncs = []

  function regexTransfer(path) {
    var parts = path.split('/')
    var regexParts = []
    for (var i = 0; i < parts.length; i++) {
      var part = parts[i]
      if (!(part && part.length > 0)) continue

      if (part[0] === ':') {
        regexParts.push('((?:(?!\\/).)+?)')
      } else {
        regexParts.push(part)
      }
    }
    return RegExp("^" + (regexParts.join('\\/')) + "\\/?$", "i")
  }

  function route(path) {
    if (regexFuncs.length === 0) return

    if (path === '') return regexFuncs[0][1].apply(null, [])

    for (var i = 1; i < regexFuncs.length; i++) {
      var regexFunc = regexFuncs[i]
      var m = path.match(regexFunc[0])
      if (m !== null) return regexFunc[1].apply(null, m.slice(1))
    }
  }

  function routes() {
    if (!(arguments.length > 0)) return

    regexFuncs.push([ '', arguments[0] ])
    for (var i = 1; i < arguments.length; i += 2) {
      regex = regexTransfer(arguments[i])
      regexFuncs.push([ regex, arguments[i + 1] ])
    }
  }

  function start(r) {
    return riot.route.exec(r || route)
  }

  riot.route.parser(function(path) { return [path] })
  riot.route(route)

  return {
    routes: routes,
    start: start
  }

})()
