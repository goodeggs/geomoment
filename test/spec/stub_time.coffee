geomoment = require '../..'

{expect} = require 'chai'

describe 'stubTime', ->

  it 'changes the time returned by calling geomoment() with no arguments', ->
    geomoment.stubTime(geomoment.pacific('1988-04-13 12:15', 'YYYY-MM-DD HH:mm'))
    expect(geomoment().tz(geomoment.pacific.tzid).format('YYYY-MM-DD hh:mm')).to.equal '1988-04-13 12:15'

  it 'changes the time returned by calling geomoment.tzid() with no arguments', ->
    geomoment.stubTime(geomoment.pacific('1988-04-13 12:15', 'YYYY-MM-DD HH:mm'))
    expect(geomoment.pacific().format('YYYY-MM-DD hh:mm')).to.equal '1988-04-13 12:15'

  it 'changes the day returned by calling geomoment() with just a time', ->
    geomoment.stubTime(geomoment.pacific('1988-04-13 12:15', 'YYYY-MM-DD HH:mm'))
    expect(geomoment('09:00', 'HH:mm').tz(geomoment.pacific.tzid).format('YYYY-MM-DD hh:mm')).to.equal '1988-04-13 09:00'
