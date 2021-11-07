FROM debian:bullseye

EXPOSE 10006/udp
EXPOSE 10015/udp
EXPOSE 10025/udp

WORKDIR /flowgraphs

# Install GNU Radio packages
RUN apt -q update && apt -qy install \
    gnuradio \
    gr-limesdr \
    gr-satellites

COPY flowgraphs/ .

CMD ["gnuradio-companion", "-c", "OreSat0_v1_0.grc;", "python", "OreSat0_v1_0.py"]
