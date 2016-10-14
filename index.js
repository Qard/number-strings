var stringifier = require('./stringifier')
var parser = require('./parser')

exports.stringify = function(number) {
  return stringifier.parse(number.toString())
}

exports.parse = function(string) {
  return parser.parse(string.toLowerCase())
}
