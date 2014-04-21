moment = window?.moment
throw new Error 'geomoment expects moment to be loaded' unless moment?
moment.tz.add require '../data/usa.json'
window.geomoment = require('./') moment
