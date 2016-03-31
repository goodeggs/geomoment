moment = require 'moment-timezone'
augment = require './augment_moment'
latest = require '../data/latest.json'

moment.tz.load(latest)
module.exports = augment(moment)
