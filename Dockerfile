FROM alpine:latest

MAINTAINER Bigyan Adhikary <bigyan.adhikary@yipl.com.np>

RUN echo "http://dl-5.alpinelinux.org/alpine/v3.4/main/" >> /etc/apk/repositories
RUN apk update
RUN apk add less curl nano asterisk asterisk-curl asterisk-speex asterisk-sample-config asterisk-sounds-en
RUN mkdir /provision

ADD sip_conf /provision/sip_conf
ADD extensions_conf /provision/extensions_conf
ADD ari_conf /provision/ari_conf
#ADD asterisk-provision.sh /provision/asterisk-provision.sh
RUN cat /provision/sip_conf >> /etc/asterisk/sip.conf
RUN cat /provision/extensions_conf >> /etc/asterisk/extensions.conf
RUN cat /provision/ari_conf > /etc/asterisk/ari.conf
#RUN echo "noload => res_pjsip.so" >> /etc/asterisk/modules.conf
RUN sed -i '/;enabled=yes/c\enabled=yes' /etc/asterisk/http.conf
RUN sed -i '/;bindport=8088/c\bindport=8088' /etc/asterisk/http.conf

CMD ["/usr/sbin/asterisk", "-cvvvv"]


