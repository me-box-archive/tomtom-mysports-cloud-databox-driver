FROM tatsushid/tinycore:7.2-x86_64
LABEL databox.type="driver"
COPY main.native /home/tc/main.native
ENTRYPOINT ["/home/tc/main.native"]
EXPOSE 80
