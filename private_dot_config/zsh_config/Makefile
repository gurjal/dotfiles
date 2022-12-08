cleanbuild:
	make clean build
build:
	zsh -c "zcompile src/zsh_init" \
		&& zsh -c "zcompile src/zsh_aliases" \
		&& zsh -c "zcompile src/zsh_functions" \
		&& zsh -c "zcompile src/zsh_options" \
		&& mv src/*.zwc bin
	zsh -c "zcompile src/plugins/zsh_vi_mode" \
		&& zsh -c "zcompile src/plugins/zsh_git" \
		&& zsh -c "zcompile src/plugins/zsh_nnn" \
		&& mv src/plugins/*.zwc bin
	zsh -c "zcompile src/distro/zsh_ubuntu" \
		&& zsh -c "zcompile src/distro/zsh_arch" \
		&& zsh -c "zcompile src/distro/zsh_void" \
		&& zsh -c "zcompile src/distro/zsh_bedrock" \
		&& mv src/distro/*.zwc bin
	zsh -c "zcompile src/completions/arduino_cli_completions.zsh" \
		&& zsh -c "zcompile src/completions/fzf_completions.zsh" \
		&& zsh -c "zcompile src/completions/git_completions.zsh" \
		&& zsh -c "zcompile src/completions/rbw_completions.zsh" \
		&& mv src/completions/*.zwc bin
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
		&& zsh -c "zcompile bin/zsh-syntax-highlighting/highlighters/root/root-highlighter.zsh" \

clean:
	rm -rf bin/*
