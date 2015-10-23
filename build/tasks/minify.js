var gulp = require('gulp')
var uglify = require('gulp-uglify')
var rename = require("gulp-rename")
var name = require('../config').name

gulp.task('minify', function () {
   gulp.src(name.js)
      .pipe(uglify())
      .pipe(rename(name.js_min))
      .pipe(gulp.dest('.'))
})
