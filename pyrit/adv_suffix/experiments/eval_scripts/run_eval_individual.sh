#!/bin/bash

export LOG=$1
export model=$2 # llama2 or mistral

python -u ../evaluate_individual.py \
    --config="../configs/transfer_${model}.py" \
    --config.train_data="https://raw.githubusercontent.com/llm-attacks/llm-attacks/main/data/advbench/harmful_${setup}.csv" \
    --config.logfile="${LOG}" \
    --config.n_train_data=2 \
    --config.n_test_data=0
