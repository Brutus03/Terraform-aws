#cloud-config

runcmd:
# ホスト名の変更
  - hostnamectl set-hostname webserver

# パッケージのインストール
## セキュリティ関連の更新のみがインストール
  - yum update --security -y

## Amazon Corretto 11
  - yum install -y java-11-amazon-corretto-headless

## PostgreSQL client programs
  - yum install -y postgresql.x86_64

# タイムゾーン変更
## 設定ファイルのバックアップ
  - cp  -p /etc/localtime /etc/localtime.org

## シンボリックリンク作成
  - ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
