geomoment = require '../..'
moment = require 'moment-timezone'

{expect} = require 'chai'

describe 'isSame', ->
  describe '"day"', ->
    it 'compares days identically to moment-timezone', ->
      d = new Date()
      expect(geomoment.pacific(d).isSame(geomoment.pacific(d), 'year'))
        .to.equal(geomoment.pacific(d).isSame(geomoment.pacific(d).toDate(), 'year'))
