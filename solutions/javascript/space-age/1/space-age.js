//
// This is only a SKELETON file for the 'Space Age' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const age = ( planet, timePassed ) => {
  let newAge = timePassed; // default to earth
  switch( planet ){
    case "mercury" :
      newAge = timePassed / 0.2408467;
      break;
    case "venus" :
      newAge = timePassed / 0.61519726;
      break;
    case "mars" :
      newAge = timePassed / 1.8808158;
      break;
    case "jupiter" :
      newAge = timePassed / 11.862615;
      break;
    case "saturn" :
      newAge = timePassed / 29.447498;
      break;
    case "uranus" :
      newAge = timePassed / 84.016846;
      break;
    case "neptune" :
      newAge = timePassed / 164.79132;
      break;
  }
  return Number((newAge / 31557600).toFixed(2));
};
