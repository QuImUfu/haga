#!/usr/bin/env bash
#SBATCH --time=00:10:00
#SBATCH --partition=cpu
#SBATCH --array=0-27
#SBATCH --output=./output/output_run_%a.txt
#SBATCH --error=./output/error_run_%a.txt
#SBATCH --nodelist=oc-compute02,oc-compute03
#SBATCH --mem=2G
problems=("iris" "nurse" "german")

current_problem=${problems[(${SLURM_ARRAY_TASK_ID}/9)]}
current_variant=$(((${SLURM_ARRAY_TASK_ID}) % 9 + 1))
current_branch="${current_problem}_${current_variant}"

git clone -b $current_branch --single-branch "https://merl.dnshome.de/git/Hans/haga.git" /data/oc-compute02/merljoha/$current_branch
git clone -b $current_branch --single-branch "https://merl.dnshome.de/git/Hans/haga.git" /data/oc-compute03/merljoha/$current_branch

srun bash -c "cd /data/$SLURMD_NODENAME/merljoha/$current_branch; nix develop --command stack --no-nix --system-ghc --no-install-ghc build"
