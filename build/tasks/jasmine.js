var gulp = require('gulp')
var gutil = require('gulp-util')
var jasmine = require('gulp-jasmine-phantom')
var config = require('../config').jasmine
 
gulp.task('jasmine', function () {
  return gulp.src(config.spec).pipe(jasmine({
  	integration: true
  }));
});
