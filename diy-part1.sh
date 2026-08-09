# Add a feed source
echo '添加 whiskyrye 软件源'
echo 'src-git whiskyrye https://github.com/whiskyrye/ImmortalWrt-Packages.git;main' >> feeds.conf.default

# 或者使用其他源
# echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages.git' >> feeds.conf.default
# echo 'src-git small https://github.com/kenzok8/small.git' >> feeds.conf.default

echo '=========Add whiskyrye feed OK!========='

echo '添加 luci-app-timecontrol 插件 (从 GitHub 克隆)'
# 注意：需要确认正确的仓库地址
rm -rf package/luci-app-timecontrol
git clone https://github.com/sirpdboy/luci-app-timecontrol.git package/luci-app-timecontrol
echo '=========Add timecontrol plug OK!========='

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
