# envrionment variables
export ENG_LAN=10.90.239.
export SERIAL_IP=10.90.231.109
export BOARD=root@$ENG_LAN

# altera
export ALTERAOCLSDKROOT="/opt/altera/hld"
export QSYS_ROOTDIR="/opt/altera/quartus/sopc_builder/bin"

# path
export PATH="/opt/altera-linux/linaro/bin:$PATH"

# ssh's to the 10.90.239.x address where x is provided by the user
# ex. ssh-board 27 = ssh root@10.90.239.27
function ssh-board() {
    ssh ${BOARD}${1}
}

# telnet's to 10.90.231.109 100x address where x is provided by the user
# ex. telnet-board 10 = telnet 10.90.231.109 10010
function telnet-board() {
    telnet $SERIAL_IP 100${1}
}
