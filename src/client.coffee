module.exports = (moment) ->
  moment.tz.add require '../data/usa.json'
  require('./') moment
