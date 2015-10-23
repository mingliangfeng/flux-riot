var gulp = require('gulp')
var concat = require('gulp-concat')
var src = require('../config').src
var name = require('../config').name
var dist = require('../config').dist

gulp.task('concat', function() {
  gulp.src([src.prefix,
    src.base_store, src.store_mixin, src.base_router, src.dispatcher,
    src.suffix])
    .pipe(concat(name.js))
    .pipe(gulp.dest(dist.dist))

})
