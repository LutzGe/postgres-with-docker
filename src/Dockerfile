FROM postgres:alpine


WORKDIR /app

COPY . /app

# VOLUME [ "/var/run/postgresql:/var/run/postgresql" ]

EXPOSE 80
USER postgres

# creating database
#RUN psql -c "CREATE DATABASE biblioteca_dados OWNER postgres"

# Inserting the specified db 
#RUN psql -d blioteca_dados < copia_bd_biblioteca.sql



