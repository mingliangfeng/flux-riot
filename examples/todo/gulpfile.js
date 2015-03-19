var requireDir = require('require-dir')
require('harmonize')()

requireDir('./build/tasks', { recurse: true })
