using System;
using System.Collections.Generic; 
using System.Linq;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand)
    {
        Dictionary<string, string> proteins = new Dictionary <string, string>() { {"UGU", "Cysteine"},{"UGC", "Cysteine"},{"UUA", "Leucine"},{"UUG", "Leucine"},{"AUG", "Methionine"},{"UUU", "Phenylalanine"},{"UUC", "Phenylalanine"},{"UCU", "Serine"},{"UCC", "Serine"},{"UCA", "Serine"},{"UCG", "Serine"},{"UGG", "Tryptophan"},{"UAU", "Tyrosine"},{"UAC", "Tyrosine"},{"UAA", "STOP"},{"UAG", "STOP"},{"UGA", "STOP"} };
        var output = new List<string>();
        var parts = Enumerable.Range(0, (strand.Length + 3 - 1) / 3).Select(i => strand.Substring(i * 3, Math.Min(strand.Length - i * 3, 3)));

        foreach( string codon in parts ) {
            if ( proteins[codon] != "STOP" ) {
                output.Add(proteins[codon]);
            } else { break; }
        }
        return output.ToArray();
    }
}