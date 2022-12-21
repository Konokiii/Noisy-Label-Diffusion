#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=6:00:00
#SBATCH --mem=16GB
#SBATCH --job-name=DoCL
#SBATCH --mail-type=END
#SBATCH --mail-user=zd662@nyu.edu
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --gres=gpu:2

singularity exec --nv --overlay /home/zd662/overlay-2GB-100K.ext3:ro \
/scratch/work/public/singularity/cuda11.6.124-cudnn8.4.0.27-devel-ubuntu20.04.4.sif /bin/bash -c "source /ext3/env.sh; python DoCL_trainer.py"

