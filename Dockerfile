FROM fedora 
MAINTAINER Samvaran Kashyap (srallaba@redhat.com)
#RUN echo "Hello docker!"
RUN dnf update -y
RUN dnf install -y git python-pip \
                       libselinux-python \
                       python-devel \
                       libffi-devel \
                       redhat-rpm-config \
                       openssl-devel \
                       openssh-server \
                       openssh-clients \
                       libyaml-devel
RUN dnf groupinstall -y "Development Tools"
RUN dnf install -y @virtualization
RUN dnf install -y libvirt-devel
RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
RUN printf "Host *\n    StrictHostKeyChecking no" > /root/.ssh/config
RUN pip install requests==2.18.1
RUN git clone -b libvirt_cloudconfig https://github.com/samvarankashyap/linchpin
WORKDIR "/linchpin"
RUN echo "$PWD"
RUN pip install file://$PWD
