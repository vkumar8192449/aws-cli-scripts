#!/bin/bash

wait_for_instance() {
    instance_id="$1"
    echo "Waiting for instance $instance_id to be in running state..."

    while true; do
        state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
        if [[ "$state" == "running" ]]; then
            echo "Instance $instance_id is now running."
            break
        fi
        sleep 10
    done
}

create_ec2_instance() {
    default_ami_id="ami-0dee22c13ea7a9a67"
    default_instance_type="t2.micro"

    read -p "Enter AMI ID (default: $default_ami_id): " ami_id
    ami_id=${ami_id:-$default_ami_id}  # Use default if empty

    read -p "Enter Instance Type (default: $default_instance_type): " instance_type
    instance_type=${instance_type:-$default_instance_type}  # Use default if empty
    
    read -p "Enter Key name: " key_name
    read -p "Enter Subnet Id: " subnet_id
    read -p "Enter Security group Id: " security_group_ids
    read -p "Enter Instance name: " instance_name

    # Run AWS CLI command to create EC2 instance
    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --subnet-id "$subnet_id" \
        --security-group-ids "$security_group_ids" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )

    if [[ -z "$instance_id" ]]; then
        echo "Failed to create EC2 instance."
        exit 1
    fi

    echo "Instance $instance_id created successfully."

    wait_for_instance "$instance_id"
}

create_ec2_instance