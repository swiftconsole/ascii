# ASCII

## Adding `ASCII` as a Dependency

To use the `ASCII` library in a SwiftPM project, 
add it to the dependencies for your package target:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/besya/ascii", from: "1.0.0"),
    ],
    targets: [
        .target(name: "<library>", dependencies: [
            // other dependencies
            .product(name: "ASCII", package: "ASCII"),
        ]),
        // other targets
    ]
)
```

## Usage

### Import
```swift
import ASCII
```

### Initialization

```swift
let bracket = ASCII.leftBracket
```

### Initialize from Int, UInt8 or String

```swift
ASCII(91) == ASCII.leftBracket          // true
ASCII(UInt8(91)) == ASCII.leftBracket   // true
ASCII("[") == ASCII.leftBracket         // true
```

### Control Sequences

```swift
let CSI: [ASCII] = [.escape, .leftBracket]

let sgrBoldSequence: [ASCII] = CSI + [.digit1, .m]
let sgrItalicSequence: [ASCII] = CSI + [.digit3, .m]
let sgrResetSequence: [ASCII] = CSI + [.digit0, .m]

let boldOn: String = sgrBoldSequence.map(String.init).joined()
let italicOn: String = sgrItalicSequence.map(String.init).joined()
let reset: String = sgrResetSequence.map(String.init).joined()

print(boldOn + "Hello," + reset + italicOn + " World!")
// Prints: **Hello,** _World!_
```

### Representations

```swift
bracket             // ASCII
bracket.int         // Int(91)
bracket.decimal     // UInt8(91)
bracket.binary      // StaticString("01011011")
bracket.hexadecimal // StaticString("5B")
bracket.octal       // StaticString("133")
bracket.unicode     // StaticString("\u{005B}")
bracket.escaped     // StaticString("\\u{005B}")
bracket.htmlEntity  // StaticString("&#91;")
```

### Comparable with Int and UInt8

```swift
ASCII.leftBracket == 91         // true
91 == ASCII.leftBracket         // true
UInt8(90) < ASCII.leftBracket   // true
ASCII.leftBracket <= UInt8(92)  // true
```

### Convenience methods

```swift
ASCII.A.isDigit         // false
ASCII.A.isLetter        // true
ASCII.A.isControl       // false
ASCII.A.isLowercase     // false
ASCII.A.isUppercase     // true
ASCII.A.isPrintable     // true
ASCII.A.isWhitespace    // false
ASCII.A.isAlphanumeric  // true
```
