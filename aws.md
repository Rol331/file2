#Descargar amazon cli  

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

#Descomprimir 

unzip awscliv2.zip

#Instalar

sudo snap install aws-cli --classic
sudo certbot --nginx -d 34.238.249.153.nip.io --non-interactive --agree-tos --email rramos@inacons.com.pe

## configurar amazon par un docker 

aws ecr create-repository --repository-name operacion-backend --region us-east-1 

### comando para acceder amazon aws por ssh #####


ssh -i operacion-backend-key.pem ubuntu@34.230.91.121


sudo vim nginx-basic.conf

#### Direccion 

cd /opt/operacion-backend

### Verificar el estado de todos los contenedores :

docker-compose ps 

##  Verificar logs de nginx 

docker-compose logs nginx 

## Probar nginx desde dentro del contenedor 

docker exec operacion-nginx nginx -t

## Verificar que nginx pueda resolver el nombre del contenedor backen

docker exec operacion-nginx ping operacion-backend

## Probar la conectividad al puerto 8080

docker exec operacion-nginx curl http://operacion-backend:8080/

## probar aplicacion desde el host :

curl http://localhost/health
curl http://localhost/graphql

# Obtener la IP pública de tu EC2
curl http://[IP_PUBLICA_DE_TU_EC2]/health 

# probar los puertos 

# Verificar que los puertos estén abiertos
sudo netstat -tlnp | grep :80
sudo netstat -tlnp | grep :8080

# Verificar que Docker esté escuchando en los puertos correctos
docker port operacion-nginx
docker port operacion-backend


###### ingresar a docker comando ##

docker exec -it operacion-nginx sh

##### servicio de dominio gratis ( se loguea con git) ####

https://www.duckdns.org/domains

#### ip publica ####


sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=PE/ST=Lima/L=Lima/O=TuEmpresa/CN=34.230.91.121"



sudo tee /usr/local/bin/update-duckdns <<EOF
#!/bin/bash
TOKEN="e7538275-288c-47a5-bff7-b35e450be5c3"
DOMAIN="kapo-operaciones"
IP=\$(curl -s ifconfig.me)
wget -qO- "https://www.duckdns.org/update?domains=\$DOMAIN&token=\$TOKEN&ip=\$IP"
EOF


sudo certbot --nginx -d kapo-operaciones.duckdns.org --non-interactive --agree-tos --email rramos@nufago.com

Opción 3: Freenom (Dominio completo gratuito por 1 año)
Paso 1: Crear cuenta en Freenom
Ve a https://www.freenom.com/
Busca un dominio gratuito (.tk, .ml, .ga, .cf, .gq)
Regístralo gratuitamente
