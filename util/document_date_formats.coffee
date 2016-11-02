fs = require 'fs'
path = require 'path'
geomoment = require '..'

now = geomoment new Date('Fri Dec 06 2013 15:22:07 GMT-0800 (PST)')
filename = path.resolve(__dirname, '..', 'FORMATS.md')

docs = ['# Date formats']
docs.push ''
docs.push '<table>'
for format, spec of geomoment.formats
  docs.push '  <tr>'
  docs.push "    <th>#{format}</th>"
  docs.push "    <td>#{now.format(spec)}</td>"
  docs.push "    <td><code>#{spec}</code></td>"
  docs.push '  </tr>'
docs.push '</table>'

fs.writeFile filename, docs.join('\n'), encoding: 'utf-8'
