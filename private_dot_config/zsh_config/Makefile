install:
	make clean build

build:
	zsh -c "zcompile src/zsh_init" && mv src/*.zwc bin
	zsh -c "zcompile src/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" \
		&& mv src/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh.zwc bin
	cp -rf src/plugins/zsh-syntax-highlighting bin \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/brackets/brackets-highlighter.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/cursor/cursor-highlighter.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/line/line-highlighter.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/pattern/pattern-highlighter.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/regexp/regexp-highlighter.zsh" \
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/root/root-highlighter.zsh"

clean:
	rm -rf bin/*

plugins:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
		&& mv -f zsh-syntax-highlighting src/plugins
	git clone https://github.com/zsh-users/zsh-history-substring-search.git \
		&& mv -f zsh-history-substring-search src/plugins
