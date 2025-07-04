#COMAANDO PARA SER EFECIENTE 

- **Projectile**: Utiliza `C-c p f` para buscar archivos en el proyecto y `C-c p g` para buscar texto en el proyecto.
- **Swiper**: Utiliza `C-s` para realizar una búsqueda interactiva en el buffer actual.
- **Ivy**: Utiliza `C-x b` para cambiar de buffer y `C-x C-f` para abrir archivos.
- **Counsel**: Utiliza `M-x` para ejecutar comandos con una interfaz mejorada.

#COMANDO PARA BUSCAR RGREP

- **Buscar con Ripgrep**: Ahora puedes usar `C-c p s r` para iniciar `counsel-rg` y
 buscar en tu proyecto actual. Este comando utiliza Ripgrep para realizar búsquedas rápidas y eficientes.
   M-x counsel-rg` 
   
- **Buscar con counsel-projectile** a una tecla rápida
  ` C-c p s`  
  counsel-projectile-rg

## comando para refrescar la instalcion de paquetes
 
   M-x package-refresh-contents
## comando para refrescar configuracion init.el 

######## Magit #################


2. **Abrir Magit**:
   - Para abrir Magit, simplemente ejecuta `M-x magit-status`. Esto abrirá el buffer de estado de Magit para el repositorio Git en el directorio actual.

3. **Navegación Básica**:
   - Dentro del buffer de Magit, puedes usar las teclas de flecha para navegar.
   - Presiona `Tab` para expandir o colapsar secciones.

4. **Comandos Comunes**:
   - **s**: Escenario (Stage) de cambios. Selecciona un archivo o sección y presiona `s` para añadirlo al área de preparación.
   - **u**: Deshacer escenario (Unstage) de cambios.
   - **c c**: Comenzar un nuevo commit. Se abrirá un buffer para que escribas tu mensaje de commit.
   - **P**: Empujar (Push) cambios al repositorio remoto.
   - **F**: Traer (Fetch) cambios del repositorio remoto.
   - **b b**: Cambiar de rama (branch).

5. **Ayuda Adicional**:
   - En cualquier momento, puedes presionar `?` en el buffer de Magit para obtener una lista de comandos disponibles y su descripción.


Para hacer un commit en Magit dentro de Emacs, sigue estos pasos:

1. **Abre Magit**:
   - En Emacs, abre el estado de Magit para tu repositorio ejecutando `M-x magit-status`. Esto abrirá un buffer con el estado actual de tu repositorio Git.

2. **Prepara los cambios (Stage)**:
   - Navega hasta la sección "Unstaged changes" utilizando las teclas de flecha.
   - Para preparar un archivo o cambios específicos, selecciona el archivo o la sección y presiona `s`. Esto moverá los cambios a la sección "Staged changes".

3. **Inicia el proceso de commit**:
   - Una vez que hayas preparado todos los cambios que deseas incluir en el commit, presiona `c` para abrir el menú de commit.
   - Luego, presiona `c` nuevamente para abrir un buffer donde podrás escribir el mensaje de commit.

4. **Escribe el mensaje de commit**:
   - En el buffer que se abre, escribe un mensaje descriptivo para tu commit. Es una buena práctica que el mensaje sea claro y explique qué cambios estás haciendo y por qué.
   - Una vez que hayas terminado de escribir el mensaje, presiona `C-c C-c` para confirmar y realizar el commit.

5. **Verifica el commit**:
   - Después de hacer el commit, puedes verificar que se haya realizado correctamente revisando la sección de "Recent commits" en el buffer de estado de Magit.


1. **Abre Magit**:
   - En Emacs, abre el estado de Magit para tu repositorio ejecutando `M-x magit-status`.

2. **Verifica los commits locales**:
   - Asegúrate de que tienes commits locales que deseas enviar al repositorio remoto. Puedes ver esto en la sección "Unpushed to origin/branch" o similar.

3. **Inicia el proceso de push**:
   - Dentro del buffer de Magit, presiona `P` para abrir el menú de push.

4. **Selecciona la opción de push**:
   - Presiona `p` para hacer un push de la rama actual al repositorio remoto configurado por defecto (normalmente `origin`).

5. **Confirma el push**:
   - Si es la primera vez que haces push de esta rama o si hay opciones adicionales necesarias, Magit te pedirá confirmaciones adicionales. Sigue las instrucciones que aparecen en pantalla.

6. **Verifica el resultado**:
   - Después de hacer el push, revisa el buffer de Magit para asegurarte de que los commits se han enviado correctamente al repositorio remoto.

`

1. **Eliminar espacios en blanco al final de las líneas:**
   Puedes usar el comando `M-x delete-trailing-whitespace`. Este comando eliminará todos los espacios en blanco al final de cada línea en el buffer actual.

2. **Eliminar líneas en blanco adicionales:**
   Si deseas eliminar líneas en blanco adicionales, puedes usar una expresión regular para buscar y reemplazar. Sigue estos pasos:
   
   - Presiona `C-M-%` para iniciar `query-replace-regexp`.
   - Escribe `\n\n+` como el patrón de búsqueda. Esto buscará dos o más líneas en blanco consecutivas.
   - Escribe `\n` como el texto de reemplazo. Esto reemplazará las líneas en blanco consecutivas con una sola línea en blanco.
   - Presiona `!` para reemplazar todas las coincidencias en el buffer.

3. **Guardar automáticamente sin espacios en blanco:**
   Si quieres que Emacs elimine automáticamente los espacios en blanco al final de las líneas cada vez que guardas un archivo, puedes agregar lo siguiente a tu archivo de configuración `.emacs` o `init.el`:

   ```elisp
   (add-hook 'before-save-hook 'delete-trailing-whitespace)
   ```


###comando para maximizar buffer 


delete-other-windows
#comando para cerrar todas los buffer except el que esta activo , ese se queda maximizado

winner-mode

#comando para activar winer mode y revertir  lo que se hizo con el comando delete-othter-windows 
#Una vez activado usar C-c + <left> configuracion anterior   o C-c <right>
