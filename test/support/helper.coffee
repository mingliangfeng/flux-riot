path_prefix = "../../"

module.exports =
  require_src: (path)-> require "#{path_prefix}#{path}"
  dontMock: (path)-> jest.dontMock "#{path_prefix}#{path}"
