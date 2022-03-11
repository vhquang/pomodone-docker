FROM ubuntu:18.04

RUN apt-get update && \
        apt-get install -y wget unzip \
            gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
            # libgtk2.0-0 libx11-xcb1 libxtst6 libxss1 libgconf-2-4 libnss3

# get your uid and gid on your host machine with `id`
RUN export uid=1000 gid=1000 && \
        mkdir -p /home/developer && \
        echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
        echo "developer:x:${uid}:" >> /etc/group && \
        mkdir /etc/sudoers.d && \
        echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
        chmod 0440 /etc/sudoers.d/developer && \
        chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer

RUN cd /home/developer && \
        wget https://app.pomodoneapp.com/installers/PomoDoneApp-1.5.1545.zip -qO app.zip && \
        unzip app.zip -d app && rm app.zip

ENTRYPOINT ["/home/developer/app/pomodoneapp"]
