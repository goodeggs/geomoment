fs = require 'fs'
path = require 'path'
moment = require 'moment-timezone'
geomoment = require('..') moment

now = geomoment 'Fri Dec 06 2013 15:22:07 GMT-0800 (PST)'
filename = path.resolve(__dirname, '..', 'README.md')

readme = fs.readFileSync(filename, encoding: 'utf-8').split('\n')
before = readme[0..readme.indexOf('## date formats')]
after = readme[readme.indexOf('## license')..]

readme = before
readme.push ''
readme.push '<table>'
for format, spec of geomoment.formats
  readme.push '  <tr>'
  readme.push "    <th>#{format}</th>"
  readme.push "    <td>#{now.format(spec)}</td>"
  readme.push "    <td><code>#{spec}</code></td>"
  readme.push '  </tr>'
readme.push '</table>'
readme.push ''
readme = readme.concat after

fs.writeFile filename, readme.join('\n'), encoding: 'utf-8'
