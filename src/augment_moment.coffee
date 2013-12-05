module.exports = (moment) ->

  moment.formats =
    day: 'YYYY-MM-DD'
    numberedDay: 'YYYYMMDD'

  moment.day = (day, tzid) ->
    moment.tz day, [moment.formats.day, moment.formats.numberedDay], tzid

  moment.fn.dayString = ->
    @format moment.formats.day

  zones =
    eastern: 'America/New_York'
    central: 'America/Chicago'
    mountain: 'America/Denver'
    pacific: 'America/Los_Angeles'
  for zone, tzid of zones
    do (zone, tzid) ->
      moment[zone] = (args...) ->
        args.push tzid
        moment.tz.apply @, args
      moment[zone].tzid = tzid

  moment
