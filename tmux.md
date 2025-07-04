##Algunos comandos básicos de tmux son:

- tmux: Inicia una nueva sesión de tmux.
- Ctrl+b d: Detiene la sesión actual.
- tmux attach: Une a una sesión existente.
- Ctrl+b c: Crea una nueva ventana.
- Ctrl+b n: Mueve al siguiente ventana.
- Ctrl+b p: Mueve al anterior ventana.
- Ctrl+b &: Mata la venatana

- Ctrl+b % : divida la ventan en dos paneles verticales
- Ctrl+b " : divude la ventana en dos panels horizontales
- Ctrl+b (flechas): ir al siguiente panel segun la dirección 
- Ctrl+b o : siguiente panel
- Ctrl+b x :Cierra el panel 
- Ctrl+b q : imprime el numero de panel 
- Ctrl+b t : tiempo en el panel 
- Ctrl+b f :buscar un panel 
- Ctrl+b [ : modo desplazamiento (no ejecuta comandos)
- q : salid de modo desplazamiento 
- Ctrl+b M+o : rotar paneles


### Creando y gestionando secciones en tmux

Tmux permite dividir la pantalla en varias secciones o paneles. Aquí te explico cómo hacerlo:

1. **Crear una nueva sección (panel)**:
   - Presiona Ctrl+b seguido de % para dividir la pantalla horizontalmente.
   - O presiona Ctrl+b seguido de " para dividir verticalmente.

2. **Navegar entre secciones**:
   - Usa las flechas de navegación (h, j, k, l) para moverte entre paneles.
   - Presiona Ctrl+b seguido de [ para ir al panel anterior y ] para ir al siguiente.

3. **Renombrar secciones**:
   - Presiona Ctrl+b, luego r, y luego el número del panel que quieres renombrar.

4. **Unir secciones**:
   - Presiona Ctrl+b seguido de ' para unir paneles adyacentes horizontalmente.
   - O presiona Ctrl+b seguido de + para unir paneles adyacentes verticalmente.

5. **Deshacer una acción**:
   - Si accidentalmente creaste una sección extra, puedes deshacer la última acción con Ctrl+b seguido de u.

6. **Configurar secciones por defecto**:
   - En tu archivo .tmux.conf, puedes definir el número inicial de paneles y su tamaño al iniciar tmux.

### Consejos adicionales

- Para ver una lista de comandos disponibles en tmux, presiona Ctrl+b seguido de ?.
- Puedes personalizar los atajos de teclado en tu archivo .tmux.conf.
- Si necesitas ayuda con un comando específico, puedes escribirlo después de Ctrl+b : para ejecutarlo directamente.



### Copiar y pegar

. **tmux:**
   - `tmux` es un multiplexor de terminal que permite dividir la terminal en múltiples sesiones y ventanas.
   - Para seleccionar texto en `tmux`, primero debes entrar en el modo de copia:
   - Presiona `Ctrl + b` y luego `[`.
   - Si la tecla `Espacio` no funciona, intenta usar `Ctrl + Espacio` para iniciar la selección.  
   - Usa las teclas de flecha para mover el cursor y seleccionar texto.
   - Presiona `Enter` para copiar la selección al portapapeles de `tmux`.
   - Puedes pegarlo dentro de `tmux` con `Ctrl + b` y luego `]`.


# Cambiar el prefijo a Ctrl+a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# Habilitar el mouse
set -g mouse on

# Mejor soporte de colores
set -g default-terminal "screen-256color"

# Empezar a contar paneles y ventanas desde 1
set -g base-index 1
setw -g pane-base-index 1




# Iniciar nueva sesión
tmux

# Iniciar sesión con nombre
tmux new -s nombre_sesion

# Listar sesiones
tmux ls
tmux list-sessions

## Conectar a sesión existente
tmux attach -t nombre_sesion

# Desconectar de sesión (desde dentro de tmux)
Ctrl+a d

# Dividir pantalla horizontalmente
Ctrl+a "

# Dividir pantalla verticalmente
Ctrl+a %

# Moverse entre paneles
Ctrl+a ←↑→↓

# Nueva ventana
Ctrl+a c

# Cambiar entre ventanas
Ctrl+a n (siguiente)
Ctrl+a p (anterior)

# Dividir pantalla horizontalmente
Ctrl+a "

# Dividir pantalla verticalmente
Ctrl+a %

# Moverse entre paneles
Ctrl+a ←↑→↓

# Nueva ventana
Ctrl+a c

# Cambiar entre ventanas
Ctrl+a n (siguiente)
Ctrl+a p (anterior)


tmux source-file ~/.tmux.conf

