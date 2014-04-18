moment = require 'moment-timezone'
geomoment = require('../lib') moment

{expect} = require 'chai'

describe 'geomoment', ->
  describe 'timezones', ->

    describe 'eastern', ->
      it 'has the eastern timezone', ->
        expect(geomoment.eastern.tzid).to.equal 'America/New_York'

      it 'parses date in eastern', ->
        m = geomoment.eastern '2013-11-04 10:00'
        expect(m.zone()).to.equal 300
        expect(m.toISOString()).to.equal '2013-11-04T15:00:00.000Z'

    describe 'central', ->
      it 'has the central timezone', ->
        expect(geomoment.central.tzid).to.equal 'America/Chicago'

      it 'parses date in central', ->
        m = geomoment.central '2013-11-04 10:00'
        expect(m.zone()).to.equal 360
        expect(m.toISOString()).to.equal '2013-11-04T16:00:00.000Z'

    describe 'pacific', ->
      it 'has the pacific timezone', ->
        expect(geomoment.pacific.tzid).to.equal 'America/Los_Angeles'

      it 'parses date in pacific', ->
        m = geomoment.pacific '2013-11-04 10:00'
        expect(m.zone()).to.equal 480
        expect(m.toISOString()).to.equal '2013-11-04T18:00:00.000Z'

  describe 'day', ->
    it 'parses dashed day (YYYY-MM-DD) in tzid', ->
      m = geomoment.day '2013-11-04', geomoment.pacific.tzid
      expect(m.zone()).to.equal 480
      expect(m.utc().toString()).to.equal 'Mon Nov 04 2013 08:00:00 GMT+0000'

    it 'parses numbered day (YYYYMMDD) in tzid', ->
      m = geomoment.day '20131104', geomoment.pacific.tzid
      expect(m.zone()).to.equal 480
      expect(m.utc().toString()).to.equal 'Mon Nov 04 2013 08:00:00 GMT+0000'

  describe 'dayString', ->
    it 'returns a day string with the dashed (YYYY-MM-DD) format', ->
      m = geomoment.day '20131104', geomoment.pacific.tzid
      expect(m.dayString()).to.equal '2013-11-04'

  describe 'stubTime', ->
    it 'changes the time returned by calling geomoment.tzid() with no arguments', ->
      geomoment.stubTime(geomoment.pacific('1988-04-13 12:15'))
      expect(geomoment.pacific().format('YYYY-MM-DD hh:mm')).to.equal '1988-04-13 12:15'

    it 'changes the time returned by calling geomoment() with no arguments', ->
      geomoment.stubTime(geomoment.pacific('1988-04-13 12:15'))
      expect(geomoment().tz(geomoment.pacific.tzid).format('YYYY-MM-DD hh:mm')).to.equal '1988-04-13 12:15'

  describe 'restoreTime', ->
    it 'restores the time returned by calling geomoment() with no arguments', ->
      geomoment.stubTime(geomoment.pacific('1988-04-13 12:15'))
      geomoment.restoreTime()
      expect(geomoment().format('YYYY-MM-DD hh:mm')).not.to.equal '1988-04-13 12:15'

