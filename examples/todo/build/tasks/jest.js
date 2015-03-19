var gulp = require('gulp')
var gutil = require('gulp-util')
var jest = require('jest-cli')
var config = require('../config').jest

gulp.task('jest', function(done) {
  jest.runCLI({ config : config }, ".", function() {
    done()
  })
})
