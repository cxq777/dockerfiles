FROM jenkins/jenkins:lts-alpine

ENV JENKINS_UC=https://mirrors.tuna.tsinghua.edu.cn/jenkins
ENV JENKINS_UC_DOWNLOAD=$JENKINS_UC

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
# ENV CASC_JENKINS_CONFIG=/var/jenkins_home/jenkins.yaml
