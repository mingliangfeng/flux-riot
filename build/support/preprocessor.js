var compiler = require('riot/compiler')
var coffee = require('coffee-script')
var preamble = "var riot = require('riot')\n"

module.exports = {
  process: function(src, path) {
    if (coffee.helpers.isCoffee(path)) {
      return coffee.compile(src, {'bare': true})
    }
    if (path.match(/\.tag$/)) {
      return preamble + compiler.compile(src)
    }
    return src
  }
}
