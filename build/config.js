source = "./src"

module.exports = {
  src: {
    prefix: source + '/wrap/prefix.js',
    suffix: source + '/wrap/suffix.js',
    prefix_npm: source + '/wrap/npm/prefix.js',
    suffix_npm: source + '/wrap/npm/suffix.js',
    base_store: source + '/base_store.js',
    store_mixin: source + '/store_mixin.js',
    base_router: source + '/base_router.js'
  },
  name: {
    js: 'flux-riot.js',
    js_min: 'flux-riot.min.js'
  },
  npm: {
    dest: './dist/npm/'
  },
  jest: {
    rootDir: source,
    preprocessor: "./build/support/preprocessor.js",
    fileExtensions: [ "js" ],
    unmockedModules: [ "node_modules/riot" ],
    testPathIgnore: [ "node_modules", "examples" ],
    moduleFileExtensions: [ "js", "json", "tag" ]
  },
  watch: {
    src: source + '/**/*.*',
    tasks: ['build']
  }
}
