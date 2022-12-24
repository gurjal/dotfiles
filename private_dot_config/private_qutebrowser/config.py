config.load_autoconfig()
config.set("colors.webpage.preferred_color_scheme", "dark")
config.set("qt.force_software_rendering", "chromium")
config.set("content.blocking.method", "both")
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0",
)
config.set("tabs.last_close", "close")

config.bind("j", "scroll-px 0 200")
config.bind("k", "scroll-px 0 -200")
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("a", "hint links tab-fg")
config.bind("F", "hint links tab-fg")

config.bind("O", "set-cmd-text :open {url}")

config.bind("t", "set-cmd-text -s :open -t")
config.bind("T", "tab-clone")
config.bind("b", "set-cmd-text -s :tab-focus")
config.bind("gb", "set-cmd-text -s :tab-move")

config.bind("'", "set-cmd-text -s :set-mark")
config.bind('"', "set-cmd-text -s :jump-mark")

config.bind("gm", "set-cmd-text -s :quickmark-load")
config.bind("gM", "set-cmd-text -s :quickmark-load -t")

config.bind(";;", "hint all hover")
config.bind(";i", "hint inputs")
config.bind(
    ";v", "set content.autoplay false;; hint links spawn --detach mpv {hint-url}"
)
config.bind(";V", "set content.autoplay false;; spawn --detach mpv {url}")

config.bind("ww", "open -w about:blank")
config.bind("wp", "open -p about:blank")
config.bind("wo", "window-only")
config.bind("wd", "close")

config.bind("zw", ":set colors.webpage.bg white")
config.bind("zt", "set-cmd-text -s :tab-take")
config.bind("zg", "tab-give")

config.source('themes/seoul256.py')
