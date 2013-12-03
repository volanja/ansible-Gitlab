ansible-Gitlab
=====================

ansibleを使って、Gitの共有リポジトリを管理できるマシンを構築します。  
以下のソフトウェアをインストールします。  

[Gitlab](http://gitlab.org/)…Ruby製のGit管理サーバソフトウェア  

[ansible](http://www.ansibleworks.com/)...サーバ構成管理ソフトウェア  

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
+ ruby 2.0.0p327
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
次のコマンドで実行します。  
```
$ ansible-playbook setup.yml -i hosts  
$ ansible-playbook setup_git.yml -i hosts
```

4. テストの準備  
Serverspecで行います。  
spec/default をspec/xxx.xxx.xxx.xxxと変更してください。

5. テストの実行  
次のコマンドで実行します。  
```
$ rake spec
```

6. 再起動  
ここで一度再起動してください。

7. Gitlabへのアクセス  
次のURLでアクセスできます。  
```
http://IPアドレス/  
```

ID```admin@local.host```  
パスワード```5iveL!fe```

リンク
-----
+ [Gitlab](http://gitlab.org/)
