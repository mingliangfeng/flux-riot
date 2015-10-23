path_prefix = "../../js/"

module.exports =
  require_src: (path)-> require "#{path_prefix}#{path}"
  dontMock: (path)-> jest.dontMock "#{path_prefix}#{path}"
