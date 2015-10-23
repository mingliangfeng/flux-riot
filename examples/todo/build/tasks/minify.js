var gulp = require('gulp')
var uglify = require('gulp-uglify')
var rename = require("gulp-rename")
var config = require('../config').minify

gulp.task('minify', function () {
   gulp.src(config.src)
      .pipe(uglify())
      .pipe(rename(config.minName))
      .pipe(gulp.dest(config.dest))
})
