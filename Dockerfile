FROM ubuntu

RUN apt-get update
RUN apt-get install -y python-pip golang git curl jq uuid-runtime vim
RUN pip install --upgrade awscli
ENV GOPATH=/golang
RUN curl -LO `curl -s https://api.github.com/repos/kubernetes/kops/releases|grep browser_download_url|grep linux| head -n 1 | cut -d '"' -f 4`
RUN chmod +x ./kops-linux-amd64
RUN mv ./kops-linux-amd64 /usr/local/bin/kops
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl