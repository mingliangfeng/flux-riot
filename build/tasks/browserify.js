var browserify = require('browserify')
var gulp = require('gulp')
var source = require('vinyl-source-stream')
var buffer = require('vinyl-buffer')

var gutil = require('gulp-util')
var dist = require('../config').dist
var config = require('../config').browserify

gulp.task('browserify', [ 'build' ], function () {
  // set up the browserify instance on a task basis
  var b = browserify({
    entries: config.entry,
    debug: true
  })

  return b.bundle()
    .pipe(source(config.filename))
    .pipe(buffer())
    .on('error', gutil.log)
    .pipe(gulp.dest(dist.dist));
})
