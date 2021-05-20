FROM dorowu/ubuntu-desktop-lxde-vnc:focal
# EXPOSE 8555
EXPOSE 8444
EXPOSE 8484
EXPOSE 80
ENV KEYS="generate"
ENV PLOTS_DIR="/plots"
ENV USER="chia"
ENV HTTP_PASSWORD="chiapass"
ENV PASSWORD="chiapass123"
ARG BRANCH
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y git lsb-release
RUN echo "cloning $BRANCH"
WORKDIR /
RUN git clone --branch $BRANCH https://github.com/Chia-Network/chia-blockchain.git
WORKDIR /chia-blockchain
ADD ./baseSetup.sh baseSetup.sh
ADD ./plotng plotng
ADD ./config.json config.json
RUN git submodule update --init mozilla-ca \
&& chmod +x install.sh \
&& sh ./install.sh
RUN mkdir /plots
RUN chmod +x baseSetup.sh && ./baseSetup.sh 
ADD ./entrypoint.sh entrypoint.sh
ADD ./chia-gui.desktop /usr/share/applications/chia-gui.desktop
ADD ./chia-monitor.desktop /usr/share/applications/chia-monitor.desktop
ADD ./chia-local-plotter.desktop /usr/share/applications/chia-local-plotter.desktop
ADD ./runGUI.sh runGUI.sh
ADD ./runPlotMonitor.sh runPlotMonitor.sh
ADD ./runPlotter.sh runPlotter.sh
ADD ./chiaSetup.sh chiaSetup.sh
RUN chmod +x ./runGUI.sh && chmod +x ./runPlotMonitor.sh && chmod +x ./runPlotter.sh && chmod +x ./chiaSetup.sh
ENTRYPOINT ["./entrypoint.sh"]
