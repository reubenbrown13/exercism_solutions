import array
def proteins(strand):
    step = 3
    protein = ""
    output = []
    proteins = {'UGU':'Cysteine','UGC':'Cysteine','UUA':'Leucine','UUG':'Leucine','AUG':'Methionine','UUU':'Phenylalanine','UUC':'Phenylalanine','UCU':'Serine','UCC':'Serine','UCA':'Serine','UCG':'Serine','UGG':'Tryptophan','UAU':'Tyrosine','UAC':'Tyrosine','UAA':'STOP','UAG':'STOP','UGA':'STOP'}
    for i in range(0, len(strand), 3):
        codon = strand[i:step]
        if ( proteins[codon] != 'STOP' ):
            output.append(proteins[codon])
        else:
            break
        step += 3
    return output
