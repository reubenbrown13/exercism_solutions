//
// This is only a SKELETON file for the 'Bowling' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Bowling {
  constructor() {
    this.rolls = [];
  }

  roll( pins ) {
    if ( this.isRollValid(pins) ){
      this.rolls.push(pins);
      // if a strike was rolled, 
      if ( pins === 10 && this.rolls.length < 20 ) {
        this.rolls.push(0);
      }
    } 
  }

  score() {
    let score = 0;
    let rollIndex = 0;

    if ( this.rolls.length < 20 || (this.rolls.length == 20 && (this.rolls[18]+this.rolls[19] == 10)) || ( this.rolls.length == 21 && this.rolls[20] == 10 && this.rolls[18] == 10 ) ) {
      throw new Error('Score cannot be taken until the end of the game');
    } else {
  
      for (let frame = 0; frame < 10; frame++) {
        if (this.isStrike(rollIndex)) {
          score += 10 + this.strikeBonus(rollIndex);
        } else if (this.isSpare(rollIndex)) {
          score += 10 + this.spareBonus(rollIndex);
        } else {
          score += this.sumOfTwoBallsInFrame(rollIndex);
        }
        rollIndex += 2;
      }
  
      return score;
    }
  }

  isRollValid(pins) {
    let pinTotal = pins;

    if ( 0 < this.rolls.length && this.rolls.length % 2 == 1 && (this.rolls.length < 20 || ( this.rolls.length >= 20 && this.rolls[this.rolls.length-1] != 10 ) ) ) {
      pinTotal += this.rolls[this.rolls.length - 1];
    }
    
    if ( pinTotal < 0 ) {
      throw new Error('Negative roll is invalid');
      return false;
    } else if ( pinTotal > 10 ) {
      throw new Error( 'Pin count exceeds pins on the lane' );
      return false;
    } else if ( ( this.rolls.length > 19 && this.rolls[18] + this.rolls[19] < 10 ) || ( this.rolls.length == 21 && this.rolls[18] + this.rolls[19] == 10 && this.rolls[18] < 10) || this.rolls.length > 21 ) {
      throw new Error('Cannot roll after game is over');
      return false;
    } else {
      return true;
    }
  }

  isStrike(rollIndex) {
    return ( this.rolls[rollIndex] === 10);
  }

  isSpare(rollIndex) {
    return ( this.rolls[rollIndex + 1] + this.rolls[rollIndex] === 10 );
  }

  strikeBonus(rollIndex) {
    if ( this.rolls[rollIndex + 2] === 10 && rollIndex < 18 ) {
      return this.rolls[rollIndex + 2] + this.rolls[rollIndex + 4];
    } else {
      return this.rolls[rollIndex + 2] + this.rolls[rollIndex + 3];
    }
  }

  spareBonus(rollIndex) {
    return this.rolls[rollIndex + 2];
  }

  sumOfTwoBallsInFrame(rollIndex) {
    return this.rolls[rollIndex] + this.rolls[rollIndex + 1];
  }
}