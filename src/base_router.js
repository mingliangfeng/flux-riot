flux_riot.BaseRouter = (function() {

  var regexFuncs = []

  function regexTransfer(path, callback) {
    var parts = path.split('/')
    var regexParts = []
    for (var i = 0; i < parts.length; i++) {
      var part = parts[i]
      if (!(part && part.length > 0)) continue

      if (part[0] === ':') {
        regexParts.push('(.+?)')
      } else {
        regexParts.push(part)
      }
    }
    var regex = RegExp("^" + (regexParts.join('\\/')) + "\\/?$", "i")
    return [regex, callback]
  }

  function route(path) {
    for (var i = 0; i < regexFuncs.length; i++) {
      var regexFunc = regexFuncs[j]
      var m = path.match(regexFunc[0])
      if (m) return regexFunc[1].apply(null, m.slice(1))
    }
  }

  function routes() {
    if (!(arguments.length > 0)) return

    regexFuncs.push([ '', arguments[0] ])
    for (var i; i < regexFuncs.length; i += 2) {
      regexFuncs.push(regexTransfer(arguments[i], arguments[i + 1]))
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
