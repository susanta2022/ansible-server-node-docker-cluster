## how to create ansible server node cluster inside docker container
creating a testing environment for ansible server and node cluster with the help of docker container 
## Prerequisite
1. docker version =>  20.10.14</br>
2. docker-compose version => v2.4.1
 
## Installation
1. download project file from git [repsitory](https://github.com/susanta2022/ansible-server-node-docker-cluster/archive/refs/heads/master.zip)</br>
2. chenge this projetct name as your requirement like</br>
``` bash
root@amz-linux# mv ansible-server-node-docker-cluster <project_name>
```
3. after change the project name run this flowing command like that
```bash
root@amz-linux# cd <project_name>
root@amz-linux# docker-compose up --build
```
## ansible server ssh setup procedure
1. open a terminal for ansible server run this flowing command 
``` bash
root@amz-linux# docker exec -it server bash
bash-4.2# systemctl start sshd
bash-4.2# cd run
bash-4.2# rm -r nologin
bash-4.2# cd ../..

```

## ansible node ssh setup procedure
1. open a terminal for ansible node(here node1 node2 ) run this flowing command 
``` bash
root@amz-linux# docker exec -it node1 bash
bash-4.2# systemctl start sshd
bash-4.2# cd run
bash-4.2# rm -r nologin
bash-4.2# cd ../..

```
2. you have to follow the same command for node2 

## generated ssh-key from ansible server and pass to the correspondence
1. make sure about the ssh key passphrase and don't give any passphrase make it blank
2. after creating ssh-key pass to the corresponding node
3. the flowing example like bellow --

``` bash
root@amz-linux# docker exec -it server bash
bash-4.2# ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): <press enter>
Enter passphrase (empty for no passphrase): <again press enter>
Enter same passphrase again: <again press enter>
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:x6lvgvze3EUNHvCrMn7qR3nIsQJ1DnaxgPyhXidH95s root@38ba281834d6
The key's randomart image is:
+---[RSA 2048]----+
|       . .. o.   |
|        o =.++.  |
|         = B..+. |
|        o.+.=. =.|
|       .So+= =+ +|
|        .o. *o.E |
|     . .. oo...  |
|      o .=.+o.   |
|       oo+B+.    |
+----[SHA256]-----+

bash-4.2# cd /root
bash-4.2# cd .ssh
bash-4.2# ssh-copy-id ansadmin@node1
bash-4.2# ssh-copy-id ansadmin@node2




