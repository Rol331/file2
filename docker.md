# listar contenedores 
 sudo docker ps

# crear contenedor por ejemplo sql server 

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Trampera@@22" -p 1433:1433 --name sql_server_container -d mcr.microsoft.com/mssql/server:2019-latest

#Explicación de los parámetros:

- `-e "ACCEPT_EULA=Y"`: Acepta el acuerdo de licencia de usuario final.
- `-e "SA_PASSWORD=TuContraseñaSegura123!"`: Establece la contraseña del usuario SA. Asegúrate de cambiar "TuContraseñaSegura123!" por una contraseña segura.
- `-p 1433:1433`: Mapea el puerto 1433 del contenedor al puerto 1433 de tu máquina host.
- `--name sql_server_container`: Asigna un nombre al contenedor.
- `-d`: Ejecuta el contenedor en segundo plano.
- `mcr.microsoft.com/mssql/server:2019-latest`: Usa la imagen más reciente de SQL Server 2019.


# Para ver los logs y asegurarte de que SQL Server se inició correctamente, usa:

   docker logs sql_server_container

# ingresar a un terminal docker (para el ejemplo sql server)

 sudo docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Trampera@@22
 sudo docker exec -it sql_server_container bash
 

# Comando para entrar el promp de sql server en dokcer virtualizaro

 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P Trampera@@22 -C 


# Comandos para inciar un contenedor 

docker start sql_server_container
