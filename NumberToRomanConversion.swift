//Convert given number to roman format
enum RomanAlphabet: Int, CaseIterable {
  case I=1, V=5, X=10, L=50, C=100, D=500, M=1000, W=5000, Y=10000
  var description: String {
      switch self {
      case .Y: return "Y"
      case .W: return "W"
      case .M: return "M"
      case .D: return "D"
      case .C: return "C"
      case .L: return "L"
      case .X: return "X"
      case .V: return "V"
      case .I: return "I"
      }
  }
}

func toRoman(number: Int) -> String {
    
    var romanValue = ""
    var startingValue = number
    
    for romanChar in RomanAlphabet.allCases.reversed() {
        let div = startingValue / romanChar.rawValue
        if div > 0 {
            for _ in 0..<div {
                romanValue += romanChar.description
            }
            startingValue -= romanChar.rawValue * div
        }
    }
    return romanValue
}
print(toRoman(number: 12345))
