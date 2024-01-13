config.load_autoconfig(False)
# config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
# config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
# config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
# c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:108.0) Gecko/20100101 Firefox/108.0'
# config.set('content.javascript.enabled', True, 'chrome-devtools://*')
# config.set('content.javascript.enabled', True, 'devtools://*')
# config.set('content.javascript.enabled', True, 'chrome://*/*')
# config.set('content.javascript.enabled', True, 'qute://*/*')
c.qt.force_software_rendering = 'none'
c.content.autoplay = False
c.content.blocking.method = 'both'
c.colors.webpage.preferred_color_scheme = 'dark'
c.tabs.last_close = 'close'
c.url.start_pages = 'about:blank'
c.url.default_page = 'about:blank'
c.url.searchengines = {
        'DEFAULT': 'https://google.com/search?q={}',
        'b': 'https://www.bing.com/search?q={}',
        'd': 'https://duckduckgo.com/?t=h_&q={}',
        }
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
# navigation
config.bind('j', 'scroll-px 0 200')
config.bind('k', 'scroll-px 0 -200')
config.bind('d', 'scroll-page 0 0.5')
config.bind('u', 'scroll-page 0 -0.5')
config.bind('gh', 'back')
config.bind('gj', 'scroll-to-perc 100')
config.bind('gk', 'scroll-to-perc 0')
config.bind('gl', 'forward')
config.bind('O', 'cmd-set-text -s :open -t')
# tabs
config.bind(',', 'tab-next')
config.bind('<', 'tab-prev')
config.bind('L', 'forward')
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
config.bind('H', 'back')
config.bind('x', 'tab-close')
config.bind('<Ctrl-w>', 'tab-close')
config.bind('tk', 'tab-close')
config.bind('tc', 'tab-clone')
config.bind('tt', 'open -t')
config.bind('to', 'cmd-set-text :open -r {url:pretty}')
config.bind('t1', 'tab-focus 1')
config.bind('t2', 'tab-focus 2')
config.bind('t3', 'tab-focus 3')
config.bind('t4', 'tab-focus 4')
config.bind('t5', 'tab-focus 5')
config.bind('t6', 'tab-focus 6')
config.bind('t7', 'tab-focus 7')
config.bind('t8', 'tab-focus 8')
config.bind('t9', 'tab-focus 9')
config.bind('t0', 'tab-focus 0')
config.bind('gt', 'cmd-set-text -s :tab-take')
config.bind('gT', 'tab-give')
# window
config.bind('wd', 'close')
config.bind('U', 'undo')
config.bind('wU', 'undo --window')
# utility
config.bind('zc', 'config-source')
config.bind('zg', 'greasemonkey-reload')
config.bind('zb', 'set colors.webpage.bg white')
# theme
config.source('qtbtheme.py')
