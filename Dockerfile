FROM kalilinux/kali-rolling

ENV TTY_VER 1.6.1

RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sLk https://github.com/tsl0922/ttyd/releases/download/${TTY_VER}/ttyd_linux.x86_64 && \
    cp ttyd_linux.x86_64 /usr/local/bin && \
    apt-get purge --auto-remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*

COPY run_ttyd.sh /run_ttyd.sh

RUN chmod 744 /run_ttyd.sh

EXPOSE 80

CMD ["/bin/bash","/run_ttyd.sh"]
