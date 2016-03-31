formatsJson = require('../data/formats.json')

module.exports = (moment) ->

  geomoment = (args...) ->
    moment.apply(null, args)

  geomoment[key] = val for key, val of moment

  geomoment.tz = (args...) ->
    moment.tz.apply(null, args)

  geomoment.tz[key] = val for key, val of moment.tz

  geomoment.formats = formatsJson

  geomoment.day = (day, tzid) ->
    {formats} = geomoment
    moment.tz day, [formats.day, formats.iCalDay, formats.slashDay], tzid

  geomoment.fn.dayString = ->
    @format geomoment.formats.day

  zones =
    eastern: 'America/New_York'
    central: 'America/Chicago'
    mountain: 'America/Denver'
    pacific: 'America/Los_Angeles'
  for zone, tzid of zones
    do (zone, tzid) ->
      geomoment[zone] = (args...) ->
        args.push tzid
        geomoment.tz.apply @, args
      geomoment[zone].tzid = tzid

  geomoment
