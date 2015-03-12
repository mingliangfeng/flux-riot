var gulp = require('gulp')
var concat = require('gulp-concat')
var src = require('../config').src
var name = require('../config').name
var npm = require('../config').npm

gulp.task('concat_npm', function() {
  gulp.src([ src.prefix_npm,
    src.base_store, src.store_mixin, src.base_router,
    src.suffix_npm ])
    .pipe(concat(name.js))
    .pipe(gulp.dest(npm.dest))

})
