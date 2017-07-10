FROM fedora 
MAINTAINER Samvaran Kashyap (srallaba@redhat.com)
RUN echo "Hello docker!"
RUN dnf update -y
RUN dnf install -y git python-pip
RUN dnf install -y libselinux-python
RUN dnf groupinstall -y "Development Tools"
RUN dnf install -y python-devel 
RUN dnf install -y libffi-devel
RUN dnf install -y redhat-rpm-config
RUN dnf install -y openssl-devel
RUN dnf install -y openssh-server openssh-clients
RUN dnf install -y @virtualization
RUN dnf install -y libvirt-devel
RUN dnf install -y libyaml-devel
RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
RUN pip install requests==2.18.1
RUN git clone -b libvirt_cloudconfig https://github.com/samvarankashyap/linchpin
WORKDIR "/linchpin"
RUN echo "$PWD"
RUN pip install file://$PWD
