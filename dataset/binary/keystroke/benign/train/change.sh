#!/bin/bash

for file in *_training_data.data_new; do
    mv "$file" "${file/_training_data/}"
done