var gulp = require('gulp');
var sass = require('gulp-sass');
var less = require('gulp-less');
var connect = require('gulp-connect');
var config_less = require('../config.js').less;

gulp.task('styles', function() {
  gulp.src(config_less.src)
    .pipe(less())
    .pipe(gulp.dest(config_less.dest))
    .pipe(connect.reload());
});
