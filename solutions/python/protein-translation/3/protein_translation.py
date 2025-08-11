PROTEINS = {'UGU': 'Cysteine', 'UGC': 'Cysteine', 'UUA': 'Leucine', 'UUG': 'Leucine', 'AUG': 'Methionine'
            , 'UUU': 'Phenylalanine', 'UUC': 'Phenylalanine', 'UCU': 'Serine', 'UCC': 'Serine', 'UCA':'Serine'
            , 'UCG': 'Serine', 'UGG': 'Tryptophan', 'UAU': 'Tyrosine', 'UAC': 'Tyrosine', 'UAA': 'STOP'
            , 'UAG': 'STOP', 'UGA': 'STOP'}


def proteins(strand):
    output = []
    for i in range(0, len(strand), 3): 
        codon = strand[i:i + 3]
        if PROTEINS[codon] == 'STOP': 
            break
        else: 
            output.append(PROTEINS[codon])
    return output