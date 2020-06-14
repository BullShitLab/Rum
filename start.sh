# confirm our specs
neofetch

#real shit
repo init -u git://github.com/Evolution-X/manifest.git -b ten --depth=1 --groups=all,-notdefault,-device,-darwin,-x86,-mips
repo sync -j16
git clone https://github.com/PratyakshM/device_xiaomi_rosy --depth=1 --single-branch device/xiaomi/rosy
git clone https://github.com/PratyakshM/vendor_xiaomi_rosy --depth=1 --single-branch vendor/xiaomi
git clone https://github.com/PratyakshM/kernel_xiaomi_rosy --depth=1 --single-branch kernel/xiaomi/rosy
. build/envsetup.sh &&brunch $rosy

#Post-build upload jobs
curl -sL https://git.io/file-transfer | sh
./transfer bit out/target/product/$device/*-rosy-*-UNOFFICIAL.zip
