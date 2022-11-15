FROM archlinux:latest
ENV WORKDIR=/home/vscode

RUN pacman -Sy --noconfirm &&\
pacman -S --needed --noconfirm zsh git python
RUN python -m pip install click

RUN useradd -m vscode -d ${WORKDIR} &&\
# RUN chsh -s /bin/zsh vscode
passwd -d vscode &&\
printf "vscode ALL=(ALL) ALL" >> /etc/sudoers

WORKDIR ${WORKDIR}
USER vscode
