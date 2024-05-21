# Running Experiments with Lambda:
This is not supposed to be a instruction on how to do it properly, but it is a writeup on how i did it.
If you want to do it properly, extend the command line Arguments for haga-lambda and allow runtime tweaking of Hyperparams and Datasets. While at it, generalizing LamdaCalculusV1 would be smart, too. You can use LamdaCalculusV2 as a template on how to do it more properly. (I wrote that later, and was IMO quite a bit smarter about it. I sadly didn't have time to fix up V1...)

You just want to do the same hack i did or know about it?

create a branch for each Dataset-experiment pair. e.g. iris_1 ... iris_9

here git is your friend, especially if you inevitably screw up.
e.g. echo git\ checkout\ iris_{1..9}\;\ git\ cherry-pick\ 7ced1e1\; will create a command for applying the commit 7ced1e1 to every iris branch.

Adapt the build.sbatch and run.sbatch and **commit them**!
clone the branch you committed to on the cluster.
create the required folders! If you forget the output one, slurm will fail silently!

Make sure to sbatch an adapted **build.sbatch before run.sbatch**!
build.sbatch will need to be adapted for and run on every node you will use!
Otherwise stuff WILL break!

sbatch run.sbatch

You can use squeue to monitor progress.

A huge slew of raw data will be dumped into the output Folder. The error files contain results, the output files stats during training.

On how to process these results, see: https://merl.dnshome.de/git/Hans/haga-graphics

