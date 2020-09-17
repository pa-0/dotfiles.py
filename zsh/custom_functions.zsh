#!/usr/bin/zsh

function public-ip ()
{
    local PUBLIC_IP=$(curl --no-progress-meter v4.ifconfig.co | awk '{ print $0 "/32" }')
    echo $PUBLIC_IP
}
