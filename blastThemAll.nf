fasta = Channel.fromPath( "./data/*.fa" ).buffer(size:6)

process blastThemAll {
    input:
    file 'seq' from fasta

    output:
    stdout procOutput

    """
    echo seq*
    cat seq1 seq2 seq3 seq4
    """

}

procOutput.subscribe { println it }