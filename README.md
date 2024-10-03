# Counterpoint-Generator
### 💭 Forming the problem

Initially, I tried to formalize this problem as a constraint satisfaction problem (CSP). I always thought this was a CSP when I was doing my practice counterpoint writing back in Music Theory class. My strategy was to write the starting note and the cadence first, then write my notes one by one, choosing from those that were available. Whenever I encounter a place where after the elimination of the invalid notes there are no notes left, I go back and change the preceding note. I therefore planned to write my algorithm following a similar algorithm.

### 💬 Example

In the example given below, the cantus is already generated. We are in the process of generating the fourth note of the counterpoint. We eliminate the following options:

- B3 (tritone)
- G3 (major second)
- F3 (specifically for this program, which is designed to not repeat a note)
- E3 (minor second)
- C3 (perfect fourth)

```jsx
-----------------------------------------------------------
| Measure | 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8  | 9  | 10 | 11 | 12 |
-----------------------------------------------------------
| C5      |    |    |    |    |    |    |    |    |    |    |    |     |
| B4      |    |    |    |    |    |    |    |    |    |    |    |     |
| A4      |    |    |    |    |    | O  |    |    |    |    |    |     |
| G4      |    |    |    |    | O  |    | O  |    |    |    |    |     |
| F4      |    | O  |    |  O |    |    |    |    | O  |    |    |     |
| E4      |    |    | O  |    |    |    |    | O  |    | O  |    |     |
| D4      |    |    |    |    |    |    |    |    |    |    | O  |     |
| C4      | O  |    |    |    |    |    |    |    |    |    |    |  O  |
-----------------------------------------------------------
| B3      |    |    |    | X  |    |    |    |    |    |    | U  |      |
| A3      |    |    |    |    |    |    |    |    |    |    |    |      |
| G3      |    |    |    | X  |    |    |    |    |    |    |    |      |
| F3      |    |    |    | X  |    |    |    |    |    |    |    |      |
| E3      | U  |    | U  | X  |    |    |    |    |    |    |    |      |
| D3      |    | U  |    |    |    |    |    |    |    |    |    |      |
| C3      |    |    |    | X  |    |    |    |    |    |    |    |      |
-----------------------------------------------------------

```

### Code Structure

Since in this project, we’re only required to generate cantus firmus of length 3-12, I did not implement backtracking but instead started from the beginning whenever there were no satisfying notes to be chosen at the next step. 

### `selectNextNote`

This function selects the next note for the cantus or counterpoint. It takes the current note (`lastNote`), whether there was a melodic jump (`jump`), and whether it's generating a cantus line or counterpoint. It also accepts an `avoid` list of notes to avoid in the next step.

- **For cantus**: It primarily uses stepwise motion (within a diatonic scale) but has a 15% chance of introducing a jump (a minor third or more).
- **For counterpoint**: It allows more flexibility for jumps and dissonance.
- **Output**: The function returns a note (within the scale) that is not the same as the last note and avoids disallowed notes.

### `genCantus`

This function generates a valid cantus firmus based on a given number of notes (`numNotes`).

- **Logic:** It generates the line in three parts:
    - **The first note:** this is always the tonic
    - **The middle part:** successively select the next note using `selectNextNote` , check for validity at the end. If no note can be chosen at some point of the selection, stop the process. Check for validity at the end, regenerates if not satisfying.
    - **The last note:** if the middle part ends in degree 7, the last note is the tonic an octave higher than the starting note. Otherwise it’s the starting note.
- **Output**: A melody consisting of `numNotes` notes.

### `genCounterpoint`

This function takes in `numNotes`  and a `melody`  and generates a counterpoint to that melody.

- **Logic**: the basic logic is the same as in `genCantus` .
- **Counterpoint Rules**: it implements some additional constraints. At each step notes dissonant with the melody are eliminated. In addition, parallels are also avoided.
- **Output**: A counterpoint line to go with the given cantus, following the rules a la Hiller.

### Note Representation

I initially represented the notes by their degree in the scale, as I only wanted to generate cantus firmus in the Ionian scale (no black keys are used). However, I later realized that this representation is problematic as tritones are not distinguishable from perfect fifths. The final product represents notes using the number of semitones away from the tonic.

```json
notes = {
    0: "tonic",
    2: "supertonic",
    4: "mediant",
    5: "subdominant",
    7: "dominant",
    9: "submediant",
    11: "leading tone"
}
```

### Extra Contraints

For ease of implementation, this program generates cantus firmus and counterpoint with some extra constraints:

- No immediate repetition of notes (this is not only easier to implement, but also considered good musical practice)
- Only generates counterpoint below the cantus.
- limited to the Ionian mode
- The range of the cantus and counterpoint is each an octave above the starting note. They won’t overlap or intertwine except for the last note.

### Example Generation

```json
[ [ 0, -8 ], [ 2, -7 ], [ 4, -5 ], [ 7, -8 ], [ 5, -7 ], [ 4, -5 ], [ 5, -10 ], [ 4, -8 ], [ 2, -1 ], [ 4, -3 ], [ 2, -1 ], [ 0, 0 ] ]
```

[SC_240930_110913.wav](SC_240930_110913.wav)

```json
[ [ 0, -8 ], [ 9, -10 ], [ 7, -8 ], [ 5, -10 ], [ 4, -8 ], [ 5, -3 ], [ 7, -5 ], [ 5, -3 ], [ 7, -1 ], [ 0, -3 ], [ 2, -1 ], [ 0, 0 ] ]
```

[SC_240930_111013.wav](SC_240930_111013.wav)
