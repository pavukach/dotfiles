#!/usr/bin/env fish

set tries 5
for i in (seq $tries)
    if set -q WAYLAND_DISPLAY; and wlr-randr >/dev/null 2>&1
        break
    end
    sleep 0.25
end

if wlr-randr | grep -q '^HDMI-A-1'
    wlr-randr --output eDP-1 --off
else
    wlr-randr --output eDP-1 --on
end
