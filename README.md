## how to create ansible server node cluster inside docker container
creating a testing environment for ansible server and node cluster with the help of docker container 
## Prerequisite
1. docker version =>  20.10.14</br>
2. docker-compose version => v2.4.1
 
## Installation
1. download project file from git [repsitory](https://github.com/susanta2022/ansible-server-node-docker-cluster/archive/refs/heads/master.zip)</br>
2. chenge this projetct name as your requirement like</br>
``` python
susanta@server# mv ansible-server-node-docker-cluster <project_name>
```
3. after change the project name run this flowing command like that
```bash
susanta@server# cd <project_name>
susanta@server# docker-compose up --build
```


