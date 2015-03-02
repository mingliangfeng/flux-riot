var gulp = require('gulp')
var less = require('gulp-less')
var connect = require('gulp-connect')
var config = require('../config.js').less

gulp.task('styles', function() {
  gulp.src(config.src)
    .pipe(less())
    .pipe(gulp.dest(config.dest))
    .pipe(connect.reload())
})
