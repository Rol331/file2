bito [options] [flags] 
        
options: 
config [to update/edit Bito config]

flags for config:
--global [specifies to use global config file for user] and supports following flags 

flags: 
-c, --context     [File to save the context/conversation history in non-interactive mode.]
-e, --edit        [Open the config file in default editor]
-f, --file        [File on whose content to perform the operation/instructions described in prompt file.]
-h, --help        [Help for bito]
-i, --ignore      [Turn off commenting in Prompt file.]
-k, --key         [Expects Bito Access Key to be used for executing Bito CLI. Bito Access Key can be generated at: https://alpha.bito.ai/home/settings/advanced]
-l, --list        [List all config variables and values] 
-m, --model       [Model type to use for AI query in the current session. Model type can be set to BASIC/ADVANCED, which
                  is case insensitive.]
-p, --prompt      [File containing prompt or instructions to perform an operation.]
                  {{%input%}} macro represents/refers to the content of the file mentioned in the -f option, 
                  this can be used in the prompt file to refer to whole content of the file provided in -f option. 
                  In case {{%input%}} macro is not used, the content of the file provided via -f option is appended 
                  to the prompt before processing. In case -f is not provided along with -p then CLI will prompt for 
                    content to proceed ahead.
-t  --temperature [Set custom temperature for AI Model in use]
-v, --version     [Get version of Bito CLI]

Eg. "/localcode selectindex" will prompt to select a local code index to run your queries for that index.tion..the Bito AI Request.

          
Aquí está la traducción completa del texto al español:

Uso:
bito [opciones] [banderas] 

opciones:
config [para actualizar/modificar la configuración de Bito]

banderas para config:
--global [especifica el uso del archivo de configuración global para el usuario] y admite las siguientes banderas 

banderas:
-c, --context     [Archivo para guardar la historia del contexto/conversación en modo no interactivo.]
-e, --edit        [Abre el archivo de configuración en el editor predeterminado]
-f, --file        [Archivo sobre cuyo contenido realizar la operación/instrucciones descritas en el archivo de prompt.]
-h, --help        [Ayuda para bito]
-i, --ignore      [Desactiva el comentario en el archivo de Prompt.]
-k, --key         [Expecta l Clave de Acceso Bito para usar al ejecutar CLI de Bito. La Clave de Acceso Bito puede generar en: https://
alpha.bito.ai/home/settings/advanced]
-l, --list        [Lista todas las variables y valores de configuración]
-m, --model       [Tipo de modelo para usar en la consulta de IA en la sesión actual. El tipo de modelo se puede establecer en BASIC/
ADVANCED, que es insensible a mayúsculas/minúsculas.]
-p, --prompt      [Archivo conteniendo el prompt o instrucciones para realizar una operación.]
                  La macro {{%input%}} representa/refiere al contenido del archivo mencionado en la opción -f, 
                  esto se puede usar en el archivo de prompt para referirse al contenido completo del archivo proporcionado en la
 opción -f. 
                  En caso de no usarse la macro {{%input%}}, el contenido del archivo proporcionado a través de la opción -f se agrega
 
                  al prompt antes de procesarlo. En caso de no proporcionar -f junto con -p entonces CLI solicitará el contenido para
 proceder. 
-t --temperature [Establece una temperatura personalizada para el Modelo de IA en uso]
-v, --version     [Obtener la versión del CLI de Bito]


/////manual web 


Comandos Bito CLI
ayuda

    Sobre MAC/Linux: Correr bito --helpo o bito config --help

    En Windows: Corre bito --helpo o bito config --help

Comandos de corte

Los comandos de barras se introducen en Bito CLI para ayudar a que características como "AI que entienda su código" esté disponible a través del CLI.
Con esto, puede acceder a su índice de código creado por la extensión Bito en su IDE. Los comandos Slash se pueden utilizar para ejecutar rápidamente acciones
como ver todos los índices de código local, 
seleccionar un índice de código local en particular y finalmente hacer consultas de LCA para ese índice.

    Escriba "/" en bito prompt de modo interactivo de Bito CLI y pulse ENTRAR o TAB para ver todos los comandos disponibles.
    Escriba "/[comando-nombre]" en bito- prompt of interactive mode of Bito CLI y pulse ENTER o TAB para ver todas las opciones disponibles para ese comando.
    Escriba "/[comando-name] [option-name]" en bito- prompt de modo interactivo de Bito CLI y pulse ENTRAR o TAB para ejecutar la opción disponible.
    Corre bito --helppara ayuda relacionada con comandos de corte.

Bito CLI MyPrompt (Automación con Bito CLI)
Sobre MAC/Linux:

    Corre bito -vo o bito --versionimprimir el número de versión de Bito CLI instalado actualmente.

    Correr bito –p writedocprompt.txt -f mycode.jspara el modo no interactivo en Bito (donde writedocprompt.txt contendrá su texto rápido como 
    "Explicar el código a continuación en resumen" y mycode.js contendrá el código real en el que se va a realizar la acción).

    Correr bito –p writedocprompt.txtpara leer el contenido en la entrada estándar en Bito (donde writedocprompt.txt contendrá su texto rápido, 
    tales como "Explicar el código siguiente en resumen" y la entrada proporcionada tendrá el contenido real en el que se va a realizar la acción).

    Correr cat file.txt | bitopara gato directamente un archivo y entubarlo para mordearlo y obtener el resultado instantáneo para su consulta.

    Corrida cat inventory.sql | bito -p testdataprompt.txt > testdata.sqlpara redirijo su salida directamente a un archivo 
    (donde -p se puede utilizar junto con el gato para realizar una acción relacionada con prontitud en el contenido dado).

    Correr cat inventory.sql | bito -c runcontext.txt -p testdataprompt.txt > testdata.sqlpara almacenar el historial de contexto/conversación en 
    modo no interactivo en el archivo runcontext.txtpara usar para el siguiente conjunto de comandos en caso de que se necesite contexto previo.
     Si runcontext.txtno está presente, será creado. Por favor, proporcione un archivo nuevo o un archivo de contexto existente creado por bito usando -copción.
      Con -copción ahora el contexto se admite en modo no interactivo

    Corre echo "give me code for bubble sort in python" | bitopara obtener respuesta al instante para sus consultas usando Bito CLI.


Más sobre Bito CLI MyPrompt:
Utilizando Comentarios:

Cualquier cosa después #en su archivo de prontitud será considerado como un comentario por Bito CLI y no será parte de su aviso.

Puedes usar \#como una secuencia de escape para hacer #como parte de su aviso y para no utilizarlo para comentar más.
Pocos ejemplos para arriba:

    Dame un ejemplo de tipo burbuja en pitón todo lo que se escribe aquí será considerado como un comentario ahora.
    Explica lo que hace esta parte del código: \#include<stdio.h>
    i. en el ejemplo anterior \#puede ser utilizado como una secuencia de escape para incluir #como parte de tu aviso.
    Esto será considerado como un comentario como contiene en el comienzo de la línea en sí.

Comentarios de desactivación:

Para tratar " como un carácter normal y no un carácter especial para marcar el inicio de un comentario (que es el comportamiento predeterminado), 
uno puede usar -i/--ignore bandera en tu comando para Bito CLI.
Usando -i/--ignore bandera en su comando para Bito CLI le permitirá a Bito CLI saber que no trata #especialmente y utilizarlo como parte del prompt de procesamiento.

Por ejemplo, "bito -p prompt.txt -i" se asegurará de que incluso si #está presente en su archivo de instrucciones, no se considerará como un comentario y su archivo será procesado tal y como está.
Usando Macro:

Uso {{%input%}}macro en el archivo de prontitud para consultar el contenido del archivo proporcionado a través de la opción -f

Ejemplo: Para comprobar si un archivo contiene código JS o no, puede crear un archivo rápido checkifjscode.txt con el siguiente aviso:

Context is provided below within contextstart and contextend
contextstart
{{%input%}}
contextend
Check if content provided in context is JS code.

Ejemplos:

Aquí hay dos ejemplos para que veas Mi Prompt en acción:

    Cómo crear mensajes de git Commit y documentación de Markdown con facilidad usando Bito CLI Mi Prompt:

Vídeo

    Cómo generar datos de prueba utilizando Bito CLI My Prompt:

Vídeo
Configuración de Bito CLI
bito config [banillos]

    Corre bito config -lo o bito config --listpara enumerar todas las variables y valores de configuración.

    Corre bito config -eo o bito config --editpara abrir el archivo de configuración en el editor por defecto.

Configuración de la muestra

bito:
 acceso.key: ""
 email: first.last-mycompany.com
 prefer, el modelo: ADVANCED
Ajustes:
 auto-update: true
 max.context.entries: 20
Tipo de modelo de IA preferido

De forma predeterminada de tipo de modelo de IA se establece en ADVANCEDy puede ser analgado corrido corrindo bito -m <BASIC/ADVANCED>
El tipo de modelo se utiliza para la consulta de IA en la sesión actual. Tipo de modelo se puede configurar BASICo o ADVANCED, que es insensible.

"ADVANCED" se refiere a modelos de IA como GPT-4o, Claude Sonnet 3.5 y los mejores en modelos de IA de clase, mientras que "BASIC" 
se refiere a modelos de IA como GPT-4o mini y modelos similares.

Cuando se utilizan modelos de BASIC AI, sus indicaciones y la memoria del chat se limitan a 40.000 caracteres (unas 18 páginas unicibles). 
Sin embargo, con los modelos ADVANCED AI, sus indicaciones y la memoria de chat pueden llegar hasta 240.000 caracteres (unas 110 páginas uniciéforas). 
Esto significa que los modelos ADVANCED pueden procesar todos sus archivos de código, lo que conduce a respuestas más precisas.

Si estás buscando los mejores resultados para tareas complejas, elige los modelos ADVANCED AI.

Bito CLI también imprime el modelo configurado y el utilizado para su sesión actual sobre el error estándar para su referencia. 
Si ejecutas "bito" entonces deberías ver "Modelo configurado" como "BASIC/ADVANCED". 
Este es el modelo que se configura en su configuración CLI (que puede ser de acceso a través de bito config -e).

Si empiezas a hacer consultas, dependiendo de tu Plan de Facto Bito si estás en un plan Gratis, el modelo cambiará automáticamente a BASIC y verás "Modelo en uso:" como BASIC impreso.

Si estás en un plan de pago y no has agotado tus consultas avanzadas, verás "Modelo en uso:" como ADVACNED impreso.
Clave de acceso

Access Key se puede crear en Bito Web UI y utilizarse en Bito CLI.

Para crear una clave de acceso, haga lo siguiente:

    Inicia sesión en tu cuenta en: https://alpha.bito.ai
    Una vez iniciado el final: https://alpha.bito.ai/home/settings/advanced
    Haga clic en el botón "Crear nueva tecla" en la sección "Bito Access Key" para crear una nueva clave y copiarla.
    Asegúrese de proteger su llave y no la compruebes, en ningún código para evitar fugas accidentales.
    En caso de que pienses que tu clave está comprometida, puedes eliminar la clave existente y crear nueva clave en cualquier momento.

Access Key es un mecanismo de autenticación alternativo para la tía de Email y OTP.

Clave de acceso se puede persistir en Bito CLI corrida bito config -eTal clave de acceso persiste puede ser anúdse por correr
 bito -k <access-key>o o bito --key <access-key>para la sesión transitoria.
Idioma de salida

Bito CLI, por defecto, genera salida en inglés. Puedes cambiar el idioma de salida a tu idioma preferido desde aquí.

A partir de ahora se necesitan 30 minutos para que el cambio de idioma se refleje en el CLI cuando el CLI está en el modo de ejecución. 
Para los cambios para reflejar inmeditamente se puede salir de la sesión actual de CLI usando Ctrl+Cy de nuevo ejecutar el CLI usando bito.
