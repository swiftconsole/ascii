[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbesya%2Fascii%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/besya/ascii)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbesya%2Fascii%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/besya/ascii)
# ASCII

A zero-cost, type-safe Swift representation of ASCII characters with comprehensive formatting options and convenient utilities.

## Features

- 🚀 Zero runtime overhead with compile-time safety
- 💪 Complete ASCII character set (0-127) as type-safe enum
- 🛠 Multiple representation formats
- ⚡️ Direct integer comparisons
- 🧰 Convenient character properties
- 📚 Extensive documentation
- ✨ Pure Swift implementation

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/swiftconsole/ascii.git", from: "1.1.0"),
    ],
    targets: [
        .target(name: "<library>", dependencies: [
            // other dependencies
            .product(name: "ASCII", package: "ascii"),
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

let boldOn: String = sgrBoldSequence.map(\.unicode).map(String.init).joined()
let italicOn: String = sgrItalicSequence.map(\.unicode).map(String.init).joined()
let reset: String = sgrResetSequence.map(\.unicode).map(String.init).joined()

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
bracket.escaped     // StaticString("\x5b")
bracket.htmlEntity  // StaticString("&#91;")
```

### Direct Comparisons

```swift
ASCII.leftBracket == 91         // true
91 == ASCII.leftBracket         // true
UInt8(90) < ASCII.leftBracket   // true
ASCII.leftBracket <= UInt8(92)  // true
```

### Convenience Methods

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

## Why ASCII?

- **Type Safety**: Prevent invalid ASCII values at compile time
- **Performance**: Zero-cost abstractions with no runtime overhead
- **Convenience**: Rich set of utility methods and properties
- **Clarity**: Descriptive enum cases instead of raw values
- **Versatility**: Multiple representation formats for different use cases

## Requirements

- Swift 5.0+
- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+

## License

This project is available under the MIT license. See the LICENSE file for more info.

## Contribution

Contributions are welcome! Please feel free to submit a Pull Request.
