geomoment = require '../..'

{expect} = require 'chai'

describe 'parsing with list of formats', ->
  {allFormats} = {}

  before ->
    allFormats = (format for name, format of geomoment.formats)

  it 'parses a dayTime', ->
    m = geomoment('2014-03-05 12:22', allFormats)
    expect(m.hours()).to.equal 12
    expect(m.minutes()).to.equal 22

