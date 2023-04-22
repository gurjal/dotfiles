config.load_autoconfig(False)
c.qt.force_software_rendering = 'none'
c.content.autoplay = False
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0'
c.content.blocking.method = 'both'
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
# config.set('content.javascript.enabled', True, 'chrome-devtools://*')
# config.set('content.javascript.enabled', True, 'devtools://*')
# config.set('content.javascript.enabled', True, 'chrome://*/*')
# config.set('content.javascript.enabled', True, 'qute://*/*')
c.tabs.last_close = 'close'
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}
c.url.start_pages = 'about:blank'
c.colors.webpage.preferred_color_scheme = 'dark'
# keybinds
config.bind('O', 'set-cmd-text :open {url}')
# quickmarks
config.unbind('m')
config.bind('mm', 'quickmark-save')
config.bind('mt', 'set-cmd-text -s :quickmark-load -t')
config.bind('mo', 'set-cmd-text -s :quickmark-load')
# jump mark
config.bind("'", 'set-cmd-text -s :jump-mark')
config.bind('"', 'set-cmd-text -s :set-mark')
# hints
config.bind('gf', 'hint links tab-fg')
config.bind('F', 'hint links tab-fg')
config.bind(';;', 'hint all hover')
# navigation
config.bind('j', 'scroll-px 0 200')
config.bind('k', 'scroll-px 0 -200')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('gj', 'scroll-to-perc 100')
config.bind('gk', 'scroll-to-perc 0')
config.bind('gh', 'back')
config.bind('gl', 'forward')
# tab
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('T', 'tab-clone')
config.bind('b', 'set-cmd-text -s :tab-focus')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('x', 'tab-close')
# window
config.bind('wd', 'close')
config.bind('wo', 'window-only')
config.bind('wp', 'open -p about:blank')
config.bind('ww', 'open -w about:blank')
# undo
config.bind('X', 'undo')
config.bind('wX', 'undo --window')
# utility
config.bind('zg', 'tab-give')
config.bind('zt', 'set-cmd-text -s :tab-take')
config.bind('zb', ':set colors.webpage.bg white')
# theme
config.source('themes/everforest.py')
