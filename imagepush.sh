#!/bin/bash

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

docker tag order-docker:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:order-docker

docker tag store-docker:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:store-docker

docker tag user-docker:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:user-docker

docker tag front-docker:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:front-docker

docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:order-docker

docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:store-docker

docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:user-docker

docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/interface_app:front-docker
