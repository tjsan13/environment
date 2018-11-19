# ActiveState specific environment and functions.

### General Configuration ###
function winmnt() {
    # takes one argument: ip of windows box to mount
    local ip=$1
    sshfs build@$ip:/ ~/mnt/windows
}

### Camel configuration ###
export AS_CAMEL_DIR="$HOME/code/activestate/camel"

# Changes the environment perl to the one needed for camel.
function cperl() {
    perlbrew use p5.26.2c
    export PERL5LIB="$AS_CAMEL_DIR/local/lib/perl5:$PERL5LIB"
    export PATH="$PATH:$AS_CAMEL_DIR/local/bin"
}

# Sets AWS environment variables for running camel's setup-builds.pl.
function ckeys() {
    AWS_ACCESS_KEY_ID=$(cat $HOME/.aws-key-id) \
        AWS_SECRET_ACCESS_KEY=$(cat $HOME/.aws-secret-key) \
        GITHUB_TOKEN=$(grep token $HOME/.config/hub | awk '{ print $2; }') \
        "$@"
}


### Kitchen configuration ###

# Changes the environment perl to the one needed for kitchen.
function kperl() {
    perlbrew use p5.26.2k
}

function start-pg-server() {
    /usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start
}
