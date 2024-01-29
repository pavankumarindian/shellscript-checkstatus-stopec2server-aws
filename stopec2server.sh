#!/bin/bash
read -p "enter the region:" region
read -p "enter the instance-id:" id
status=$(aws ec2 describe-instance-status --region "$region" --instance-ids "$id" --query 'InstanceStatuses[0].InstanceState.Code' --output text)
echo $status
if [ $status -eq 16 ];then

        echo "$id is running"
aws ec2 stop-instances --instance-ids "$id"
else

        echo "$id is not running"
fi
