# ActiveState specific environment and functions.


### Commmon ###
export AS_ROOT="$HOME/code/activestate"


### Camel configuration ###

# Changes the environment perl to the one needed for camel.
function cperl() {
    perlbrew use perl-5.26.2
    export PERL5LIB="$AS_ROOT/camel/local/lib/perl5:$PERL5LIB"
    export PATH="$PATH:$AS_ROOT/camel/local/bin"
}

# Sets AWS environment variables for running camel's setup-builds.pl.
function ckeys() {
    AWS_ACCESS_KEY_ID=$(cat $HOME/.aws-key-id) AWS_SECRET_ACCESS_KEY=$(cat $HOME/.aws-secret-key) $*
}


### Kitchen configuration ###


