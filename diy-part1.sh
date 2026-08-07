# Add a feed source
echo '添加 whiskyrye 软件源'
# 1. 先尝试移除可能存在的旧配置，避免重复
sed -i '/whiskyrye\/ImmortalWrt-Packages/d' feeds.conf.default
# 2. 添加新源，使用更明确的名称
echo 'src-git whiskyrye https://github.com/whiskyrye/ImmortalWrt-Packages.git;main' >> feeds.conf.default
echo '=========Add whiskyrye feed OK!========='

echo '添加 K3 屏幕插件 (Luci 界面)'
rm -rf package/luci-app-k3screenctrl
git clone https://github.com/JE668/luci-app-k3screenctrl.git package/luci-app-k3screenctrl
echo '=========Add k3screen plug OK!========='

echo '添加 K3 屏幕驱动插件'
rm -rf package/k3screenctrl
git clone https://github.com/JE668/k3screenctrl_build.git package/k3screenctrl/
echo '=========Replace k3screen drive plug OK!========='

# 无线驱动版本选择 (1.'asus_dhd24' 2.'ac88u_20' 3.'69027')
firmware='69027'
echo '替换无线驱动'
wget -nv https://github.com/JE668/Phicomm-k3-Wireless-Firmware/raw/master/brcmfmac4366c-pcie.bin.${firmware} -O package/firmware/brcmfmac4366c0-firmware-k3/files/brcmfmac4366c-pcie.bin
echo '=========Replace k3 wireless firmware OK!========='

#Compile K3 Only
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
