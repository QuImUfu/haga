#!/usr/bin/env bash
# test this timing, it scales with result sizes
#SBATCH --time=12:00:00
#SBATCH --partition=cpu
# 30 Runs * 9 Experiments * 3 Datasets
#SBATCH --array=0-809
# ensure output exists, is a folder and is writable in your working directory
#SBATCH --output=./output/output_run_%a.txt
#SBATCH --error=./output/error_run_%a.txt
# exclude nodes with weaker CPUs
#SBATCH --exclude=oc222
# test memory usage, it scales **Exponentially** with max Depth. Implement some countermeasures if that's a problem, e.g. raise max depth over time.
#SBATCH --mem=6G
#SBATCH --nodes=1


# list your branches
problems=("iris" "nurse" "german")

# 30 Runs * 9 Experiments
current_problem=${problems[(${SLURM_ARRAY_TASK_ID}/270)]}
# 30 Runs, 9 Experiments
current_variant=$(((${SLURM_ARRAY_TASK_ID} / 30) % 9 + 1))
current_branch="${current_problem}_${current_variant}"

# ensure [full path to writable folder on node *] exists
git clone -b $current_branch --single-branch "[your git repo]" [full path to writable folder on node 1]/$current_branch
git clone -b $current_branch --single-branch "[your git repo]" [full path to writable folder on node 2]/$current_branch
#... for every node

srun bash -c "cd /data/$SLURMD_NODENAME/merljoha/$current_branch; nix develop --command stack --no-nix --system-ghc --no-install-ghc run haga-lambda"
