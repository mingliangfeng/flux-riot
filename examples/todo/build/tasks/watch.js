var gulp = require('gulp')
var config = require('../config').watch

gulp.task('watch', config.tasks, function() {
  gulp.watch(config.src, config.tasks)
})
