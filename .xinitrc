export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

exec i3
