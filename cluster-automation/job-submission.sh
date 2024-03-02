#!/bin/bash
echo starting job-submission.sh

echo Paramter 1=$1
echo Paramter 2=$2
echo Paramter 3=$3


curl https://raw.githubusercontent.com/aws-samples/hpcops-automation/main/cluster-automation/worker-node-test-script.sh --output ~/worker-node-test-script.sh

/opt/slurm/bin/sbatch ~/worker-node-test-script.sh $1 $2 $3

exit 0

