//
// This is only a SKELETON file for the 'Leap' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isLeap = (y) => {
  if ( ( y % 4 ) == 0 && ( ( y % 100 ) != 0 || ( y % 400 ) == 0 ) ){
	return true;
  } else { return false; }
};
