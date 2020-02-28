#!/bin/bash
#
# You should only work under the /scratch/users/<username> directory.
#
# Example job submission script
#
# -= Resources =-
#
#SBATCH --job-name=game-of-life-jobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --partition=short
#SBATCH --time=00:30:00
#SBATCH --output=game-of-life.out

################################################################################
##################### !!! DO NOT EDIT ABOVE THIS LINE !!! ######################
################################################################################
# Set stack size to unlimited
echo "Setting stack size to unlimited..."
ulimit -s unlimited
ulimit -l unlimited
ulimit -a
echo

echo "Running Job...!"
echo "==============================================================================="
echo "Running compiled binary..."

#serial version
echo "Serial version..."
./life -n 2000 -i 500 -p 0.2 -d

#parallel version
#echo "Parallel version with 32 threads"
#export OMP_NUM_THREADS=32 
#export KMP_AFFINITY=verbose,granularity=fine,compact
#./life_parallel

#echo "Parallel version with 16 threads"
#export OMP_NUM_THREADS=16
#export KMP_AFFINITY=verbose,granularity=fine,compact
#./life_parallel
