curPath=`pwd`
git pull
echo "开始build前台"
cd console/src/main/resources/static/console-fe
npm run build
echo "build前台结束"
echo "开始build后台"
cd $curPath
mvn -Prelease-nacos -Dmaven.test.skip=true clean install -U
echo "build后台结束"
echo "build结束，开始拷贝安装文件"
echo "部署172.26.130.8开始"
scp -r distribution/target/nacos-server-1.2.1.tar.gz root@172.26.130.8:/neworiental/nacos
ssh root@172.26.130.8 "cd /neworiental/nacos; ./deploy.sh"
echo "部署172.26.130.8结束"
echo "部署172.26.130.20开始"
scp -r distribution/target/nacos-server-1.2.1.tar.gz root@172.26.130.20:/neworiental/nacos
ssh root@172.26.130.20 "cd /neworiental/nacos; ./deploy.sh"
echo "部署172.26.130.20结束"
echo "部署172.26.130.28开始"
scp -r distribution/target/nacos-server-1.2.1.tar.gz root@172.26.130.28:/neworiental/nacos
ssh root@172.26.130.28 "cd /neworiental/nacos; ./deploy.sh"
echo "部署172.26.130.28结束"
