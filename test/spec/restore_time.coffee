geomoment = require '../..'

{expect} = require 'chai'

describe 'restoreTime', ->
  it 'restores the time returned by calling geomoment() with no arguments', ->
    geomoment.stubTime(geomoment.pacific('1988-04-13 12:15', 'YYYY-MM-DD HH:mm'))
    geomoment.restoreTime()
    expect(geomoment().format('YYYY-MM-DD hh:mm')).not.to.equal '1988-04-13 12:15'
