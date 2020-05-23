## ~/.nixpkgs/config.nix 
## this file is not used at the moment since the packages are installed 
## by home manager
{  pkgs, ... }:
  let
    customPlugins.vim-better-whitespace = pkgs.vimUtils.buildVimPlugin {
      name = "vim-better-whitespace";
      src = pkgs.fetchFromGitHub {
        owner = "ntpeters";
        repo = "vim-better-whitespace";
        rev = "984c8da518799a6bfb8214e1acdcfd10f5f1eed7";
        sha256 = "10l01a8xaivz6n01x6hzfx7gd0igd0wcf9ril0sllqzbq7yx2bbk";
      };
    };
    in {
      packageOverrides = pkgs: with pkgs; {
      # install by nix-env -iA nixpkg.myVim
      myVim = vim_configurable.customize {
      	# add custom .vimrc lines like this:
      	name = "vim-with-plugins";
        vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // customPlugins;
        vimrcConfig.vam.pluginDictionaries = [ 
          { names = [ "vim-better-whitespace" "vim-go" ]; } 
        ];
      	vimrcConfig.customRC = ''
      	  set hidden
      	  set colorcolumn=80 
            set number
            syntax enable
      	'';
          #vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
          #  # loaded on launch
          #  start = [ vim-go vim-better-whitespace ];
          #  # manually loadable by calling `:packadd $plugin-name`
          #  opt = [ elm-vim ];
          #  # To automatically load a plugin when opening a filetype, add vimrc lines like:
          #  # autocmd FileType php :packadd phpCompletion
          #};
      };
      myNeovim = neovim.override {
        configure = {
          # here your custom configuration goes!
        	customRC = ''
            set number
        	  let g:LanguageClient_serverCommands = {
        	   \ 'python': ['pyls']
        	   \ }
        	  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
        	  nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
        	  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
        	  nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
        	  nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
        	  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
        	  nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<CR>
        	'';
          #plug.plugins = with pkgs.vimPlugins; [
          #  vim-go
          #];
          packages.myVimPackage = with pkgs.vimPlugins; {
            # see examples below how to use custom packages
            start = [ LanguageClient-neovim vim-nix ];
            opt = [ ];
        	};      
        };
      };
    };
  }

