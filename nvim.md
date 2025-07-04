#Para aceptar sugerencias:
Ctrl + J (porque configuramos vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")'))
Otras teclas útiles por defecto:
Alt + ] - siguiente sugerencia
Alt + [ - sugerencia anterior
Alt + \ - descartar sugerencia actual
Para Copilot Chat:
<leader>cc - Toggle Copilot Chat
<leader>ce - Explicar código
<leader>ct - Generar tests
<leader>cf - Arreglar código
<leader>cr - Revisar código
Ctrl + s - Enviar mensaje en la ventana de chat
Nota: Por defecto, la tecla <leader> suele ser la barra espaciadora, a menos que la hayas configurado de otra manera.

##Sí, Copilot Chat en Neovim puede ayudarte a crear archivos, 
##pero la interacción es un poco diferente a VS Code. 
##Aquí te explico cómo:

1.-Usando Copilot Chat:

# Abre el chat con
<leader>cc   # (según tu configuración)

# Luego puedes escribir prompts como:
"Create a new TypeScript file for a User model"
"Generate a GraphQL schema for users"

2.-Para crear el archivo:
Copilot Chat te dará el código
Necesitas crear manualmente el archivo:

:e nuevo_archivo.ts    # Crear/abrir nuevo archivo
# Pegar el código generado


3.-Comandos útiles adicionales:
<leader>cf   # Fix code
<leader>ce   # Explain code
<leader>ct   # Generate tests


##Sí, Copilot Chat en Neovim puede ayudarte a modificar archivos existentes. 
##La diferencia principal está en cómo interactúas con él. Aquí te explico:

1.Para modificar archivos existentes:
Abre el archivo que quieres modificar
Selecciona el código que quieres cambiar (modo visual)
Usa los comandos de Copilot Chat:

<leader>ce   # Para explicar el código
<leader>cf   # Para arreglar el código
<leader>cr   # Para revisar y sugerir cambios

1.-Para modificaciones específicas:

Abre Copilot Chat con <leader>cc
Escribe tu solicitud específica, por ejemplo:
"Refactor this code to use async/await"
"Add error handling to this function"
"Convert this class to TypeScript"

2.- Aplicar los cambios:
Copilot Chat te mostrará los cambios sugeridos
Puedes copiar y pegar manualmente
O usar comandos de selección/reemplazo de Neovim:

:'<,'>d    # Borrar selección
p          # Pegar nuevo código


