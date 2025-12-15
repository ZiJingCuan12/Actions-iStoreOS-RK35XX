#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 修改版本为编译日期，数字类型。
date_version=$(date +"%Y%m%d%H")
echo $date_version > version

# ---------------------------------------------------------
# [修改点 1] 设置你的品牌名称
# ---------------------------------------------------------
# 将作者名改为 MuFVps，这样版本描述中会显示 "by MuFVps"
author="MuFVps"

# ---------------------------------------------------------
# [修改点 2] 修改系统底层标识 ID
# ---------------------------------------------------------
# 这行命令非常重要，它配合 diy-part2 的修改，确保系统认为自己是 MuFVps
# 注意：这行必须放在 package/base-files 相关操作之前
sed -i "s/DISTRIB_ID=.*/DISTRIB_ID='MuFVps'/g" package/base-files/files/etc/openwrt_release

# 修改系统描述和发布信息
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release

# 拉取我的软件包仓库
# (保留原逻辑，如果你有自己的仓库也可以替换这里)
echo 'src-git xmpackages https://github.com/xiaomeng9597/openwrt-packages2.git;main' >> feeds.conf.default
