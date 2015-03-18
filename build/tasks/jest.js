var gulp = require('gulp')
var gutil = require('gulp-util')
// gutil.log('stuff happened', 'Really it did', gutil.colors.magenta('123'))
//var jest = require('gulp-jest')
var jest = require('jest-cli')
var config = require('../config').jest

var jestConfig = {
  rootDir: './',
  testFileExtensions: [ 'js', 'json', 'coffee' ],
  testPathIgnorePatterns: [ 'node_modules', 'examples', 'helper.coffee' ],
  scriptPreprocessor: './build/support/preprocessor.js'
}

gulp.task('jest', function(done) {
  jest.runCLI({ config : jestConfig }, ".", function() {
    done()
  })
})
