/**
* Your implmentation of the Leap exercise
*/
component {

	/**
	* @year The input year to consider
	*
	* @returns A boolean for whether the inputted year is true or false
	*/
	 function leapYear( year ) {
		// Implement me here.  Would normally use isLeapYear() that CFML provides.
		var chkLeapYear = false;
		if ( ( arguments.year % 4 ) EQ 0 AND ( ( arguments.year % 100 ) NEQ 0 OR ( arguments.year % 400 ) EQ 0 ) ){
			chkLeapYear = true;
		}
		return chkLeapYear;
	}

}
