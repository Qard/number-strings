Expression
  = Zero
  / Numbers Singles+ {
    throw new Error('Why do you even need numbers that big?')
  }
  / Numbers

// 
// Singles
// 
Zero
  = "0" { return "" }
One
  = "1" { return "one" }
Two
  = "2" { return "two" }
Three
  = "3" { return "three" }
Four
  = "4" { return "four" }
Five
  = "5" { return "five" }
Six
  = "6" { return "six" }
Seven
  = "7" { return "seven" }
Eight
  = "8" { return "eight" }
Nine
  = "9" { return "nine" }

Singles
  = One
  / Two
  / Three
  / Four
  / Five
  / Six
  / Seven
  / Eight
  / Nine

// 
// Teens
// 
Eleven
  = "11" { return "eleven" }
Twelve
  = "12" { return "twelve" }
Thirteen
  = "13" { return "thirteen" }
Fourteen
  = "14" { return "fourteen" }
Fifteen
  = "15" { return "fifteen" }
Sixteen
  = "16" { return "sixteen" }
Seventeen
  = "17" { return "seventeen" }
Eighteen
  = "18" { return "eighteen" }
Nineteen
  = "19" { return "nineteen" }

Teens
  = Eleven
  / Twelve
  / Thirteen
  / Fourteen
  / Fifteen
  / Sixteen
  / Seventeen
  / Eighteen
  / Nineteen

// 
// Tens
// 
Ten
  = "1" Zero { return "ten" }
Twenty
  = "2" tail:Singles { return ["twenty", tail].join(' ') }
  / "2" Zero { return "twenty" }
Thirty
  = "3" tail:Singles { return ["thirty", tail].join(' ') }
  / "3" Zero { return "thirty" }
Fourty
  = "4" tail:Singles { return ["fourty", tail].join(' ') }
  / "4" Zero { return "fourty" }
Fifty
  = "5" tail:Singles { return ["fifty", tail].join(' ') }
  / "5" Zero { return "fifty" }
Sixty
  = "6" tail:Singles { return ["sixty", tail].join(' ') }
  / "6" Zero { return "sixty" }
Seventy
  = "7" tail:Singles { return ["seventy", tail].join(' ') }
  / "7" Zero { return "seventy" }
Eighty
  = "8" tail:Singles { return ["eighty", tail].join(' ') }
  / "8" Zero { return "eighty" }
Ninety
  = "9" tail:Singles { return ["ninety", tail].join(' ') }
  / "9" Zero { return "ninety" }

Tens
  = Twenty
  / Thirty
  / Fourty
  / Fifty
  / Sixty
  / Seventy
  / Eighty
  / Ninety

Doubles
  = Tens
  / Teens
  / Ten

SubDoubles
  = Doubles
  / Zero tail:Singles { return tail }
  / Zero Zero { return "" }

// 
// Hundreds
// 
SubHundreds
  = Hundreds
  / Zero tail:SubDoubles { return tail }

Hundreds
  = base:Singles tail:SubDoubles {
  	var list = [base, 'hundred']
    if (tail) list.push(tail)
  	return list.join(' ')
  }

// 
// Thousands
// 
SubThousand
  = base:SubHundreds tail:SubHundreds {
    var list = []
    if (base) list.push(base, 'thousand')
    if (tail) list.push(tail)
  	return list.join(' ')
  }

ThousandSets
  = Hundreds SubHundreds
  / Doubles SubHundreds
  / Singles SubHundreds

Thousands
  = pair:ThousandSets {
  	var list = [pair[0], 'thousand']
    if (pair[1]) list.push(pair[1])
  	return list.join(' ')
  }

// 
// Millions
// 
SubMillion
  = base:SubHundreds tail:SubThousand {
    var list = []
    if (base) list.push(base, 'million')
    if (tail) list.push(tail)
  	return list.join(' ')
  }

MillionSets
  = Hundreds SubThousand
  / Doubles SubThousand
  / Singles SubThousand

Millions
  = pair:MillionSets {
  	var list = [pair[0], 'million']
    if (pair[1]) list.push(pair[1])
  	return list.join(' ')
  }

// 
// Billions
// 
SubBillion
  = base:SubHundreds tail:SubMillion {
    var list = []
    if (base) list.push(base, 'billion')
    if (tail) list.push(tail)
  	return list.join(' ')
  }

BillionSets
  = Hundreds SubMillion
  / Doubles SubMillion
  / Singles SubMillion

Billions
  = pair:BillionSets {
  	var list = [pair[0], 'billion']
    if (pair[1]) list.push(pair[1])
  	return list.join(' ')
  }

// 
// Trillions
// 
SubTrillion
  = base:SubHundreds tail:SubBillion {
    var list = []
    if (base) list.push(base, 'trillion')
    if (tail) list.push(tail)
  	return list.join(' ')
  }

TrillionSets
  = Hundreds SubBillion
  / Doubles SubBillion
  / Singles SubBillion

Trillions
  = pair:TrillionSets {
  	var list = [pair[0], 'trillion']
    if (pair[1]) list.push(pair[1])
  	return list.join(' ')
  }
  
// 
// Quadrillions
// 
SubQuadrillion
  = base:SubHundreds tail:SubTrillion {
    var list = []
    if (base) list.push(base, 'quadrillion')
    if (tail) list.push(tail)
  	return list.join(' ')
  }

QuadrillionSets
  = Hundreds SubTrillion
  / Doubles SubTrillion
  / Singles SubTrillion

Quadrillions
  = pair:QuadrillionSets {
    var list = [pair[0], 'quadrillion']
    if (pair[1]) list.push(pair[1])
    return list.join(' ')
  }

// 
// Quintillions
// 
QuintillionSets
  = Hundreds SubQuadrillion
  / Doubles SubQuadrillion
  / Singles SubQuadrillion

Quintillions
  = pair:QuintillionSets {
    var list = [pair[0], 'quintillion']
    if (pair[1]) list.push(pair[1])
    return list.join(' ')
  }

// 
// Number scales
// 
Numbers
  = Quintillions
  / Quadrillions
  / Trillions
  / Billions
  / Millions
  / Thousands
  / Hundreds
  / Doubles
  / Singles
