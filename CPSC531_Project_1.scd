/*
 _______  _______  __   __  __    _  _______  _______  ______    _______  _______  ___   __    _  _______
|       ||       ||  | |  ||  |  | ||       ||       ||    _ |  |       ||       ||   | |  |  | ||       |
|       ||   _   ||  | |  ||   |_| ||_     _||    ___||   | ||  |    _  ||   _   ||   | |   |_| ||_     _|
|       ||  | |  ||  |_|  ||       |  |   |  |   |___ |   |_||_ |   |_| ||  | |  ||   | |       |  |   |
|      _||  |_|  ||       ||  _    |  |   |  |    ___||    __  ||    ___||  |_|  ||   | |  _    |  |   |
|     |_ |       ||       || | |   |  |   |  |   |___ |   |  | ||   |    |       ||   | | | |   |  |   |
|_______||_______||_______||_|  |__|  |___|  |_______||___|  |_||___|    |_______||___| |_|  |__|  |___|
 _______  _______  __    _  _______  ______    _______  _______  _______  ______
|       ||       ||  |  | ||       ||    _ |  |   _   ||       ||       ||    _ |
|    ___||    ___||   |_| ||    ___||   | ||  |  |_|  ||_     _||   _   ||   | ||
|   | __ |   |___ |       ||   |___ |   |_||_ |       |  |   |  |  | |  ||   |_||_
|   ||  ||    ___||  _    ||    ___||    __  ||       |  |   |  |  |_|  ||    __  |
|   |_| ||   |___ | | |   ||   |___ |   |  | ||   _   |  |   |  |       ||   |  | |
|_______||_______||_|  |__||_______||___|  |_||__| |__|  |___|  |_______||___|  |_|
 _______    ___      _______    __   __  ___   ___      ___      _______  ______
|   _   |  |   |    |   _   |  |  | |  ||   | |   |    |   |    |       ||    _ |
|  |_|  |  |   |    |  |_|  |  |  |_|  ||   | |   |    |   |    |    ___||   | ||
|       |  |   |    |       |  |       ||   | |   |    |   |    |   |___ |   |_||_
|       |  |   |___ |       |  |       ||   | |   |___ |   |___ |    ___||    __  |
|   _   |  |       ||   _   |  |   _   ||   | |       ||       ||   |___ |   |  | |
|__| |__|  |_______||__| |__|  |__| |__||___| |_______||_______||_______||___|  |_|

v091922

Alternate Assignment #3 (Project 1): Counterpoint Program a la Hiller
---------------------------------------------------------------------
For due date see: https://www.notion.so/scottpetersen/Assignment-Descriptions-79214edf138047ebb2126dbdee001a7a


Description:
------------

This assignment is an alternate project for Assignment #3, Project 1. The primary assignment is the Matrix Beats assignment. Who should consider this assignment?

1. Those preferring a more straight-ahead CS project/problem.
2. Those interested in learning more western music theory (a la Fux)
3. 💀 Those who hate beats 💀

Your goal is to follow the example of what Hiller et al did and described in "Experimental Music" chapter five, but only 1) a program that can generate a cantus firmus and 2) can generate a cantus firmus and one other part (below it). You *must read* the Hiller chapter five description in order to complete this assignment. All details available are there. If there are ambiguities, blame Hiller and resolve the ambiguity yourself. (The answer can only be wrong if it doesn't work.)

The rubric for the assignment is as follows and is based on the Hiller description of functionality of the second experiment (two-part writing) from


Core Classes:
-------------

The following are a series of classes/objects you will find useful (in some cases, necessary) to employ.

-Control Structures (do, for, while)
-Array (and its transformation (instance) methods)
-Pattern: Pbind, Pseq, Ppar, Ptpar
-TempoClock


Resources:
-----------

- Class handouts
- Hiller: Experimental Music
- Reading: documentation for the above classes


Core deliverables: 1-2 pts each (Total: 16)
-------------------------------------------

POINTS :: DESCRIPTION

(1 pt)  No melodic line may span more than an octave, i.e., the range from the lowest note to the highest note of a given melodic line should be an octaveorless.

(1 pt) If the melodic line is the cantus firmus itself, it must begin and end on the tonic.

(1 pt) If the melodic line is not the cantus firmus, it still must begin and end on notes of the tonic chord. This was the C-major triad in our experiments.

(1 pt) A melodic skip of a major or minor seventh is forbidden because this is a dissonant melodic interval.

(2 pts) Any melodic skip, i.e., a melodic movement of a minor third or more, must be followed by a tone repeat or by a stepwise motion with or without a change of direction.

(1 pt) No more than one successive repeat of a given note is permitted.

(2 pts) It is forbidden to repeat the highest, or climax, note of a given me- lodic line unless it is high C and the melodic line happens to move in a tritone resolution or in the cadence up to high C.

(1 pt) Only consonant intervals are permitted. The permissible intervals include:
- unisons, octaves, perfect fifths, and major and minor thirds and sixths. Forbidden dissonant intervals include:
- major and minor seconds and sevenths, and the tritone, except as under Rule 10 below.

(1 pt) No perfect fourths

(1 pt) The first and last chords of a cantus firmus setting must be based on the tonic triad.

(2 pts) in the cadence, the top voice must be scale degree 2 and resolve down to tonic (1) and the lower voice must be scale degree 7 and resolve up to tonic. Or, the lower note may be 2 and resolve down to 1, and the upper note (being 7) resolve up to 1.

(1 pt) Parallel unisons, parallel perfect fifths and perfect fourths, and parallel octaves are forbidden.

(1 pt) Parallel thirds and sixths are permitted, including parallel major thirds and minor sixths forbidden in the strictest counterpoint.


Additional Points/Criteria:
---------------------------

(2 pts) Implements all of the above. For students enrolled in CPSC 431/531 and MUSI 428, we will accept a subset of functionality, but the submission will not get points for rules not implemented and will not receive these two (2) points. (A 10% penalty, if you will.) For students enrolled in CPSC 531 this is non-optional -- you must implement all 13 rules.

(1 pt) The program will accept input in the form of a string where "cantus" will generate a cantus firmus line according to the above rules and "two part" will generate two part harmony according to the above.

(1 pt) One point for commenting your code succinctly and clearly, *specifically*, indicating where you implement the above rules.

*/

/* Question:
if we hav only 27 -> 1 or 72 -> 1 there cannot be tritone resolution?
if perfect fourths are not permitted there cannot be parallel perfect fourths?
*/

(
s.waitForBoot {

/* --- variables and user-inputs here */
	var numNotes = 12; // must be greater or equal than 3
	var tonic = 60;    // MIDI note for tonic
	var string = "two part"; // Whether to generate counterpoint
	var diatonicSteps = [
		0, // tonic, index=0
		2, // supertonic, index=1
		4, // mediant, index=2
		5, // subdominant, index=3
		7, // dominant, index=4
		9, // submediant, index=5
		11 // leading tone, index=6
	];
	var melody;
	var lowerline;
	var midiArray;
	var counter = 0;

/* --- SynthDefs and other asynchronous stuff ---*/

	/*A helper function that selects the next note given
	the current note
	if there is a jump to be compensated for
	if generating for a cantus or for a counterpoint
	and an array of notes to avoid
	Return a number in [0, 2, 4, 5, 7, 9, 11],
	or nil if the set of possible notes is empty*/

	~selectNextNote = { |lastNote, jump, cantus, avoid|
		var possibleNotes = [];
		var result;
		var lastIndex = diatonicSteps.indexOf(lastNote);
		if (jump == 1) {
			if (lastIndex >= 1) {possibleNotes = possibleNotes.add(diatonicSteps[lastIndex - 1])};
		}{
			if (jump == -1) {
				if (lastIndex <= 5) {possibleNotes = possibleNotes.add(diatonicSteps[lastIndex + 1])};
			}{
				if (cantus) {
					if ( 100.rand < 15) { // 15% chance to jump, don't want to jump too much
						[-1, 1].do({|direction|
							[2, 3, 4, 5].do({|interval|
								var index = lastIndex + (direction * interval);
								if (index >= 0 and: (index <= 6)) {
									possibleNotes = possibleNotes.add(diatonicSteps[index]);
								};
							});
						});
					}{ // else stepwise motion
						[-1, 1].do({|interval|
							var index = lastIndex + interval; // TODO: edit for minor thirds
							if (index >= 0 and: (index <= 6)) {
								possibleNotes = possibleNotes.add(diatonicSteps[index]);
							};
						});
					};
				}{ // else counterpoint case, we can jump as needed
					[-1, 1].do({|direction|
						[1, 2, 3, 4, 5].do({|interval|
							var index = lastIndex + (direction * interval);
							if (index >= 0 and: (index <= 6)) {
								possibleNotes = possibleNotes.add(diatonicSteps[index]);
							};
						});
					});
				};
			};
		};


		result = (possibleNotes).select({ |note|
			// the program completely eliminates successive repeatition of notes
			(note != lastNote) and: (avoid.includes(note).not)
		}).choose;
		result;
	};

	// Generate the Cantus Firmus
	~genCantus = { |numNotes|
		var lastNote;
		var highestNote = -inf; // keep track of the highest note so it's not repeated
		var middle;
		var genMiddle;

		// generate the middle part, write as a function to reuse
		genMiddle = {
			var generated = [];
			var jump = 0;
			var curNote = 0; // the first note is always the tonic
			var nextNote;
			nextNote = ~selectNextNote.value(0, jump, true, []);
			highestNote = nextNote;
			while {(generated.size < (numNotes - 2)) and: (nextNote.isNil.not)} {

				// determine if there's a jump
				if(nextNote - curNote > 2)
				{jump = 1;} // jumped upward
				{if (nextNote - curNote < -2) {jump = -1} {jump = 0};};

				// add the next degree
				generated = generated.add(nextNote);
				// update highest note
				highestNote = nextNote.max(highestNote);
				// generate a new note
				curNote = nextNote;
				nextNote = ~selectNextNote.value(generated.last, jump, true, [highestNote]);
			};
			generated;
		};

		middle = genMiddle.value;
		// regenerated middle if it's not satisfiable
		while {middle.size < (numNotes - 2) // doesn't have enough notes
			or: (middle.last != 2 and: (middle.last != 11)) // does not end in degree 2 or 7
			or: ((middle[middle.size - 2] - middle.last).abs > 2) // jumps to the last note
		} {middle = genMiddle.value(numNotes - 2);};
		if (middle.last == 2) {lastNote = 0} {lastNote = 12}; // ends on low or high tonic
		[0] ++ middle ++ lastNote;
	};


	// similar motion to fifths and octaves aren't mentioned in hiller so not implemented
	~genCounterpoint = {|numNotes, melody|
		var startNote; // should be notes of the tonic chord
		var lastNote; // should be notes of the tonic chord
		var secondToLastNote;
		var middle;
		var genMiddle;
		var dissonance = [1, 2, 5, 6, 10, 11, 13, 14, 17, 18, 22, 23]; //allow unisons, octaves, perfect fifths, and major and minor thirds and sixths.
		var counter = 0;
		var solved;

		startNote = [0, 4].choose; // choose from tonic chord, dominant is illegal because it's a perfect fourth

		if (melody[melody.size - 2] == 2) // if the cantus ends in supertonic
		{secondToLastNote = 11;} // end in leading tone
		{secondToLastNote = 2;}; // otherwise end in supertonic

		genMiddle = {
			var generated = [];
			var jump = 0;
			var curNote = startNote;
			var nextNote;
			var index = 1;
			var parallelNotes = [];

			if (startNote == 0)
			{parallelNotes = parallelNotes.add(melody[index])};
			nextNote = ~selectNextNote.value(startNote, jump, false, melody[index] + 12 - dissonance ++ parallelNotes);
			while {(generated.size < (numNotes - 2)) and: (nextNote.isNil.not)} {

				// determine if there's a jump
				if(nextNote - curNote > 2)
				{jump = 1} // jumped upward
				{if (nextNote - curNote < 2) {jump = -1} {jump = 0};};

				// add the next degree
				generated = generated.add(nextNote);

				// determine if there's any parallel to avoid, nextNote is not updated yet (it's the currrent degree)
				parallelNotes = []; // reset
				if (index + 1 < melody.size) {
					if (melody[index] == nextNote) // octaves
					{parallelNotes = parallelNotes.add(melody[index + 1])}
					{if ((melody[index] + 12 - nextNote) == 7) // fifths
						{
							parallelNotes = parallelNotes.add(melody[index + 1] + 5);
						}
					};

					// generate a new note
					curNote = nextNote;
					nextNote = ~selectNextNote.value(generated.last, jump, false, (melody[index+1] + 12 - dissonance ++ parallelNotes));
					// increment index
					index = index + 1;
				}; // to prevent index out of range
			};
			if (generated.size < 2) {generated = generated.add([0])}; // make sure there are at least two notes
			generated;
		};
		middle = genMiddle.value(numNotes - 2);
		// regenerated middle if it's not satisfiable
		while { (counter < 100 ) // stop after 100 failures
			and: (middle.size < (numNotes - 2) // doesn't have enough notes
			or: (middle.last != secondToLastNote) // check if middle connects with cadence
			or: ((middle[middle.size - 2] - middle.last).abs > 2)) // jumps to the last note
		} {
			middle = genMiddle.value;
			counter = counter + 1;
		};
		// exiting while loop doesn't guarantee problem solved, check validity
		if (middle.size == (numNotes - 2)
			and: (middle.last == secondToLastNote) // check if middle connects with cadence
			and: ((middle[middle.size - 2] - middle.last).abs <= 2))
			{solved = true;}
			{middle = []};
		if (middle.last == 2) {lastNote = 0} {lastNote = 12}; // ends on low or high tonic
		[startNote] ++ middle ++ [lastNote] - 12;
	};

	/*Generate cantus, then counterpoint.
	If no counterpoint is found for a cantus, regenerate the cantus*/

	melody = ~genCantus.value(numNotes);
	lowerline = ~genCounterpoint.value(numNotes, melody);
	while {lowerline.size < 3 and: (counter < 100)} {
		melody = ~genCantus.value(numNotes);
		lowerline = ~genCounterpoint.value(numNotes, melody);
		counter = counter + 1;
	};
	melody.do({|note| midiArray = midiArray.add([note])});
	if (string == "two part") {lowerline.do({|note, i| midiArray[i] = midiArray[i].add(note);});};
	midiArray.postln;

s.sync;


/* --- Pattern classes to play your music --- */
	Pbind(\midinote, Pseq(midiArray + tonic), \dur, 1).play;

}
)
