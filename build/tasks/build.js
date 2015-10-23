var gulp = require('gulp')

gulp.task('build', ['concat', 'package_npm', 'minify'])
