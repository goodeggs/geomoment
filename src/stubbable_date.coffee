stubbedTime = null

module.exports = (year, month, day, hour, minute, second, millisecond) ->
  if not year?
    return new Date(stubbedTime.valueOf()) if stubbedTime?
    return new Date()
  return new Date(year) unless month?
  return new Date(year, month, day, hour, minute, second, millisecond)

module.exports.stubTime = (date) ->
  stubbedTime = date

module.exports.restoreTime = ->
  stubbedTime = null
