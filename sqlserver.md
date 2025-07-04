# comando para verificar la conexion de sql server remoto 

sqlcmd -S sqlserver.cp4hz1vxpeek.us-east-1.rds.amazonaws.com,1433 -U root -P Trampera -Q "SELECT @@VERSION"

# comando para ingresar al sql server remoto 
sqlcmd -S sqlserver.cp4hz1vxpeek.us-east-1.rds.amazonaws.com,1433 -U root -P Trampera


# comando para informacion 

SELECT @@VERSION;
GO

# Comando para listar todas las bases de datos 

SELECT name FROM sys.databases;
GO


# Ovbio !!
USE SQLDelphin
GO

#El comando para generar un archivo .sql con solo el esquema (sin datos) sería:

sqlcmd -S localhost -d SQLDelphin -E -Q "exec sp_help" -o SQLDelphin_schema.sql

#completo con todas la definiciones 

sqlcmd -S localhost -d SQLDelphin -E -Q "SELECT OBJECT_DEFINITION(object_id) AS definition FROM sys.objects WHERE type IN ('U', 'P', 'V', 'TR', 'FN', 'IF', 'TF')" -o SQLDelphin_schema.sql


# CRUD

1. Crear una base de datos:
```sql
CREATE DATABASE EmpresaDB;
GO

USE EmpresaDB;
GO
```

2. Crear una tabla:
```sql
CREATE TABLE Empleados (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Edad INT,
    Departamento VARCHAR(50)
);
GO
```

3. CRUD (Crear, Leer, Actualizar, Eliminar):

   a) Crear (Insertar datos):
   ```sql
   INSERT INTO Empleados (Nombre, Apellido, Edad, Departamento)
   VALUES ('Juan', 'Pérez', 30, 'Ventas');
   GO
   ```

   b) Leer (Seleccionar datos):
   ```sql
   -- Leer todos los registros
   SELECT * FROM Empleados;
   GO

   -- Leer un registro específico
   SELECT * FROM Empleados WHERE ID = 1;
   GO
   ```

   c) Actualizar:
   ```sql
   UPDATE Empleados
   SET Edad = 31
   WHERE ID = 1;
   GO
   ```

   d) Eliminar:
   ```sql
   DELETE FROM Empleados WHERE ID = 1;
   GO
   ```

Recuerda ejecutar cada comando seguido de "GO" en una nueva línea cuando uses sqlcmd.

Para verificar que la tabla se creó correctamente:
```sql
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO
```
#listar todas las tablas de la base de datos:

SELECT name FROM sys.tables WHERE type IN ('U','V')
go
#listar todas las tablas de la base de datos:
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';
Go 


### imprla estructura de la base de datos (es decir, las tablas y sus relaciones) sin los datos, podemos usar
##  un enfoque más simple. Aquí te explico cómo hacerlo:

1. Exportar la estructura de la base de datos local:
```
sqlcmd -S [servidor_local] -d [nombre_base_datos] -U [usuario] -P [contraseña] -Q "SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'" -o "C:\ruta\estructura_tablas.sql"
```
2. Conecta a tu base de datos en Amazon RDS:

```
sqlcmd -S [endpoint_rds] -d [nombre_base_datos] -U [usuario] -P [contraseña]
```

3. Ejecuta el script de creación de tablas en la base de datos de RDS:

```
sqlcmd -S [endpoint_rds] -d [nombre_base_datos] -U [usuario] -P [contraseña] -i "C:\ruta\crear_tablas.sql"
```

Este proceso creará todas las tablas y relaciones en tu base de datos de RDS sin importar ningún dato.

5. Verifica que las tablas se hayan creado correctamente:

```
sqlcmd -S [endpoint_rds] -d [nombre_base_datos] -U [usuario] -P [contraseña] -Q "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"
```

### PROCESO DE CONVERTIR ARCHIVO DE ARCHIVO BAK A .Sql  ###

#1) he virtualizaro el sql server con docker 

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Trampera@@22" -p 1433:1433 --name sql_server_container -d mcr.microsoft.com/mssql/server:2019-latest

#2) Si el contenedor está en ejecución, vamos a crear el directorio necesario dentro del contenedor:
  
   sudo docker exec sql_server_container mkdir -p /var/opt/mssql/backup

#3) copiar los archivos.back al contenedor docker 

  sudo  docker cp /home/inacons/Documentos/dbdelfin/SQLDelphin_blanco.bak  sql_server_container:/var/opt/mssql/backup/
  
#4) comando para verificar si se subio el archivo al contenedor 

sudo docker exec sql_server_container ls /var/opt/mssql/backup/

# ingresar a un terminal docker (para el ejemplo sql server)

 sudo docker exec -it sql_server_container bash


# Comando para entrar el promp de sql server en dokcer virtualizaro

 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P Trampera@@22 -C 

##   --restaurar base de datos (extraer)    ##########

1. Primero, vamos a obtener los nombres lógicos correctos del archivo de backup:

   ```sql
   RESTORE FILELISTONLY 
   FROM DISK = '/var/opt/mssql/backup/SQLDelphin_blanco.bak'
   GO
   ```

2. Este comando te mostrará una lista de los archivos en el backup. Busca en la columna "LogicalName" los nombres correctos para el archivo de datos (.mdf) y el archivo de log (.ldf).

3. Una vez que tengas los nombres correctos, modifica el comando RESTORE de la siguiente manera:

   ```sql
   RESTORE DATABASE SQLDelphin
   FROM DISK = '/var/opt/mssql/backup/SQLDelphin_blanco.bak'
   WITH MOVE 'NombreLogicoMDF' TO '/var/opt/mssql/data/SQLDelphin.mdf',
   MOVE 'NombreLogicoLDF' TO '/var/opt/mssql/data/SQLDelphin_log.ldf'
   GO
   ```

   Reemplaza 'NombreLogicoMDF' y 'NombreLogicoLDF' con los nombres que obtuviste del comando RESTORE FILELISTONLY.

4. Si la base de datos ya existe y quieres sobrescribirla, añade la opción REPLACE:

   ```sql
   RESTORE DATABASE SQLDelphin
   FROM DISK = '/var/opt/mssql/backup/SQLDelphin_blanco.bak'
   WITH REPLACE,
   MOVE 'NombreLogicoMDF' TO '/var/opt/mssql/data/SQLDelphin.mdf',
   MOVE 'NombreLogicoLDF' TO '/var/opt/mssql/data/SQLDelphin_log.ldf'
   GO
   ```

Por favor, ejecuta el RESTORE FILELISTONLY, obtén los nombres lógicos correctos y luego intenta el RESTORE DATABASE con esos nombres. ¿

# el procedimiento del 1 al 4 restaura la base de datos 

# cuando la base datos se restaure saldra un mensaje de suscefull y ejecutar lo siguiente en el prompt 

USE SQLDelphin
GO

# genera un script se sql mas completo con vistas, funciones , triggers ,etc 

:OUT /tmp/Delfin.sql
:OUT /tmp/SQLDelphin_schema.sql
-- Primero las tablas
SELECT 'CREATE TABLE ' + OBJECT_SCHEMA_NAME(o.object_id) + '.' + o.name + ' (' +
    CHAR(13) + CHAR(10) +
    STRING_AGG(
        CAST(c.name + ' ' + 
        CASE WHEN t.name IN ('char', 'varchar', 'nchar', 'nvarchar') 
             THEN t.name + '(' + CAST(c.max_length AS VARCHAR) + ')'
             ELSE t.name 
        END + 
        CASE WHEN c.is_nullable = 1 THEN ' NULL' ELSE ' NOT NULL' END
        AS VARCHAR(MAX)), 
        ',' + CHAR(13) + CHAR(10)
    ) +
    CHAR(13) + CHAR(10) + 
    ');'
FROM sys.objects o
JOIN sys.columns c ON o.object_id = c.object_id
JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE o.type = 'U'
GROUP BY o.object_id, o.name;
GO

-- Luego los demás objetos
SELECT OBJECT_DEFINITION(object_id) as ObjectDefinition
FROM sys.objects 
WHERE type IN ('V','P','FN','TR')
ORDER BY type_desc, name;
GO

#Codigo mejorado 


:OUT /tmp/delfin_schema.sql
-- Primero las tablas y sus columnas principales
SELECT 
    'IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = ''' + o.name + ''')' + CHAR(13) + 
    'CREATE TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(o.name) + ' (' +
    CHAR(13) + CHAR(10) +
    STRING_AGG(
        CAST(
            QUOTENAME(c.name) + ' ' + 
            CASE 
                WHEN t.name IN ('char', 'varchar', 'nchar', 'nvarchar') 
                    THEN t.name + '(' + 
                        CASE 
                            WHEN c.max_length = -1 THEN 'MAX'
                            WHEN t.name IN ('nchar', 'nvarchar') THEN CAST(c.max_length/2 AS VARCHAR)
                            ELSE CAST(c.max_length AS VARCHAR)
                        END + ')'
                WHEN t.name IN ('decimal', 'numeric')
                    THEN t.name + '(' + CAST(c.precision AS VARCHAR) + ',' + CAST(c.scale AS VARCHAR) + ')'
                ELSE t.name 
            END + 
            CASE 
                WHEN c.is_identity = 1 
                    THEN ' IDENTITY(' + CAST(IDENT_SEED(SCHEMA_NAME(schema_id) + '.' + o.name) AS VARCHAR) + ',' + 
                         CAST(IDENT_INCR(SCHEMA_NAME(schema_id) + '.' + o.name) AS VARCHAR) + ')'
                ELSE ''
            END +
            CASE WHEN c.is_nullable = 1 THEN ' NULL' ELSE ' NOT NULL' END
        AS VARCHAR(MAX)), 
        ',' + CHAR(13) + CHAR(10)
    ) +
    CHAR(13) + CHAR(10) + 
    ');' + CHAR(13) + CHAR(10)
FROM sys.objects o
JOIN sys.columns c ON o.object_id = c.object_id
JOIN sys.types t ON c.user_type_id = t.user_type_id
WHERE o.type = 'U'
GROUP BY o.object_id, o.name, o.schema_id;
GO

-- Agregar Primary Keys
SELECT 
    'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(o.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(i.object_id)) + 
    ' ADD CONSTRAINT ' + QUOTENAME(i.name) + ' PRIMARY KEY ' +
    CASE i.type WHEN 1 THEN 'CLUSTERED' ELSE 'NONCLUSTERED' END + 
    ' (' + 
    STRING_AGG(QUOTENAME(c.name), ',') WITHIN GROUP (ORDER BY ic.key_ordinal) +
    ');' + CHAR(13) + CHAR(10)
FROM sys.indexes i
JOIN sys.objects o ON i.object_id = o.object_id
JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE i.is_primary_key = 1
GROUP BY o.schema_id, i.object_id, i.name, i.type;
GO

-- Agregar Foreign Keys
SELECT 
    'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(fk.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.parent_object_id)) +
    ' ADD CONSTRAINT ' + QUOTENAME(fk.name) + 
    ' FOREIGN KEY (' + 
    STRING_AGG(QUOTENAME(pc.name), ',') WITHIN GROUP (ORDER BY fkc.constraint_column_id) +
    ') REFERENCES ' + QUOTENAME(SCHEMA_NAME(refsch.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(fk.referenced_object_id)) + 
    ' (' + 
    STRING_AGG(QUOTENAME(rc.name), ',') WITHIN GROUP (ORDER BY fkc.constraint_column_id) +
    ');' + CHAR(13) + CHAR(10)
FROM sys.foreign_keys fk
JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
JOIN sys.columns pc ON fkc.parent_object_id = pc.object_id AND fkc.parent_column_id = pc.column_id
JOIN sys.columns rc ON fkc.referenced_object_id = rc.object_id AND fkc.referenced_column_id = rc.column_id
JOIN sys.objects refsch ON fk.referenced_object_id = refsch.object_id
GROUP BY fk.schema_id, fk.parent_object_id, fk.referenced_object_id, refsch.schema_id, fk.name;
GO

### 



#Despues fuera del contenedor ejecutar el siguiente comando en el lugar donde se quiere guardar el fichero .sql 

sudo  docker cp sql_server_container:/tmp/SQLDelphin_schema.sql  ./SQLDelphin_schema.sql

                                                                   delfin_schema.sql


sudo  docker cp sql_server_container:/tmp/SQLDelphin_schema.sql  ./delfin_schema.sql

#debe salir este mensaje 


Successfully copied 54.3kB to /home/inacons/Documentos/SQLDelphin_schema.sql

# Despues crear la base de datos en el amazon rds 

sqlcmd -S sqlserver.cp4hz1vxpeek.us-east-1.rds.amazonaws.com,1433 -U root -P Trampera -Q "CREATE DATABASE SQLDelphin"


#Y luego ejecutar el script de importación especificando la base de datos (debes estar en el mismo directorio del schema o colocar la ruta) 

sqlcmd -S sqlserver.cp4hz1vxpeek.us-east-1.rds.amazonaws.com,1433 -U root -P Trampera -d SQLDelphin -i SQLDelphin_schema.sql


#si el archivo salio corrupto hay que revisar el script este comaando solucions


 SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'serie_salida'
ORDER BY 
    ORDINAL_POSITION;

lumes 4 de noviembre 


bito response>
Entiendo, en los contenedores Docker generalmente no se usa sudo. Vamos a ajustar nuestro enfoque. Intentemos lo siguiente:

1. Primero, verifica si tienes permisos para instalar paquetes:

```bash
apt-get update
```

Si esto funciona, intenta instalar net-tools:

```bash
apt-get install -y net-tools
```

2. Si no puedes instalar paquetes, usemos alternativas para verificar el puerto:

```bash
cat /proc/net/tcp | grep :0569
```
(0569 es 1433 en hexadecimal)

3. Intenta conectarte directamente al servidor SQL:

```bash
/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P "Trampera@@22" -Q "SELECT @@VERSION" -C
```

El flag -C al final fuerza la confianza en el certificado del servidor.

4. Verifica la configuración de SQL Server:

```bash
cat /var/opt/mssql/mssql.conf
```

5. Revisa los logs de SQL Server:

```bash
tail -n 50 /var/opt/mssql/log/errorlog
```

6. Intenta reiniciar el servicio de SQL Server (si tienes permisos):

```bash
/opt/mssql/bin/mssql-conf setup
```

Por favor, intenta estos comandos y comparte los resultados. Especialmente me interesa saber:
- Si puedes ver algo relacionado con el puerto 1433 abierto
- Si hay algún error en los logs de SQL Server
- Si puedes conectarte usando el comando sqlcmd con la opción -C

¿Podrías probar estos pasos y decirme qué obtienes?

# To end input please press Ctrl+D. To quit please type quit and Ctrl+D.
bito> 
