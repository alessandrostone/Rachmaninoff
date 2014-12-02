//
// The MIT License (MIT)
//
// Copyright (c) 2014 Rudolf Adamkovič
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

//
// MARK: -
// MARK: Note
//

enum NoteName: String {
    
    case C = "C"
    case D = "D"
    case E = "E"
    case F = "F"
    case G = "G"
    case A = "A"
    case B = "B"
    
}

struct Note {
    
    let name: NoteName
    let octave: Int
    let sharp: Bool
    
    init(name: NoteName, octave: Int, sharp: Bool) {
        
        assert(contains(-1...9, octave))
        
        assert(name != .E || sharp == false)
        assert(name != .B || sharp == false)
        
        self.name = name
        self.octave = octave
        self.sharp = sharp
        
    }
    
    var stringValue: String {
        
        return ""
            + name.rawValue
            + (sharp ? "♯" : "")
            + ["₋₁", "₀", "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉"][octave + 1]
        
    }

}

extension Note: Hashable {
    
    var hashValue: Int {
        
        return stringValue.hashValue
        
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    
    return lhs.stringValue == rhs.stringValue
    
}

extension Note: Printable {
    
    var description: String {
        
        return stringValue
        
    }
    
}

//
// MARK: -
// MARK: Octave
//

extension Note {
    
    static func notesInOctave(octave: Int) -> [Note] {
        
        return [
            
            Note(name: .C, octave: octave, sharp: false),
            Note(name: .C, octave: octave, sharp: true),
            Note(name: .D, octave: octave, sharp: false),
            Note(name: .D, octave: octave, sharp: true),
            Note(name: .E, octave: octave, sharp: false),
            Note(name: .F, octave: octave, sharp: false),
            Note(name: .F, octave: octave, sharp: true),
            Note(name: .G, octave: octave, sharp: false),
            Note(name: .G, octave: octave, sharp: true),
            Note(name: .A, octave: octave, sharp: false),
            Note(name: .A, octave: octave, sharp: true),
            Note(name: .B, octave: octave, sharp: false)
            
        ]
        
    }
    
}

//
// MARK: -
// MARK: Chord
//

extension Note {
    
    var majorChord: [Note] {
        
        switch (name, sharp) {
            
        case (.C, false):
            return [
                Note(name: .C, octave: octave, sharp: false),
                Note(name: .E, octave: octave, sharp: false),
                Note(name: .G, octave: octave, sharp: false)
            ]
            
        case (.C, true):
            return [
                Note(name: .C, octave: octave, sharp: true),
                Note(name: .F, octave: octave, sharp: false),
                Note(name: .G, octave: octave, sharp: true)
            ]
            
        case (.D, false):
            return [
                Note(name: .D, octave: octave, sharp: false),
                Note(name: .F, octave: octave, sharp: true),
                Note(name: .A, octave: octave, sharp: false)
            ]
            
        case (.D, true):
            return [
                Note(name: .D, octave: octave, sharp: true),
                Note(name: .G, octave: octave, sharp: false),
                Note(name: .A, octave: octave, sharp: true)
            ]
            
        case (.E, _):
            return [
                Note(name: .E, octave: octave, sharp: false),
                Note(name: .G, octave: octave, sharp: true),
                Note(name: .B, octave: octave, sharp: false)
            ]
            
        case (.F, false):
            return [
                Note(name: .F, octave: octave, sharp: false),
                Note(name: .A, octave: octave, sharp: false),
                Note(name: .C, octave: octave + 1, sharp: false)
            ]
            
        case (.F, true):
            return [
                Note(name: .F, octave: octave, sharp: true),
                Note(name: .A, octave: octave, sharp: true),
                Note(name: .C, octave: octave + 1, sharp: true)
            ]
            
        case (.G, false):
            return [
                Note(name: .G, octave: octave, sharp: false),
                Note(name: .B, octave: octave, sharp: false),
                Note(name: .D, octave: octave + 1, sharp: false)
            ]
            
        case (.G, true):
            return [
                Note(name: .G, octave: octave, sharp: true),
                Note(name: .C, octave: octave + 1, sharp: false),
                Note(name: .D, octave: octave + 1, sharp: true)
            ]
            
        case (.A, false):
            return [
                Note(name: .A, octave: octave, sharp: false),
                Note(name: .C, octave: octave + 1, sharp: true),
                Note(name: .E, octave: octave + 1, sharp: false)
            ]
            
        case (.A, true):
            return [
                Note(name: .A, octave: octave, sharp: true),
                Note(name: .D, octave: octave + 1, sharp: false),
                Note(name: .F, octave: octave + 1, sharp: false)
            ]
            
        case (.B, false):
            return [
                Note(name: .B, octave: octave, sharp: false),
                Note(name: .D, octave: octave + 1, sharp: true),
                Note(name: .F, octave: octave + 1, sharp: true)
            ]
            
        default:
            assertionFailure()
            
        }
        
    }
    
}

//
// MARK: -
// MARK: Chord Progression
//

extension Note {
    
    var chordProgression: [Note] {
        
        switch (name, sharp) {
            
        case (.C, false):
            return [
                Note(name: .C, octave: octave, sharp: false),
                Note(name: .F, octave: octave, sharp: false),
                Note(name: .G, octave: octave, sharp: false)
            ]
            
        case (.C, true):
            return [
                Note(name: .C, octave: octave, sharp: true),
                Note(name: .F, octave: octave, sharp: true),
                Note(name: .G, octave: octave, sharp: true)
            ]
            
        case (.D, false):
            return [
                Note(name: .D, octave: octave, sharp: false),
                Note(name: .G, octave: octave, sharp: false),
                Note(name: .A, octave: octave, sharp: false)
            ]
            
        case (.D, true):
            return [
                Note(name: .D, octave: octave, sharp: true),
                Note(name: .G, octave: octave, sharp: true),
                Note(name: .A, octave: octave, sharp: true)
            ]
            
        case (.E, _):
            return [
                Note(name: .E, octave: octave, sharp: false),
                Note(name: .A, octave: octave, sharp: false),
                Note(name: .B, octave: octave, sharp: false)
            ]
            
        case (.F, false):
            return [
                Note(name: .F, octave: octave, sharp: false),
                Note(name: .A, octave: octave, sharp: true),
                Note(name: .C, octave: octave + 1, sharp: false)
            ]
            
        case (.F, true):
            return [
                Note(name: .F, octave: octave, sharp: true),
                Note(name: .B, octave: octave, sharp: false),
                Note(name: .C, octave: octave + 1, sharp: true)
            ]
            
        case (.G, false):
            return [
                Note(name: .G, octave: octave, sharp: false),
                Note(name: .C, octave: octave + 1, sharp: false),
                Note(name: .D, octave: octave + 1, sharp: false)
            ]
            
        case (.G, true):
            return [
                Note(name: .G, octave: octave, sharp: true),
                Note(name: .C, octave: octave + 1, sharp: true),
                Note(name: .D, octave: octave + 1, sharp: true)
            ]
            
        case (.A, false):
            return [
                Note(name: .A, octave: octave, sharp: false),
                Note(name: .D, octave: octave + 1, sharp: false),
                Note(name: .E, octave: octave + 1, sharp: false)
            ]
            
        case (.A, true):
            return [
                Note(name: .A, octave: octave, sharp: true),
                Note(name: .D, octave: octave + 1, sharp: true),
                Note(name: .F, octave: octave + 1, sharp: false)
            ]
    
        case (.B, _):
            return [
                Note(name: .B, octave: octave, sharp: false),
                Note(name: .E, octave: octave + 1, sharp: false),
                Note(name: .F, octave: octave + 1, sharp: true)
            ]
            
        default:
            assertionFailure()
            
        }
        
    }
    
}
