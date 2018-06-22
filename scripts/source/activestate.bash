# ActiveState specific environment and functions.


## Camel configuration ##
export AS_CAMEL_DIR="$HOME/code/activestate/camel"

# Changes the environment perl to the one needed for camel.
function cperl() {
    perlbrew use p5.26.2c
    export PERL5LIB="$AS_CAMEL_DIR/local/lib/perl5:$PERL5LIB"
    export PATH="$PATH:$AS_CAMEL_DIR/local/bin"
}

# Sets AWS environment variables for running camel's setup-builds.pl.
function ckeys() {
    AWS_ACCESS_KEY_ID=$(cat $HOME/.aws-key-id) AWS_SECRET_ACCESS_KEY=$(cat $HOME/.aws-secret-key) $*
}


## Kitchen configuration ##

# Changes the environment perl to the one needed for kitchen.
function kperl() {
    perlbrew use perl-5.26.2-kitchen
}

