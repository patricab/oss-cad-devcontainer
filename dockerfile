FROM archlinux:latest
ENV WORKDIR=/home/vscode

RUN pacman -Sy --noconfirm &&\
pacman -S --needed --noconfirm zsh git python python-pip
RUN pip install click

RUN useradd -m vscode -d ${WORKDIR} &&\
# RUN chsh -s /bin/zsh vscode
passwd -d vscode &&\
printf "vscode ALL=(ALL) ALL" >> /etc/sudoers

WORKDIR ${WORKDIR}
USER vscode

RUN git clone https://github.com/YosysHQ/oss-cad-suite-build &&\
cd ${WORKDIR}/oss-cad-suite-build &&\
./builder.py build --no-update
