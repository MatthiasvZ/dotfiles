#!/bin/sh

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export XIM_PROGRAM=/usr/bin/fcitx5
fcitx5 &
