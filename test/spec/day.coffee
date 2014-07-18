geomoment = require '../..'

{expect} = require 'chai'

describe 'day', ->
  it 'parses dashed day (YYYY-MM-DD) in tzid', ->
    m = geomoment.day '2013-11-04', geomoment.pacific.tzid
    expect(m.zone()).to.equal 480
    expect(m.utc().toString()).to.equal 'Mon Nov 04 2013 08:00:00 GMT+0000'

  it 'parses numbered day (YYYYMMDD) in tzid', ->
    m = geomoment.day '20131104', geomoment.pacific.tzid
    expect(m.zone()).to.equal 480
    expect(m.utc().toString()).to.equal 'Mon Nov 04 2013 08:00:00 GMT+0000'
