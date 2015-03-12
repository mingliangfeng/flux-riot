var gulp = require('gulp')

gulp.task('build', ['concat', 'concat_npm', 'package_npm', 'minify'])
