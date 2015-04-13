var coffee = require('coffee-script')
var riot = require('riot/compiler')
var preamble = "var riot = require('riot/riot')\n"

module.exports = {
  process: function(src, path) {
    if (path.match(/\.coffee$/)) {
      return coffee.compile(src, {'bare': true})
    }
    if (path.match(/\.tag$/)) {
      return preamble + riot.compile(src)
    }
    return src
  }
}
