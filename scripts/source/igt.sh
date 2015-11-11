# envrionment variables
export ENG_LAN=10.90.239.
export BOARD=root@$ENG_LAN
export NMS_LAN=10.90.231.
export SERIAL_IP=10.90.231.109

# altera
export ALTERA_VERSION='14.0'
export ALTERAOCLSDKROOT="/opt/altera/${ALTERA_VERSION}/hld"
export QUARTUS_DIR="/opt/altera/${ALTERA_VERSION}/quartus"
export QSYS_ROOTDIR="/opt/altera/${ALTERA_VERSION}/quartus/sopc_builder/bin"
export SOPC_KIT_NIOS2="/opt/altera/${ALTERA_VERSION}/nios2eds"
export QUARTUS_64BIT=1
function enable_altera_tools() {
    export PATH="$PATH\
:$QUARTUS_DIR/bin\
:$SOPC_KIT_NIOS2/bin\
:$SOPC_KIT_NIOS2/bin/gnu/H-x86_64-pc-linux-gnu/bin\
:$SOPC_KIT_NIOS2/sdk2/bin\
:$QSYS_ROOTDIR\
"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$QUARTUS_DIR/linux64"
}

# cmake builds
export VTIDIRECT_DIR="$HOME/Code/vtidirect"
export VTIDIRECT_BUILD_DIR="$VTIDIRECT_DIR/build"
export VTIDIRECT_INSTALL_DIR="$VTIDIRECT_DIR/install"
export VTIDIRECT_DEPS_DIR="$VTIDIRECT_DIR/deps"
function enable_vtidirect_build() {
    export BUILD_DIR="$VTIDIRECT_BUILD_DIR"
    export INSTALL_DIR="$VTIDIRECT_INSTALL_DIR"
    export GENERATOR='Unix Makefiles'
    export LIB="$VTIDIRECT_DEPS_DIR/lib"
    export INCLUDE="$VTIDIRECT_DEPS_DIR/include"
    export PATH="$PATH:$VTIDIRECT_DEPS_DIR/bin"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$VTIDIRECT_DEPS_DIR/lib"
    export PYTHONPATH="$PYTHONPATH:$VTIDIRECT_DIR/source/arts/hUB_art/packages"
}

# gdb
alias arm-gdb='/opt/altera-linux/linaro/bin/arm-linux-gnueabihf-gdb'

# path
export PATH="/opt/altera-linux/linaro/bin:$PATH"

# python (for arts)
export PATH="$PATH:/opt/python-3.2.5/bin"

# ssh's to the 10.90.239.x address where x is provided by the user
# ex. ssh-board 27 = ssh root@10.90.239.27
function ssh-board() {
    ssh ${BOARD}${1}
}

# scp's the specified file to the 10.90.239.x address where x provided the user
# ex. scp-board Release/Mobility 26
function scp-board() {
    echo "$@"
    local files=${@:1:$#-1}
    local ip=${@: -1}
    if [ -z "$files" ]; then
        echo 'Too few arguments.'
        return 1
    fi
    scp $files ${BOARD}${ip}:~
}

# telnet's to 10.90.231.109 100x address where x is provided by the user
# ex. telnet-board 10 = telnet 10.90.231.109 10010
function telnet-board() {
    telnet $SERIAL_IP 100${1}
}

# ssh's to the 10.90.231.x address where x is provided by the user
# ex. ssh-nms 30 = ssh idirect@10.90.231.30
function ssh-nms() {
    ssh idirect@${NMS_LAN}${1}
}

# add my public key to the remote's authorized_keys file enabling
# password-less ssh access.
function authorize-board() {
    ssh ${BOARD}${1} 'chmod g-w /root'
    ssh-copy-id ${BOARD}${1}
}
