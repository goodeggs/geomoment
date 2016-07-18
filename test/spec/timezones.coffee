geomoment = require '../..'

{expect} = require 'chai'

describe 'timezones', ->

  describe 'eastern', ->
    it 'has the eastern timezone', ->
      expect(geomoment.eastern.tzid).to.equal 'America/New_York'

    it 'parses date in eastern', ->
      m = geomoment.eastern '2013-11-04 10:00', 'YYYY-MM-DD HH:mm'
      expect(m.format()).to.equal '2013-11-04T10:00:00-05:00'

  describe 'central', ->
    it 'has the central timezone', ->
      expect(geomoment.central.tzid).to.equal 'America/Chicago'

    it 'parses date in central', ->
      m = geomoment.central '2013-11-04 10:00', 'YYYY-MM-DD HH:mm'
      expect(m.format()).to.equal '2013-11-04T10:00:00-06:00'

  describe 'pacific', ->
    it 'has the pacific timezone', ->
      expect(geomoment.pacific.tzid).to.equal 'America/Los_Angeles'

    it 'parses date in pacific', ->
      m = geomoment.pacific '2013-11-04 10:00', 'YYYY-MM-DD HH:mm'
      expect(m.format()).to.equal '2013-11-04T10:00:00-08:00'

