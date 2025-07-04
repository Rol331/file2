#Resumen de org mode 


Comandos básicos de Org-mode:
- `C-c C-t`: Ciclar entre estados TODO/DONE
- `C-c C-d`: Agregar fecha límite
- `C-c C-s`: Agregar fecha de inicio programada
- `Tab`: Expandir/contraer secciones
- `Shift-Tab`: Expandir/contraer todo el documento
- `Alt-Enter`: Agregar nuevo item al mismo nivel
- `C-c C-c`: Marcar checkboxes o tags

Para activar Org-mode en Emacs:
1. Abre tu archivo .emacs o init.el
2. Agrega estas líneas:
```lisp
(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
```

Para ver la agenda:
- `C-c a`: Muestra la vista de agenda

Para marcar prioridades:
- `C-c ,`: Asignar prioridad [A], [B], [C]
(con shift y las teclas arrib  y abajo se puede establecer la prioridad)

har para mejorar tu productividad. Aquí te dejo algunas sugerencias:

### 1. **Usar Prioridades:**
   Puedes asignar prioridades a tus tareas usando `[#A]`, `[#B]`, `[#C]`, etc. Esto te ayudará a saber qué tareas son más urgentes o importantes.

   ```org
   *** TODO [#A] Api para generar Guia de remision y factura (PENDIENTE)
       :ESTADO: PENDIENTE
   ```

### 2. **Etiquetas:**
   Las etiquetas te permiten categorizar tareas. Puedes añadir etiquetas específicas a cada tarea para organizarlas mejor.

   ```org
   *** TODO Api para roles por obras :backend:
       :ESTADO: PENDIENTE
   ```

### 3. **Captura de Tareas Rápida:**
   Configura plantillas de captura en Emacs para añadir tareas rápidamente sin tener que navegar a tu archivo Org.

### 4. **Vista de Agenda:**
   Usa la función de agenda de Emacs (`C-c a a`) para ver todas tus tareas y plazos en un solo lugar. Esto te ayuda a planificar tu día o semana de manera más efectiva.

### 5. **Propiedades Personalizadas:**
   Puedes definir propiedades personalizadas para tus tareas. Por ejemplo, puedes añadir una propiedad `:RESPONSABLE:` para indicar quién es responsable de cada tarea.

   ```org
   *** TODO Api con las cantidades de recurso en cada fase
       :ESTADO: PENDIENTE
       :RESPONSABLE: Rolando
   ```

### 6. **Subtareas:**
   Divide tareas grandes en subtareas más pequeñas para facilitar su gestión. Esto se puede hacer simplemente añadiendo más niveles de encabezados.

   ```org
   *** TODO Api para generar Guia de remision y factura (PENDIENTE)
       :ESTADO: PENDIENTE
   **** TODO Implementar lógica de generación
   **** TODO Crear endpoints necesarios
   ```

### 7. **Integración con Git:**
   Si estás usando Git, puedes integrar tus archivos Org para mantener un historial de cambios y colaborar con otros.

### 8. **Enlaces a Archivos o Código:**
   Puedes añadir enlaces a archivos relevantes o fragmentos de código directamente en tus tareas. Esto es útil para acceder rápidamente a recursos necesarios.

   ```org
   *** TODO Api para sustentar requerimiento (PENDIENTE)
       :ESTADO: PENDIENTE
       [[file:~/proyecto/docs/requerimiento.md][Documento de Requerimiento]]
   ```

### Enlazar a Archivos

1. **Enlace Básico a Archivos:**
   Para enlazar a un archivo, puedes usar la siguiente sintaxis:

   ```org
   [[file:/ruta/a/tu/archivo.txt][Descripción]]
   ```

   - `/ruta/a/tu/archivo.txt` es la ruta al archivo al que deseas enlazar.
   - `Descripción` es el texto que se mostrará como el enlace.

2. **Rutas Relativas:**
   También puedes usar rutas relativas, que son especialmente útiles si tu archivo Org y los archivos enlazados están en el mismo directorio del proyecto.

   ```org
   [[file:../docs/requerimientos.md][Documento de Requerimientos]]
   ```

3. **Enlazar a Líneas Específicas:**
   Si deseas enlazar a una línea específica en un archivo, puedes añadir `::NúmeroDeLínea` a la ruta del archivo.

   ```org
   [[file:/ruta/a/tu/archivo.txt::42][Ir a la línea 42]]
   ```

### Enlazar a Bloques de Código

1. **Enlazar a Bloques de Código dentro de Archivos Org:**
   Si tienes bloques de código dentro de tu archivo Org, puedes enlazar a ellos usando el nombre del bloque.

   Primero, nombra tu bloque de código:

   ```org
   #+NAME: mi-bloque-de-código
   #+BEGIN_SRC python
   print("¡Hola, Mundo!")
   #+END_SRC
   ```

   Luego enlaza a él:

   ```org
   [[mi-bloque-de-código][Ir a mi bloque de código]]
   ```

2. **Enlazar a Código en Archivos Externos:**
   Si deseas enlazar a una parte específica de un archivo de código, puedes usar comentarios o etiquetas en tu código para marcar el lugar y enlazar a él de manera similar a cómo enlazas líneas específicas.

### Usar Enlaces en Org Mode

- **Seguir Enlaces:**
  Para seguir un enlace en Org mode, coloca tu cursor sobre el enlace y presiona `C-c C-o` o simplemente `Enter`.

- **Crear Enlaces Fácilmente:**
  Puedes crear enlaces fácilmente usando `C-c C-l` (`org-insert-link`). Este comando te pedirá el tipo de enlace y el destino.

### Solución para Seguir Enlaces

1. **Verificar el Modo Org:**
   - Asegúrate de que el archivo esté abierto en Org mode. Deberías ver "Org" en la barra de estado en la parte inferior de Emacs. Si no está en Org mode, puedes activarlo manualmente con `M-x org-mode`.

2. **Verificar la Configuración de Emacs:**
   - Asegúrate de que no haya conflictos con otras configuraciones o paquetes que puedan estar interceptando las teclas `C-c C-o` o `Enter`.

3. **Actualizar Emacs:**
   - Asegúrate de que estás usando una versión reciente de Emacs y Org mode. Las versiones más antiguas pueden tener bugs que ya han sido corregidos.

4. **Modo de Enlaces Activo:**
   - Asegúrate de que el modo de enlaces de Org esté activo. Puedes verificarlo con `M-x org-toggle-link-display`, que debería mostrar los enlaces en su forma completa.

5. **Revisar Mensajes de Error:**
   - Si Emacs muestra algún mensaje de error en el minibuffer (la línea inferior), eso puede darte pistas sobre qué está fallando.

### Editar Enlaces en Org Mode

Para editar un enlace en Org mode:

1. **Colocar el Cursor sobre el Enlace:**
   - Mueve el cursor al enlace que deseas editar.

2. **Usar el Comando de Edición de Enlaces:**
   - Presiona `C-c C-l` (`org-insert-link`). Este comando te permitirá editar el enlace actual. Si el cursor ya está sobre un enlace, este comando te permitirá modificarlo.

3. **Modificar el Enlace:**
   - Cambia la URL o la descripción del enlace según sea necesario y presiona `Enter` para guardar los cambios.


################################################# Tablas en org mode #####################################3

En Org-mode (Emacs/Neovim), hay varias formas de crear tablas. Aquí te muestro las más comunes:

1. **Tabla Básica Manual**
```org
| Nombre | Edad | Ciudad |
|--------+------+--------|
| Ana    | 25   | Madrid |
| Juan   | 30   | París  |
| María  | 28   | Roma   |
```

2. **Crear tabla rápidamente**
- Escribe `|nombre|edad|ciudad|` y presiona `TAB`
- En Org-mode se formateará automáticamente

3. **Separador de encabezado**
- Después del encabezado, escribe `|-` y presiona `TAB`
- Org-mode creará la línea separadora

Atajos útiles:
- `TAB`: Formatea la celda actual
- `RET`: Nueva fila
- `M-left/right`: Mover columna
- `M-up/down`: Mover fila

Tips:
- Las tablas se alinean automáticamente
- Puedes usar `|` para iniciar una nueva tabla
- Para cálculos, puedes usar fórmulas con `#+TBLFM:`



1. Posiciona el cursor en la columna que deseas eliminar
2. Presiona `M-x org-table-delete-column` 
   o usa el atajo de teclado: `M-S-<left>` (Meta+Shift+flecha izquierda)

Por ejemplo, si tienes una tabla:
```
| id | F_Creacion | F_Cambio | ID_pago |
|----+------------+-----------+---------|
|  1 | 2023-01-01 | 2023-01-02|     101 |
```

Y quieres eliminar la columna `F_Cambio`, después de ejecutar el comando quedará:
```
| id | F_Creacion | ID_pago |
|----+------------+---------|
|  1 | 2023-01-01 |     101 |
```

