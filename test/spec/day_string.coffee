geomoment = require '../..'

{expect} = require 'chai'

describe 'dayString', ->
  it 'returns a day string with the dashed (YYYY-MM-DD) format', ->
    m = geomoment.day '20131104', geomoment.pacific.tzid
    expect(m.dayString()).to.equal '2013-11-04'
