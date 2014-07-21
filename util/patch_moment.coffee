fs = require 'fs'
path = require 'path'
falafel = require 'falafel'

baseDir = path.join(__dirname, '..')
nodeModulesDir = path.join(baseDir, 'node_modules')

falafelTransform = (module, transform) ->
  filename = "#{module}.js"
  infile = path.join nodeModulesDir, module, filename
  outfile = path.join baseDir, filename

  options = encoding: 'utf8'
  infileSrc = fs.readFileSync infile, options
  fs.writeFileSync outfile, falafel(infileSrc, transform), options
  console.log "Updated #{outfile}."

falafelTransform 'moment', (node) ->
  if node.type is 'Program'
    node.update """
      var stubbableDate = require('./lib/stubbable_date');

      #{node.source()}
    """
  if node.type is 'NewExpression' and node.callee.name is 'Date'
    node.update node.source().replace /new Date/, 'stubbableDate'

falafelTransform 'moment-timezone', (node) ->
  node.update("require('./moment')") if node.type is 'CallExpression' and node.callee.name is 'require' and node.arguments[0].value is 'moment'
