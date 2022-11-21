FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN apt-get update \
    && apt-get install sudo \
    && sudo apt-get install -y binutils build-essential golang sysstat python3-matplotlib python3-pil fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system tzdata strace psmisc
RUN sudo adduser `id -un` libvirt && sudo adduser `id -un` libvirt-qemu && sudo adduser `id -un` kvm
