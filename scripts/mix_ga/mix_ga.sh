#!/usr/bin/env bash

set -e

OUT_DIR=./out/mix-ga/${1:-full}
DATA_GLOB=${2:-"./data/*.test"}
LOG_SUFFIX=${3:-""}
RUNS=20

if [ ! -d "$OUT_DIR" ]; then
    mkdir -p ${OUT_DIR}
fi
echo > "$OUT_DIR/log.txt"

for it in $(seq 1 ${RUNS})
do
    echo "Run $it"
    for fn in ${DATA_GLOB}
    do
        cmd="python3 k_mxf_ga.py -i $fn -o "${OUT_DIR}/run-${it}" 2>>$OUT_DIR/log$LOG_SUFFIX.txt"

        echo "$cmd"
        eval ${cmd}
        echo
    done
done