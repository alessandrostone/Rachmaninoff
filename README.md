Rachmaninoff
============

Rachmaninoff is a simple library for working with music theory in Swift.

*Sergei Vasilievich Rachmaninoff: (Russian: Серге́й Васи́льевич Рахма́нинов; Russian pronunciation: [sʲɪrˈɡʲej rɐxˈmanʲɪnəf]; 1 April 1873 – 28 March 1943) was a Russian composer, pianist, and conductor.*

# Usage

Create a C♯₂ note:

```swift
let note = Note(name: .C, octave: 2, sharp: true)
```

Get a major chord (C♯₂, F₂, G♯₂):

```swift
let chord = note.majorChord
```
    
Get a chord progression (C♯₂, F♯₂, G♯₂):

```swift
let chordProgression = note.chordProgression
```
