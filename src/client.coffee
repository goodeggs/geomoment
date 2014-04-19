throw new Error 'geomoment expects moment to be loaded' unless window?.geomoment?
moment.tz.add require '../data/usa.json'
window.geomoment = require('./') moment
