# How to install homemanager
assume that
1.) nix is allready installed
2.) we have added a new user test

How do we make the new user aware of the installed nix?

`source /etc/profile.d/nix.sh` 


This creates a link 
~/.nix-profile
to 
/nix/var/nix/profiles/per-user/test/profile 
which at this moment does not exist.

But when we install our first package e.g. by nix-env -iA nixpkgs.hello the directory is populated

now we put the line:

`source /etc/profile.d/nix.sh`                                           

into the bashrc to be sourced every time we log in
This will change the path so that we can use nix-env and friends and also some other variables.

since all the nix tools are now in the patch we can use them 
from here on we follow the description on
`https://rycee.gitlab.io/home-manager/index.html#sec-install-standalone`


nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update

To make the channel available we say:
`export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH`

Then we can install the home-manager
`nix-shell '<home-manager>' -A install`


# How to create a new profile?
