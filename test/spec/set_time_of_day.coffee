geomoment = require '../..'

{expect} = require 'chai'

describe 'setTimeOfDay', ->
  it 'requires a timezone', ->
    expect(-> geomoment('2016-07-12').setTimeOfDay('14:00')).to.throw()

  it 'requires a timezone', ->
    expect(geomoment.pacific('2016-07-12').setTimeOfDay('14:00').format('YYYY-MM-DD HH:mm')).to.eq '2016-07-12 14:00'
