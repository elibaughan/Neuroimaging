#!/bin/bash

sbatch \
-o ~/logfiles/${1}/output_elibrain.txt \
-e ~/logfiles/${1}/error_elibrain.txt \
~/scripts/elibrain/freesurfereli_job.sh \
