#!/usr/bin/zsh

function public-ip() {
	local PUBLIC_IP=$(curl -sL v4.ifconfig.co | awk '{ print $0 "/32" }')
	echo $PUBLIC_IP
}

function src() {
    exec zsh
}
