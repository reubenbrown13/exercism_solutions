export const twoFer = ( name = "you" ) => {
  return toEqual( name );
}
function toEqual( name1="you" ) {
  if ( name1.length == 0 ) { name1 = "you"; }
  return `One for ${name1}, one for me.`
}
