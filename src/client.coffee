moment = require 'moment-timezone/moment-timezone'
augment = require './augment_moment'
usa = require '../data/usa.json'

moment.tz.add usa
module.exports = augment(moment)
