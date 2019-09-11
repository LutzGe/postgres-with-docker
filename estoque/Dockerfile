FROM postgres:alpine


WORKDIR /app

COPY . /app

# VOLUME [ "/var/run/postgresql:/var/run/postgresql" ]

EXPOSE 81
USER postgres

# creating database
#RUN psql -c "CREATE DATABASE estoque OWNER postgres"

# Inserting the specified db 
#RUN psql -d estoque < copa_base_estoque.sql
