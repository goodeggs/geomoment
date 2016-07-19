geomoment = require '../..'

{expect} = require 'chai'

describe 'setTimeOfDay', ->
  it 'requires a timezone', ->
    expect(-> geomoment('2016-07-12').setTimeOfDay('14:00')).to.throw(/undefined timezone/)

  it 'sets hours and minutes', ->
    expect(geomoment.pacific('2016-07-12').setTimeOfDay('14:00').format()).to.eq '2016-07-12T14:00:00-07:00'
