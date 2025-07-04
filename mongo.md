#consula recurrente para actualizar 

db.transferencia_detalle.updateOne(
  { _id: ObjectId('677c0bc15d1b1004fff9eee3') },
  {
    $set: {
      tipo: 'RECEPCION_TRANSFERENCIA',
      referencia: 'Recepción de transferencia - Salida de Almacen - TRA-20250106-974'
    }
  }
);

# Consulta para eliminar en la fechas 

```javascript
// 1. Primero obtenemos los IDs de las transferencias
var transferenciasIds = db.transferencia.find({
    fecha: {
        $gte: ISODate("2025-01-07T00:00:00.000Z"),
        $lt: ISODate("2025-01-09T00:00:00.000Z")
    }
}).toArray();

// 2. Obtenemos los IDs de los detalles
var detalleIds = db.transferencia_detalle.find({
    transferencia_id: { 
        $in: transferenciasIds.map(function(t) { return t._id; })
    }
}).toArray();

// 3. Eliminamos los registros en orden (de hijo a padre)

// 3.1 Eliminamos primero transferencia_recurso
db.transferencia_recurso.deleteMany({
    transferencia_detalle_id: { 
        $in: detalleIds.map(function(d) { return d._id; })
    }
});

// 3.2 Eliminamos transferencia_detalle
db.transferencia_detalle.deleteMany({
    transferencia_id: { 
        $in: transferenciasIds.map(function(t) { return t._id; })
    }
});

// 3.3 Finalmente eliminamos las transferencias
db.transferencia.deleteMany({
    fecha: {
        $gte: ISODate("2025-01-07T00:00:00.000Z"),
        $lt: ISODate("2025-01-09T00:00:00.000Z")
    }
});

// Para verificar el resultado, puedes usar:
print("Documentos eliminados correctamente");
```

Este código:
1. Obtiene primero todos los IDs necesarios
2. Elimina los registros en el orden correcto para mantener la integridad referencial
3. Usa el mismo enfoque que funcionó para transferencia_recurso en todas las eliminaciones

Puedes ejecutar estos comandos uno por uno en la terminal de MongoDB para asegurarte de que cada paso se complete correctamente.

### Pasos para ejecutar mongo en local terminal

sudo apt update && sudo apt install -y gnupg curl

# Importar la clave GPG pública de MongoDB
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
   sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt update
sudo apt install -y mongodb-org

sudo systemctl start mongod
sudo systemctl enable mongod

# Comprobar el estado del servicio
sudo systemctl status mongod

# Comprobar la versión
mongod --version

###### Conectarse al shell de MongoDB #######
mongosh

## comandos utiles 

# Iniciar MongoDB
sudo systemctl start mongod

# Detener MongoDB
sudo systemctl stop mongod

# Reiniciar MongoDB
sudo systemctl restart mongod

# Ver logs
sudo journalctl -u mongod
   
### correr en local 

primero hacer el backup con el siguiente comando  pasarlo local 

```
mongorestore --host=localhost --port=27017 --db=inacons /home/inacons/proyecto/backup/feb-2025/inacons
```
 
  *** consulta para listar colleccines con like 
  
```  
db.getCollectionNames().filter(c => c.includes('pago'))
db.getCollectionNames().filter(c => /pago/i.test(c))
db.getCollectionNames().filter(c => /comprobante/i.test(c))
```
########  comando para subir  backup mongo a atlas ##################

mongorestore --uri="mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons?retryWrites=true&w=majority" /home/inacons/proyecto/backup/marzo2025/inacons

####### comando para ingrear por remot cli mongo atlas ##############

mongosh "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons?retryWrites=true&w=majority"
mongosh "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_new?retryWrites=true&w=majority"
mongosh "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_velimaq?retryWrites=true&w=majority"


######## cadena de conexion para backend ##############

DATABASE_URL_DEV=mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_new?retryWrites=true&w=majority
########### Comando para subir , data por tablas ###############3

mongoimport --uri="mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons?retryWrites=true&w=majority" --collection=recursos --file=aura.json --jsonArray
mongoimport --uri "mongodb+srv://rramos:MPqGnZEugJRD7imC@cluster0.xinqt.mongodb.net/inacons?retryWrites=true&w=majority" --collection obra_bodega_recursos --file ./obra_bodega_recursos.json --jsonArray


########### comando para crear nueva base de datos y verificar su existencias 

mongosh "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_new?retryWrites=true&w=majority" --eval "db.version()"

################# comamdo para subir el bakcup completa de la base de datos a la nueva base de datos (crea con toda la base de datos no es necesario crear antes)  ###############333

mongorestore --uri "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_new?retryWrites=true&w=majority" /home/inacons/proyecto/backup/2025-04-29/inacons
### produccion 
mongorestore --uri "mongodb+srv://rramos:U064QlTWNgCmZeZr@cluster0.xinqt.mongodb.net/puchemon?retryWrites=true&w=majority" /home/inacons/proyecto/backup/2025-06-25/inacons


################### Comando para resturar bakup en local ############################
mongorestore --db mi_base_de_datos ./inacons
 
mongorestore --db samuel ./inacons

mongorestore --db Alexander ./inacons
###############listar todos los valores de un campo ##############3

	db.transferencia_detalle.distinct('tipo')

#################### Crear indices para acelerar consultas ##############


// Índices para transferencia_detalle
db.transferencia_detalle.createIndex({ "_id": 1 });

// Índices para transferencia_recurso
db.transferencia_recurso.createIndex({ "transferencia_detalle_id": 1 });
db.transferencia_recurso.createIndex({ "obra_bodega_id": 1 });
db.transferencia_recurso.createIndex({ "recurso_id": 1 });

// Índices para obra_bodega
db.obra_bodega.createIndex({ "_id": 1 });

// Índices para obra_bodega_recursos
db.obra_bodega_recursos.createIndex({ 
  "obra_bodega_id": 1, 
  "recurso_id": 1 
});
db.obra_bodega_recursos.createIndex({ "_id": 1 });

######################### verificar indices ###########################

// Ver índices en transferencia_detalle
db.transferencia_detalle.getIndexes()

// Ver índices en transferencia_recurso
db.transferencia_recurso.getIndexes()

// Ver índices en obra_bodega
db.obra_bodega.getIndexes()

// Ver índices en obra_bodega_recursos
db.obra_bodega_recursos.getIndexes()

################################## exportar data directamen en json (cambia la contraseña) ###############################3

# Obtener lista de colecciones
collections=$(mongosh "mongodb+srv://rramos:MPqGnZEugJRD7imC@cluster0.xinqt.mongodb.net/inacons" --quiet --eval "db.getCollectionNames().join(' ')")

# Exportar cada una
for collection in $collections; do
    echo "Exportando: $collection"
    mongoexport --uri "mongodb+srv://rramos:MPqGnZEugJRD7imC@cluster0.xinqt.mongodb.net/inacons" --collection="$collection" --out "/home/inacons/proyecto/db/${collection}.json"
done


///////////////////////Trama ejemplo data ///////////////////////////////7



// Actualizar el primer documento                                                                                                                                                                                   
db.tu_coleccion.updateOne(                                                                                                                                                                                          
  { _id: ObjectId("674731745f130d366d7aa291") },                                                                                                                                                                    
  { $set: { entidad: "67f93983a6204fb72f4d0b4f" } }                                                                                                                                                                          
);                                                             
                               
// Actualizar el segundo documento                                                                                                                             
db.tu_coleccion.updateOne(                                     
  { _id: ObjectId("6750d90805bfba1b6018147a") },                                                                                                               
  { $set: { entidad: "67f95132ad6f9306c015032c" } }                                     
);                                                                             
                                       
///////////////////////////////////////////////

db.archivos_sustentos.updateOne(
{_id: ObjectId("67c72c0da3c0e86c3f0652da")},
{
  $set: {referencia_id:Object("67ea9f21b2c2f58fc89f3820")},
  $set: {tipo: 'cotizacion'}
	
}
	
);

db.archivos_sustento.updateOne(
  { _id: ObjectId("67c72c0da3c0e86c3f0652da") },
  {
    $set: {
      referencia_id: ObjectId("67ea9f21b2c2f58fc89f3820"),
      tipo: 'cotizacion'
    }
  }
);


db.requerimiento_aprobacion.updateOne(
  { _id: ObjectId("6827bd9e15acc875555e9e0c") },
  {
    $set: {
      referencia_id: ObjectId("67ea9f21b2c2f58fc89f3820"),
      usuario_id: ObjectId('67859e2872e2828e8f067e6d')  
        }
  }
);




////////////////////// insertar data //////////////////


db.obra_bodega_recursos.insertOne({
  obra_bodega_id: ObjectId('67dc311ca8ffaa74eee63998'), // Cambia este valor según sea necesario
  recurso_id: ObjectId('67bdde2d778692dd75bf0381'), // Cambia este valor según sea necesario
  cantidad: 20, // Cambia este valor según sea necesario
  costo: 2, // Cambia este valor según sea necesario
  estado: 'NUEVO', // Cambia este valor según sea necesario


db.requerimiento.updateOne(
{_id: ObjectId("681be9056db10a68b64a740f")},
{
  $set: {empresa_id: '679d06f3f1365dbcf09cd153'}
	
}
	
);



db.cotizacion.find({  codigo_cotizacion: '216'})
db.cotizacion.find({  codigo_cotizacion: '193'})


db.cotizacion_recursos.find({ cotizacion_id: ObjectId('681d229183389c47886506e4')})

db.cotizacion_proveedores.find({ cotizacion_id: ObjectId('681d229183389c47886506e4')})

db.cotizacion_proveedores_recurso.find({ cotizacion_proveedor_id: ObjectId('681d22b683389c478865092f')})


db.solicitud_compra_cotizacion.find({ cotizacion_id: ObjectId('681c0c616db10a68b64abd6a')})

db.solicitud_compra.find({ _id: ObjectId('681b912aad7a4c7a23f6e7ed')})

db.solicitud_compra.find({ _id: ObjectId('681b9140ad7a4c7a23f6e83d')})



 estado: 'PENDIENTE',
}


db.solicitud_compra.update(
{_id: ObjectId("681be9056db10a68b64a740f")},
{
  $set: { estado: 'PENDIENTE'  }
	
}
	
);


db.solicitud_compra.updateOne(
  { _id: ObjectId("682347fa8d5f5d20170777c3") },
  {
    $set: { estado: 'PENDIENTE' }
  }
);


db.requerimiento.updateOne(
  { _id: ObjectId("6823b459f6e343c77cc92241") },
  {
    $set: {  empresa_id: '679d06f3f1365dbcf09cd153' }
  }
);


db.requerimiento.updateOne(
  { _id: ObjectId("6818f0b25c3cd5cf99026860") },
  {
    $set: {  empresa_id: '680ac2fd910e4f9bfaccc4bd' }
  }
);

db.orden_pago.updateOne(
  { _id: ObjectId("6824043af6e343c77cce17ed") },
  {
    $set: {  tipo_moneda: ObjectId('679bbb9b46ff10eb05a34fdf') }
  }
);


db.requerimiento.updateOne(
  { _id: ObjectId("680981ad6e52007b91099360") },
  {
    $set: {  tipo_moneda: ObjectId('679bbb9b46ff10eb05a34fdf') }
  }
);

db.orden_compra_recurso.updateOne(
  { _id: ObjectId("682e16d2364edfe7418b0f42") },
  {
    $set: {  costo_aproximado: 400}
  }
);



db.usuario.find({ dni :'73891674'})

mongosh "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_velimaq?retryWrites=true&w=majority" --eval "db.version()"
mongorestore --uri "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_velimaq?retryWrites=true&w=majority" /home/inacons/proyecto/backup/2025-05-14/inacons

mongorestore --uri "mongodb+srv://rolandoramos2013:2BE9k3fVdQGWS3c5@cluster0.7r1n9nb.mongodb.net/inacons_velimaq?retryWrites=true&w=majority" /inacons


db.orden_compra_recurso.updateOne(
  { _id: ObjectId("6830f8fa94a7dcefe6ffac1c") },
  {
    $set: {  proveedor_medio_pago_id: ObjectId('6830fdc694a7dcefe600325b') }
  }
);


db.orden_compra_recurso.updateOne(
  { _id: ObjectId("6830f8fa94a7dcefe6ffac1c") },
  {
    $set: { proveedor_medio_pago_id: ObjectId('6830fdc694a7dcefe600325b') }
  }
);


////////////////////////


 {
    _id: ObjectId('681007e1fd49403f5fa53c1c'),
    titulo: 'CU-GOL',
    nombre: 'CU-GOL EJECUCIÓN DE OBRAS CIVILES GENERALES Y COMPLEMENTARIAS EN LA HABILIACIÓN URBANA GOLF DE SANTA CLARA-ATE ',
    descripcion: 'RESERVORIO, POZO, LINEAS SANITARIAS ',
    ubicacion: 'GOLF ATE SANTA CLARA ',
    direccion: 'ATE ',
    estado: 'ACTIVO',
    tipo_id: ObjectId('67db24c1849643e104c4d3e2'),
    empresa_id: ObjectId('67b0c00e1f4f9ce9cb09ae4e'),
    id_proyecto: 'PRY0000000014',
    __v: 0
  },


 {
    _id: ObjectId('6810e01ef87a8486163b713b'),
    titulo: 'CU-PLAN3',
    nombre: 'CU-PLAN3 HABILITACION URBANA LA PLANICIE 4B',
    descripcion: 'Obra existente ',
    ubicacion: '-11.823467996331752, -77.07615185607688',
    direccion: 'LA PLANICIE - CARABAYLLO - LIMA',
    estado: 'ACTIVO',
    tipo_id: ObjectId('678827c1d1d35ae00c11ff1b'),
    empresa_id: ObjectId('67b0c00e1f4f9ce9cb09ae4e'),
    id_proyecto: 'PRY0000000017',
    __v: 0
  },



 db.obra.find({ titulo: { $regex: /plan/i}})

db.obra_bodega.find({  obra_id: ObjectId('6810e01ef87a8486163b713b'), main: true  })

////////// cursor //// 

tmux select-pane -t 1; \
tmux send-keys 'cd ${BASE_DIR}/files/apli' C-m; \
tmux send-keys 'export CURSOR_DISABLE_UPDATE=true && export CURSOR_DISABLE_TELEMETRY=true && ./Cursor-1.1.3-x86_64.AppImage --no-sandbox --disable-updates --disable-background-update' C-m; \


680b9ff5910e4f9bfacce2c3
----------------------------------------------------------

ambios no rastreados para el commit:
  (usa "git add <archivo>..." para actualizar lo que será confirmado)
  (usa "git restore <archivo>..." para descartar los cambios en el directorio de trabajo)
        modificados:     src/Graphql/schemas/OrdenCompra.graphql
        modificados:     src/Graphql/schemas/PagoCompraComprobante.graphql
        modificados:     src/Graphql/services/OrdenCompraService.ts
        modificados:     src/Graphql/services/PagoCompraComprobanteService.ts

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que será confirmado)
        src/Graphql/models/AprobacionComprobanteServicio.ts
        src/Graphql/resolvers/AprobacionComprobanteServicioResolver.ts
        src/Graphql/schemas/aprobacionComprobanteServicio.graphql
        src/Graphql/services/AprobacionComprobanteServicioService.ts

sin cambios agregados al commit (usa "git add" y/o "git commit -a")


