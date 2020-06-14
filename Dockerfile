FROM ubuntu:18.04

WORKDIR /root/build
RUN chmod 777 /root/build
RUN apt update &&apt install -y bc build-essential ccache curl neofetch g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop m4 openjdk-8-jdk pngcrush repo rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
RUN curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
RUN chmod a+rx /usr/local/bin/repo
COPY start.sh /root/start.sh

RUN neofetch --stdout

#real shit
RUN repo init -u git://github.com/Evolution-X/manifest.git -b ten --depth=1 --groups=all,-notdefault,-device,-darwin,-x86,-mips
RUN repo sync -j16
RUN git clone https://github.com/PratyakshM/device_xiaomi_rosy --depth=1 --single-branch device/xiaomi/rosy
RUN git clone https://github.com/PratyakshM/vendor_xiaomi_rosy --depth=1 --single-branch vendor/xiaomi
RUN git clone https://github.com/PratyakshM/kernel_xiaomi_rosy --depth=1 --single-branch kernel/xiaomi/rosy
RUN . build/envsetup.sh &&brunch $rosy



