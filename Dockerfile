FROM tatsushid/tinycore:7.2-x86_64
COPY main.native /home/tc/main.native
ENTRYPOINT ["/home/tc/main.native"]
