Expression
  = Zero
  / a:Base _ b:Base { return a + b }
  / Base

Base
  = head:Quintillions ','? _ tail:Base { return head + tail }
  / head:Quadrillions ','? _ tail:Base { return head + tail }
  / head:Trillions ','? _ tail:Base { return head + tail }
  / head:Billions ','? _ tail:Base { return head + tail }
  / head:Millions ','? _ tail:Base { return head + tail }
  / head:Thousands ','? _ tail:Base { return head + tail }
  / Segment
  / Nil

Segment
  = head:Hundreds " and"? _ tail:Segment { return head + tail }
  / head:Hundreds { return head }
  / Double

Double
  = head:Tens _ tail:Singles { return head + tail }
  / Tens
  / Teens
  / Ten
  / Singles

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

Tens
  = Twenty
  / Thirty
  / Fourty
  / Fifty
  / Sixty
  / Seventy
  / Eighty
  / Ninety

// Hundreds only join with double-digit number segments
Hundreds
  = "a" _ Hundred { return 100 }
  / base:Double _ Hundred { return base * 100 }

// Other multipliers join with three-digit number segments
Thousands
  = "a" _ Thousand { return 1000 }
  / base:Segment _ Thousand { return base * 1000 }
Millions
  = "a" _ Million { return 1000000 }
  / base:Segment _ Million { return base * 1000000 }
Billions
  = "a" _ Billion { return 1000000000 }
  / base:Segment _ Billion { return base * 1000000000 }
Trillions
  = "a" _ Trillion { return 1000000000000 }
  / base:Segment _ Trillion { return base * 1000000000000 }
Quadrillions
  = "a" _ Quadrillion { return 1000000000000000 }
  / base:Segment _ Quadrillion { return base * 1000000000000000 }
Quintillions
  = "a" _ Quintillion { return 1000000000000000000 }
  / base:Segment _ Quintillion { return base * 1000000000000000000 }

// Singles
Zero
  = "zero" { return 0 }
One
  = "one" { return 1 }
Two
  = "two" { return 2 }
Three
  = "three" { return 3 }
Four
  = "four" { return 4 }
Five
  = "five" { return 5 }
Six
  = "six" { return 6 }
Seven
  = "seven" { return 7 }
Eight
  = "eight" { return 8 }
Nine
  = "nine" { return 9 }

// Teens
Eleven
  = "eleven" { return 11 }
Twelve
  = "twelve" { return 12 }
Thirteen
  = "thirteen" { return 13 }
Fourteen
  = "fourteen" { return 14 }
Fifteen
  = "fifteen" { return 15 }
Sixteen
  = "sixteen" { return 16 }
Seventeen
  = "seventeen" { return 17 }
Eighteen
  = "eighteen" { return 18 }
Nineteen
  = "nineteen" { return 19 }

// Tens
Ten
  = "ten" { return 10 }
Twenty
  = "twenty" { return 20 }
Thirty
  = "thirty" { return 30 }
Fourty
  = "fourty" { return 40 }
Fifty
  = "fifty" { return 50 }
Sixty
  = "sixty" { return 60 }
Seventy
  = "seventy" { return 70 }
Eighty
  = "eighty" { return 80 }
Ninety
  = "ninety" { return 90 }

// Multipliers
Hundred
  = "hundred" { return 100 }
Thousand
  = "thousand" { return 1000 }
Million
  = "million" { return 1000000 }
Billion
  = "billion" { return 1000000000 }
Trillion
  = "trillion" { return 1000000000000 }
Quadrillion
  = "quadrillion" { return 1000000000000000 }
Quintillion
  = "quintillion" { return 1000000000000000000 }

Nil
  = "" { return 0 }

_ "whitespace"
  = [ \t\n\r-]*