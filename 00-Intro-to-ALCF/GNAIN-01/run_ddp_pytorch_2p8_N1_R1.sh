#! /bin/bash -x
#
#
# Timezone US/Central
export TZ='/usr/share/zoneinfo/US/Central'

# Define a timestamp function
timestamp() {
  date +"%Y-%m-%d %H:%M:%S" # current time
}

#NNODES=`wc -l < $PBS_NODEFILE`
NNODES=1
NRANKS_PER_NODE=1

let NRANKS=$((NNODES*$NRANKS_PER_NODE))

module use /soft/modulefiles
module load conda/2025-09-25
conda activate 
#conda activate /home/gnain/gnain_ai4s_anl

export DISABLE_PYMODULE_LOG=1

export CPU_AFFINITY="verbose,list:0,1:8,9:16,17:24,25"

mpiexec -n ${NRANKS} -ppn ${NRANKS_PER_NODE} -l --line-buffer --cpu-bind ${CPU_AFFINITY} python pytorch_2p8_ddp.py
