FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y curl git-all openssh-server 
ADD .bashrc /root/.bashrc

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
RUN . /root/.bashrc;nvm install 4.3.1;nvm use 4.3.1;npm install pm2 -g;pm2 startup ubuntu;npm install my-deploy -g

RUN mkdir /var/run/sshd
RUN echo 'root:myssh' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
EXPOSE 80

ADD ./Startup.sh ./Startup.sh
CMD /bin/bash ./Startup.sh && /usr/sbin/sshd -D
