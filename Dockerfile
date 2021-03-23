FROM debian:buster

ENV AUTOINDEX=on
RUN apt-get update && apt-get upgrade -y && apt-get install -y	\
	nginx	\
	php7.3 php7.3-fpm php7.3-mysql php7.3-cli php7.3-common php7.3-json php7.3-xml php7.3-opcache php7.3-readline php7.3-mbstring	\
	mariadb-server	\
	wget git curl vim libnss3-tools
RUN mkdir /var/www/dylews
ADD srcs/* /root/
CMD bash /root/install_all.sh

	# apache2-utils mlocate	\
