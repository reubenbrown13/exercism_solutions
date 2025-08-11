//
// This is only a SKELETON file for the 'Raindrops' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const convert = (number) => {
  let noiseArray = [3,5,7];
  var noise = "";
  noiseArray.forEach((n) => {
    if (number % n == 0) {
      switch(n) {
        case 3: 
          noise = noise + "Pling";
          break;
        case 5: 
          noise = noise + "Plang";
          break;
        case 7: 
          noise = noise + "Plong";
          break;
        default : 
          noise = number.toString();
      }
    } 
  });
  if ( noise == "" ) { noise = number.toString(); }
  return noise;
};
