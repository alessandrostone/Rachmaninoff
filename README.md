Rachmaninoff
============

Rachmaninoff is a simple library for working with music theory in Swift.

*Sergei Vasilievich Rachmaninoff: (Russian: Серге́й Васи́льевич Рахма́нинов; Russian pronunciation: [sʲɪrˈɡʲej rɐxˈmanʲɪnəf]; 1 April 1873 – 28 March 1943) was a Russian composer, pianist, and conductor.*

# Types

* `Note`
* `Chord` = `(Note, Note, Note)`
* `ChordProgression` = `(Chord, Chord, Chord)`

# Usage

Create a C♯₂ note:

    let note = Note(name: .C, octave: 2, sharp: true)

Get C♯₂ major chord (C♯₂, F♯₂ and G♯₂ notes):

    let chord = note.majorChord
    
Get chord progression (3 chords × 3 notes) for C♯₂:

    let chordProgression = note.chordProgression
