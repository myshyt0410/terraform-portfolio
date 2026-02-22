# Terraform AWS Infrastructure Portfolio

## 構成図
（先ほどの構成図の画像をここに貼る）

## 概要
AWSのインフラをTerraformでコード化したポートフォリオです。
マルチAZ構成でALBによる負荷分散とRDSによるデータベース管理を実装しています。

## 使用技術
- Terraform
- AWS VPC / Subnet / Internet Gateway / Route Table
- AWS ALB（Application Load Balancer）
- AWS EC2（Amazon Linux 2）
- AWS RDS（MySQL 8.0）
- AWS Security Group

## インフラ構成
- VPC（10.0.0.0/16）
- Public Subnet × 2（マルチAZ：ap-northeast-1a / 1c）
- Private Subnet × 2（マルチAZ：ap-northeast-1a / 1c）
- ALBでEC2 2台に負荷分散
- RDSをPrivate Subnetに配置しセキュリティを確保

## 設計理由
- マルチAZ構成にすることで単一障害点をなくし可用性を高めた
- RDSをPrivate Subnetに配置することでインターネットから直接アクセスできない構成にした
- Security GroupでALB→EC2→RDSの通信のみ許可しセキュリティを確保した

## 動作確認
ALBのDNS名にアクセスしEC2のホスト名が表示されることを確認。
リロードごとに1aと1cのEC2に交互に振り分けられることを確認。
