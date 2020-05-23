# This file has to be linked to ~/.config/nixpkgs/home.nix
# and home-manager has to be installed as described in 
# https://rycee.gitlab.io/home-manager/index.html#sec-install-standalone
# and activated in your profile 
# export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
{ config, pkgs, ... }:
let vimrcstr= ''
    syntax enable
    set number
    set mouse=a 
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
  ''; in {
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "20.03";
    home.packages= [
      (pkgs.python3.withPackages(ps: [
      ps.python-language-server
      # the following plugins are optional, they provide type checking, import sorting and code formatting
      ps.pyls-mypy ps.pyls-isort ps.pyls-black
      ]))
    ];
    #programs.vim = {
    #  enable = true;
    #  plugins =  [ 
    #    pkgs.vimPlugins.LanguageClient-neovim 
    #    pkgs.vimPlugins.vim-nix 
    #  ];
    #  settings = { ignorecase = true; };
    #  extraConfig = vimrcstr; 
    #};  
    programs.neovim = {
      enable = true;
        configure = {
          # here your custom configuration goes!
          customRC = vimrcstr;
          packages.myVimPackage = with pkgs.vimPlugins; {
            # see examples below how to use custom packages
            start = [ LanguageClient-neovim vim-nix ];
            opt = [ ];
          };      
        };
    };  
    programs.neovim.extraPython3Packages = (ps: [
      ps.python-language-server
      # the following plugins are optional, they provide type checking, import sorting and code formatting
      ps.pyls-mypy ps.pyls-isort ps.pyls-black
    ]);
}
