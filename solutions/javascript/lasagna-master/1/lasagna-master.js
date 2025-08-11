/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */
export function cookingStatus( timeRemaining ) {
  let message = 'You forgot to set the timer.';
  if ( timeRemaining == 0 ) {
    message = 'Lasagna is done.';
  } else if ( timeRemaining > 0 ) {
    message = 'Not done, please wait.';
  }
  return message;
}

export function preparationTime ( layers, prepTimePer = 2 ) {
  return ( layers.length * prepTimePer );
}

export function quantities( layers ){
  let layerCount = layers.reduce(function (acc, curr) {
    return acc[curr] ? ++acc[curr] : acc[curr] = 1, acc
  }, {});
  return { noodles: ( (layerCount["noodles"] ? layerCount["noodles"] : 0) * 50 ) , sauce: ( ( layerCount["sauce"] ? layerCount["sauce"] : 0) * 0.2 ) };
}

export function addSecretIngredient( friendsList, myList ){
  myList.push(friendsList.at(friendsList.length-1));
}

export function scaleRecipe( recipe, portions=2 ){
  let newRecipe = Object.assign({}, recipe);
  Object.keys(newRecipe).forEach( key=>{
    newRecipe[key] = (newRecipe[key] * (portions/2) ) });
  return newRecipe;
}