//
//  ASCII.swift
//  ASCII
//
//  Created by Ihar Biaspalau on 28.01.25.
//

/// Representation of ASCII characters (0-127).
///
/// This enum provides a complete set of ASCII characters with type safety and zero runtime overhead.
/// It includes control characters (0-31), printable characters (32-126), and delete (127).
///
/// ## Initialization
/// ```swift
/// let bracket = ASCII.leftBracket
/// ```
///
/// ## Initialize from Int, UInt8 or String
///
/// ```swift
/// ASCII(91) == ASCII.leftBracket          // true
/// ASCII(UInt8(91)) == ASCII.leftBracket   // true
/// ASCII("[") == ASCII.leftBracket         // true
/// ```
///
/// ## Control Sequences
///
/// ```swift
/// let CSI: [ASCII] = [.escape, .leftBracket]
///
/// let sgrBoldSequence: [ASCII] = CSI + [.digit1, .m]
/// let sgrItalicSequence: [ASCII] = CSI + [.digit3, .m]
/// let sgrResetSequence: [ASCII] = CSI + [.digit0, .m]
///
/// let boldOn: String = sgrBoldSequence.map(String.init).joined()
/// let italicOn: String = sgrItalicSequence.map(String.init).joined()
/// let reset: String = sgrResetSequence.map(String.init).joined()
///
/// print(boldOn + "Hello," + reset + italicOn + " World!")
/// // Prints: **Hello,** _World!_
/// ```
///
/// ## Representations
///
/// ```swift
/// bracket             // ASCII
/// bracket.int         // Int(91)
/// bracket.decimal     // UInt8(91)
/// bracket.binary      // StaticString("01011011")
/// bracket.hexadecimal // StaticString("5B")
/// bracket.octal       // StaticString("133")
/// bracket.unicode     // StaticString("\u{005B}")
/// bracket.escaped     // StaticString("\x5b")
/// bracket.htmlEntity  // StaticString("&#91;")
/// ```
///
/// ## Comparable with Int and UInt8
///
/// ```swift
/// ASCII.leftBracket == 91         // true
/// 91 == ASCII.leftBracket         // true
/// UInt8(90) < ASCII.leftBracket   // true
/// ASCII.leftBracket <= UInt8(92)  // true
/// ```
///
/// ## Convenience methods
///
/// ```swift
/// ASCII.A.isDigit         // false
/// ASCII.A.isLetter        // true
/// ASCII.A.isControl       // false
/// ASCII.A.isLowercase     // false
/// ASCII.A.isUppercase     // true
/// ASCII.A.isPrintable     // true
/// ASCII.A.isWhitespace    // false
/// ASCII.A.isAlphanumeric  // true
/// ```
@frozen
public enum ASCII: CaseIterable, Sendable {
    /// Null character (ASCII 0x00, ^@)
    ///
    /// A zero-valued character that serves several purposes in computing:
    /// - String termination in C and related languages
    /// - Padding in files and communications
    /// - Data stream control
    ///
    /// Historical background:
    /// Originally used in teleprinters to indicate "nothing", which allowed
    /// machines to maintain synchronization when no data was being sent.
    ///
    /// Common uses:
    /// - Null terminator in C strings
    /// - File padding
    /// - Database field padding
    /// - Binary data separation
    ///
    /// Representations:
    /// - Control notation: ^@
    /// - Binary: 00000000
    /// - Octal: 000
    /// - Decimal: 0
    /// - Hexadecimal: 00
    /// - HTML entity: &#0;
    /// - Escape sequence: \0
    /// - Unicode: \u{0000}
    /// - Control description: NUL
    ///
    /// Alternative names:
    /// - NUL
    /// - Null
    /// - ^@
    /// - \0
    ///
    /// Safety considerations:
    /// - Can cause string truncation in C-style strings
    /// - May need escaping in certain contexts
    /// - Often stripped by text processors
    case null

    /// Start of Heading (ASCII 0x01, ^A)
    ///
    /// Control character that marks the beginning of a message header section.
    /// Used in data communication protocols to indicate the start of header information.
    ///
    /// Historical background:
    /// Part of the original ASCII control characters designed for
    /// data transmission and printer control.
    ///
    /// Common uses:
    /// - Message header delimitation
    /// - Data transmission protocols
    /// - Legacy systems
    ///
    /// Representations:
    /// - Control notation: ^A
    /// - Binary: 00000001
    /// - Octal: 001
    /// - Decimal: 1
    /// - Hexadecimal: 01
    /// - HTML entity: &#1;
    /// - Escape sequence: \x01
    /// - Unicode: \u{0001}
    /// - Control description: SOH
    ///
    /// Alternative names:
    /// - SOH
    /// - Start of Header
    /// - ^A
    ///
    /// Protocol considerations:
    /// - May need special handling in text processing
    /// - Often requires escaping in data streams
    case startOfHeading

    /// Start of Text (ASCII 0x02, ^B)
    ///
    /// Indicates the beginning of the actual text in a message,
    /// following any header information.
    ///
    /// Historical background:
    /// Used in early data communication systems to separate
    /// header information from the message content.
    ///
    /// Common uses:
    /// - Data transmission protocols
    /// - Message formatting
    /// - Legacy communication systems
    ///
    /// Representations:
    /// - Control notation: ^B
    /// - Binary: 00000010
    /// - Octal: 002
    /// - Decimal: 2
    /// - Hexadecimal: 02
    /// - HTML entity: &#2;
    /// - Escape sequence: \x02
    /// - Unicode: \u{0002}
    /// - Control description: STX
    ///
    /// Alternative names:
    /// - STX
    /// - Start of Text
    /// - ^B
    case startOfText

    /// End of Text (ASCII 0x03, ^C)
    ///
    /// Marks the end of a text segment and traditionally used
    /// to interrupt running programs.
    ///
    /// Historical background:
    /// Widely known as the "break" character in interactive systems,
    /// used to interrupt or terminate processes.
    ///
    /// Common uses:
    /// - Program interruption (SIGINT)
    /// - Terminal control
    /// - Data transmission termination
    ///
    /// Representations:
    /// - Control notation: ^C
    /// - Binary: 00000011
    /// - Octal: 003
    /// - Decimal: 3
    /// - Hexadecimal: 03
    /// - HTML entity: &#3;
    /// - Escape sequence: \x03
    /// - Unicode: \u{0003}
    /// - Control description: ETX
    ///
    /// Alternative names:
    /// - ETX
    /// - End of Text
    /// - Break
    /// - ^C
    ///
    /// Operating system behavior:
    /// - Generates SIGINT signal in Unix-like systems
    /// - Standard interrupt character in terminals
    case endOfText

    /// End of Transmission (ASCII 0x04, ^D)
    ///
    /// Signals the end of a transmission session or file.
    ///
    /// Historical background:
    /// Originally used in telecommunications to indicate
    /// the end of a message transmission.
    ///
    /// Common uses:
    /// - End-of-file marker in Unix systems
    /// - Terminal input termination
    /// - Data transmission control
    ///
    /// Representations:
    /// - Control notation: ^D
    /// - Binary: 00000100
    /// - Octal: 004
    /// - Decimal: 4
    /// - Hexadecimal: 04
    /// - HTML entity: &#4;
    /// - Escape sequence: \x04
    /// - Unicode: \u{0004}
    /// - Control description: EOT
    ///
    /// Alternative names:
    /// - EOT
    /// - End of Transmission
    /// - ^D
    ///
    /// Operating system behavior:
    /// - Signals EOF in Unix-like systems when typed at start of line
    /// - May terminate input in interactive programs
    case endOfTransmission

    /// Enquiry character (ASCII 0x05, ^E)
    ///
    /// Used to request a response from the remote end of a communications link.
    ///
    /// Historical background:
    /// Originally used in telecommunications to automatically identify
    /// remote terminals or request their status.
    ///
    /// Common uses:
    /// - Communication handshaking
    /// - Device status requests
    /// - Legacy terminal identification
    ///
    /// Representations:
    /// - Control notation: ^E
    /// - Binary: 00000101
    /// - Octal: 005
    /// - Decimal: 5
    /// - Hexadecimal: 05
    /// - HTML entity: &#5;
    /// - Escape sequence: \x05
    /// - Unicode: \u{0005}
    /// - Control description: ENQ
    ///
    /// Alternative names:
    /// - ENQ
    /// - Enquiry
    /// - WRU ("Who are you?")
    /// - ^E
    ///
    /// Protocol considerations:
    /// - Often used in combination with ACK/NAK
    /// - May trigger automatic responses in some systems
    case enquiry

    /// Acknowledge character (ASCII 0x06, ^F)
    ///
    /// Transmitted as an affirmative response to an enquiry
    /// or other transmission.
    ///
    /// Historical background:
    /// Part of the basic flow control mechanism in early
    /// data communication protocols.
    ///
    /// Common uses:
    /// - Positive acknowledgment in protocols
    /// - Flow control
    /// - Handshaking procedures
    ///
    /// Representations:
    /// - Control notation: ^F
    /// - Binary: 00000110
    /// - Octal: 006
    /// - Decimal: 6
    /// - Hexadecimal: 06
    /// - HTML entity: &#6;
    /// - Escape sequence: \x06
    /// - Unicode: \u{0006}
    /// - Control description: ACK
    ///
    /// Alternative names:
    /// - ACK
    /// - Acknowledge
    /// - ^F
    ///
    /// Protocol considerations:
    /// - Used in XON/XOFF flow control
    /// - Part of many communication protocols
    case acknowledge

    /// Bell character (ASCII 0x07, ^G)
    ///
    /// Triggers an audible or visible alert on the terminal.
    ///
    /// Historical background:
    /// Originally rang a physical bell on teletype machines
    /// to get the operator's attention.
    ///
    /// Common uses:
    /// - Terminal alerts
    /// - User notification
    /// - System sounds
    /// - Error indicators
    ///
    /// Representations:
    /// - Control notation: ^G
    /// - Binary: 00000111
    /// - Octal: 007
    /// - Decimal: 7
    /// - Hexadecimal: 07
    /// - HTML entity: &#7;
    /// - Escape sequence: \a
    /// - Unicode: \u{0007}
    /// - Control description: BEL
    ///
    /// Alternative names:
    /// - BEL
    /// - Bell
    /// - Alert
    /// - ^G
    ///
    /// System behavior:
    /// - May produce audible beep
    /// - May trigger visual alert
    /// - May be disabled in some terminals
    ///
    /// Security considerations:
    /// - Can be used for denial of service if not rate-limited
    /// - May be filtered in secure environments
    case bell

    /// Backspace character (ASCII 0x08, ^H)
    ///
    /// Moves the cursor one position backward, possibly
    /// deleting the previous character.
    ///
    /// Historical background:
    /// Originally moved the print head back one space
    /// on typewriters and teleprinters.
    ///
    /// Common uses:
    /// - Text editing
    /// - Cursor control
    /// - Character deletion
    /// - Terminal control
    ///
    /// Representations:
    /// - Control notation: ^H
    /// - Binary: 00001000
    /// - Octal: 010
    /// - Decimal: 8
    /// - Hexadecimal: 08
    /// - HTML entity: &#8;
    /// - Escape sequence: \b
    /// - Unicode: \u{0008}
    /// - Control description: BS
    ///
    /// Alternative names:
    /// - BS
    /// - Backspace
    /// - ^H
    ///
    /// Terminal behavior:
    /// - May delete previous character
    /// - May only move cursor
    /// - Behavior can vary by implementation
    ///
    /// Implementation considerations:
    /// - Different handling in different systems
    /// - May need special processing in text editors
    case backspace

    /// Horizontal Tab character (ASCII 0x09, ^I)
    ///
    /// Moves the cursor to the next tab stop.
    ///
    /// Historical background:
    /// Derived from typewriter tab stops, used for
    /// formatting and alignment of text.
    ///
    /// Common uses:
    /// - Text formatting
    /// - Code indentation
    /// - Table alignment
    /// - Form filling
    ///
    /// Representations:
    /// - Control notation: ^I
    /// - Binary: 00001001
    /// - Octal: 011
    /// - Decimal: 9
    /// - Hexadecimal: 09
    /// - HTML entity: &#9;
    /// - Escape sequence: \t
    /// - Unicode: \u{0009}
    /// - Control description: HT
    ///
    /// Alternative names:
    /// - HT
    /// - Tab
    /// - ^I
    ///
    /// Formatting considerations:
    /// - Tab width may vary by environment
    /// - May be expanded to spaces
    /// - Important in source code formatting
    ///
    /// Programming considerations:
    /// - Common source of formatting issues
    /// - May need normalization in text processing
    case horizontalTab

    /// Line Feed character (ASCII 0x0A, ^J)
    ///
    /// Moves the cursor to the beginning of the next line.
    ///
    /// Historical background:
    /// Originally moved paper up one line in printers and
    /// teletype machines. Now standard line terminator in Unix systems.
    ///
    /// Common uses:
    /// - Line termination (Unix/Linux)
    /// - Text file line breaks
    /// - Printer control
    /// - Output formatting
    ///
    /// Representations:
    /// - Control notation: ^J
    /// - Binary: 00001010
    /// - Octal: 012
    /// - Decimal: 10
    /// - Hexadecimal: 0A
    /// - HTML entity: &#10;
    /// - Escape sequence: \n
    /// - Unicode: \u{000A}
    /// - Control description: LF
    ///
    /// Alternative names:
    /// - LF
    /// - Newline
    /// - Line Feed
    /// - \n
    /// - ^J
    ///
    /// System considerations:
    /// - Unix systems use LF for newline
    /// - May need conversion in cross-platform applications
    /// - Critical for text file handling
    case lineFeed

    /// Vertical Tab character (ASCII 0x0B, ^K)
    ///
    /// Moves the cursor down to the next vertical tab stop.
    ///
    /// Historical background:
    /// Originally used in printers for vertical positioning
    /// of text, now rarely used in modern systems.
    ///
    /// Common uses:
    /// - Legacy printer control
    /// - Vertical spacing (historical)
    /// - Special formatting
    ///
    /// Representations:
    /// - Control notation: ^K
    /// - Binary: 00001011
    /// - Octal: 013
    /// - Decimal: 11
    /// - Hexadecimal: 0B
    /// - HTML entity: &#11;
    /// - Escape sequence: \v
    /// - Unicode: \u{000B}
    /// - Control description: VT
    ///
    /// Alternative names:
    /// - VT
    /// - Vertical Tab
    /// - ^K
    ///
    /// Implementation considerations:
    /// - Rarely used in modern systems
    /// - May need special handling in text processors
    /// - Often treated as whitespace
    case verticalTab

    /// Form Feed character (ASCII 0x0C, ^L)
    ///
    /// Advances to the next page or clears the screen.
    ///
    /// Historical background:
    /// Originally used to advance paper to the top of the
    /// next page in printers and forms.
    ///
    /// Common uses:
    /// - Page breaks in printing
    /// - Screen clearing in terminals
    /// - Document formatting
    ///
    /// Representations:
    /// - Control notation: ^L
    /// - Binary: 00001100
    /// - Octal: 014
    /// - Decimal: 12
    /// - Hexadecimal: 0C
    /// - HTML entity: &#12;
    /// - Escape sequence: \f
    /// - Unicode: \u{000C}
    /// - Control description: FF
    ///
    /// Alternative names:
    /// - FF
    /// - Form Feed
    /// - Page Break
    /// - ^L
    ///
    /// System behavior:
    /// - May clear screen in terminals
    /// - May insert page break in printers
    /// - Often used as a section separator
    case formFeed

    /// Carriage Return character (ASCII 0x0D, ^M)
    ///
    /// Moves the cursor to the beginning of the current line.
    ///
    /// Historical background:
    /// Named after the carriage return mechanism in typewriters,
    /// which moved the carriage back to the starting position.
    ///
    /// Common uses:
    /// - Line termination (Windows - CR+LF)
    /// - Text file line breaks
    /// - Serial communication
    ///
    /// Representations:
    /// - Control notation: ^M
    /// - Binary: 00001101
    /// - Octal: 015
    /// - Decimal: 13
    /// - Hexadecimal: 0D
    /// - HTML entity: &#13;
    /// - Escape sequence: \r
    /// - Unicode: \u{000D}
    /// - Control description: CR
    ///
    /// Alternative names:
    /// - CR
    /// - Carriage Return
    /// - \r
    /// - ^M
    ///
    /// System considerations:
    /// - Windows uses CR+LF for newlines
    /// - May need conversion in cross-platform applications
    /// - Important in network protocols
    case carriageReturn

    /// Shift Out character (ASCII 0x0E, ^N)
    ///
    /// Switches to an alternate character set.
    ///
    /// Historical background:
    /// Originally used to switch between multiple character
    /// sets in early communication systems.
    ///
    /// Common uses:
    /// - Character set switching
    /// - Extended character set access
    /// - Legacy terminal control
    ///
    /// Representations:
    /// - Control notation: ^N
    /// - Binary: 00001110
    /// - Octal: 016
    /// - Decimal: 14
    /// - Hexadecimal: 0E
    /// - HTML entity: &#14;
    /// - Escape sequence: \x0E
    /// - Unicode: \u{000E}
    /// - Control description: SO
    ///
    /// Alternative names:
    /// - SO
    /// - Shift Out
    /// - ^N
    ///
    /// Protocol considerations:
    /// - Mostly obsolete in modern systems
    /// - May still be used in legacy applications
    /// - Should be handled carefully in text processing
    case shiftOut

    /// Shift In character (ASCII 0x0F, ^O)
    ///
    /// Returns to the standard character set after Shift Out.
    ///
    /// Historical background:
    /// Paired with Shift Out for character set switching in
    /// early communication systems and terminals.
    ///
    /// Common uses:
    /// - Character set switching
    /// - Return to standard charset
    /// - Legacy terminal control
    ///
    /// Representations:
    /// - Control notation: ^O
    /// - Binary: 00001111
    /// - Octal: 017
    /// - Decimal: 15
    /// - Hexadecimal: 0F
    /// - HTML entity: &#15;
    /// - Escape sequence: \x0F
    /// - Unicode: \u{000F}
    /// - Control description: SI
    ///
    /// Alternative names:
    /// - SI
    /// - Shift In
    /// - ^O
    ///
    /// Protocol considerations:
    /// - Usually paired with Shift Out (0x0E)
    /// - Mainly historical significance
    /// - May need special handling in legacy systems
    case shiftIn

    /// Data Link Escape character (ASCII 0x10, ^P)
    ///
    /// Changes the meaning of subsequent characters.
    ///
    /// Historical background:
    /// Used in communication protocols to indicate that
    /// following characters have special meaning.
    ///
    /// Common uses:
    /// - Protocol control sequences
    /// - Special character marking
    /// - Communication control
    ///
    /// Representations:
    /// - Control notation: ^P
    /// - Binary: 00010000
    /// - Octal: 020
    /// - Decimal: 16
    /// - Hexadecimal: 10
    /// - HTML entity: &#16;
    /// - Escape sequence: \x10
    /// - Unicode: \u{0010}
    /// - Control description: DLE
    ///
    /// Alternative names:
    /// - DLE
    /// - Data Link Escape
    /// - ^P
    ///
    /// Protocol considerations:
    /// - Important in binary protocols
    /// - May need escaping in data streams
    /// - Used for control sequence introduction
    case dataLinkEscape

    /// Device Control 1 character (ASCII 0x11, ^Q)
    ///
    /// Primary device control character, commonly used as XON.
    ///
    /// Historical background:
    /// Part of the device control series, standardized as
    /// XON in software flow control.
    ///
    /// Common uses:
    /// - Flow control (XON)
    /// - Terminal resume output
    /// - Serial communication
    ///
    /// Representations:
    /// - Control notation: ^Q
    /// - Binary: 00010001
    /// - Octal: 021
    /// - Decimal: 17
    /// - Hexadecimal: 11
    /// - HTML entity: &#17;
    /// - Escape sequence: \x11
    /// - Unicode: \u{0011}
    /// - Control description: DC1
    ///
    /// Alternative names:
    /// - DC1
    /// - XON
    /// - Device Control 1
    /// - ^Q
    ///
    /// Flow control:
    /// - Signals device to resume transmission
    /// - Paired with XOFF (DC3)
    /// - Critical in serial communications
    case deviceControl1

    /// Device Control 2 character (ASCII 0x12, ^R)
    ///
    /// Secondary device control character.
    ///
    /// Historical background:
    /// One of four device control characters defined in
    /// ASCII for equipment control.
    ///
    /// Common uses:
    /// - Device-specific control
    /// - Auxiliary device control
    /// - Custom protocol control
    ///
    /// Representations:
    /// - Control notation: ^R
    /// - Binary: 00010010
    /// - Octal: 022
    /// - Decimal: 18
    /// - Hexadecimal: 12
    /// - HTML entity: &#18;
    /// - Escape sequence: \x12
    /// - Unicode: \u{0012}
    /// - Control description: DC2
    ///
    /// Alternative names:
    /// - DC2
    /// - Device Control 2
    /// - ^R
    ///
    /// Implementation considerations:
    /// - Usage varies by device/system
    /// - May have special meaning in specific protocols
    /// - Often available for custom use
    case deviceControl2

    /// Device Control 3 character (ASCII 0x13, ^S)
    ///
    /// Third device control character, commonly used as XOFF.
    ///
    /// Historical background:
    /// Standardized as XOFF in software flow control,
    /// used to pause transmission.
    ///
    /// Common uses:
    /// - Flow control (XOFF)
    /// - Terminal suspend output
    /// - Serial communication control
    ///
    /// Representations:
    /// - Control notation: ^S
    /// - Binary: 00010011
    /// - Octal: 023
    /// - Decimal: 19
    /// - Hexadecimal: 13
    /// - HTML entity: &#19;
    /// - Escape sequence: \x13
    /// - Unicode: \u{0013}
    /// - Control description: DC3
    ///
    /// Alternative names:
    /// - DC3
    /// - XOFF
    /// - Device Control 3
    /// - ^S
    ///
    /// Flow control:
    /// - Signals device to suspend transmission
    /// - Paired with XON (DC1)
    /// - Important in hardware flow control
    ///
    /// System considerations:
    /// - May pause terminal output
    /// - Critical in serial communications
    /// - May need special handling in applications
    case deviceControl3

    /// Device Control 4 character (ASCII 0x14, ^T)
    ///
    /// Fourth device control character.
    ///
    /// Historical background:
    /// Last of the four device control characters in ASCII,
    /// reserved for device-specific control functions.
    ///
    /// Common uses:
    /// - Device-specific control
    /// - Custom protocol implementations
    /// - Special equipment control
    ///
    /// Representations:
    /// - Control notation: ^T
    /// - Binary: 00010100
    /// - Octal: 024
    /// - Decimal: 20
    /// - Hexadecimal: 14
    /// - HTML entity: &#20;
    /// - Escape sequence: \x14
    /// - Unicode: \u{0014}
    /// - Control description: DC4
    ///
    /// Alternative names:
    /// - DC4
    /// - Device Control 4
    /// - ^T
    ///
    /// Implementation considerations:
    /// - Function varies by device
    /// - Available for custom protocol use
    /// - May have special meaning in specific systems
    case deviceControl4

    /// Negative Acknowledge character (ASCII 0x15, ^U)
    ///
    /// Indicates that a transmission was received with errors
    /// or cannot be processed.
    ///
    /// Historical background:
    /// Used in early communication protocols to indicate
    /// failed or rejected transmissions.
    ///
    /// Common uses:
    /// - Error signaling
    /// - Protocol negative response
    /// - Communication flow control
    ///
    /// Representations:
    /// - Control notation: ^U
    /// - Binary: 00010101
    /// - Octal: 025
    /// - Decimal: 21
    /// - Hexadecimal: 15
    /// - HTML entity: &#21;
    /// - Escape sequence: \x15
    /// - Unicode: \u{0015}
    /// - Control description: NAK
    ///
    /// Alternative names:
    /// - NAK
    /// - Negative Acknowledge
    /// - ^U
    ///
    /// Protocol considerations:
    /// - Often triggers retransmission
    /// - Important in error recovery
    /// - Used in handshaking protocols
    case negativeAcknowledge

    /// Synchronous Idle character (ASCII 0x16, ^V)
    ///
    /// Used to maintain synchronization in data communication.
    ///
    /// Historical background:
    /// Originally used in synchronous communication systems
    /// to maintain timing when no data was being sent.
    ///
    /// Common uses:
    /// - Synchronization maintenance
    /// - Timing control
    /// - Communication protocols
    ///
    /// Representations:
    /// - Control notation: ^V
    /// - Binary: 00010110
    /// - Octal: 026
    /// - Decimal: 22
    /// - Hexadecimal: 16
    /// - HTML entity: &#22;
    /// - Escape sequence: \x16
    /// - Unicode: \u{0016}
    /// - Control description: SYN
    ///
    /// Alternative names:
    /// - SYN
    /// - Synchronous Idle
    /// - ^V
    ///
    /// Protocol considerations:
    /// - Used in synchronous transmission
    /// - Important for timing maintenance
    /// - May be filtered in some contexts
    case synchronousIdle

    /// End of Transmission Block character (ASCII 0x17, ^W)
    ///
    /// Indicates the end of a transmission block of data.
    ///
    /// Historical background:
    /// Used in block-oriented data transmission protocols
    /// to mark block boundaries.
    ///
    /// Common uses:
    /// - Block termination
    /// - Data segmentation
    /// - Protocol control
    ///
    /// Representations:
    /// - Control notation: ^W
    /// - Binary: 00010111
    /// - Octal: 027
    /// - Decimal: 23
    /// - Hexadecimal: 17
    /// - HTML entity: &#23;
    /// - Escape sequence: \x17
    /// - Unicode: \u{0017}
    /// - Control description: ETB
    ///
    /// Alternative names:
    /// - ETB
    /// - End of Transmission Block
    /// - ^W
    ///
    /// Protocol considerations:
    /// - Used in block-oriented protocols
    /// - May trigger block checksums
    /// - Important in data integrity checks
    case endOfTransmissionBlock

    /// Cancel character (ASCII 0x18, ^X)
    ///
    /// Indicates that previous data should be disregarded.
    ///
    /// Historical background:
    /// Used to signal that previously transmitted data
    /// should be ignored or cancelled.
    ///
    /// Common uses:
    /// - Data cancellation
    /// - Error recovery
    /// - Protocol abort signals
    ///
    /// Representations:
    /// - Control notation: ^X
    /// - Binary: 00011000
    /// - Octal: 030
    /// - Decimal: 24
    /// - Hexadecimal: 18
    /// - HTML entity: &#24;
    /// - Escape sequence: \x18
    /// - Unicode: \u{0018}
    /// - Control description: CAN
    ///
    /// Alternative names:
    /// - CAN
    /// - Cancel
    /// - ^X
    ///
    /// Protocol considerations:
    /// - May trigger error recovery
    /// - Used in abort sequences
    /// - Important in error handling
    case cancel

    /// End of Medium character (ASCII 0x19, ^Y)
    ///
    /// Indicates the physical end of a medium or the end
    /// of usable portion of data.
    ///
    /// Historical background:
    /// Originally used to signal the physical end of tape
    /// or other storage media.
    ///
    /// Common uses:
    /// - Media end indication
    /// - Data termination
    /// - Storage boundaries
    ///
    /// Representations:
    /// - Control notation: ^Y
    /// - Binary: 00011001
    /// - Octal: 031
    /// - Decimal: 25
    /// - Hexadecimal: 19
    /// - HTML entity: &#25;
    /// - Escape sequence: \x19
    /// - Unicode: \u{0019}
    /// - Control description: EM
    ///
    /// Alternative names:
    /// - EM
    /// - End of Medium
    /// - ^Y
    ///
    /// Implementation considerations:
    /// - May indicate physical or logical boundaries
    /// - Used in some storage systems
    /// - Historical significance in tape storage
    case endOfMedium

    /// Substitute character (ASCII 0x1A, ^Z)
    ///
    /// Used to replace detected errors in data.
    ///
    /// Historical background:
    /// Originally used to mark corrupted or invalid data.
    /// Also known as EOF marker in DOS/Windows systems.
    ///
    /// Common uses:
    /// - Error replacement
    /// - EOF marker (DOS/Windows)
    /// - Data validation
    ///
    /// Representations:
    /// - Control notation: ^Z
    /// - Binary: 00011010
    /// - Octal: 032
    /// - Decimal: 26
    /// - Hexadecimal: 1A
    /// - HTML entity: &#26;
    /// - Escape sequence: \x1A
    /// - Unicode: \u{001A}
    /// - Control description: SUB
    ///
    /// Alternative names:
    /// - SUB
    /// - Substitute
    /// - EOF
    /// - ^Z
    ///
    /// System considerations:
    /// - EOF marker in DOS/Windows
    /// - May need special handling in text processing
    /// - Important in cross-platform applications
    case substitute

    /// Escape character (ASCII 0x1B, ^[)
    ///
    /// Indicates that following characters have alternate meaning.
    ///
    /// Historical background:
    /// Used to extend the command set beyond ASCII by prefixing
    /// control sequences, especially in terminal control.
    ///
    /// Common uses:
    /// - Terminal control sequences
    /// - ANSI escape codes
    /// - Special command introduction
    ///
    /// Representations:
    /// - Control notation: ^[
    /// - Binary: 00011011
    /// - Octal: 033
    /// - Decimal: 27
    /// - Hexadecimal: 1B
    /// - HTML entity: &#27;
    /// - Escape sequence: \x1B
    /// - Unicode: \u{001B}
    /// - Control description: ESC
    ///
    /// Alternative names:
    /// - ESC
    /// - Escape
    /// - ^[
    ///
    /// Programming considerations:
    /// - Key in ANSI terminal control
    /// - Often starts control sequences
    /// - Important in terminal emulation
    case escape

    /// File Separator character (ASCII 0x1C, ^\)
    ///
    /// Separates logical data files within a larger structure.
    ///
    /// Historical background:
    /// Part of a hierarchical set of separators used for
    /// data organization in early computing.
    ///
    /// Common uses:
    /// - File level separation
    /// - Data structuring
    /// - Record organization
    ///
    /// Representations:
    /// - Control notation: ^\
    /// - Binary: 00011100
    /// - Octal: 034
    /// - Decimal: 28
    /// - Hexadecimal: 1C
    /// - HTML entity: &#28;
    /// - Escape sequence: \x1C
    /// - Unicode: \u{001C}
    /// - Control description: FS
    ///
    /// Alternative names:
    /// - FS
    /// - File Separator
    /// - ^\
    ///
    /// Data organization:
    /// - Highest level in separator hierarchy
    /// - Used in structured data
    /// - Important in legacy systems
    case fileSeparator

    /// Group Separator character (ASCII 0x1D, ^])
    ///
    /// Separates groups of data within files.
    ///
    /// Historical background:
    /// Second highest level in the original ASCII
    /// hierarchy of data separators.
    ///
    /// Common uses:
    /// - Group level separation
    /// - Data organization
    /// - Structured records
    ///
    /// Representations:
    /// - Control notation: ^]
    /// - Binary: 00011101
    /// - Octal: 035
    /// - Decimal: 29
    /// - Hexadecimal: 1D
    /// - HTML entity: &#29;
    /// - Escape sequence: \x1D
    /// - Unicode: \u{001D}
    /// - Control description: GS
    ///
    /// Alternative names:
    /// - GS
    /// - Group Separator
    /// - ^]
    ///
    /// Data organization:
    /// - Second level in separator hierarchy
    /// - Used in structured data formats
    /// - Legacy data formatting
    case groupSeparator

    /// Record Separator character (ASCII 0x1E, ^^)
    ///
    /// Separates records within groups of data.
    ///
    /// Historical background:
    /// Third level in the ASCII hierarchy of data separators,
    /// used for structuring data in early computing systems.
    ///
    /// Common uses:
    /// - Record delimitation
    /// - Data structuring
    /// - Legacy data formats
    ///
    /// Representations:
    /// - Control notation: ^^
    /// - Binary: 00011110
    /// - Octal: 036
    /// - Decimal: 30
    /// - Hexadecimal: 1E
    /// - HTML entity: &#30;
    /// - Escape sequence: \x1E
    /// - Unicode: \u{001E}
    /// - Control description: RS
    ///
    /// Alternative names:
    /// - RS
    /// - Record Separator
    /// - ^^
    ///
    /// Data organization:
    /// - Third level in separator hierarchy
    /// - Used in structured data
    /// - Important for record formatting
    case recordSeparator

    /// Unit Separator character (ASCII 0x1F, ^_)
    ///
    /// Separates individual units of data within records.
    ///
    /// Historical background:
    /// Lowest level in the ASCII hierarchy of data separators,
    /// used for the smallest data divisions.
    ///
    /// Common uses:
    /// - Field separation
    /// - Data unit delimitation
    /// - Low-level data organization
    ///
    /// Representations:
    /// - Control notation: ^_
    /// - Binary: 00011111
    /// - Octal: 037
    /// - Decimal: 31
    /// - Hexadecimal: 1F
    /// - HTML entity: &#31;
    /// - Escape sequence: \x1F
    /// - Unicode: \u{001F}
    /// - Control description: US
    ///
    /// Alternative names:
    /// - US
    /// - Unit Separator
    /// - ^_
    ///
    /// Data organization:
    /// - Lowest level in separator hierarchy
    /// - Field-level separation
    /// - Basic data structuring
    case unitSeparator

    /// Space character (ASCII 0x20)
    ///
    /// The most basic and common form of white space.
    ///
    /// Historical background:
    /// Derived from the typewriter space bar, used to
    /// separate words and create visual spacing.
    ///
    /// Common uses:
    /// - Word separation
    /// - Text formatting
    /// - Visual spacing
    /// - Alignment
    ///
    /// Representations:
    /// - Visual: ' ' (blank space)
    /// - Binary: 00100000
    /// - Octal: 040
    /// - Decimal: 32
    /// - Hexadecimal: 20
    /// - HTML entity: &#32;
    /// - Escape sequence: ' '
    /// - Unicode: \u{0020}
    /// - Control description: SPC
    ///
    /// Alternative names:
    /// - SPC
    /// - Space
    /// - Blank
    /// - White space
    ///
    /// Programming considerations:
    /// - Most common whitespace character
    /// - Important in text processing
    /// - May need normalization
    /// - Critical in formatting
    ///
    /// Text processing:
    /// - Often collapsed in HTML
    /// - May be significant in pre-formatted text
    /// - Key in word boundary detection
    case space

    /// Exclamation Mark character (ASCII 0x21, !)
    ///
    /// Punctuation mark indicating strong emotion or emphasis.
    ///
    /// Historical background:
    /// Derived from Latin punctuation, used for centuries
    /// to mark exclamations and emphasis.
    ///
    /// Common uses:
    /// - Emphasis in text
    /// - Exclamations
    /// - Factorial in mathematics
    /// - Logical negation in programming
    ///
    /// Representations:
    /// - Symbol: !
    /// - Binary: 00100001
    /// - Octal: 041
    /// - Decimal: 33
    /// - Hexadecimal: 21
    /// - HTML entity: &#33;
    /// - Escape sequence: !
    /// - Unicode: \u{0021}
    ///
    /// Programming contexts:
    /// - Logical NOT operator
    /// - Shell script "bang" line (#!)
    /// - Factorial operator
    /// - Not equal operator (!=)
    ///
    /// Text considerations:
    /// - May need escaping in certain contexts
    /// - Important in pattern matching
    /// - Used in shell scripting
    case exclamationMark

    /// Double Quote character (ASCII 0x22, ")
    ///
    /// Character used for quoting text and string delimitation.
    ///
    /// Historical background:
    /// Traditional punctuation mark used for quotations and
    /// later adopted as a string delimiter in programming.
    ///
    /// Common uses:
    /// - String delimitation in programming
    /// - Direct quotations in text
    /// - Attribute values in markup languages
    ///
    /// Representations:
    /// - Symbol: "
    /// - Binary: 00100010
    /// - Octal: 042
    /// - Decimal: 34
    /// - Hexadecimal: 22
    /// - HTML entity: &#34;
    /// - Escape sequence: \"
    /// - Unicode: \u{0022}
    ///
    /// Programming considerations:
    /// - String delimiter in many languages
    /// - Often needs escaping
    /// - Important in parsing
    /// - Key in markup languages
    ///
    /// Text processing:
    /// - May need special handling
    /// - Important in CSV formats
    /// - Critical in JSON
    case doubleQuote

    /// Number Sign character (ASCII 0x23, #)
    ///
    /// Also known as hash or pound sign.
    ///
    /// Historical background:
    /// Originally used for numbers, evolved into various
    /// uses including comments and social media tags.
    ///
    /// Common uses:
    /// - Comments in programming
    /// - Hashtags in social media
    /// - Numbers/ordering
    /// - Shell script shebangs
    ///
    /// Representations:
    /// - Symbol: #
    /// - Binary: 00100011
    /// - Octal: 043
    /// - Decimal: 35
    /// - Hexadecimal: 23
    /// - HTML entity: &#35;
    /// - Escape sequence: #
    /// - Unicode: \u{0023}
    ///
    /// Programming contexts:
    /// - Comment indicator
    /// - Preprocessor directives
    /// - Special sequence starter
    /// - Markdown headings
    ///
    /// Modern usage:
    /// - Social media tags
    /// - Channel names
    /// - Anchor links
    /// - Color codes
    case numberSign

    /// Dollar Sign character (ASCII 0x24, $)
    ///
    /// Currency symbol and programming variable indicator.
    ///
    /// Historical background:
    /// Originally a currency symbol, later adopted for
    /// various programming and technical uses.
    ///
    /// Common uses:
    /// - Currency notation
    /// - Variable indicators
    /// - Regular expression anchors
    /// - Shell script variables
    ///
    /// Representations:
    /// - Symbol: $
    /// - Binary: 00100100
    /// - Octal: 044
    /// - Decimal: 36
    /// - Hexadecimal: 24
    /// - HTML entity: &#36;
    /// - Escape sequence: $
    /// - Unicode: \u{0024}
    ///
    /// Programming contexts:
    /// - Variable prefix in shell scripts
    /// - End of line in regex
    /// - jQuery selector
    /// - String interpolation
    ///
    /// Special uses:
    /// - Currency symbol
    /// - Financial notation
    /// - Template variables
    /// - Macro expansion
    case dollarSign

    /// Percent Sign character (ASCII 0x25, %)
    ///
    /// Mathematical and programming operator symbol.
    ///
    /// Historical background:
    /// Mathematical symbol for percentages, later adopted
    /// for various computing uses.
    ///
    /// Common uses:
    /// - Percentage values
    /// - Modulo operator
    /// - URL encoding
    /// - Format strings
    ///
    /// Representations:
    /// - Symbol: %
    /// - Binary: 00100101
    /// - Octal: 045
    /// - Decimal: 37
    /// - Hexadecimal: 25
    /// - HTML entity: &#37;
    /// - Escape sequence: %
    /// - Unicode: \u{0025}
    ///
    /// Programming contexts:
    /// - Modulo operator
    /// - Format specifiers
    /// - URL encoding
    /// - SQL wildcards
    ///
    /// Special uses:
    /// - Statistical notation
    /// - Template placeholders
    /// - Character encoding
    /// - Pattern matching
    case percentSign

    /// Ampersand character (ASCII 0x26, &)
    ///
    /// Logical AND operator and special character.
    ///
    /// Historical background:
    /// Derived from Latin "et" (and), evolved into both
    /// a logical operator and general conjunction symbol.
    ///
    /// Common uses:
    /// - Logical AND in programming
    /// - HTML entity prefix
    /// - URL parameter separator
    /// - Command concatenation
    ///
    /// Representations:
    /// - Symbol: &
    /// - Binary: 00100110
    /// - Octal: 046
    /// - Decimal: 38
    /// - Hexadecimal: 26
    /// - HTML entity: &#38;
    /// - Escape sequence: &
    /// - Unicode: \u{0026}
    ///
    /// Programming contexts:
    /// - Bitwise AND operator
    /// - Reference operator in C/C++
    /// - Background process in shells
    /// - HTML escape sequences
    ///
    /// Special uses:
    /// - URL query strings
    /// - Command chaining
    /// - XML/HTML entities
    /// - Pointer references
    case ampersand

    /// Single Quote character (ASCII 0x27, ')
    ///
    /// Character string delimiter and apostrophe.
    ///
    /// Historical background:
    /// Traditional punctuation mark used for quotations
    /// and contractions, adopted as string delimiter.
    ///
    /// Common uses:
    /// - String delimitation
    /// - Apostrophe in text
    /// - Character literals
    /// - Quotation mark
    ///
    /// Representations:
    /// - Symbol: '
    /// - Binary: 00100111
    /// - Octal: 047
    /// - Decimal: 39
    /// - Hexadecimal: 27
    /// - HTML entity: &#39;
    /// - Escape sequence: \'
    /// - Unicode: \u{0027}
    ///
    /// Programming contexts:
    /// - Character literals
    /// - String delimiter
    /// - SQL string delimiter
    /// - Shell command substitution
    ///
    /// Text processing:
    /// - Contractions
    /// - Possessives
    /// - Quote marks
    /// - May need escaping
    case singleQuote

    /// Left Parenthesis character (ASCII 0x28, ()
    ///
    /// Opening bracket for grouping and precedence.
    ///
    /// Historical background:
    /// Mathematical notation adopted into general writing
    /// and programming for grouping elements.
    ///
    /// Common uses:
    /// - Expression grouping
    /// - Function calls
    /// - Precedence control
    /// - Text organization
    ///
    /// Representations:
    /// - Symbol: (
    /// - Binary: 00101000
    /// - Octal: 050
    /// - Decimal: 40
    /// - Hexadecimal: 28
    /// - HTML entity: &#40;
    /// - Escape sequence: (
    /// - Unicode: \u{0028}
    ///
    /// Programming contexts:
    /// - Function parameters
    /// - Expression grouping
    /// - Operator precedence
    /// - Pattern matching
    ///
    /// Special uses:
    /// - Mathematical notation
    /// - Regular expressions
    /// - Capture groups
    /// - Syntax grouping
    case leftParenthesis

    /// Right Parenthesis character (ASCII 0x29, ))
    ///
    /// Closing bracket for grouping and precedence.
    ///
    /// Historical background:
    /// Paired with left parenthesis for enclosing
    /// expressions and groups in text and mathematics.
    ///
    /// Common uses:
    /// - Expression closure
    /// - Function call termination
    /// - Grouping completion
    /// - Syntax boundaries
    ///
    /// Representations:
    /// - Symbol: )
    /// - Binary: 00101001
    /// - Octal: 051
    /// - Decimal: 41
    /// - Hexadecimal: 29
    /// - HTML entity: &#41;
    /// - Escape sequence: )
    /// - Unicode: \u{0029}
    ///
    /// Programming contexts:
    /// - Function call closure
    /// - Expression termination
    /// - Grouping completion
    /// - Pattern boundaries
    ///
    /// Parsing considerations:
    /// - Must match left parenthesis
    /// - Important in syntax checking
    /// - Key in expression evaluation
    /// - Critical in compiler parsing
    case rightParenthesis

    /// Asterisk character (ASCII 0x2A, *)
    ///
    /// Multiplication operator and wildcard symbol.
    ///
    /// Historical background:
    /// Originally a symbol for multiplication, evolved into
    /// multiple uses in computing and text processing.
    ///
    /// Common uses:
    /// - Multiplication operator
    /// - Wildcard character
    /// - Pointer dereferencing
    /// - Emphasis marker
    ///
    /// Representations:
    /// - Symbol: *
    /// - Binary: 00101010
    /// - Octal: 052
    /// - Decimal: 42
    /// - Hexadecimal: 2A
    /// - HTML entity: &#42;
    /// - Escape sequence: *
    /// - Unicode: \u{002A}
    ///
    /// Programming contexts:
    /// - Multiplication operator
    /// - Pointer dereferencing in C/C++
    /// - Regular expression quantifier
    /// - File globbing
    ///
    /// Special uses:
    /// - Bullet points
    /// - Password masking
    /// - Documentation emphasis
    /// - Pattern matching
    case asterisk

    /// Plus Sign character (ASCII 0x2B, +)
    ///
    /// Addition operator and concatenation symbol.
    ///
    /// Historical background:
    /// Mathematical symbol for addition, adopted for
    /// various computing and string operations.
    ///
    /// Common uses:
    /// - Addition operator
    /// - String concatenation
    /// - Increment operations
    /// - Positive numbers
    ///
    /// Representations:
    /// - Symbol: +
    /// - Binary: 00101011
    /// - Octal: 053
    /// - Decimal: 43
    /// - Hexadecimal: 2B
    /// - HTML entity: &#43;
    /// - Escape sequence: +
    /// - Unicode: \u{002B}
    ///
    /// Programming contexts:
    /// - Addition operator
    /// - String concatenation
    /// - Increment operator (++)
    /// - Regular expression quantifier
    ///
    /// Special uses:
    /// - URL encoding (+)
    /// - Base64 encoding
    /// - Number formatting
    /// - Version numbers
    case plus

    /// Comma character (ASCII 0x2C, ,)
    ///
    /// List separator and decimal point in some locales.
    ///
    /// Historical background:
    /// Traditional punctuation mark for separating elements,
    /// widely used in data formats and programming.
    ///
    /// Common uses:
    /// - List separation
    /// - Parameter separation
    /// - Decimal point (some locales)
    /// - Array elements
    ///
    /// Representations:
    /// - Symbol: ,
    /// - Binary: 00101100
    /// - Octal: 054
    /// - Decimal: 44
    /// - Hexadecimal: 2C
    /// - HTML entity: &#44;
    /// - Escape sequence: ,
    /// - Unicode: \u{002C}
    ///
    /// Programming contexts:
    /// - Parameter separator
    /// - Array element separator
    /// - CSV data format
    /// - Multiple declarations
    ///
    /// Data formatting:
    /// - CSV fields
    /// - JSON arrays
    /// - Function parameters
    /// - Number formatting
    case comma

    /// Minus Sign character (ASCII 0x2D, -)
    ///
    /// Subtraction operator and hyphen.
    ///
    /// Historical background:
    /// Mathematical symbol for subtraction and text hyphenation,
    /// evolved into multiple uses in computing.
    ///
    /// Common uses:
    /// - Subtraction operator
    /// - Negative numbers
    /// - Text hyphenation
    /// - Command-line options
    ///
    /// Representations:
    /// - Symbol: -
    /// - Binary: 00101101
    /// - Octal: 055
    /// - Decimal: 45
    /// - Hexadecimal: 2D
    /// - HTML entity: &#45;
    /// - Escape sequence: -
    /// - Unicode: \u{002D}
    ///
    /// Programming contexts:
    /// - Subtraction operator
    /// - Decrement operator (--)
    /// - Command-line flags
    /// - Range specification
    ///
    /// Special uses:
    /// - Word hyphenation
    /// - Bullet points
    /// - File names
    /// - Version numbers
    case minus

    /// Period/Dot character (ASCII 0x2E, .)
    ///
    /// Sentence terminator and decimal point.
    ///
    /// Historical background:
    /// Fundamental punctuation mark used for sentence endings
    /// and adopted for numerous technical purposes.
    ///
    /// Common uses:
    /// - Sentence termination
    /// - Decimal point
    /// - Domain names
    /// - Object member access
    ///
    /// Representations:
    /// - Symbol: .
    /// - Binary: 00101110
    /// - Octal: 056
    /// - Decimal: 46
    /// - Hexadecimal: 2E
    /// - HTML entity: &#46;
    /// - Escape sequence: .
    /// - Unicode: \u{002E}
    ///
    /// Programming contexts:
    /// - Member access operator
    /// - File extensions
    /// - Package names
    /// - Regular expression (any character)
    ///
    /// Special uses:
    /// - IP addresses
    /// - Version numbers
    /// - Path separation
    /// - Method chaining
    case period

    /// Forward Slash character (ASCII 0x2F, /)
    ///
    /// Division operator and path separator.
    ///
    /// Historical background:
    /// Mathematical division symbol that became widely used
    /// for file paths and URLs in computing.
    ///
    /// Common uses:
    /// - Division operator
    /// - Path separator
    /// - URL component separator
    /// - Date separator
    ///
    /// Representations:
    /// - Symbol: /
    /// - Binary: 00101111
    /// - Octal: 057
    /// - Decimal: 47
    /// - Hexadecimal: 2F
    /// - HTML entity: &#47;
    /// - Escape sequence: /
    /// - Unicode: \u{002F}
    ///
    /// Programming contexts:
    /// - Division operator
    /// - Path delimiter
    /// - Regular expression delimiters
    /// - Comment markers
    ///
    /// Special uses:
    /// - URL paths
    /// - Command options
    /// - Search patterns
    /// - File system paths
    case forwardSlash

    /// Digit Zero character (ASCII 0x30, 0)
    ///
    /// Numeric digit and common placeholder.
    ///
    /// Historical background:
    /// Basic numeric digit, significant in positional
    /// number systems and computing.
    ///
    /// Common uses:
    /// - Numeric value zero
    /// - Binary digit
    /// - Array indexing
    /// - Padding
    ///
    /// Representations:
    /// - Symbol: 0
    /// - Binary: 00110000
    /// - Octal: 060
    /// - Decimal: 48
    /// - Hexadecimal: 30
    /// - HTML entity: &#48;
    /// - Escape sequence: 0
    /// - Unicode: \u{0030}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Index base
    /// - NULL terminator
    /// - Boolean false
    ///
    /// Special uses:
    /// - String padding
    /// - Phone numbers
    /// - Decimal places
    /// - Binary data
    case digit0

    /// Digit One character (ASCII 0x31, 1)
    ///
    /// Numeric digit and boolean true value.
    ///
    /// Historical background:
    /// Basic numeric digit, fundamental in binary
    /// and decimal number systems.
    ///
    /// Common uses:
    /// - Numeric value one
    /// - Binary digit
    /// - Boolean true
    /// - Counting
    ///
    /// Representations:
    /// - Symbol: 1
    /// - Binary: 00110001
    /// - Octal: 061
    /// - Decimal: 49
    /// - Hexadecimal: 31
    /// - HTML entity: &#49;
    /// - Escape sequence: 1
    /// - Unicode: \u{0031}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Boolean true
    /// - Binary values
    /// - Array indices
    ///
    /// Special uses:
    /// - Flags
    /// - Status codes
    /// - Version numbers
    /// - Enumeration
    case digit1

    /// Digit Two character (ASCII 0x32, 2)
    ///
    /// Numeric digit and common multiplier.
    ///
    /// Historical background:
    /// Basic numeric digit, significant in mathematics
    /// and binary powers (2^n).
    ///
    /// Common uses:
    /// - Numeric value two
    /// - Powers of two
    /// - Base pairs
    /// - Enumeration
    ///
    /// Representations:
    /// - Symbol: 2
    /// - Binary: 00110010
    /// - Octal: 062
    /// - Decimal: 50
    /// - Hexadecimal: 32
    /// - HTML entity: &#50;
    /// - Escape sequence: 2
    /// - Unicode: \u{0032}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Array indices
    /// - Binary shifts
    /// - Version numbers
    ///
    /// Special uses:
    /// - Binary powers
    /// - Status codes
    /// - Pair counting
    /// - Duplicate markers
    case digit2

    /// Digit Three character (ASCII 0x33, 3)
    ///
    /// Numeric digit and tertiary indicator.
    ///
    /// Historical background:
    /// Basic numeric digit, often used in counting
    /// and systematic numbering.
    ///
    /// Common uses:
    /// - Numeric value three
    /// - Tertiary ordering
    /// - Triple counts
    /// - Version numbers
    ///
    /// Representations:
    /// - Symbol: 3
    /// - Binary: 00110011
    /// - Octal: 063
    /// - Decimal: 51
    /// - Hexadecimal: 33
    /// - HTML entity: &#51;
    /// - Escape sequence: 3
    /// - Unicode: \u{0033}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Array indices
    /// - Error codes
    /// - Enumeration
    ///
    /// Special uses:
    /// - Triple patterns
    /// - Status indicators
    /// - Priority levels
    /// - Sequence numbers
    case digit3

    /// Digit Four character (ASCII 0x34, 4)
    ///
    /// Numeric digit and quaternary indicator.
    ///
    /// Historical background:
    /// Basic numeric digit, significant in various
    /// numbering systems and patterns.
    ///
    /// Common uses:
    /// - Numeric value four
    /// - Quaternary counting
    /// - Version numbers
    /// - Pattern repeats
    ///
    /// Representations:
    /// - Symbol: 4
    /// - Binary: 00110100
    /// - Octal: 064
    /// - Decimal: 52
    /// - Hexadecimal: 34
    /// - HTML entity: &#52;
    /// - Escape sequence: 4
    /// - Unicode: \u{0034}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Array indices
    /// - Status codes
    /// - Pattern matching
    ///
    /// Special uses:
    /// - Quad patterns
    /// - Error levels
    /// - Matrix indices
    /// - Version components
    case digit4

    /// Digit Five character (ASCII 0x35, 5)
    ///
    /// Numeric digit and quintary indicator.
    ///
    /// Historical background:
    /// Basic numeric digit, historically significant
    /// in counting systems and ratings.
    ///
    /// Common uses:
    /// - Numeric value five
    /// - Rating systems
    /// - Version numbers
    /// - Counting
    ///
    /// Representations:
    /// - Symbol: 5
    /// - Binary: 00110101
    /// - Octal: 065
    /// - Decimal: 53
    /// - Hexadecimal: 35
    /// - HTML entity: &#53;
    /// - Escape sequence: 5
    /// - Unicode: \u{0035}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Array indices
    /// - Error codes
    /// - Pattern matching
    ///
    /// Special uses:
    /// - Star ratings
    /// - Priority levels
    /// - HTTP status codes
    /// - Sequence numbers
    case digit5

    /// Digit Six character (ASCII 0x36, 6)
    ///
    /// Numeric digit and sextary indicator.
    ///
    /// Historical background:
    /// Basic numeric digit, significant in mathematical
    /// and computing contexts.
    ///
    /// Common uses:
    /// - Numeric value six
    /// - Base-6 numbers
    /// - Version numbers
    /// - Counting systems
    ///
    /// Representations:
    /// - Symbol: 6
    /// - Binary: 00110110
    /// - Octal: 066
    /// - Decimal: 54
    /// - Hexadecimal: 36
    /// - HTML entity: &#54;
    /// - Escape sequence: 6
    /// - Unicode: \u{0036}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Array indices
    /// - Status codes
    /// - Base conversion
    ///
    /// Special uses:
    /// - IPv6 addresses
    /// - Color codes
    /// - Coordinate systems
    /// - Pattern matching
    case digit6

    /// Digit Seven character (ASCII 0x37, 7)
    ///
    /// Numeric digit and septenary indicator.
    ///
    /// Historical background:
    /// Basic numeric digit, historically significant
    /// in many cultural and computing contexts.
    ///
    /// Common uses:
    /// - Numeric value seven
    /// - Week days
    /// - Base-7 numbers
    /// - Version numbers
    ///
    /// Representations:
    /// - Symbol: 7
    /// - Binary: 00110111
    /// - Octal: 067
    /// - Decimal: 55
    /// - Hexadecimal: 37
    /// - HTML entity: &#55;
    /// - Escape sequence: 7
    /// - Unicode: \u{0037}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Array indices
    /// - Error codes
    /// - Pattern matching
    ///
    /// Special uses:
    /// - Calendar systems
    /// - Phone numbers
    /// - Reference codes
    /// - Status indicators
    case digit7

    /// Digit Eight character (ASCII 0x38, 8)
    ///
    /// Numeric digit and octal base indicator.
    ///
    /// Historical background:
    /// Basic numeric digit, significant in octal
    /// numbering systems and computing.
    ///
    /// Common uses:
    /// - Numeric value eight
    /// - Octal numbers
    /// - Byte values
    /// - Version numbers
    ///
    /// Representations:
    /// - Symbol: 8
    /// - Binary: 00111000
    /// - Octal: 070
    /// - Decimal: 56
    /// - Hexadecimal: 38
    /// - HTML entity: &#56;
    /// - Escape sequence: 8
    /// - Unicode: \u{0038}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Octal notation
    /// - Byte manipulation
    /// - Pattern matching
    ///
    /// Special uses:
    /// - File permissions
    /// - Byte boundaries
    /// - Status codes
    /// - Reference systems
    case digit8

    /// Digit Nine character (ASCII 0x39, 9)
    ///
    /// Numeric digit and highest single-digit value.
    ///
    /// Historical background:
    /// Basic numeric digit, represents the largest
    /// single digit in decimal system.
    ///
    /// Common uses:
    /// - Numeric value nine
    /// - Decimal numbers
    /// - Version numbers
    /// - Maximum single digit
    ///
    /// Representations:
    /// - Symbol: 9
    /// - Binary: 00111001
    /// - Octal: 071
    /// - Decimal: 57
    /// - Hexadecimal: 39
    /// - HTML entity: &#57;
    /// - Escape sequence: 9
    /// - Unicode: \u{0039}
    ///
    /// Programming contexts:
    /// - Numeric literal
    /// - Array indices
    /// - Range limits
    /// - Pattern matching
    ///
    /// Special uses:
    /// - Decimal system
    /// - Phone numbers
    /// - Version numbers
    /// - Numeric boundaries
    case digit9

    /// Colon character (ASCII 0x3A, :)
    ///
    /// Punctuation mark for separation and association.
    ///
    /// Historical background:
    /// Traditional punctuation mark adopted for various
    /// technical and programming uses.
    ///
    /// Common uses:
    /// - Time separation
    /// - Label delimiter
    /// - Port numbers
    /// - Key-value separation
    ///
    /// Representations:
    /// - Symbol: :
    /// - Binary: 00111010
    /// - Octal: 072
    /// - Decimal: 58
    /// - Hexadecimal: 3A
    /// - HTML entity: &#58;
    /// - Escape sequence: :
    /// - Unicode: \u{003A}
    ///
    /// Programming contexts:
    /// - JSON key-value separator
    /// - Label definition
    /// - URL scheme separator
    /// - Ternary operator
    ///
    /// Special uses:
    /// - Time notation
    /// - Protocol specifications
    /// - Class inheritance
    /// - Dictionary syntax
    case colon

    /// Semicolon character (ASCII 0x3B, ;)
    ///
    /// Statement terminator and list separator.
    ///
    /// Historical background:
    /// Punctuation mark adopted as a statement terminator
    /// in many programming languages.
    ///
    /// Common uses:
    /// - Statement termination
    /// - List separation
    /// - Clause separation
    /// - Command separation
    ///
    /// Representations:
    /// - Symbol: ;
    /// - Binary: 00111011
    /// - Octal: 073
    /// - Decimal: 59
    /// - Hexadecimal: 3B
    /// - HTML entity: &#59;
    /// - Escape sequence: ;
    /// - Unicode: \u{003B}
    ///
    /// Programming contexts:
    /// - Statement terminator
    /// - Multiple statements
    /// - For loop separator
    /// - CSS rule terminator
    ///
    /// Special uses:
    /// - Command chaining
    /// - Parameter lists
    /// - Style definitions
    /// - Query parameters
    case semicolon

    /// Less Than character (ASCII 0x3C, <)
    ///
    /// Comparison operator and XML/HTML tag delimiter.
    ///
    /// Historical background:
    /// Mathematical symbol adopted for programming
    /// comparison and markup language syntax.
    ///
    /// Common uses:
    /// - Comparison operator
    /// - XML/HTML tags
    /// - Input/Output redirection
    /// - Template parameters
    ///
    /// Representations:
    /// - Symbol: <
    /// - Binary: 00111100
    /// - Octal: 074
    /// - Decimal: 60
    /// - Hexadecimal: 3C
    /// - HTML entity: &#60;
    /// - Escape sequence: <
    /// - Unicode: \u{003C}
    ///
    /// Programming contexts:
    /// - Less than operator
    /// - XML/HTML tag start
    /// - Template parameters
    /// - Stream redirection
    ///
    /// Special uses:
    /// - Markup languages
    /// - Shell redirection
    /// - Generic types
    /// - Mathematical notation
    case lessThan

    /// Equals Sign character (ASCII 0x3D, =)
    ///
    /// Assignment and equality comparison operator.
    ///
    /// Historical background:
    /// Mathematical symbol adopted for assignment
    /// and equality testing in programming.
    ///
    /// Common uses:
    /// - Assignment operator
    /// - Equality comparison
    /// - Parameter assignment
    /// - Value definition
    ///
    /// Representations:
    /// - Symbol: =
    /// - Binary: 00111101
    /// - Octal: 075
    /// - Decimal: 61
    /// - Hexadecimal: 3D
    /// - HTML entity: &#61;
    /// - Escape sequence: =
    /// - Unicode: \u{003D}
    ///
    /// Programming contexts:
    /// - Assignment operator
    /// - Equality test (==)
    /// - Parameter setting
    /// - Default values
    ///
    /// Special uses:
    /// - URL parameters
    /// - Configuration files
    /// - Shell variables
    /// - Math equations
    case equals

    /// Greater Than character (ASCII 0x3E, >)
    ///
    /// Comparison operator and XML/HTML tag closer.
    ///
    /// Historical background:
    /// Mathematical symbol adopted for programming
    /// comparisons and markup language syntax.
    ///
    /// Common uses:
    /// - Comparison operator
    /// - XML/HTML tag closing
    /// - Output redirection
    /// - Generic type closure
    ///
    /// Representations:
    /// - Symbol: >
    /// - Binary: 00111110
    /// - Octal: 076
    /// - Decimal: 62
    /// - Hexadecimal: 3E
    /// - HTML entity: &#62;
    /// - Escape sequence: >
    /// - Unicode: \u{003E}
    ///
    /// Programming contexts:
    /// - Greater than operator
    /// - XML/HTML tag end
    /// - Stream redirection
    /// - Lambda expressions
    ///
    /// Special uses:
    /// - Markup languages
    /// - Shell redirection
    /// - Mail quotations
    /// - Tree structures
    case greaterThan

    /// Question Mark character (ASCII 0x3F, ?)
    ///
    /// Interrogation mark and conditional operator.
    ///
    /// Historical background:
    /// Punctuation mark for questions, adopted for
    /// various programming and pattern matching uses.
    ///
    /// Common uses:
    /// - Question mark
    /// - Ternary operator
    /// - Optional types
    /// - Pattern matching
    ///
    /// Representations:
    /// - Symbol: ?
    /// - Binary: 00111111
    /// - Octal: 077
    /// - Decimal: 63
    /// - Hexadecimal: 3F
    /// - HTML entity: &#63;
    /// - Escape sequence: ?
    /// - Unicode: \u{003F}
    ///
    /// Programming contexts:
    /// - Ternary operator
    /// - Optional chaining
    /// - Wildcard character
    /// - URL query start
    ///
    /// Special uses:
    /// - Help markers
    /// - Unknown values
    /// - Optional types
    /// - Query strings
    case questionMark

    /// At Sign character (ASCII 0x40, @)
    ///
    /// Commercial at and annotation marker.
    ///
    /// Historical background:
    /// Originally used in commerce and accounting,
    /// now widely used in email and social media.
    ///
    /// Common uses:
    /// - Email addresses
    /// - Social media handles
    /// - Annotations/Decorators
    /// - Mentions
    ///
    /// Representations:
    /// - Symbol: @
    /// - Binary: 01000000
    /// - Octal: 100
    /// - Decimal: 64
    /// - Hexadecimal: 40
    /// - HTML entity: &#64;
    /// - Escape sequence: @
    /// - Unicode: \u{0040}
    ///
    /// Programming contexts:
    /// - Annotations
    /// - Decorators
    /// - String interpolation
    /// - Special directives
    ///
    /// Special uses:
    /// - Email syntax
    /// - Social mentions
    /// - Documentation tags
    /// - Compiler directives
    case atSign

    /// Uppercase A character (ASCII 0x41, A)
    ///
    /// First letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Essential Latin letter, derived from Phoenician aleph,
    /// fundamental in alphabetic ordering.
    ///
    /// Common uses:
    /// - Beginning of alphabet
    /// - Grade designation
    /// - Hexadecimal digit (10)
    /// - Variable names
    ///
    /// Representations:
    /// - Symbol: A
    /// - Binary: 01000001
    /// - Octal: 101
    /// - Decimal: 65
    /// - Hexadecimal: 41
    /// - HTML entity: &#65;
    /// - Escape sequence: A
    /// - Unicode: \u{0041}
    ///
    /// Programming contexts:
    /// - Hexadecimal notation
    /// - Variable names
    /// - Class names
    /// - Type parameters
    ///
    /// Special uses:
    /// - Academic grades
    /// - Quality ratings
    /// - Drive letters
    /// - Measurement units
    case A

    /// Uppercase B character (ASCII 0x42, B)
    ///
    /// Second letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician beth,
    /// significant in various numbering systems.
    ///
    /// Common uses:
    /// - Binary data units (Byte)
    /// - Grade designation
    /// - Hexadecimal digit (11)
    /// - Variable names
    ///
    /// Representations:
    /// - Symbol: B
    /// - Binary: 01000010
    /// - Octal: 102
    /// - Decimal: 66
    /// - Hexadecimal: 42
    /// - HTML entity: &#66;
    /// - Escape sequence: B
    /// - Unicode: \u{0042}
    ///
    /// Programming contexts:
    /// - Hexadecimal notation
    /// - Byte representation
    /// - Class names
    /// - Boolean values
    ///
    /// Special uses:
    /// - Data sizes (KB, MB, GB)
    /// - Academic grades
    /// - Blood types
    /// - Musical notes
    case B

    /// Uppercase C character (ASCII 0x43, C)
    ///
    /// Third letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter evolved from Phoenician gimel,
    /// significant in programming language names.
    ///
    /// Common uses:
    /// - Programming language name
    /// - Temperature (Celsius)
    /// - Hexadecimal digit (12)
    /// - Variable names
    ///
    /// Representations:
    /// - Symbol: C
    /// - Binary: 01000011
    /// - Octal: 103
    /// - Decimal: 67
    /// - Hexadecimal: 43
    /// - HTML entity: &#67;
    /// - Escape sequence: C
    /// - Unicode: \u{0043}
    ///
    /// Programming contexts:
    /// - C language
    /// - Hexadecimal notation
    /// - Class names
    /// - Constants
    ///
    /// Special uses:
    /// - Temperature scale
    /// - Musical notes
    /// - Roman numerals
    /// - Copyright symbol
    case C

    /// Uppercase D character (ASCII 0x44, D)
    ///
    /// Fourth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician daleth,
    /// used in various technical contexts.
    ///
    /// Common uses:
    /// - Drive letters
    /// - Grade designation
    /// - Hexadecimal digit (13)
    /// - Variable names
    ///
    /// Representations:
    /// - Symbol: D
    /// - Binary: 01000100
    /// - Octal: 104
    /// - Decimal: 68
    /// - Hexadecimal: 44
    /// - HTML entity: &#68;
    /// - Escape sequence: D
    /// - Unicode: \u{0044}
    ///
    /// Programming contexts:
    /// - Hexadecimal notation
    /// - Class names
    /// - Drive specifications
    /// - Debug flags
    ///
    /// Special uses:
    /// - Academic grades
    /// - Roman numerals
    /// - Video quality (D1)
    /// - Chemical notation
    case D

    /// Uppercase E character (ASCII 0x45, E)
    ///
    /// Fifth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter evolved from Phoenician he,
    /// significant in scientific notation.
    ///
    /// Common uses:
    /// - Scientific notation
    /// - Hexadecimal digit (14)
    /// - Mathematical constant e
    /// - Variable names
    ///
    /// Representations:
    /// - Symbol: E
    /// - Binary: 01000101
    /// - Octal: 105
    /// - Decimal: 69
    /// - Hexadecimal: 45
    /// - HTML entity: &#69;
    /// - Escape sequence: E
    /// - Unicode: \u{0045}
    ///
    /// Programming contexts:
    /// - Scientific notation
    /// - Hexadecimal notation
    /// - Error handling
    /// - Enumeration types
    ///
    /// Special uses:
    /// - Academic grades
    /// - Mathematical constants
    /// - East direction
    /// - Electronic notation
    case E

    /// Uppercase F character (ASCII 0x46, F)
    ///
    /// Sixth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from digamma,
    /// significant as highest hexadecimal digit.
    ///
    /// Common uses:
    /// - Final hexadecimal digit (15)
    /// - Grade designation
    /// - Function keyword
    /// - False boolean
    ///
    /// Representations:
    /// - Symbol: F
    /// - Binary: 01000110
    /// - Octal: 106
    /// - Decimal: 70
    /// - Hexadecimal: 46
    /// - HTML entity: &#70;
    /// - Escape sequence: F
    /// - Unicode: \u{0046}
    ///
    /// Programming contexts:
    /// - Hexadecimal notation
    /// - Function declarations
    /// - File operations
    /// - Format specifications
    ///
    /// Special uses:
    /// - Academic grades
    /// - Temperature (Fahrenheit)
    /// - Musical notes
    /// - Failure indicators
    case F

    /// Uppercase G character (ASCII 0x47, G)
    ///
    /// Seventh letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter evolved from Greek gamma,
    /// used in various technical contexts.
    ///
    /// Common uses:
    /// - Units (Giga-)
    /// - Variable names
    /// - Musical notes
    /// - Graphics contexts
    ///
    /// Representations:
    /// - Symbol: G
    /// - Binary: 01000111
    /// - Octal: 107
    /// - Decimal: 71
    /// - Hexadecimal: 47
    /// - HTML entity: &#71;
    /// - Escape sequence: G
    /// - Unicode: \u{0047}
    ///
    /// Programming contexts:
    /// - Graphics functions
    /// - Global variables
    /// - Getter methods
    /// - Game development
    ///
    /// Special uses:
    /// - Data sizes (GB)
    /// - Musical notation
    /// - Force (G-force)
    /// - Gene notation
    case G

    /// Uppercase H character (ASCII 0x48, H)
    ///
    /// Eighth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician heth,
    /// significant in various technical contexts.
    ///
    /// Common uses:
    /// - Height designation
    /// - HTTP headers
    /// - Variable names
    /// - Hash functions
    ///
    /// Representations:
    /// - Symbol: H
    /// - Binary: 01001000
    /// - Octal: 110
    /// - Decimal: 72
    /// - Hexadecimal: 48
    /// - HTML entity: &#72;
    /// - Escape sequence: H
    /// - Unicode: \u{0048}
    ///
    /// Programming contexts:
    /// - Header files
    /// - Hash functions
    /// - Height parameters
    /// - HTTP methods
    ///
    /// Special uses:
    /// - Hospital designation
    /// - Hydrogen symbol
    /// - Hardware references
    /// - Height measurements
    case H

    /// Uppercase I character (ASCII 0x49, I)
    ///
    /// Ninth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter evolved from Phoenician yodh,
    /// commonly used in programming contexts.
    ///
    /// Common uses:
    /// - Integer type
    /// - Interface prefix
    /// - Input/Output
    /// - Index variables
    ///
    /// Representations:
    /// - Symbol: I
    /// - Binary: 01001001
    /// - Octal: 111
    /// - Decimal: 73
    /// - Hexadecimal: 49
    /// - HTML entity: &#73;
    /// - Escape sequence: I
    /// - Unicode: \u{0049}
    ///
    /// Programming contexts:
    /// - Integer types
    /// - Interface names
    /// - Iterator variables
    /// - Input handling
    ///
    /// Special uses:
    /// - Roman numeral (1)
    /// - Personal pronoun
    /// - Interstate highways
    /// - Current (electronics)
    case I

    /// Uppercase J character (ASCII 0x4A, J)
    ///
    /// Tenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Relatively recent addition to Latin alphabet,
    /// differentiated from I in medieval times.
    ///
    /// Common uses:
    /// - Java references
    /// - JSON notation
    /// - Variable names
    /// - Joule unit
    ///
    /// Representations:
    /// - Symbol: J
    /// - Binary: 01001010
    /// - Octal: 112
    /// - Decimal: 74
    /// - Hexadecimal: 4A
    /// - HTML entity: &#74;
    /// - Escape sequence: J
    /// - Unicode: \u{004A}
    ///
    /// Programming contexts:
    /// - Java identifiers
    /// - JSON handling
    /// - JavaScript files
    /// - Loop counters
    ///
    /// Special uses:
    /// - Joule (physics)
    /// - Junior designation
    /// - Journal entries
    /// - Jack (cards)
    case J

    /// Uppercase K character (ASCII 0x4B, K)
    ///
    /// Eleventh letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician kaph,
    /// significant in scientific notation.
    ///
    /// Common uses:
    /// - Kilo- prefix
    /// - Variable names
    /// - Kernel references
    /// - Temperature (Kelvin)
    ///
    /// Representations:
    /// - Symbol: K
    /// - Binary: 01001011
    /// - Octal: 113
    /// - Decimal: 75
    /// - Hexadecimal: 4B
    /// - HTML entity: &#75;
    /// - Escape sequence: K
    /// - Unicode: \u{004B}
    ///
    /// Programming contexts:
    /// - Data sizes (KB)
    /// - Key variables
    /// - Kernel functions
    /// - Constants
    ///
    /// Special uses:
    /// - Kelvin scale
    /// - Thousand indicator
    /// - King (chess/cards)
    /// - Strike out (baseball)
    case K

    /// Uppercase L character (ASCII 0x4C, L)
    ///
    /// Twelfth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician lamed,
    /// used in various measurement contexts.
    ///
    /// Common uses:
    /// - Length designation
    /// - Logical operations
    /// - Variable names
    /// - Liter unit
    ///
    /// Representations:
    /// - Symbol: L
    /// - Binary: 01001100
    /// - Octal: 114
    /// - Decimal: 76
    /// - Hexadecimal: 4C
    /// - HTML entity: &#76;
    /// - Escape sequence: L
    /// - Unicode: \u{004C}
    ///
    /// Programming contexts:
    /// - Long integers
    /// - List structures
    /// - Loop variables
    /// - Library references
    ///
    /// Special uses:
    /// - Roman numeral (50)
    /// - License notation
    /// - Left direction
    /// - Level indicators
    case L

    /// Uppercase M character (ASCII 0x4D, M)
    ///
    /// Thirteenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician mem,
    /// significant in metric system.
    ///
    /// Common uses:
    /// - Mega- prefix
    /// - Memory references
    /// - Matrix notation
    /// - Method names
    ///
    /// Representations:
    /// - Symbol: M
    /// - Binary: 01001101
    /// - Octal: 115
    /// - Decimal: 77
    /// - Hexadecimal: 4D
    /// - HTML entity: &#77;
    /// - Escape sequence: M
    /// - Unicode: \u{004D}
    ///
    /// Programming contexts:
    /// - Memory allocation
    /// - Method declarations
    /// - Matrix operations
    /// - Main function
    ///
    /// Special uses:
    /// - Roman numeral (1000)
    /// - Data sizes (MB)
    /// - Medium size
    /// - Male designation
    case M

    /// Uppercase N character (ASCII 0x4E, N)
    ///
    /// Fourteenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician nun,
    /// commonly used in mathematical notation.
    ///
    /// Common uses:
    /// - Number references
    /// - Null values
    /// - Variable names
    /// - North direction
    ///
    /// Representations:
    /// - Symbol: N
    /// - Binary: 01001110
    /// - Octal: 116
    /// - Decimal: 78
    /// - Hexadecimal: 4E
    /// - HTML entity: &#78;
    /// - Escape sequence: N
    /// - Unicode: \u{004E}
    ///
    /// Programming contexts:
    /// - Null references
    /// - Number variables
    /// - Network functions
    /// - Name spaces
    ///
    /// Special uses:
    /// - Natural numbers
    /// - Nitrogen symbol
    /// - Newton (force)
    /// - Compass direction
    case N

    /// Uppercase O character (ASCII 0x4F, O)
    ///
    /// Fifteenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician ayin,
    /// significant in various technical contexts.
    ///
    /// Common uses:
    /// - Object references
    /// - Output designation
    /// - Variable names
    /// - Binary digit
    ///
    /// Representations:
    /// - Symbol: O
    /// - Binary: 01001111
    /// - Octal: 117
    /// - Decimal: 79
    /// - Hexadecimal: 4F
    /// - HTML entity: &#79;
    /// - Escape sequence: O
    /// - Unicode: \u{004F}
    ///
    /// Programming contexts:
    /// - Object-oriented
    /// - Output operations
    /// - Option flags
    /// - Octal notation
    ///
    /// Special uses:
    /// - Blood type
    /// - Oxygen symbol
    /// - Zero alternative
    /// - Order notation
    case O

    /// Uppercase P character (ASCII 0x50, P)
    ///
    /// Sixteenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician pe,
    /// significant in programming terminology.
    ///
    /// Common uses:
    /// - Program references
    /// - Parameter notation
    /// - Pointer variables
    /// - Process IDs
    ///
    /// Representations:
    /// - Symbol: P
    /// - Binary: 01010000
    /// - Octal: 120
    /// - Decimal: 80
    /// - Hexadecimal: 50
    /// - HTML entity: &#80;
    /// - Escape sequence: P
    /// - Unicode: \u{0050}
    ///
    /// Programming contexts:
    /// - Pointer types
    /// - Process handling
    /// - Parameter lists
    /// - Program names
    ///
    /// Special uses:
    /// - Parking designation
    /// - Phosphorus symbol
    /// - Power notation
    /// - Port numbers
    case P

    /// Uppercase Q character (ASCII 0x51, Q)
    ///
    /// Seventeenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician qoph,
    /// used in various technical contexts.
    ///
    /// Common uses:
    /// - Query references
    /// - Queue structures
    /// - Quality indicators
    /// - Quantum notation
    ///
    /// Representations:
    /// - Symbol: Q
    /// - Binary: 01010001
    /// - Octal: 121
    /// - Decimal: 81
    /// - Hexadecimal: 51
    /// - HTML entity: &#81;
    /// - Escape sequence: Q
    /// - Unicode: \u{0051}
    ///
    /// Programming contexts:
    /// - Queue operations
    /// - Query functions
    /// - Quality parameters
    /// - Quit commands
    ///
    /// Special uses:
    /// - Queen (chess)
    /// - Quality control
    /// - Quarter references
    /// - Question marking
    case Q

    /// Uppercase R character (ASCII 0x52, R)
    ///
    /// Eighteenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician resh,
    /// significant in mathematical and programming contexts.
    ///
    /// Common uses:
    /// - Read operations
    /// - Return values
    /// - Resource references
    /// - Real numbers
    ///
    /// Representations:
    /// - Symbol: R
    /// - Binary: 01010010
    /// - Octal: 122
    /// - Decimal: 82
    /// - Hexadecimal: 52
    /// - HTML entity: &#82;
    /// - Escape sequence: R
    /// - Unicode: \u{0052}
    ///
    /// Programming contexts:
    /// - Read operations
    /// - Return statements
    /// - Resource handles
    /// - Regular expressions
    ///
    /// Special uses:
    /// - Registered trademark
    /// - Resistance (physics)
    /// - Right direction
    /// - Room numbers
    case R

    /// Uppercase S character (ASCII 0x53, S)
    ///
    /// Nineteenth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician shin,
    /// commonly used in programming and system contexts.
    ///
    /// Common uses:
    /// - String references
    /// - System calls
    /// - South direction
    /// - Status indicators
    ///
    /// Representations:
    /// - Symbol: S
    /// - Binary: 01010011
    /// - Octal: 123
    /// - Decimal: 83
    /// - Hexadecimal: 53
    /// - HTML entity: &#83;
    /// - Escape sequence: S
    /// - Unicode: \u{0053}
    ///
    /// Programming contexts:
    /// - String operations
    /// - System functions
    /// - Size parameters
    /// - Security contexts
    ///
    /// Special uses:
    /// - Sulfur symbol
    /// - Small size
    /// - Section marking
    /// - Signal notation
    case S

    /// Uppercase T character (ASCII 0x54, T)
    ///
    /// Twentieth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician taw,
    /// significant in technical and time contexts.
    ///
    /// Common uses:
    /// - Time references
    /// - Type definitions
    /// - Temperature
    /// - True boolean
    ///
    /// Representations:
    /// - Symbol: T
    /// - Binary: 01010100
    /// - Octal: 124
    /// - Decimal: 84
    /// - Hexadecimal: 54
    /// - HTML entity: &#84;
    /// - Escape sequence: T
    /// - Unicode: \u{0054}
    ///
    /// Programming contexts:
    /// - Type parameters
    /// - Time functions
    /// - Thread operations
    /// - Template types
    ///
    /// Special uses:
    /// - True value
    /// - Time notation
    /// - Temperature scales
    /// - Terminal reference
    case T

    /// Uppercase U character (ASCII 0x55, U)
    ///
    /// Twenty-first letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Greek upsilon,
    /// used in various technical contexts.
    ///
    /// Common uses:
    /// - Unit references
    /// - Unsigned types
    /// - User interfaces
    /// - URL components
    ///
    /// Representations:
    /// - Symbol: U
    /// - Binary: 01010101
    /// - Octal: 125
    /// - Decimal: 85
    /// - Hexadecimal: 55
    /// - HTML entity: &#85;
    /// - Escape sequence: U
    /// - Unicode: \u{0055}
    ///
    /// Programming contexts:
    /// - Unsigned integers
    /// - Unicode escapes
    /// - URI handling
    /// - User input
    ///
    /// Special uses:
    /// - Uranium symbol
    /// - Universal set
    /// - Up direction
    /// - Unit notation
    case U

    /// Uppercase V character (ASCII 0x56, V)
    ///
    /// Twenty-second letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter historically related to 'U',
    /// significant in version and vector notation.
    ///
    /// Common uses:
    /// - Version numbers
    /// - Vector notation
    /// - Voltage reference
    /// - Virtual keywords
    ///
    /// Representations:
    /// - Symbol: V
    /// - Binary: 01010110
    /// - Octal: 126
    /// - Decimal: 86
    /// - Hexadecimal: 56
    /// - HTML entity: &#86;
    /// - Escape sequence: V
    /// - Unicode: \u{0056}
    ///
    /// Programming contexts:
    /// - Version control
    /// - Vector operations
    /// - Virtual functions
    /// - Variable declarations
    ///
    /// Special uses:
    /// - Voltage (electronics)
    /// - Victory symbol
    /// - Roman numeral (5)
    /// - Velocity notation
    case V

    /// Uppercase W character (ASCII 0x57, W)
    ///
    /// Twenty-third letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Relatively recent addition to Latin alphabet,
    /// originally written as 'VV' (double U).
    ///
    /// Common uses:
    /// - Width parameters
    /// - Weight values
    /// - West direction
    /// - Write operations
    ///
    /// Representations:
    /// - Symbol: W
    /// - Binary: 01010111
    /// - Octal: 127
    /// - Decimal: 87
    /// - Hexadecimal: 57
    /// - HTML entity: &#87;
    /// - Escape sequence: W
    /// - Unicode: \u{0057}
    ///
    /// Programming contexts:
    /// - Width variables
    /// - Write functions
    /// - Window references
    /// - Web operations
    ///
    /// Special uses:
    /// - Watt (power)
    /// - Weight notation
    /// - West compass point
    /// - Warning indicators
    case W

    /// Uppercase X character (ASCII 0x58, X)
    ///
    /// Twenty-fourth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Greek chi,
    /// commonly used in mathematical contexts.
    ///
    /// Common uses:
    /// - X-coordinate
    /// - Unknown values
    /// - Multiplication
    /// - Exit indicators
    ///
    /// Representations:
    /// - Symbol: X
    /// - Binary: 01011000
    /// - Octal: 130
    /// - Decimal: 88
    /// - Hexadecimal: 58
    /// - HTML entity: &#88;
    /// - Escape sequence: X
    /// - Unicode: \u{0058}
    ///
    /// Programming contexts:
    /// - Coordinate systems
    /// - Exit functions
    /// - XOR operations
    /// - XML notation
    ///
    /// Special uses:
    /// - X-axis
    /// - Multiplication symbol
    /// - Cancel/close
    /// - Unknown quantity
    case X

    /// Uppercase Y character (ASCII 0x59, Y)
    ///
    /// Twenty-fifth letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Greek upsilon,
    /// significant in coordinate systems.
    ///
    /// Common uses:
    /// - Y-coordinate
    /// - Yes/No values
    /// - Yield keyword
    /// - Year notation
    ///
    /// Representations:
    /// - Symbol: Y
    /// - Binary: 01011001
    /// - Octal: 131
    /// - Decimal: 89
    /// - Hexadecimal: 59
    /// - HTML entity: &#89;
    /// - Escape sequence: Y
    /// - Unicode: \u{0059}
    ///
    /// Programming contexts:
    /// - Coordinate systems
    /// - Yes/No flags
    /// - Yield statements
    /// - Year variables
    ///
    /// Special uses:
    /// - Y-axis
    /// - Yttrium symbol
    /// - Binary yes
    /// - Year abbreviation
    case Y

    /// Uppercase Z character (ASCII 0x5A, Z)
    ///
    /// Twenty-sixth and final letter of English alphabet in uppercase.
    ///
    /// Historical background:
    /// Latin letter derived from Phoenician zayin,
    /// significant in mathematical and coordinate systems.
    ///
    /// Common uses:
    /// - Z-coordinate
    /// - Zero values
    /// - Zone references
    /// - Size parameters
    ///
    /// Representations:
    /// - Symbol: Z
    /// - Binary: 01011010
    /// - Octal: 132
    /// - Decimal: 90
    /// - Hexadecimal: 5A
    /// - HTML entity: &#90;
    /// - Escape sequence: Z
    /// - Unicode: \u{005A}
    ///
    /// Programming contexts:
    /// - Z-axis coordinates
    /// - Compression (ZIP)
    /// - Zone calculations
    /// - Zero operations
    ///
    /// Special uses:
    /// - Complex numbers
    /// - Time zones
    /// - Sleep state
    /// - Size notation
    case Z

    /// Left Square Bracket character (ASCII 0x5B, [)
    ///
    /// Opening delimiter for arrays and blocks.
    ///
    /// Historical background:
    /// Introduced with typewriters, became essential
    /// in programming for array notation.
    ///
    /// Common uses:
    /// - Array indexing
    /// - List delimiters
    /// - JSON syntax
    /// - Pattern matching
    ///
    /// Representations:
    /// - Symbol: [
    /// - Binary: 01011011
    /// - Octal: 133
    /// - Decimal: 91
    /// - Hexadecimal: 5B
    /// - HTML entity: &#91;
    /// - Escape sequence: [
    /// - Unicode: \u{005B}
    ///
    /// Programming contexts:
    /// - Array access
    /// - Collection literals
    /// - Regular expressions
    /// - Markdown syntax
    ///
    /// Special uses:
    /// - JSON arrays
    /// - Character classes
    /// - Optional grouping
    /// - List notation
    case leftBracket

    /// Backslash character (ASCII 0x5C, \)
    ///
    /// Escape character and path separator.
    ///
    /// Historical background:
    /// Introduced for computing needs, essential
    /// for escape sequences and Windows paths.
    ///
    /// Common uses:
    /// - Escape sequences
    /// - Path separators
    /// - String literals
    /// - Regular expressions
    ///
    /// Representations:
    /// - Symbol: \
    /// - Binary: 01011100
    /// - Octal: 134
    /// - Decimal: 92
    /// - Hexadecimal: 5C
    /// - HTML entity: &#92;
    /// - Escape sequence: \\
    /// - Unicode: \u{005C}
    ///
    /// Programming contexts:
    /// - String escaping
    /// - Path notation
    /// - Regex escaping
    /// - Special characters
    ///
    /// Special uses:
    /// - Windows paths
    /// - Continuation lines
    /// - Quote escaping
    /// - Character escaping
    case backslash

    /// Right Square Bracket character (ASCII 0x5D, ])
    ///
    /// Closing delimiter for arrays and blocks.
    ///
    /// Historical background:
    /// Paired with left bracket, essential for
    /// bounded notation in computing.
    ///
    /// Common uses:
    /// - Array closure
    /// - List termination
    /// - JSON syntax
    /// - Pattern boundaries
    ///
    /// Representations:
    /// - Symbol: ]
    /// - Binary: 01011101
    /// - Octal: 135
    /// - Decimal: 93
    /// - Hexadecimal: 5D
    /// - HTML entity: &#93;
    /// - Escape sequence: ]
    /// - Unicode: \u{005D}
    ///
    /// Programming contexts:
    /// - Array notation
    /// - Collection closing
    /// - Regular expressions
    /// - Markdown syntax
    ///
    /// Special uses:
    /// - JSON arrays
    /// - Character classes
    /// - Optional grouping
    /// - List closure
    case rightBracket

    /// Caret/Circumflex character (ASCII 0x5E, ^)
    ///
    /// Exponential and control character notation.
    ///
    /// Historical background:
    /// Mathematical symbol adopted for computing
    /// as control modifier and power operator.
    ///
    /// Common uses:
    /// - Exponentiation
    /// - Control characters
    /// - XOR operator
    /// - Regular expressions
    ///
    /// Representations:
    /// - Symbol: ^
    /// - Binary: 01011110
    /// - Octal: 136
    /// - Decimal: 94
    /// - Hexadecimal: 5E
    /// - HTML entity: &#94;
    /// - Escape sequence: ^
    /// - Unicode: \u{005E}
    ///
    /// Programming contexts:
    /// - Bitwise XOR
    /// - Control notation
    /// - Regex anchors
    /// - Power operations
    ///
    /// Special uses:
    /// - Line start anchor
    /// - Power notation
    /// - Control characters
    /// - Cursor position
    case caret

    /// Underscore character (ASCII 0x5F, _)
    ///
    /// Low line and identifier separator.
    ///
    /// Historical background:
    /// Originally used for underlining text,
    /// became essential in programming identifiers.
    ///
    /// Common uses:
    /// - Variable names
    /// - Private indicators
    /// - Word separation
    /// - Placeholder values
    ///
    /// Representations:
    /// - Symbol: _
    /// - Binary: 01011111
    /// - Octal: 137
    /// - Decimal: 95
    /// - Hexadecimal: 5F
    /// - HTML entity: &#95;
    /// - Escape sequence: _
    /// - Unicode: \u{005F}
    ///
    /// Programming contexts:
    /// - Identifier separator
    /// - Private members
    /// - Unused variables
    /// - Name conventions
    ///
    /// Special uses:
    /// - Blank placeholder
    /// - Snake case
    /// - Hidden files
    /// - Ignored values
    case underscore

    /// Backtick/Grave Accent character (ASCII 0x60, `)
    ///
    /// Code quotation and shell command delimiter.
    ///
    /// Historical background:
    /// Originally a diacritical mark, adopted for
    /// command substitution and code formatting.
    ///
    /// Common uses:
    /// - Code blocks
    /// - Shell commands
    /// - String literals
    /// - Identifiers
    ///
    /// Representations:
    /// - Symbol: `
    /// - Binary: 01100000
    /// - Octal: 140
    /// - Decimal: 96
    /// - Hexadecimal: 60
    /// - HTML entity: &#96;
    /// - Escape sequence: `
    /// - Unicode: \u{0060}
    ///
    /// Programming contexts:
    /// - Command substitution
    /// - Markdown code
    /// - Raw identifiers
    /// - Template literals
    ///
    /// Special uses:
    /// - Shell commands
    /// - Code formatting
    /// - Documentation
    /// - String delimiters
    case backquote

    /// Lowercase a character (ASCII 0x61, a)
    ///
    /// First letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Essential Latin letter, most common letter
    /// in English language.
    ///
    /// Common uses:
    /// - Variable names
    /// - Loop counters
    /// - Hexadecimal (10)
    /// - Parameter names
    ///
    /// Representations:
    /// - Symbol: a
    /// - Binary: 01100001
    /// - Octal: 141
    /// - Decimal: 97
    /// - Hexadecimal: 61
    /// - HTML entity: &#97;
    /// - Escape sequence: a
    /// - Unicode: \u{0061}
    ///
    /// Programming contexts:
    /// - Variable names
    /// - Iterator variables
    /// - Hexadecimal values
    /// - Function parameters
    ///
    /// Special uses:
    /// - Area units
    /// - Article prefix
    /// - Scale notation
    /// - Algebraic variables
    case a

    /// Lowercase b character (ASCII 0x62, b)
    ///
    /// Second letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used in
    /// programming and technical contexts.
    ///
    /// Common uses:
    /// - Binary notation
    /// - Byte values
    /// - Boolean variables
    /// - Base numbers
    ///
    /// Representations:
    /// - Symbol: b
    /// - Binary: 01100010
    /// - Octal: 142
    /// - Decimal: 98
    /// - Hexadecimal: 62
    /// - HTML entity: &#98;
    /// - Escape sequence: b
    /// - Unicode: \u{0062}
    ///
    /// Programming contexts:
    /// - Binary literals
    /// - Byte operations
    /// - Buffer variables
    /// - Boolean flags
    ///
    /// Special uses:
    /// - Bit notation
    /// - Base prefixes
    /// - Block scope
    /// - Backup files
    case b

    /// Lowercase c character (ASCII 0x63, c)
    ///
    /// Third letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, significant in programming
    /// and mathematical notation.
    ///
    /// Common uses:
    /// - Counter variables
    /// - Character data
    /// - Constant values
    /// - Currency notation
    ///
    /// Representations:
    /// - Symbol: c
    /// - Binary: 01100011
    /// - Octal: 143
    /// - Decimal: 99
    /// - Hexadecimal: 63
    /// - HTML entity: &#99;
    /// - Escape sequence: c
    /// - Unicode: \u{0063}
    ///
    /// Programming contexts:
    /// - Counter variables
    /// - Character handling
    /// - Class methods
    /// - Callback functions
    ///
    /// Special uses:
    /// - Speed of light
    /// - Cents symbol
    /// - Copyright (©)
    /// - Capacity units
    case c

    /// Lowercase d character (ASCII 0x64, d)
    ///
    /// Fourth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used in
    /// mathematical and programming contexts.
    ///
    /// Common uses:
    /// - Delta values
    /// - Directory paths
    /// - Decimal notation
    /// - Distance variables
    ///
    /// Representations:
    /// - Symbol: d
    /// - Binary: 01100100
    /// - Octal: 144
    /// - Decimal: 100
    /// - Hexadecimal: 64
    /// - HTML entity: &#100;
    /// - Escape sequence: d
    /// - Unicode: \u{0064}
    ///
    /// Programming contexts:
    /// - Directory handling
    /// - Decimal numbers
    /// - Data structures
    /// - Delta calculations
    ///
    /// Special uses:
    /// - Derivative notation
    /// - Day abbreviation
    /// - Density symbol
    /// - Dimension reference
    case d

    /// Lowercase e character (ASCII 0x65, e)
    ///
    /// Fifth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Most common letter in English, significant
    /// in mathematical notation.
    ///
    /// Common uses:
    /// - Mathematical constant e
    /// - Scientific notation
    /// - Element variables
    /// - Error handling
    ///
    /// Representations:
    /// - Symbol: e
    /// - Binary: 01100101
    /// - Octal: 145
    /// - Decimal: 101
    /// - Hexadecimal: 65
    /// - HTML entity: &#101;
    /// - Escape sequence: e
    /// - Unicode: \u{0065}
    ///
    /// Programming contexts:
    /// - Exception variables
    /// - Event handling
    /// - Exponential notation
    /// - Element iteration
    ///
    /// Special uses:
    /// - Euler's number
    /// - Electronic prefix
    /// - Energy notation
    /// - Error codes
    case e

    /// Lowercase f character (ASCII 0x66, f)
    ///
    /// Sixth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, significant in
    /// programming and function notation.
    ///
    /// Common uses:
    /// - Function names
    /// - File handles
    /// - Float variables
    /// - Flag indicators
    ///
    /// Representations:
    /// - Symbol: f
    /// - Binary: 01100110
    /// - Octal: 146
    /// - Decimal: 102
    /// - Hexadecimal: 66
    /// - HTML entity: &#102;
    /// - Escape sequence: f
    /// - Unicode: \u{0066}
    ///
    /// Programming contexts:
    /// - Function declarations
    /// - File operations
    /// - Float types
    /// - Format strings
    ///
    /// Special uses:
    /// - Force (physics)
    /// - Frequency notation
    /// - False value
    /// - Form feed
    case f

    /// Lowercase g character (ASCII 0x67, g)
    ///
    /// Seventh letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used in
    /// scientific and programming notation.
    ///
    /// Common uses:
    /// - Gravity constant
    /// - Global variables
    /// - Graphics contexts
    /// - Group references
    ///
    /// Representations:
    /// - Symbol: g
    /// - Binary: 01100111
    /// - Octal: 147
    /// - Decimal: 103
    /// - Hexadecimal: 67
    /// - HTML entity: &#103;
    /// - Escape sequence: g
    /// - Unicode: \u{0067}
    ///
    /// Programming contexts:
    /// - Global scope
    /// - Getter methods
    /// - Graphics functions
    /// - Game variables
    ///
    /// Special uses:
    /// - Gravity constant
    /// - Gram unit
    /// - Global flags
    /// - Group identifiers
    case g

    /// Lowercase h character (ASCII 0x68, h)
    ///
    /// Eighth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, significant in
    /// scientific and technical notation.
    ///
    /// Common uses:
    /// - Height variables
    /// - Hour notation
    /// - Hash values
    /// - Handler functions
    ///
    /// Representations:
    /// - Symbol: h
    /// - Binary: 01101000
    /// - Octal: 150
    /// - Decimal: 104
    /// - Hexadecimal: 68
    /// - HTML entity: &#104;
    /// - Escape sequence: h
    /// - Unicode: \u{0068}
    ///
    /// Programming contexts:
    /// - Height parameters
    /// - Handler functions
    /// - Hash operations
    /// - HTTP variables
    ///
    /// Special uses:
    /// - Hours notation
    /// - Planck constant
    /// - Height units
    /// - Host references
    case h

    /// Lowercase i character (ASCII 0x69, i)
    ///
    /// Ninth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, traditionally used
    /// for iteration and indexing.
    ///
    /// Common uses:
    /// - Index variables
    /// - Iterator values
    /// - Integer types
    /// - Input references
    ///
    /// Representations:
    /// - Symbol: i
    /// - Binary: 01101001
    /// - Octal: 151
    /// - Decimal: 105
    /// - Hexadecimal: 69
    /// - HTML entity: &#105;
    /// - Escape sequence: i
    /// - Unicode: \u{0069}
    ///
    /// Programming contexts:
    /// - Loop counters
    /// - Index variables
    /// - Iterator objects
    /// - Input handling
    ///
    /// Special uses:
    /// - Imaginary unit
    /// - Item numbering
    /// - Integer typing
    /// - Iteration count
    case i

    /// Lowercase j character (ASCII 0x6A, j)
    ///
    /// Tenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Relatively recent addition to Latin alphabet,
    /// common in programming for nested loops.
    ///
    /// Common uses:
    /// - Secondary index
    /// - JSON handling
    /// - JavaScript code
    /// - Joint variables
    ///
    /// Representations:
    /// - Symbol: j
    /// - Binary: 01101010
    /// - Octal: 152
    /// - Decimal: 106
    /// - Hexadecimal: 6A
    /// - HTML entity: &#106;
    /// - Escape sequence: j
    /// - Unicode: \u{006A}
    ///
    /// Programming contexts:
    /// - Nested loops
    /// - JSON operations
    /// - JavaScript files
    /// - Secondary counters
    ///
    /// Special uses:
    /// - Joule unit
    /// - Join operations
    /// - Job references
    /// - Junction points
    case j

    /// Lowercase k character (ASCII 0x6B, k)
    ///
    /// Eleventh letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used in
    /// scientific and programming contexts.
    ///
    /// Common uses:
    /// - Key variables
    /// - Constant values
    /// - Kernel functions
    /// - Kilobyte notation
    ///
    /// Representations:
    /// - Symbol: k
    /// - Binary: 01101011
    /// - Octal: 153
    /// - Decimal: 107
    /// - Hexadecimal: 6B
    /// - HTML entity: &#107;
    /// - Escape sequence: k
    /// - Unicode: \u{006B}
    ///
    /// Programming contexts:
    /// - Key iterations
    /// - Kernel operations
    /// - Constant values
    /// - Dictionary keys
    ///
    /// Special uses:
    /// - Kilo prefix
    /// - Spring constant
    /// - Key identifiers
    /// - Knowledge base
    case k

    /// Lowercase l character (ASCII 0x6C, l)
    ///
    /// Twelfth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, significant in
    /// programming for length and lists.
    ///
    /// Common uses:
    /// - Length variables
    /// - List elements
    /// - Loop counters
    /// - Line numbers
    ///
    /// Representations:
    /// - Symbol: l
    /// - Binary: 01101100
    /// - Octal: 154
    /// - Decimal: 108
    /// - Hexadecimal: 6C
    /// - HTML entity: &#108;
    /// - Escape sequence: l
    /// - Unicode: \u{006C}
    ///
    /// Programming contexts:
    /// - Length parameters
    /// - List operations
    /// - Loop variables
    /// - Line counting
    ///
    /// Special uses:
    /// - Liter unit
    /// - Lambda functions
    /// - Local variables
    /// - Linear measures
    case l

    /// Lowercase m character (ASCII 0x6D, m)
    ///
    /// Thirteenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// measurement and mathematical notation.
    ///
    /// Common uses:
    /// - Mass variables
    /// - Method names
    /// - Map functions
    /// - Meter units
    ///
    /// Representations:
    /// - Symbol: m
    /// - Binary: 01101101
    /// - Octal: 155
    /// - Decimal: 109
    /// - Hexadecimal: 6D
    /// - HTML entity: &#109;
    /// - Escape sequence: m
    /// - Unicode: \u{006D}
    ///
    /// Programming contexts:
    /// - Method names
    /// - Map operations
    /// - Member variables
    /// - Matrix elements
    ///
    /// Special uses:
    /// - Meter unit
    /// - Mass notation
    /// - Message variables
    /// - Modulo operations
    case m

    /// Lowercase n character (ASCII 0x6E, n)
    ///
    /// Fourteenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, traditionally used for
    /// counting and natural numbers.
    ///
    /// Common uses:
    /// - Count variables
    /// - Number values
    /// - Name references
    /// - Node pointers
    ///
    /// Representations:
    /// - Symbol: n
    /// - Binary: 01101110
    /// - Octal: 156
    /// - Decimal: 110
    /// - Hexadecimal: 6E
    /// - HTML entity: &#110;
    /// - Escape sequence: n
    /// - Unicode: \u{006E}
    ///
    /// Programming contexts:
    /// - Loop counts
    /// - Number variables
    /// - Node references
    /// - Name strings
    ///
    /// Special uses:
    /// - Natural numbers
    /// - Newline character
    /// - Number of items
    /// - Network variables
    case n

    /// Lowercase o character (ASCII 0x6F, o)
    ///
    /// Fifteenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// objects and output operations.
    ///
    /// Common uses:
    /// - Object references
    /// - Output variables
    /// - Option flags
    /// - Offset values
    ///
    /// Representations:
    /// - Symbol: o
    /// - Binary: 01101111
    /// - Octal: 157
    /// - Decimal: 111
    /// - Hexadecimal: 6F
    /// - HTML entity: &#111;
    /// - Escape sequence: o
    /// - Unicode: \u{006F}
    ///
    /// Programming contexts:
    /// - Object instances
    /// - Output streams
    /// - Option parameters
    /// - Offset calculations
    ///
    /// Special uses:
    /// - Order notation
    /// - Object notation
    /// - Origin reference
    /// - Output flags
    case o

    /// Lowercase p character (ASCII 0x70, p)
    ///
    /// Sixteenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, significant in
    /// pointer and parameter notation.
    ///
    /// Common uses:
    /// - Pointer variables
    /// - Parameter names
    /// - Position values
    /// - Process IDs
    ///
    /// Representations:
    /// - Symbol: p
    /// - Binary: 01110000
    /// - Octal: 160
    /// - Decimal: 112
    /// - Hexadecimal: 70
    /// - HTML entity: &#112;
    /// - Escape sequence: p
    /// - Unicode: \u{0070}
    ///
    /// Programming contexts:
    /// - Pointer references
    /// - Parameter lists
    /// - Process handling
    /// - Pattern matching
    ///
    /// Special uses:
    /// - Pressure units
    /// - Probability
    /// - Page numbers
    /// - Port numbers
    case p

    /// Lowercase q character (ASCII 0x71, q)
    ///
    /// Seventeenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// queues and query operations.
    ///
    /// Common uses:
    /// - Queue variables
    /// - Query strings
    /// - Quantity values
    /// - Quick references
    ///
    /// Representations:
    /// - Symbol: q
    /// - Binary: 01110001
    /// - Octal: 161
    /// - Decimal: 113
    /// - Hexadecimal: 71
    /// - HTML entity: &#113;
    /// - Escape sequence: q
    /// - Unicode: \u{0071}
    ///
    /// Programming contexts:
    /// - Queue operations
    /// - Query handling
    /// - Quit flags
    /// - Quantity variables
    ///
    /// Special uses:
    /// - Quantum numbers
    /// - Question marks
    /// - Quotient values
    /// - Quality factors
    case q

    /// Lowercase r character (ASCII 0x72, r)
    ///
    /// Eighteenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// reading operations and rates.
    ///
    /// Common uses:
    /// - Read operations
    /// - Rate values
    /// - Result variables
    /// - Range limits
    ///
    /// Representations:
    /// - Symbol: r
    /// - Binary: 01110010
    /// - Octal: 162
    /// - Decimal: 114
    /// - Hexadecimal: 72
    /// - HTML entity: &#114;
    /// - Escape sequence: r
    /// - Unicode: \u{0072}
    ///
    /// Programming contexts:
    /// - Read functions
    /// - Result storage
    /// - Range operations
    /// - Random numbers
    ///
    /// Special uses:
    /// - Radius values
    /// - Rate calculations
    /// - Regular expressions
    /// - Reference counting
    case r

    /// Lowercase s character (ASCII 0x73, s)
    ///
    /// Nineteenth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// string operations and size values.
    ///
    /// Common uses:
    /// - String variables
    /// - Size parameters
    /// - Status flags
    /// - Source references
    ///
    /// Representations:
    /// - Symbol: s
    /// - Binary: 01110011
    /// - Octal: 163
    /// - Decimal: 115
    /// - Hexadecimal: 73
    /// - HTML entity: &#115;
    /// - Escape sequence: s
    /// - Unicode: \u{0073}
    ///
    /// Programming contexts:
    /// - String handling
    /// - Size calculations
    /// - Stream operations
    /// - System calls
    ///
    /// Special uses:
    /// - Second unit
    /// - Source code
    /// - State variables
    /// - Set notation
    case s

    /// Lowercase t character (ASCII 0x74, t)
    ///
    /// Twentieth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// time and temporary variables.
    ///
    /// Common uses:
    /// - Time variables
    /// - Temporary values
    /// - Type parameters
    /// - Target references
    ///
    /// Representations:
    /// - Symbol: t
    /// - Binary: 01110100
    /// - Octal: 164
    /// - Decimal: 116
    /// - Hexadecimal: 74
    /// - HTML entity: &#116;
    /// - Escape sequence: t
    /// - Unicode: \u{0074}
    ///
    /// Programming contexts:
    /// - Time handling
    /// - Temporary storage
    /// - Type definitions
    /// - Thread variables
    ///
    /// Special uses:
    /// - Time notation
    /// - Temperature
    /// - Tab character
    /// - Test flags
    case t

    /// Lowercase u character (ASCII 0x75, u)
    ///
    /// Twenty-first letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// units and user references.
    ///
    /// Common uses:
    /// - Unit values
    /// - User variables
    /// - Unicode escapes
    /// - Unsigned types
    ///
    /// Representations:
    /// - Symbol: u
    /// - Binary: 01110101
    /// - Octal: 165
    /// - Decimal: 117
    /// - Hexadecimal: 75
    /// - HTML entity: &#117;
    /// - Escape sequence: u
    /// - Unicode: \u{0075}
    ///
    /// Programming contexts:
    /// - Unicode handling
    /// - User input
    /// - URL encoding
    /// - Unit testing
    ///
    /// Special uses:
    /// - Units prefix
    /// - User IDs
    /// - Upload flags
    /// - Utility functions
    case u

    /// Lowercase v character (ASCII 0x76, v)
    ///
    /// Twenty-second letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// vectors and version numbers.
    ///
    /// Common uses:
    /// - Vector variables
    /// - Version numbers
    /// - Value parameters
    /// - Velocity measurements
    ///
    /// Representations:
    /// - Symbol: v
    /// - Binary: 01110110
    /// - Octal: 166
    /// - Decimal: 118
    /// - Hexadecimal: 76
    /// - HTML entity: &#118;
    /// - Escape sequence: v
    /// - Unicode: \u{0076}
    ///
    /// Programming contexts:
    /// - Vector operations
    /// - Version control
    /// - Value types
    /// - Variable arguments
    ///
    /// Special uses:
    /// - Velocity notation
    /// - Volume variables
    /// - Vertical alignment
    /// - Validation flags
    case v

    /// Lowercase w character (ASCII 0x77, w)
    ///
    /// Twenty-third letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, commonly used for
    /// width measurements and write operations.
    ///
    /// Common uses:
    /// - Width variables
    /// - Write operations
    /// - Weight values
    /// - Window references
    ///
    /// Representations:
    /// - Symbol: w
    /// - Binary: 01110111
    /// - Octal: 167
    /// - Decimal: 119
    /// - Hexadecimal: 77
    /// - HTML entity: &#119;
    /// - Escape sequence: w
    /// - Unicode: \u{0077}
    ///
    /// Programming contexts:
    /// - Width parameters
    /// - Write functions
    /// - Window handles
    /// - Web operations
    ///
    /// Special uses:
    /// - Weight notation
    /// - Work variables
    /// - Wave functions
    /// - Word boundaries
    case w

    /// Lowercase x character (ASCII 0x78, x)
    ///
    /// Twenty-fourth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, traditionally used for
    /// unknown values and x-coordinates.
    ///
    /// Common uses:
    /// - X-coordinates
    /// - Unknown variables
    /// - Index values
    /// - Exit flags
    ///
    /// Representations:
    /// - Symbol: x
    /// - Binary: 01111000
    /// - Octal: 170
    /// - Decimal: 120
    /// - Hexadecimal: 78
    /// - HTML entity: &#120;
    /// - Escape sequence: x
    /// - Unicode: \u{0078}
    ///
    /// Programming contexts:
    /// - Coordinate systems
    /// - Loop variables
    /// - Hex notation
    /// - Exit conditions
    ///
    /// Special uses:
    /// - X-axis notation
    /// - Unknown values
    /// - Multiplication
    /// - Exception handling
    case x

    /// Lowercase y character (ASCII 0x79, y)
    ///
    /// Twenty-fifth letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, traditionally used for
    /// y-coordinates and boolean values.
    ///
    /// Common uses:
    /// - Y-coordinates
    /// - Boolean flags
    /// - Year variables
    /// - Yield values
    ///
    /// Representations:
    /// - Symbol: y
    /// - Binary: 01111001
    /// - Octal: 171
    /// - Decimal: 121
    /// - Hexadecimal: 79
    /// - HTML entity: &#121;
    /// - Escape sequence: y
    /// - Unicode: \u{0079}
    ///
    /// Programming contexts:
    /// - Coordinate systems
    /// - Yes/No flags
    /// - Yield statements
    /// - Year calculations
    ///
    /// Special uses:
    /// - Y-axis notation
    /// - Binary yes
    /// - Youth variables
    /// - Yield curves
    case y

    /// Lowercase z character (ASCII 0x7A, z)
    ///
    /// Twenty-sixth and final letter of English alphabet in lowercase.
    ///
    /// Historical background:
    /// Basic Latin letter, traditionally used for
    /// z-coordinates and sleep states.
    ///
    /// Common uses:
    /// - Z-coordinates
    /// - Zero values
    /// - Zone references
    /// - Size parameters
    ///
    /// Representations:
    /// - Symbol: z
    /// - Binary: 01111010
    /// - Octal: 172
    /// - Decimal: 122
    /// - Hexadecimal: 7A
    /// - HTML entity: &#122;
    /// - Escape sequence: z
    /// - Unicode: \u{007A}
    ///
    /// Programming contexts:
    /// - Z-axis values
    /// - Zero operations
    /// - Zone handling
    /// - ZIP compression
    ///
    /// Special uses:
    /// - Z-index
    /// - Zone times
    /// - Zoom factors
    /// - Z-transforms
    case z

    /// Left Brace character (ASCII 0x7B, {)
    ///
    /// Opening delimiter for blocks and objects.
    ///
    /// Historical background:
    /// Introduced with structured programming,
    /// essential for code blocks and data structures.
    ///
    /// Common uses:
    /// - Code blocks
    /// - Object literals
    /// - Set notation
    /// - JSON syntax
    ///
    /// Representations:
    /// - Symbol: {
    /// - Binary: 01111011
    /// - Octal: 173
    /// - Decimal: 123
    /// - Hexadecimal: 7B
    /// - HTML entity: &#123;
    /// - Escape sequence: {
    /// - Unicode: \u{007B}
    ///
    /// Programming contexts:
    /// - Block delimiters
    /// - Object notation
    /// - Scope markers
    /// - Template syntax
    ///
    /// Special uses:
    /// - JSON objects
    /// - Set definitions
    /// - Function bodies
    /// - Pattern groups
    case leftBrace

    /// Vertical Bar character (ASCII 0x7C, |)
    ///
    /// Logical OR and pipe operator.
    ///
    /// Historical background:
    /// Adopted from mathematics for logical operations
    /// and command chaining in computing.
    ///
    /// Common uses:
    /// - Logical OR
    /// - Pipe operator
    /// - Pattern alternation
    /// - Table formatting
    ///
    /// Representations:
    /// - Symbol: |
    /// - Binary: 01111100
    /// - Octal: 174
    /// - Decimal: 124
    /// - Hexadecimal: 7C
    /// - HTML entity: &#124;
    /// - Escape sequence: |
    /// - Unicode: \u{007C}
    ///
    /// Programming contexts:
    /// - Bitwise OR
    /// - Command pipes
    /// - Regular expressions
    /// - Pattern matching
    ///
    /// Special uses:
    /// - Table borders
    /// - Alternative lists
    /// - Conditional tests
    /// - Path separators
    case verticalBar

    /// Right Brace character (ASCII 0x7D, })
    ///
    /// Closing delimiter for blocks and objects.
    ///
    /// Historical background:
    /// Paired with left brace for structured
    /// programming and data notation.
    ///
    /// Common uses:
    /// - Block closure
    /// - Object termination
    /// - Set closure
    /// - Scope ending
    ///
    /// Representations:
    /// - Symbol: }
    /// - Binary: 01111101
    /// - Octal: 175
    /// - Decimal: 125
    /// - Hexadecimal: 7D
    /// - HTML entity: &#125;
    /// - Escape sequence: }
    /// - Unicode: \u{007D}
    ///
    /// Programming contexts:
    /// - Block termination
    /// - Object closure
    /// - Scope endings
    /// - Template closure
    ///
    /// Special uses:
    /// - JSON syntax
    /// - Set notation
    /// - Function endings
    /// - Pattern groups
    case rightBrace

    /// Tilde character (ASCII 0x7E, ~)
    ///
    /// Approximate and negation operator.
    ///
    /// Historical background:
    /// Mathematical symbol adopted for various
    /// computing operations and home directories.
    ///
    /// Common uses:
    /// - Approximation
    /// - Bitwise NOT
    /// - Home directory
    /// - Destructuring
    ///
    /// Representations:
    /// - Symbol: ~
    /// - Binary: 01111110
    /// - Octal: 176
    /// - Decimal: 126
    /// - Hexadecimal: 7E
    /// - HTML entity: &#126;
    /// - Escape sequence: ~
    /// - Unicode: \u{007E}
    ///
    /// Programming contexts:
    /// - Bitwise operations
    /// - Path expansion
    /// - Pattern matching
    /// - Destructuring
    ///
    /// Special uses:
    /// - Home paths
    /// - Approximate values
    /// - Wave notation
    /// - Negation operator
    case tilde

    /// Delete character (ASCII 0x7F, DEL)
    ///
    /// Control character for data deletion.
    ///
    /// Historical background:
    /// Originally used for paper tape deletion,
    /// marked by punching all holes.
    ///
    /// Common uses:
    /// - Character deletion
    /// - Data removal
    /// - Control sequences
    /// - Error marking
    ///
    /// Representations:
    /// - Symbol: DEL
    /// - Binary: 01111111
    /// - Octal: 177
    /// - Decimal: 127
    /// - Hexadecimal: 7F
    /// - HTML entity: `&#127;`
    /// - Escape sequence: \x7F
    /// - Unicode: \u{007F}
    /// - Control description: DEL
    ///
    /// Programming contexts:
    /// - Character deletion
    /// - Control codes
    /// - Special handling
    /// - Error marking
    ///
    /// Special uses:
    /// - Deletion marker
    /// - Control sequences
    /// - Terminal control
    /// - Legacy systems
    case delete
}
