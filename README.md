# geomoment

[![NPM](https://nodei.co/npm/geomoment.png)](https://nodei.co/npm/geomoment/)
[![Build Status](https://travis-ci.org/goodeggs/geomoment.svg)](https://travis-ci.org/goodeggs/geomoment)

This library is basically just a thin, sugary wrapper over [moment.js](http://momentjs.com/) and [moment-timezone](http://momentjs.com/timezone/).

## What can it do?

```javascript
var geomoment = require('geomoment');

// Timezone sugar
geomoment.pacific('2013-01-01', 'YYYY-MM-DD')
geomoment.eastern('2013-02-08 09:30:26.123')
geomoment.central.tzid

// Day string sugar
geomoment.day('2013-01-01', geomoment.pacific.tzid)
geomoment.day('20101221', geomoment.central.tzid)
geomoment().dayString() // => '2013-01-01'

// Set HH:mm time of day
geomoment.pacific('2013-01-02').setTimeOfDay('14:00')

// Date formats (see below for a complete list)
geomoment.formats.day         = 'YYYY-MM-DD'    // 2013-01-01
```

See also: [geomoment-angular](https://github.com/goodeggs/geomoment-angular) for use in an [angular.js](http://angularjs.org) project.

## Date formats

<table>
  <tr>
    <th>day</th>
    <td>2013-12-06</td>
    <td><code>YYYY-MM-DD</code></td>
  </tr>
  <tr>
    <th>time</th>
    <td>15:22</td>
    <td><code>HH:mm</code></td>
  </tr>
  <tr>
    <th>dayTime</th>
    <td>2013-12-06 15:22</td>
    <td><code>YYYY-MM-DD HH:mm</code></td>
  </tr>
  <tr>
    <th>iCalDay</th>
    <td>20131206</td>
    <td><code>YYYYMMDD</code></td>
  </tr>
  <tr>
    <th>iCalTime</th>
    <td>152207</td>
    <td><code>HHmmss</code></td>
  </tr>
  <tr>
    <th>iCalDayTime</th>
    <td>20131206T152207</td>
    <td><code>YYYYMMDD[T]HHmmss</code></td>
  </tr>
  <tr>
    <th>slashDay</th>
    <td>12/6/2013</td>
    <td><code>M/D/YYYY</code></td>
  </tr>
  <tr>
    <th>shortSlashDay</th>
    <td>12/6</td>
    <td><code>M/D</code></td>
  </tr>
  <tr>
    <th>shortDay</th>
    <td>Friday, Dec 6</td>
    <td><code>dddd, MMM D</code></td>
  </tr>
  <tr>
    <th>abbrvDay</th>
    <td>Fri Dec 6</td>
    <td><code>ddd MMM D</code></td>
  </tr>
  <tr>
    <th>longDay</th>
    <td>Friday, December 6, 2013</td>
    <td><code>dddd, MMMM D, YYYY</code></td>
  </tr>
  <tr>
    <th>weekday</th>
    <td>Friday</td>
    <td><code>dddd</code></td>
  </tr>
  <tr>
    <th>unixDate</th>
    <td>Fri Dec 06 2013 15:22:07</td>
    <td><code>ddd MMM DD YYYY HH:mm:ss</code></td>
  </tr>
</table>

## Dependencies

Requires `moment-timezone` when you require `geomoment` but
requires that your project explicitly includes `moment@2.9.0` or newer.

## License

The MIT License (MIT)

Copyright (c) 2013 Good Eggs Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
