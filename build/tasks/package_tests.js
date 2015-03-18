var gulp = require('gulp')
var tests = require('../config').tests

gulp.task('package_tests', function() {
  gulp.src(['./package.json', 'README.md'])
    .pipe(gulp.dest(npm.dest))

})
