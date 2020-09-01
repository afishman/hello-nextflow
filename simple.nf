#!/usr/bin/env nextflow
 
nextflow.enable.dsl=2 
/*
 * split a fasta file in multiple files
 */
process sayHello {
 
    input:
        val cheers
 
    output:
        stdout
 
    """
        echo SAY: $cheers
    """
}



workflow {
    channel.of('Ciao', 'Hello', 'Hola') | sayHello | view
}