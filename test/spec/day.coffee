geomoment = require '../..'

{expect} = require 'chai'

describe 'day', ->
  it 'parses dashed day (YYYY-MM-DD) in tzid', ->
    m = geomoment.day '2013-11-04', geomoment.pacific.tzid
    expect(m.format()).to.equal '2013-11-04T00:00:00-08:00'

  it 'parses numbered day (YYYYMMDD) in tzid', ->
    m = geomoment.day '20131104', geomoment.pacific.tzid
    expect(m.format()).to.equal '2013-11-04T00:00:00-08:00'
