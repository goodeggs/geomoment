geomoment = require '../..'
moment = require 'moment'

{expect} = require 'chai'

describe 'isSame', ->
  describe '"day"', ->
    it 'compares days identically to moment', ->
      expect(moment(new Date('Sun Nov 06 2016 12:00:00 GMT+0000 (UTC)')).isSame('2016-11-06', 'day'))
        .to.equal(geomoment.tz(new Date('Sun Nov 06 2016 12:00:00 GMT+0000 (UTC)'), geomoment.pacific.tzid).isSame('2016-11-06', 'day'))
