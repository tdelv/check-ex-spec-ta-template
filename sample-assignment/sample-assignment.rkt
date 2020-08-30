#lang forge

-- Put TA solution code here, with the sig/relation declarations

sig Node {
    edges : set Node
}

pred APred[n: Node] {
    n.edges = n
}

pred BPred {
    some n: Node | n.edges = n
}
