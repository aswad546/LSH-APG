#!/bin/bash

for file in *_test_data.data_new; do
    mv "$file" "${file/_test_data/}"
done