FROM centos:7

RUN yum install -y wget openssh-server openssh-clients  vim which net-tools
WORKDIR /opt
RUN wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN tar -xf openjdk-11.0.2_linux-x64_bin.tar.gz
RUN mv  jdk-11.0.2 jdk
ENV JAVA_HOME=/opt/jdk
ENV PATH="${PATH}:${JAVA_HOME}/bin:${JAVA_HOME}/sbin"

RUN yum -y  install openssh-server openssh-clients
RUN yum -y  install vim which net-tools

#generate key files
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''

# login localhost without password
RUN ssh-keygen -f /root/.ssh/id_rsa -N ''
RUN touch /root/.ssh/authorized_keys
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

# set password of root
RUN echo "root:123456" | chpasswd

# open the port 22
EXPOSE 22
# when start a container it will be executed
CMD ["/usr/sbin/sshd","-D"]