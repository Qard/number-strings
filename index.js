const parser = require('./parser')
const stringifier = require('./stringifier')

exports.parse = v => parser.parse(v.toLowerCase())
exports.stringify = v => stringifier.parse(v.toString())