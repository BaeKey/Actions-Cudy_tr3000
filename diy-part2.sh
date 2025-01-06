#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 237修改
# LAN IP
# sed -i 's/192.168.6.1/192.168.5.1/g' package/base-files/files/bin/config_generate
# 修改默认主题
# sed -i 's/[Bb]ootstrap/argon/g' feeds/luci/collections/luci/Makefile

# LEDE 修改

# LAN IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile

# 主机名
sed -i "s/hostname='LEDE'/hostname='Cudy'/" package/base-files/files/bin/config_generate

# 修改默认WiFi名称
sed -i "s/^\(\s*\)set wireless.default_radio\${devidx}\.ssid=LEDE/\1set wireless.default_radio\${devidx}.ssid=Cudy_\$(cat \/sys\/class\/ieee80211\/phy0\/macaddress | awk -F \":\" '{print \$5\$6 }' | tr a-z A-Z)/" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 删除默认密码
sed -i '/root::0:0:99999:7:::/d' package/lean/default-settings/files/zzz-default-settings
sed -i '/root:::0:99999:7:::/d' package/lean/default-settings/files/zzz-default-settings
