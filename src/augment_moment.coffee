formatsJson = require('../data/formats.json')

module.exports = (moment) ->

  stubbedTime = null

  geomoment = (args...) ->
    if stubbedTime?
      [first] = args
      if moment.isMoment(first)
        # do nothing
      else if not first?
        args[0] = stubbedTime.clone()
      else if typeof first is 'object'
        unless first.y? or first.year? or first.years?
          first.year = stubbedTime.year()
        unless first.M? or first.month? or first.months?
          first.month = stubbedTime.month()
        unless first.d? or first.day? or first.days?
          first.day = stubbedTime.date()
    moment.apply(null, args)

  geomoment[key] = val for key, val of moment

  geomoment.tz = (args...) ->
    if stubbedTime? and !args[1]?
      stubbedTime.clone().tz(args[0])
    else
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

  geomoment.stubTime = (time) ->
    stubbedTime = moment(time)

  geomoment.restoreTime = ->
    stubbedTime = null

  geomoment
