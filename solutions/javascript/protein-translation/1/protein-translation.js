//
// This is only a SKELETON file for the 'Protein Translation' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const translate = ( strand ) => {
  var output = [];
  var protein = "";
  if ( strand ) {
    for (let i=0; i < strand.length; i+=3 ) {
      protein = PROTEINS.get(strand.substring (i, i+3));
      if ( protein != "STOP" ) {
        console.log(protein);
        if ( protein == undefined ) { throw new Error("Invalid codon");
        } else { output.push(protein); }
      } else { break; }
    }
  }
  return output;
};

export const PROTEINS = new Map();
PROTEINS.set("UGU", "Cysteine");
PROTEINS.set("UGC", "Cysteine");
PROTEINS.set("UUA", "Leucine");
PROTEINS.set("UUG", "Leucine");
PROTEINS.set("AUG", "Methionine");
PROTEINS.set("UUU", "Phenylalanine");
PROTEINS.set("UUC", "Phenylalanine");
PROTEINS.set("UCU", "Serine");
PROTEINS.set("UCC", "Serine");
PROTEINS.set("UCA", "Serine");
PROTEINS.set("UCG", "Serine");
PROTEINS.set("UGG", "Tryptophan");
PROTEINS.set("UAU", "Tyrosine");
PROTEINS.set("UAC", "Tyrosine");
PROTEINS.set("UAA", "STOP");
PROTEINS.set("UAG", "STOP");
PROTEINS.set("UGA", "STOP");
