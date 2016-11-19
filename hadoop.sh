# Hadoop user
echo "*** HADOOP USER ***"
useradd -m hadoop
SSH_DIR=/home/hadoop/.ssh
mkdir -p ${SSH_DIR}
cp /vagrant/{config,id_rsa,id_rsa.pub} ${SSH_DIR}/
cat ${SSH_DIR}/id_rsa.pub >>${SSH_DIR}/authorized_keys
chown -R hadoop:hadoop ${SSH_DIR}

