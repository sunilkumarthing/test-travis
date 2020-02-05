#!/bin/bash -e

# Checks if previous command throw any error status code if it did
# Script exists with exit code 1
check_status() {
  if [ $? -ne 0 ]; then
    exit 1
  fi
}

aws_s3_sync() {
  aws s3 sync . s3://${BUCKET_NAME} --region=${REGION_NAME} --delete
  check_status
}

main() {
  aws_s3_sync
}

main
