#!/usr/bin/env bash
#SBATCH --time=12:00:00
#SBATCH --partition=cpu
#SBATCH --array=0-810
#SBATCH --output=./output/output_run_%a.txt
#SBATCH --error=./output/error_run_%a.txt
#SBATCH --exclude=oc222
#SBATCH --mem=6G
#SBATCH --nodes=1
problems=("iris" "nurse" "german")

current_problem=${problems[(${SLURM_ARRAY_TASK_ID}/270)]}
current_variant=$(((${SLURM_ARRAY_TASK_ID} / 30) % 9 + 1))
current_branch="${current_problem}_${current_variant}"

git clone -b $current_branch --single-branch "https://merl.dnshome.de/git/Hans/haga.git" ../../../oc-compute02/merljoha/$current_branch
git clone -b $current_branch --single-branch "https://merl.dnshome.de/git/Hans/haga.git" ../../../oc-compute03/merljoha/$current_branch

srun bash -c "cd /data/$SLURMD_NODENAME/merljoha/$current_branch; nix develop --command stack --no-nix --system-ghc --no-install-ghc run haga-lambda"
