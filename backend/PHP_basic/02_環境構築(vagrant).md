# 環境構築
ここではPHPを自分のPCで実行するための
開発環境の構築を行います。

今回は**Vagrant + Virtual Box**を使用します。

## 手順

### Vagrantのインストール

### Virtual Boxのインストール

### 仮想マシンの起動
```
vagrant box add ubuntu/xenial64
vagrant box list #ubuntu/xenial64が表示されることを確認

vagrant init ubuntu/xenial64
```

```
vim Vagrantfile

vagrant init ubuntu/xenial64

# config.vm.network "private_network", ip: "192.168.33.10"

# config.vm.synced_folder "../data", "/vagrant_data"

vagrant up

vagrant ssh
```

```
sudo apt-get update -y


```

### PHPのインストール
```
sudo apt-get install php -y

```


### Apacheのインストール
```
sudo apt-get install apache2 -y
sudo systemctl start apache2.service
sudo systemctl enable apache2.service
```


### MySQLのインストール
```
sudo apt-get install mysql-server -y
```