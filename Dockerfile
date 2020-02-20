FROM ubuntu:18.04

EXPOSE 18332

RUN apt-get update

RUN apt-get -y install wget

WORKDIR /usr/src

RUN wget https://github.com/dogecoin/dogecoin/releases/download/v1.14.2/dogecoin-1.14.2-x86_64-linux-gnu.tar.gz
RUN tar -xzvf dogecoin-1.14.2-x86_64-linux-gnu.tar.gz
RUN chmod +x dogecoin-1.14.2/bin/dogecoind dogecoin-1.14.2/bin/dogecoin-cli
RUN ln -s /usr/src/dogecoin-1.14.2/bin/dogecoind /usr/bin/dogecoind
RUN ln -s /usr/src/dogecoin-1.14.2/bin/dogecoin-cli /usr/bin/dogecoin-cli

ADD init-node.sh /tmp
RUN chmod 777 /tmp/init-node.sh

CMD /tmp/init-node.sh
