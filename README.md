# 功能点
## 可以登录
## 可以注册
## 可以聊天
# 部署指南
## 登录Docker Image Register
```bash
docker login registry.cn-hongkong.aliyuncs.com
```
然后输入你的docker用户名以及密码
## 拉取必须的image
```bash
docker pull phpmyadmin/phpmyadmin
docker pull registry.cn-shanghai.aliyuncs.com/mingshz/mysql-alirds
docker pull registry.cn-hongkong.aliyuncs.com/mingshz/xp-file-server:latest
docker pull nginx
docker pull redis
docker pull registry.cn-hongkong.aliyuncs.com/mingshz/xp-account:latest
docker pull registry.cn-hongkong.aliyuncs.com/mingshz/xp-bb:latest
docker pull registry.cn-hongkong.aliyuncs.com/mingshz/custom-openfire:latest
```
## 导入线上数据
本地可能会缺少一份dump_online.sql需自行所取。
```bash
./mysql-deploy.sh
dump_2_deve.sh
docker stack rm xp_deve
```
## 开始本地环境
```bash
mkdir -p files
./deploy.sh
```
## 如何开始测试
将以下记录添加到本地的hosts表中。
```
127.0.0.1 mysql.deve.xiaopao69.com
127.0.0.1 app.deve.xiaopao69.com
127.0.0.1 im.deve.xiaopao69.com
127.0.0.1 www.deve.xiaopao69.com
```

