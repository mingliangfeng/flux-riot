source = "./src"

module.exports = {
  src: {
    prefix: source + '/wrap/prefix.js',
    suffix: source + '/wrap/suffix.js',
    prefix_npm: source + '/wrap/npm/prefix.js',
    suffix_npm: source + '/wrap/npm/suffix.js',
    base_store: source + '/base_store.js',
    store_mixin: source + '/store_mixin.js',
    base_router: source + '/base_router.js',
    dispatcher: source + '/dispatcher.js'
  },
  name: {
    js: 'flux-riot.js',
    js_min: 'flux-riot.min.js'
  },
  npm: {
    dest: './dist/npm/'
  },
  jest: {
    rootDir: './',
    testFileExtensions: [ 'js', 'json', 'coffee' ],
    testPathIgnorePatterns: [ 'node_modules', 'examples', '__tests__/support' ],
    unmockedModulePathPatterns: [ 'node_modules/riot', 'support/helper.coffee', 'object-assign' ],
    scriptPreprocessor: './build/support/preprocessor.js'
  },
  watch: {
    src: source + '/**/*.*',
    tasks: ['build', 'jest']
  }
}
