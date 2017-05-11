FROM ubuntu

RUN apt-get update
RUN apt-get install -y python-pip golang git
RUN pip install --upgrade --user awscli
ENV GOPATH=/golang
RUN go get -d k8s.io/kops
RUN cd ${GOPATH}/src/k8s.io/kops/
RUN git checkout release
RUN make
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN sudo mv ./kubectl /usr/local/bin/kubectl