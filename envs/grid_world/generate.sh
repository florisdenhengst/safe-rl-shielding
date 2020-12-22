#!/bin/bash

#N=14
N=1
(
for SEED in 1 #2 3 4 5 6 7 8 9 10
do
    for COST in 0.00001 #0.001 0.01 0.1 0.2 0.5 1.0 2.0 
    do
        for SAFE in 4
        do
            ((i=i%N)); ((i++==0)) && wait
            python simulator.py 9x9_illustrative/9x9_illustrative.png -o 4 -c  \
            batch_${COST}_${SEED} -s \
            batch_${COST}_${SEED} --num-steps 10000 -x ${COST} --seed $SEED &
        done
    done
done
)
wait
