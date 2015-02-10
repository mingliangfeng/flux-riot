var dest = "./dist";
var src = './src';

module.exports = {
  server: {
    settings: {
      root: dest,
      host: 'localhost',
      port: 8080,
      livereload: {
        port: 35929
      }
    }
  },
  sass: {
    src: src + "/styles/**/*.{sass,scss,css}",
    dest: dest + "/styles",
    settings: {
      indentedSyntax: false, // Enable .sass syntax?
      imagePath: '/images' // Used by the image-url helper
    }
  },
  less: {
    src: src + "/styles/**/*.less",
    dest: dest + "/styles"
  },
  browserify: {
    settings: {
      transform: [
        [ "riotify", {"type": "coffeescript", "expr": true} ],
        [ "coffeeify", {"extension": "coffee"} ],
        '6to5ify' ]
    },
    src: src + '/js/index.coffee',
    dest: dest + '/js',
    outputName: 'index.js',
  },
  html: {
    src: 'src/index.html',
    dest: dest
  },
  watch: {
    src: 'src/**/*.*',
    tasks: ['build']
  }
};
