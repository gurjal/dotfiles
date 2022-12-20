config.load_autoconfig()
config.source("themes/moonfly.py")
config.set("colors.webpage.preferred_color_scheme", "dark")
config.set("qt.force_software_rendering", "chromium")
config.set("content.blocking.method", "both")
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0",
)
config.set("tabs.last_close", "close")
config.bind("ww", ":set colors.webpage.bg white")

config.bind("j", "scroll-px 0 200")
config.bind("k", "scroll-px 0 -200")
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("F", "hint links tab-fg")

config.bind("O", "set-cmd-text :open {url}")

config.bind("t", "set-cmd-text -s :open -t")
config.bind("b", "set-cmd-text -s :tab-focus")
config.bind("gb", "set-cmd-text -s :tab-move")
config.bind("B", "tab-clone")
config.bind("T", "set-cmd-text -s :tab-take")
config.bind("W", "tab-give")

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
