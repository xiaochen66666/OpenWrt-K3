# 修改默认 IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 取消原主题 luci-theme-bootstrap 为默认主题 - 修改 argon 为默认主题 - 删除原默认主题
echo '切换默认主题为 Argon'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
rm -rf feeds/luci/themes/luci-theme-bootstrap
echo '=========Default theme changed to Argon!========='
