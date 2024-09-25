#!/bin/sh
 
echo '--------安装docker---------'
echo '解压tar包'
tar -xvf docker.tgz
echo '将docker目录下所有文件复制到/usr/bin目录'
cp docker/* /usr/bin
echo '将docker.service 复制到/etc/systemd/system/目录'
cp docker.service /etc/systemd/system/
echo '添加文件可执行权限'
chmod +x /etc/systemd/system/docker.service
echo '重新加载配置文件'
systemctl daemon-reload
echo '启动docker'
systemctl restart docker.service
systemctl start docker
echo '设置开机自启'
systemctl enable docker.service
echo 'docker安装成功'
docker -v


echo '---------安装docker-compose-------'
echo '拷贝docker-compose到 /usr/local/bin'
cp docker-compose /usr/local/bin/
echo '添加执行权限'
chmod +x /usr/local/bin/docker-compose
echo 'docker-compose 安装成功'
docker-compose -v 

