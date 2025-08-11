// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  var mixTime = 2.5;
  switch (name){
    case 'Pure Strawberry Joy' :
      mixTime = 0.5;
      break;
    case 'Energizer' : case 'Green Garden' :
      mixTime = 1.5;
      break;
    case 'Tropical Island' : 
      mixTime = 3;
      break;
    case 'All or Nothing' :
      mixTime = 5;
      break;
  }
  return mixTime;
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  var wedgeCount = 0;
  var index = 0;
  while( wedgesNeeded > wedgeCount && index < limes.length ) {
    wedgeCount += ( limes[index] == 'small' ? 6 : ( limes[index] == 'medium' ? 8 : 10 ) );
    index += 1;
  }
  return index;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  while ( timeLeft > 0 ){
    timeLeft -= timeToMixJuice( orders[0] );
    orders.shift();
  }
  return orders;
}
