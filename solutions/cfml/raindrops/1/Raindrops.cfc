/**
* Your implmentation of the Raindrops exercise
*/
component {

	/**
	* @returns
	*/
	 function convert( number ) {
		// Implement me here
		var inputNumber = arguments.number;
		var noiseArray = arrayMap( [3,5,7], function(num) {
			var noise = "";
			if ( inputNumber % num EQ 0 ) {
				switch(num){
					case 3 :
						noise = "Pling";
						break;
					case 5 :
						noise = "Plang";
						break;
					case 7 :
						noise = "Plong";
						break;
					default :
						noise = "";
				}
			}
			return noise;
		} );
		var noiseList = Replace( ListRemoveDuplicates( ArrayToList( noiseArray ) ), ",", "", "ALL" );
		if ( ListLen( noiseList ) EQ 0 ) { return inputNumber;
		} else { return noiseList; }
	}
}
