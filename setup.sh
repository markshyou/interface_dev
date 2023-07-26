#!/bin/bash

chmod +x ~/environment/interface_app/setup.sh
chmod +x ~/environment/interface_app/ecr.sh
chmod +x ~/environment/interface_app/make_all.sh
chmod +x ~/environment/interface_app/imagepush.sh


#자격증명 업데이트 확인
rm -vf ${HOME}/.aws/credentials
aws sts get-caller-identity --query Arn | grep eksworkspace-admin >> output.txt

#AWS CLI 업데이트
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
export PATH=/usr/local/bin:$PATH
source ~/.bash_profile
aws --version >> output.txt

#kubectl 설치
sudo curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
kubectl version --short --client >> output.txt

#기타 툴 설치
sudo yum install -y jq
sudo yum install -y bash-completion

#eksctl 설치 및 확인
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv -v /tmp/eksctl /usr/local/bin
eksctl version >> output.txt

#cdk 확인
cdk --version >> output.txt

#현재 리전 기본 설정 및 확인
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
aws configure set default.region ${AWS_REGION}
aws configure get default.region >> output.txt

#현재 계정ID 환경변수 등록
export ACCOUNT_ID=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.accountId')
echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile >> output.txt

#디스크사이즈 증설
wget https://gist.githubusercontent.com/joozero/b48ee68e2174a4f1ead93aaf2b582090/raw/2dda79390a10328df66e5f6162846017c682bef5/resize.sh
sh resize.sh
df -h >> output.txt



cat output.txt