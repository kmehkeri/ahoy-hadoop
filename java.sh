export JAVA_HOME=$(readlink -f /usr/bin/java | sed 's:/bin/java::')
export PATH=${PATH}:${JAVA_HOME}/bin

