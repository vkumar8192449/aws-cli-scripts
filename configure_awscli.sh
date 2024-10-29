#!/bin/bash

read -p "Enter your AWS Access Key ID: " AWS_ACCESS_KEY_ID
read -p "Enter your AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
read -p "Enter your default region (e.g., us-east-1): " AWS_REGION
read -p "Enter your preferred output format (json, yaml, text, table): " AWS_OUTPUT

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set region "$AWS_REGION"
aws configure set output "$AWS_OUTPUT"

echo "AWS CLI configuration complete."