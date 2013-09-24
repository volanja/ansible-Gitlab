ansible-Gitlab
=====================

ansibleを使って、Gitの共有リポジトリを管理できるマシンを構築します。  
今のところREADMEしかありません。
以下のソフトウェアをインストールします。  
Gitlab…Ruby製のGit管理サーバソフトウェア  

ansible...サーバ構成管理ソフトウェア  

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
	serverspec (0.7.12)

インストールするもの
------
+ Gitlab 6.1
+ ruby 1.9.3+
+ git 1.7.10+
+ redis 2.0+
+ MariaDB 5.5.33a
+ Nginx

TODO
-----
+ インストールスクリプトのAnsible化
+ テストを書く。

リンク
-----
+ [Gitlab](http://gitlab.org/)


