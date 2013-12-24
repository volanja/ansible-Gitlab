ansible-Gitlab
=====================

ansibleを使って、Gitの共有リポジトリを管理できるマシンを構築します。  
以下のソフトウェアをインストールします。  

[Gitlab](http://gitlab.org/)…Ruby製のGit管理サーバソフトウェア  

[ansible](http://www.ansibleworks.com/)...サーバ構成管理ソフトウェア  

アクセスはサブドメイン(gitlab.cadence)で行います。

![ソフトウェア構成図](https://raw.github.com/volanja/ansible-Gitlab/master/img/ansible-Gitlab.png)

対象環境
-----
CentOS 6.4 64bit   (virtualbox + vagrantで構築)

実行環境
-----
	$ ansible --version  
	ansible 1.2.2

	$ ruby -v  
	ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-darwin11.4.2]

	$ gem list |grep serverspec  
	serverspec (0.13.0)

インストールするもの
------
+ ruby 2.0.0p353
+ git 1.7.10+
+ redis 2.0+
+ MariaDB 5.5.33a
+ Gitlab 6.1
+ Nginx

実行手順
----
1. hostsファイルの設定変更  
clone後、hostsファイル内の対象サーバのIPアドレスを変更してください。

2. SSH公開鍵認証の準備  
対象サーバにSSH公開鍵認証方式でログイン出来るように準備してください。

3. ansible playbook 実行  

対象サーバのドメイン名を次のファイルに定義(デフォルトはcadence)してください。
Windows/Linuxではhostsファイルの書き換えにより、アクセスするようにします。

```
+----------------------------------------------------------------------------+
|             File             |          Key          |        Value        |
+----------------------------------------------------------------------------+
| roles/gitlab/vars/main.yml   | server_name           | cadence             |
| roles/hostname/vars/main.yml | server_name           | cadence             |
+----------------------------------------------------------------------------+
```

次のコマンドで実行します。  

```
$ ansible-playbook setup.yml -i hosts  
```

4. テストの準備  
Serverspecで行います。  
spec/properties.ymlのIPアドレス、秘密鍵を修正してください。

```spec/spec.yml
root:
  roles:
    - Packages
    - gitlab
  ip: 192.168.0.108
  private_key: ~/.ssh/id_rsa
```

5. テストの実行  
次のコマンドで実行します。  
```
$ rake serverspec       # Run serverspec to all hosts
```

6. Gitlabへのアクセス  
あらかじめhostsファイルを次のように変更しておきます。
Windows... C:/Windows/System32/drivers/etc/hosts
Linux,Mac... /etc/hosts

```
192.168.0.108 gitlab.cadence
```

次のURLでアクセスできます。  

```
http://gitlab.cadence/  
```

ID```admin@local.host```  
パスワード```5iveL!fe```

リンク
-----
+ [Gitlab](http://gitlab.org/)

謝辞
-----
作成にあたり、以下のサイトを参考にさせて頂きました。
+ [serverspec インフラ層のテスト項目を考える](https://hiroakis.com/blog/2013/12/24/serverspec-%E3%82%A4%E3%83%B3%E3%83%95%E3%83%A9%E5%B1%A4%E3%81%AE%E3%83%86%E3%82%B9%E3%83%88%E9%A0%85%E7%9B%AE%E3%82%92%E8%80%83%E3%81%88%E3%82%8B/)
