/**
 * Integer Multiplcation
 */


func stringWithPadding(s: String, n: Int) -> String {
  var result = s
  
  for i in 0..<n {
    result += "0"
  }
  
  return result
}

func IntegerMultiplication(n1: Int, n2: Int) -> Int {
  var result = 0
  
  // convert n1 & n2 into strings
  let n1String = reverse(String(n1))
  let n2String = reverse(String(n2))

  // multi each digit of n2 by each digit of n1 adding padding on each "new row"
  for (j, digit2) in enumerate(n2String) {
    for (i, digit1) in enumerate(n1String) {
      var paddingAmount = j + i

      // NOTE: type conversion are inefficient
      result += (String(digit2).toInt()! * stringWithPadding(String(digit1), paddingAmount).toInt()!)
    }
  }
  
  return result
}

// single digit numbers
IntegerMultiplication(3, 5) == (3 * 5)
// double digit numbers
IntegerMultiplication(13, 35) == (13 * 35)
IntegerMultiplication(1324, 351) == (1324 * 351)

// "13"
// "35"

//  15
//  50
//  90
// 300
 
// 1)  65
// 2) 390
// 1) + 2)

