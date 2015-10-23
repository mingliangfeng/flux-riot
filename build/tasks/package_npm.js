var gulp = require('gulp')
var concat = require('gulp-concat')
var npm = require('../config').npm

gulp.task('package_npm', function() {
  gulp.src(['./package.json', 'README.md'])
    .pipe(gulp.dest(npm.dest))

})
