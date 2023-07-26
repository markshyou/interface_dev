# interface_app
soldesk interface team project

실행 순서 ### 수업 때 배운 워크숖페이지로 한다면 아래 순으로, 테라폼으로 배포하고 로드밸런서 컨트롤러는 직접 하는걸 권장
1. setup.sh
2. make_all.sh
3. ecr.sh
4. imagepush.sh

권장 순서 ### chmod +x ~/environment/interface_app/setup.sh >> 셋업 후 ###
1. terraform/network
2. ecr.sh > 리포지토리 인증 
    ex)aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin 11111111111.dkr.ecr.ap-northeast-2.amazonaws.com
3. make_all.sh
4. imagepush.sh
5. terraform/eks
6. aws-load-balancer-controller
7. manifest
## manifest 파일 배포 아직 안해봄 ##
## docker-compose.yaml 은 참고만. 실행 안함, 루트디렉터리에 docker-compose.yaml 파일은 도커컨테이너 이용시 사용 ##