#!/usr/bin/env bash
#SBATCH --time=00:10:00
#SBATCH --partition=cpu
# 9 Experiments * 3 Datasets
#SBATCH --array=0-27
# ensure output exists, is a folder and is writable in your working directory
#SBATCH --output=./output/output_run_%a.txt
#SBATCH --error=./output/error_run_%a.txt
# run once for every node you plan to use
#SBATCH --nodelist=oc-compute02
#SBATCH --mem=2G


# list your branches
problems=("iris" "nurse" "german")

#9 Experiments
current_problem=${problems[(${SLURM_ARRAY_TASK_ID}/9)]}
#9 Experiments
current_variant=$(((${SLURM_ARRAY_TASK_ID}) % 9 + 1))
current_branch="${current_problem}_${current_variant}"

# ensure [full path to writable folder on node *] exists
git clone -b $current_branch --single-branch "[your git repo]" [full path to writable folder on node 1]/$current_branch
git clone -b $current_branch --single-branch "[your git repo]" [full path to writable folder on node 1]/$current_branch
#... for every node

srun bash -c "cd /data/$SLURMD_NODENAME/merljoha/$current_branch; nix develop --command stack --no-nix --system-ghc --no-install-ghc build"
