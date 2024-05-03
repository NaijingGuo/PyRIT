#!/bin/bash

#!/bin/bash

export WANDB_MODE=disabled

# Optionally set the cache for transformers
# export TRANSFORMERS_CACHE='YOUR_PATH/huggingface'

export model=$1 # llama2 or mistral
export setup=$2 # behaviors or strings

# Create results folder if it doesn't exist
if [ ! -d "../results" ]; then
    mkdir "../results"
    echo "Folder '../results' created."
else
    echo "Folder '../results' already exists."
fi

# for data_offset in 0 10 20 30 40 50 60 70 80 90
data_offset=0


python -u ../main.py \
    --config="../configs/individual_${model}.py" \
    --config.attack=gcg \
    --config.train_data="https://raw.githubusercontent.com/llm-attacks/llm-attacks/main/data/advbench/harmful_${setup}.csv" \
    --config.result_prefix="../results/individual_${setup}_${model}_gcg_offset${data_offset}" \
    --config.n_train_data=1 \
    --config.data_offset=$data_offset \
    --config.n_steps=100 \
    --config.test_steps=50 \
    --config.batch_size=128
