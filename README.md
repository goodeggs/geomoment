# geomoment

This library is basically just a thin, sugary wrapper over [moment.js](http://momentjs.com/) and [moment-timezone](http://momentjs.com/timezone/).

## what can it do?

```javascript
var geomoment = require('geomoment');

// Timezone sugar
geomoment.pacific('2013-01-01', 'YYYY-MM-DD')
geomoment.eastern('2013-02-08 09:30:26.123')
geomoment.central.tzid

// Day string sugar
geomoment.day('2013-01-01', geomoment.pacific.tzid)
geomoment.day('20101221', geomoment.central.tzid)
geomoment().toDay() // => '2013-01-01'
```
