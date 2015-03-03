path_prefix = "../js/"

jest.dontMock 'object-assign'

module.exports =
  require_src: (path)-> require "#{path_prefix}#{path}"
  dontMock: (path)-> jest.dontMock "#{path_prefix}#{path}"
