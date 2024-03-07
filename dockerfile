FROM ubuntu:24.04
RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& apt-get install -y \
sudo \
nano \
wget \
curl \
git
RUN useradd -G sudo -m -d /home/BRUKER -s /bin/bash -p "$(openssl passwd -1 1234)" hannahtk04
USER hannahtk04
WORKDIR /home/hannahtk04
RUN mkdir hacking \
 && cd hacking \
 && curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh > pawned.sh \
 && chmod 764 pawned.sh \
 && cd ..
RUN git config --global user.email "hannahtorstveitklavenes@gmail.com"\
 && git config --global user.name "Hannahtk04" \
 && git config --global url."https://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:@github.com/".insteadOf"https://github.com" \
 && mkdir -p github.com/GITHUB-hannahtk04
USER root
RUN curl -SL https://go.dev/dl/go1.21.7.linux-arm64.tar.gz \
 | tar xvz -C /usr/local
USER hannahtk04
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/hannahtk04/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"
