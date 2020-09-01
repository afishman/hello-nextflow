#!/usr/bin/env nextflow
 
params.in = "$baseDir/data/sample.fa"
 
/*
 * split a fasta file in multiple files
 */
process splitSequences {
    container 'ubuntu'
 
    input:
    path 'input.fa' from params.in
 
    output:
    path 'seq_*' into records

    """
    cat input.fa > seq_*
    #awk '/^>/{f="seq_"++d} {print > f}' < input.fa
    """
}
 
/*
 * Simple reverse the sequences
 */
process reverse {
    container 'ubuntu'

 
    input:
    path x from records
     
    output:
    stdout into result
 
    """
    cat $x | rev
    """
}
 
/*
 * print the channel content
 */
result.subscribe { println it }