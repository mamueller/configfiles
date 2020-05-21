assume that
1.) nix is allready installed
2.) we have added a new user test

How do we make the new user aware of the installed nix?

source /etc/profile.d/nix.sh 


This creates a link 
~/.nix-profile
to 
/nix/var/nix/profiles/per-user/test/profile 
which at this moment does not exist.

But when we install our first package e.g. by nix-env -iA nixpkgs.hello

now we put the line:

source /etc/profile.d/nix.sh                                           

into the bashrc to be sourced every time we log in
This will change the path so that we can use nix-env and friends and also some other variables.

# How to create a new profile?
