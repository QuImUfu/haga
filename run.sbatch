#!/usr/bin/env bash
#SBATCH --time=12:00:00
#SBATCH --partition=cpu
#SBATCH --array=0-810
#SBATCH --output=/data/%N/merljoha/output/output_run_%a.txt
#SBATCH --error=/data/%N/merljoha/output/error_run_%a.txt
#SBATCH --nodelist=oc-compute02,oc-compute03
#SBATCH --mem=6G
problems=("iris" "nurse" "german")

current_problem=${problems[(${SLURM_ARRAY_TASK_ID}/270)]}
current_variant=$(((${SLURM_ARRAY_TASK_ID} / 30) % 9 + 1))
current_branch="${current_problem}_${current_variant}"

cd /data/oc-compute02/merljoha/
git clone -b $current_branch --single-branch "https://merl.dnshome.de/git/Hans/haga.git" ./$current_branch
cd /data/oc-compute03/merljoha/
git clone -b $current_branch --single-branch "https://merl.dnshome.de/git/Hans/haga.git" ./$current_branch

srun bash -c "cd /data/$SLURMD_NODENAME/merljoha/$current_branch; nix develop --command stack --no-nix --system-ghc --no-install-ghc run haga-lambda"
