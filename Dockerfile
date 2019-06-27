# 基础镜像

FROM ubuntu:xenial



# 自动化

ENV DEBIAN_FRONTEND noninteractive



# 修改镜像源为清华tuna

#WORKDIR /etc/apt

#RUN rm /etc/apt/sources.list

#COPY sources.list sources.list



# 安装

RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list;

RUN apt-get update --fix-missing && apt-get install -y git --fix-missing

RUN apt-get -y upgrade

RUN dpkg --add-architecture i386

RUN apt-get -y install ssh net-tools nano

RUN apt-get -y install virtualenvwrapper python2.7-dev build-essential sudo libxml2-dev libxslt1-dev git libffi-dev cmake libreadline-dev libtool debootstrap debian-archive-keyring libglib2.0-dev libpixman-1-dev libpq-dev python-dev pkg-config zlib1g-dev libtool libtool-bin wget automake autoconf coreutils bison libacl1-dev qemu-user qemu-kvm socat postgresql-client nasm binutils-multiarch llvm clang

RUN apt-get -y install git
RUN apt-get -y install python3-pip
RUN apt-get -y install qtdeclarative5-dev
RUN apt-get -y install openjdk-8-jdk





RUN apt-get update --fix-missing && apt-get install -y git --fix-missing

RUN apt-get -y install libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386



# 支持SSH

RUN rm -f /etc/service/sshd/down

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config



# 开端口

EXPOSE 22

EXPOSE 80







# 启动项

#RUN ln -s /home/dak/桌面/run.sh / # backwards compat

#RUN chmod +x /home/dak/桌面/run.sh

#ENTRYPOINT ["run.sh"]