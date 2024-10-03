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
