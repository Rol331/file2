Command 	Description
/add 	 Añadir archivos al chat para que aider pueda editarlos o revisarlos en detalle
/architect 	Entra en modo arquitecto para discutir diseño y arquitectura de alto nivel
/ask 	 	Haz preguntas sobre la base de código sin editar ningún archivo
/chat-mode 	Cambiar a un nuevo modo de chat
/clear 	Despeja la historia del chat
/code 	Pide cambios en tu código
/commit  Cometar las ediciones al repo hecho fuera del chat (comprometer mensaje opcional)
/copy    Copia el último mensaje de asistente del portapapeles
/diff 	Mostrar la diferencia de los cambios desde el último mensaje
/drop 	Eliminar archivos de la sesión de chat para liberar espacio contextual
/exit 	Salida de la aplicación
/git 	Ejecutar un comando git (salida del chat)
/help 	Haz preguntas sobre aider
/lint 	Pinchar y fijar archivos en el chat o todos los archivos sucios si ninguno en chat
/ls 	Enumee todos los archivos conocidos e indique cuáles están incluidos en la sesión de chat
/map 	Imprima el mapa de repositorio actual
/map-refresh 	Forzar una actualización del mapa del repositorio
/model 	Cambiar a una nueva LLM
/models 	Busca la lista de modelos disponibles
/paste 	Pele imagen/texto desde el portapapeles en el chat. Opcionalmente proporcionar un nombre para la imagen.
/quit 	Salida de la aplicación
/read-only Añadir archivos al chat que son de referencia, no ser editado
/report 	Reportar un problema al abrir un tema de GitHub
/reset 	Suelta todos los archivos y despeja la historia del chat
/run 	Ejecute un comando shell y opcionalmente agregue la salida al chat (alias:
/settings 	Imprime la configuración actual
/test 	Ejecute un comando shell y agregue la salida al chat en código de salida no cero
/tokens 	Informe sobre el número de fichas utilizadas por el actual contexto de chat
/undo 	Deshacer el último git commit si fue hecho por aider
/voice 	Graba y transcribe entrada de voz
/web 	Raspa una página web, convertir a marca y enviar un mensaje


Emacs

    Ctrl-A: Móve cursor al comienzo de la línea.
    Ctrl-B: Máve cursor de nuevo un personaje.
    Ctrl-D: Eliminar el carácter bajo el cursor.
    Ctrl-E: Máve el cursor al final de la línea.
    Ctrl-F: Máve cursor hacia adelante un personaje.
    Ctrl-K: Eliminar del cursor hasta el final de la línea.
    Ctrl-L: Despeja la pantalla.
    Ctrl-N: Pasa a la siguiente entrada de la historia.
    Ctrl-P: Avanzándote a la entrada de la historia anterior.
    Ctrl-R: Búsqueda inversa en la historia del comando.
