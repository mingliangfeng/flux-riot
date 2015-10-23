source = "./lib"
dist = "./dist"

module.exports = {
  src: {
    prefix: source + '/wrap/prefix.js',
    suffix: source + '/wrap/suffix.js',
    base_store: source + '/base_store.js',
    store_mixin: source + '/store_mixin.js',
    base_router: source + '/base_router.js',
    dispatcher: source + '/dispatcher.js'
  },
  dist: {
  	dist: dist + '/',
  },
  name: {
    js: 'flux-riot.js',
    js_min: 'flux-riot.min.js'
  },
  npm: {
    dest: dist + '/npm/'
  },
  karma: {
  	config_file: __dirname + '/karma.conf.js'
  },
  jest: {
    rootDir: './',
    testFileExtensions: [ 'js', 'json', 'coffee' ],
    testPathIgnorePatterns: [ 'node_modules', 'examples', '__tests__/support' ],
    unmockedModulePathPatterns: [ 'node_modules/riot', 'support/helper.coffee', 'object-assign' ],
    scriptPreprocessor: './build/support/preprocessor.js'
  },
  jasmine: {
  	spec: ['spec/**/*.coffee']
  },
  browserify: {
  	entry: dist + '/flux-riot.js',
  	filename: 'index.js'
  },
  watch: {
    src: source + '/**/*.*',
    tasks: ['build', 'jest']
  }
}
