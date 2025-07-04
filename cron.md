mkdir -p ~/scripts
nano ~/scripts/mongodb_backup.sh


#!/bin/bash

# Configuración
BACKUP_DIR="/home/inacons/mongodb_backups"
DATE=$(date +%Y-%m-%d)
BACKUP_PATH="$BACKUP_DIR/$DATE"
MONGODB_URI="mongodb+srv://rramos:MPqGnZEugJRD7imC@cluster0.xinqt.mongodb.net/inacons"

# Crear directorio de backup si no existe
mkdir -p $BACKUP_DIR

# Crear backup
mongodump --uri "$MONGODB_URI" --out $BACKUP_PATH

# Comprimir el backup
tar -czf "$BACKUP_PATH.tar.gz" $BACKUP_PATH

# Eliminar el directorio sin comprimir
rm -rf $BACKUP_PATH

# Eliminar backups más antiguos de 30 días
find $BACKUP_DIR -name "*.tar.gz" -mtime +30 -delete

# Registrar el backup
echo "Backup completado: $DATE" >> $BACKUP_DIR/backup.log



chmod +x ~/scripts/mongodb_backup.sh

#Configura el crontab para ejecutar cada 15 días:

crontab -e

#Agrega esta línea al crontab (se ejecutará a las 2 AM cada 15 días):

0 2 */15 * * /home/inacons/scripts/mongodb_backup.sh

El script hace lo siguiente:
Crea un directorio para los backups si no existe
Genera un backup con la fecha actual
Comprime el backup en un archivo .tar.gz
Elimina el directorio sin comprimir
Elimina backups más antiguos de 30 días
Registra la ejecución en un archivo de log

#Para verificar que el crontab se configuró correctamente:

crontab -l


#Si en el futuro quieres cambiar el editor por defecto, puedes usar:

select-editor
########## probar el script manualmente 
 
~/scripts/mongodb_backup.sh 



db.requerimiento.find({ codigo: '000295'})


db.requerimiento.updateOne(
  { codigo: '000295' }, // Filtro para encontrar el documento
  { $set: { obra_id: '681525b5af28062bf0dcb290' } } // Campo y valor a actualizar
)


db.cotizacion.updateOne(
  { codigo_cotizacion: '280' }, // Filtro para encontrar el documento
  { $set: { obra_id: '681525b5af28062bf0dcb290' } } // Campo y valor a actualizar
)




/////////////////////////////data ////////////////////////


onst findAll = async () => {
  try {
    const ordenes = await OrdenCompra.aggregate([
      {
        $lookup: {
          from: "cotizacion",
          localField: "cotizacion_id",
          foreignField: "_id",
          as: "cotizacion",
        },
      },
      {
        $unwind: "$cotizacion",
      },
      {
        $lookup: {
          from: "usuario",
          localField: "cotizacion.usuario_id",
          foreignField: "_id",
          as: "usuario",
        },
      },
      {
        $unwind: {
          path: "$usuario",
          preserveNullAndEmptyArrays: true,
        },
      },
      {
        $lookup: {
          from: "solicitud_compra_cotizacion",
          let: { cotizacionId: "$cotizacion._id" },
          pipeline: [
            {
              $match: {
                $expr: { $eq: ["$cotizacion_id", "$$cotizacionId"] },
              },
            }
          ],
          as: "solicitud_compra_cotizacion",
        },
      },
      {
        $unwind: {
          path: "$solicitud_compra_cotizacion",
          preserveNullAndEmptyArrays: true,
        },
      },
      {
        $lookup: {
          from: "solicitud_compra",
          let: { solicitudId: "$solicitud_compra_cotizacion.solicitud_compra_id" },
          pipeline: [
            {
              $match: {
                $expr: { $eq: ["$_id", { $toObjectId: "$$solicitudId" }] },
              },
            }
          ],
          as: "solicitud_compra",
        },
      },
      {
        $unwind: {
          path: "$solicitud_compra",
          preserveNullAndEmptyArrays: true,
        },
      },
      {
        $lookup: {
          from: "requerimiento",
          let: { reqId: "$solicitud_compra.requerimiento_id" },
          pipeline: [
            {
              $match: {
                $expr: { $eq: ["$_id", { $toObjectId: "$$reqId" }] },
              },
            }
          ],
          as: "requerimiento",
        },
      },
      {
        $unwind: {
          path: "$requerimiento",
          preserveNullAndEmptyArrays: true,
        },
      },
      {
        $group: {
          _id: "$_id",
          codigo_orden: { $first: "$codigo_orden" },
          estado: { $first: "$estado" },
          descripcion: { $first: "$descripcion" },
          fecha_ini: { $first: "$fecha_ini" },
          fecha_fin: { $first: "$fecha_fin" },
          tipo: { $first: "$tipo" },
          cotizacion: { $first: "$cotizacion" },
          usuario: { $first: "$usuario" },
          requerimientos: {
            $push: {
              obra_id: "$requerimiento.obra_id",
              req_usuario_id: "$requerimiento.usuario_id",
              codigo_rq: "$requerimiento.codigo"
            }
          }
        }
      },
      {
        $project: {
          id: "$_id",
          codigo_orden: 1,
          estado: 1,
          descripcion: 1,
          fecha_ini: 1,
          fecha_fin: 1,
          tipo: 1,
          requerimiento: "$requerimientos",
          cotizacion_id: {
            id: "$cotizacion._id",
            codigo_cotizacion: "$cotizacion.codigo_cotizacion",
            aprobacion: "$cotizacion.aprobacion",
            estado: "$cotizacion.estado",
            fecha: "$cotizacion.fecha",
            usuario_id: {
              id: "$usuario._id",
              nombres: "$usuario.nombres",
              apellidos: "$usuario.apellidos",
              dni: "$usuario.dni",
            }
          }
        }
      },
      {
        $sort: { fecha_ini: -1 },
      },
    ]);
    console.log(JSON.stringify(ordenes, null, 2));
    return ordenes;
  } catch (error) {
    console.error("Error al obtener todas las órdenes de compra:", error);
    throw new Error("Error al obtener órdenes de compra");
  }
};


---------+++++++++++++++++++++++++++++++++-------------------------

ype OrdenCompra {
  id: ID!
  codigo_orden: String
  cotizacion_id: Cotizacion
  estado: String
  descripcion: String!
  fecha_ini: DateTime
  fecha_fin: DateTime
  tipo: String # compra, servicio, mixto etc
  requerimiento: [RequerimientoOrdenCompra]
  obra_id: String
  req_usuario_id: String # Usuario del requerimiento asociado
  codigo_rq: String
}


ype RequerimientoOrdenCompra {
  id: ID!
  usuario_id: String
  fecha_solicitud: DateTime
  fecha_final: DateTime
  estado_atencion: String
  sustento: String
  codigo: String
  obra_id: String
  empresa_id: String
  obra: ObraRequerimiento
}

type ObraRequerimiento {
  id: ID!
  titulo: String
  nombre: String
  descripcion: String
  ubicacion: String
  direccion: String
  estado: String
  empresa_id: EmpresaRequerimiento
}

type EmpresaRequerimiento {
  id: ID!
  nombre_comercial: String
  razon_social: String
  descripcion: String
  estado: String
  regimen_fiscal: String
  ruc: String
  imagenes: String
  color: String
}


ñññññññññññññññññññññññññññññññññññññññññññññññññññññññññññññññññññññññ


// Resolver para tipo OrdenCompra
    OrdenCompra: {
        // Resolver para asegurar que obra_id siempre esté presente
        obra_id: async (parent: any) => {
            // Si ya tiene obra_id, devolverla
            if (parent.obra_id) {
                return parent.obra_id;
            }
            
            // Si no tiene obra_id pero tiene id, intentar obtenerla
            if (parent.id) {
                try {
                    const obraId = await ordenCompraService.obtenerObraIdParaOrdenCompra(parent.id);
                    if (obraId) {
                        // Actualizar en la base de datos para futuras consultas
                        await ordenCompraService.updateOrdenCompra(parent.id, { obra_id: obraId });
                        return obraId;
                    }
                } catch (error) {
                    console.error('Error al resolver obra_id:', error);
                }
            }
            
            return null;
        },
        // Resolver para obtener el usuario_id del requerimiento asociado
        req_usuario_id: async (parent: any) => {
            // Si ya existe el campo req_usuario_id en los datos, usarlo directamente
            if (parent.req_usuario_id) {
                return parent.req_usuario_id;
            }
            
            // Si no tiene req_usuario_id pero tiene id, intentar obtenerlo
            if (parent.id) {
                try {
                    const usuarioId = await ordenCompraService.obtenerUsuarioIdRequerimiento(parent.id);
                    if (usuarioId) {
                        // Actualizar en la base de datos para futuras consultas
                        await ordenCompraService.updateOrdenCompra(parent.id, { req_usuario_id: usuarioId });
                        return usuarioId;
                    }
                } catch (error) {
                    console.error('Error al resolver req_usuario_id:', error);
                }
            }
            
            return null;
        },
        // Resolver para el array de requerimientos
        requerimiento: async (parent: any) => {
            // Si ya tiene el array de requerimientos, devolverlo
            if (parent.requerimiento) {
                return parent.requerimiento;
            }
            
            // Si no tiene requerimientos pero tiene id, intentar obtenerlos
            if (parent.id) {
                try {
                    const orden = await ordenCompraService.findAll();
                    const ordenEncontrada = orden.find(o => o.id === parent.id);
                    if (ordenEncontrada && ordenEncontrada.requerimiento) {
                        return ordenEncontrada.requerimiento;
                    }
                } catch (error) {
                    console.error('Error al resolver requerimiento:', error);
                }
            }
            
            return [];
        }
    }
