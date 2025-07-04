[copilot-chat-custom-prompt-selection] --->  Permite enviar el codigo seleccionado al prompt de chat / puedes añadir instucciones 

*** Funciones básicas

 [copilot-chat-reset] Restaura todo, incluyendo la historia, amortiguadores y frontend.
 [copilot-chat-display] mostrar copiloto de chat de copiloto.
 [copilot-chat-switch-to-buffer] cambiar a Copilot Chat buffer, junto con el buffer actual de edición de código.
 [copilot-chat-set-model] Seleccionar el modelo de IA a utilizar.

*** Prompt

    [copilot-chat-custom-prompt-selection] pedir un aviso en la selección de minibuffer y pastas después de él antes de enviarlo al copiloto.
    [copilot-chat-prompt-history-previous] insertar el prompt previo de la historia en el amortiguador rápido.
    [copilot-chat-prompt-history-next] insertar siguiente rapidez de la historia en el amortiguador rápido.
    [copilot-chat-ask-and-insert] pedir una respuesta personalizada y escribir en el buffer actual en el punto.

*** Manipulación de respuestas

    [copilot-chat-send-to-buffer] enviar un bloque de código a un amortiguador elegido. Reemplazar la selección si lo hubiera. (Sólo ordena y marcar frontends)

*** Buffers

    [copilot-chat-add-current-buffer] añadir el buffer actual al chat de copiloto. Su contenido se enviará con cada petición.
    [copilot-chat-del-current-buffer] eliminar el amortiguador de la corriente.
    [copilot-chat-list] lista de amortiguadores.
    [copilot-chat-add-buffers-in-current-window] Agregue todos los amortiguadores en la ventana de Emacs actual al chat de copiloto.
    [copilot-chat-add-files-under-dir] Añadir todos los archivos con el mismo sufijo que el archivo actual bajo el directorio actual. Si hay más de 40 archivos, negáse a añadir y mostrar mensaje de advertencia.

    [copillot-chat-add-file] Añadir archivo al contexto 
    [ /copilot-chat-show-files] ver los archivos que se cargo 

        1. **Cómo Usarlo**:
        ```vim
        :Copilot chat add file
        " O específicamente:
        :Copilot chat add /ruta/al/archivo.js
        ```        
        2. **Beneficios**:
           - Mejor comprensión del contexto por parte de Copilot
           - Respuestas más precisas y relevantes
           - Capacidad de hacer preguntas sobre la interacción entre archivos
           - Más efectivo para debuggear problemas que involucran múltiples archivos
        
	        Este comando es especialmente útil cuando trabajas en proyectos donde el código está distribuido en 
	        varios archivos y necesitas que Copilot entienda el contexto completo.

         3. **Añadir Múltiples Archivos**:
            - Puedes ejecutar el comando varias veces para añadir diferentes archivos
            ```vim
            :Copilot chat add file1.js
            :Copilot chat add file2.js
            :Copilot chat add file3.js
            ```
         
         4. **Gestión de Archivos**:
            - Los archivos se acumulan en el contexto de la conversación
            - Puedes ver qué archivos están incluidos en el contexto
            - Los archivos permanecen en el contexto hasta que:
              - Inicies una nueva conversación
              - Limpies explícitamente el contexto
         
         5. **Consideraciones Importantes**:
            - Hay un límite en la cantidad de contexto que Copilot puede manejar
            - Se recomienda añadir solo los archivos relevantes
            - Demasiados archivos pueden hacer que las respuestas sean menos precisas
         
         6. **Buenas Prácticas**:
            - Añade solo los archivos relacionados con tu consulta actual
            - Si cambias de tema, considera iniciar una nueva conversación
            - Prioriza los archivos más relevantes para tu pregunta
         
			**Variantes  

			 Sí, existen varias variantes del comando para interactuar con archivos en Copilot. Aquí te las detallo:
			 
			 1. **Añadir Archivos**:
			 ```vim
			 :Copilot chat add         " Añade el archivo actual
			 :Copilot chat add %      " Añade el buffer actual
			 :Copilot chat add file   " Añade un archivo específico
			 :Copilot chat add /ruta/completa/archivo.js  " Añade usando ruta completa
			 ```
			 
			 2. **Eliminar Archivos**:
			 ```vim
			 :Copilot chat remove     " Elimina el archivo actual del contexto
			 :Copilot chat clear     " Limpia todo el contexto de la conversación
			 ```
			 
			 3. **Ver Contexto**:
			 ```vim
			 :Copilot chat show     " Muestra los archivos en el contexto actual
			 :Copilot chat status   " Muestra el estado del contexto
			 ```
			 
			 4. **Interacción con Selecciones**:
			 ```vim
			 :Copilot chat focus    " Enfoca la conversación en la selección actual
			 :Copilot chat apply    " Aplica cambios sugeridos al código
			 ```
			 
			 5. **Otros Comandos Útiles**:
			 ```vim
			 :Copilot chat reset    " Reinicia la conversación
			 :Copilot chat new      " Inicia una nueva conversación
			 :Copilot chat toggle   " Alterna la ventana de chat
			 ```
  	        
     
*** Funciones de ayudante de código

    [copilot-chat-explain-symbol-at-line] pícalo Copilot para explicar el símbolo en cuestión.
    [copilot-chat-explain] Pídale al copiloto que explique el código seleccionado.
    [copilot-chat-review] Pídale al copiloto que revise el código seleccionado.
    [copilot-chat-doc] Pídale al copiloto que documenten el código seleccionado.
    [copilot-chat-fix] Pídale al copiloto que fije el código seleccionado.
    [copilot-chat-optimize] Pídale al copiloto para optimizar el código seleccionado.
    [copilot-chat-test] Pídale al copiloto que escriba pruebas para el código seleccionado.
    [copilot-chat-explain-defun] pedir al copiloto para que explique la función actual en cuestión.
    [copilot-chat-custom-prompt-function] Pídale al copiloto que aplique un aviso personalizado al cuerpo de función debajo de la letra. Por ejemplo, instruyendo sobre cómo refactor la función.
    [copilot-chat-review-whole-buffer] Pida al copiloto para revisar todo el buffer actual. Se puede utilizar para revisar la clase completa, o, revisar el magit diff para mi cambio, o el cambio de otras personas.

*** Magitra

    [copilot-chat-insert-commit-message] Insertar en el buffer actual un copiloto generó mensaje de confirmación.
