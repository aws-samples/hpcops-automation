#!/bin/bash
exec > >(tee /ArtifactBucket/output-"`date +"%d-%m-%Y-%H-%M-%S"`".txt|logger -t user-data -s 2>/dev/console) 2>&1
echo `date +'%F %R:%S'` "INFO: Logging Setup" >&2
echo starting worker-node-test-script.sh
echo `date +'%F %R:%S'` "INFO: Logging Setup" 
set -u

echo "Cluster Stack Name $1. Workload ran at $(date)"
echo "Cluster Deployment Role $3"

sleep 5m

OUT=$(aws sts assume-role --role-arn $3 --role-session-name cloudformationexecution);\
export AWS_ACCESS_KEY_ID=$(echo $OUT | jq -r '.Credentials''.AccessKeyId');\
export AWS_SECRET_ACCESS_KEY=$(echo $OUT | jq -r '.Credentials''.SecretAccessKey');\
export AWS_SESSION_TOKEN=$(echo $OUT | jq -r '.Credentials''.SessionToken');
aws cloudformation delete-stack --stack-name $1 --region $2

exit 0


