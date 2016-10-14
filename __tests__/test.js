const numberWords = require('../')

const pairs = [
  {
    name: 'big and complex numbers',
    number: 100312025988211,
    string: 'one hundred trillion three hundred twelve billion twenty five million nine hundred eighty eight thousand two hundred eleven'
  },
  {
    name: 'omits unused ranges',
    number: 100000000000001,
    string: 'one hundred trillion one'
  }
]

pairs.forEach(pair => {
  test(pair.name, () => {
    expect(numberWords.parse(pair.string)).toBe(pair.number)
    expect(numberWords.stringify(pair.number)).toBe(pair.string)
  })
})
