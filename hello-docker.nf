#!/usr/bin/env nextflow
 
nextflow.enable.dsl=2 
/*
 * split a fasta file in multiple files
 */
process sayHello {
    container 'biocontainers/samtools:v1.9-4-deb_cv1'
 
    input:
        val cheers
 
    output:
        stdout
 
    """
        echo running samtools
        samtools --help
    """
}



workflow {
    channel.of('Ciao') | sayHello | view
}