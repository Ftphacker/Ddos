# Используйте официальный образ httpd (Apache) как базовый
FROM httpd:latest

# Установка пакетов, необходимых для mod_security и mod_evasive
RUN apt-get update && apt-get install -y \
    libapache2-mod-security2 \
    libapache2-mod-evasive \
    python3 \
    python3-pip \
    libapache2-mod-python \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Установка Apache Exporter
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/Lusitaniae/apache_exporter/releases/download/v0.9.0/apache_exporter-0.9.0.linux-amd64.tar.gz
RUN tar -xvf apache_exporter-0.9.0.linux-amd64.tar.gz
RUN mv apache_exporter-0.9.0.linux-amd64/apache_exporter /usr/local/bin/
RUN rm -rf apache_exporter-0.9.0.linux-amd64 apache_exporter-0.9.0.linux-amd64.tar.gz

# Копирование модулей в нужную директорию
RUN cp /usr/lib/apache2/modules/mod_python.so /usr/local/apache2/modules/mod_python.so

RUN useradd -m volod
RUN groupadd volodg

# Создание директории для скрипта и копирование скрипта
RUN mkdir -p /usr/local/apache2/htdocs/apache
COPY www/script.py /usr/local/apache2/htdocs/apache/script.py

# Установка правильного владельца и разрешений для скрипта
RUN chown -R www-data:www-data /usr/local/apache2/htdocs/apache
RUN chown www-data:www-data /usr/local/apache2/htdocs/apache/script.py
RUN chmod -R 777 /usr/local/apache2/htdocs/apache
RUN chmod 777 /usr/local/apache2/htdocs/apache/script.py

# Открытие портов для Apache Exporter и других сервисов
EXPOSE 8000
EXPOSE 5000

# Запуск Apache в фоновом режиме с Apache Exporter
CMD ["sh", "-c", "httpd-foreground & apache_exporter"]
