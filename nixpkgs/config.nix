## ~/.nixpkgs/config.nix
## this file is used at the moment since these packages are not installed
## by home manager
{  pkgs, ... }:
  let
    R-with-my-packages =pkgs.rWrapper.override{packages = with pkgs.rPackages; [
      devtools 
      roxygen2
      getopt 
      FME 
      dplyr 
      testthat
      argparse
      stringr
      RUnit
      knitr
      rmarkdown
      rhub
    ]; };
    customPlugins.vim-better-whitespace = pkgs.vimUtils.buildVimPlugin {
      name = "vim-better-whitespace";
      src = pkgs.fetchFromGitHub {
        owner = "ntpeters";
        repo = "vim-better-whitespace";
        rev = "984c8da518799a6bfb8214e1acdcfd10f5f1eed7";
        sha256 = "10l01a8xaivz6n01x6hzfx7gd0igd0wcf9ril0sllqzbq7yx2bbk";
      };
    };
    customPlugins.vim-tmux-clipboard= pkgs.vimUtils.buildVimPlugin {
      name = "vim-tmux-clipboard";
      src = pkgs.fetchFromGitHub {
        owner = "roxma";
        repo = "vim-tmux-clipboard";
        rev = "47187740b88f9dab213f44678800cc797223808e";
        sha256 = "1a7rpbvb7dgjfnrh95zg2ia6iiz2mz2xps31msb8h14hcj6dsv6y";
      };
    };
    customPlugins.nvim-r = pkgs.vimUtils.buildVimPlugin {
      name = "nvim-r";
      src = pkgs.fetchgit {
        url= "https://github.com/jalvesaq/nvim-r";
        rev =  "c53b5a402a26df5952718f483c7461af5bb459eb";
        sha256 = "13xbb05gnpgmyaww6029saplzjq7cq2dxzlxylcynxhhyibz5ibv";
        };
      buildInputs = [ pkgs.which pkgs.vim pkgs.zip];
    };
    in {
      packageOverrides = pkgs: with pkgs; {
      # install by nix-env -iA nixpkgs.myVim
      myVim = vim_configurable.customize {
      	# add custom .vimrc lines like this:
      	name = "vim-with-plugins";
        vimrcConfig.vam.knownPlugins = pkgs.vimPlugins // customPlugins;
        vimrcConfig.vam.pluginDictionaries = [
          { names = [ "vim-better-whitespace" "vim-tmux-clipboard" "vim-go" ]; }
        ];
      	vimrcConfig.customRC = ''
      	  set hidden
      	  set colorcolumn=80
          set number
          set hls
          set mouse=a
          syntax enable
          "
          "key maps 
          "
          map <F6> :nohls <CR>
          "
          augroup vimrc
          " remove all previously defined autocommands
            autocmd!
            "
            "autocmd VimEnter * NERDTree

            " set python indentation
            " and keyremapping see :help key-notation
            au BufNewFile,BufRead *.py
                \ setlocal tabstop=4|
                \ setlocal softtabstop=4|
                \ setlocal shiftwidth=4|
                \ setlocal expandtab|
                \ setlocal shiftround|
                " \ inoremap = <Space>=<Space>|
                "\ inoremap , ,<Space>

            " set html indentation
            au BufNewFile,BufRead *.html,*.tex,*.sh,*.F90,*.R,*.Rnw,*.hs
                \ setlocal tabstop=2 |
                \ setlocal softtabstop=2 |
                \ setlocal shiftwidth=2|
                \ setlocal expandtab |
                \ setlocal autoindent |
                \ setlocal fileformat=unix |
               " \ setlocal textwidth=79
          augroup END
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
          vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
            # see examples below how to use custom packages
            start = [ LanguageClient-neovim vim-nix ];
            opt = [ ];
        	};
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
                  "
                  "key maps 
                  "
                  map <F6> :nohls <CR>
                  "
                  set number
                  set mouse=a
                  augroup vimrc
                  " remove all previously defined autocommands
                    autocmd!
                    "
                    "autocmd VimEnter * NERDTree

                    " set python indentation
                    " and keyremapping see :help key-notation
                    au BufNewFile,BufRead *.py
                        \ setlocal tabstop=4|
                        \ setlocal softtabstop=4|
                        \ setlocal shiftwidth=4|
                        \ setlocal expandtab|
                        \ setlocal shiftround|
                        " \ inoremap = <Space>=<Space>|
                        "\ inoremap , ,<Space>

                    " set html indentation
                    au BufNewFile,BufRead *.html,*.tex,*.sh,*.F90,*.R,*.Rnw,*.hs
                        \ setlocal tabstop=2 |
                        \ setlocal softtabstop=2 |
                        \ setlocal shiftwidth=2|
                        \ setlocal expandtab |
                        \ setlocal autoindent |
                        \ setlocal fileformat=unix |
                       " \ setlocal textwidth=79
                  augroup END
        	  let g:LanguageClient_serverCommands = {
        	   \ 'python': ['pyls']
        	   \ }
        	  let g:LanguageClient_diagnosticsList = "Disabled"
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
          packages.myVimPackage = with pkgs.vimPlugins // customPlugins; {
            # see examples below how to use custom packages
            start = [ LanguageClient-neovim vim-nix nvim-r ];
            opt = [ ];
        	};
        };
      };
      myR = R-with-my-packages; 
    };
  }

