#!/bin/bash

#리포지토리 생성
aws ecr create-repository \
--repository-name interface-app \
--image-scanning-configuration scanOnPush=true \
--region ${AWS_REGION}
