var gulp = require('gulp')
var karma = require('karma').Server
var config = require('../config').karma

gulp.task('karma', ['browserify'], function (done) {
  new karma({
    configFile: config.config_file,
    singleRun: true
  }, done).start()
})
