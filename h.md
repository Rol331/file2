
           
El protocolo de red H.264/MPEG-4 AVC (Advanced Video Coding) es un estándar de codificación de video que se utiliza ampliamente en la transmisión de
 video sobre redes. Aquí te explico sus principales características:

### Características principales

- Es una versión avanzada del estándar MPEG-4, desarrollado por el grupo de trabajo JVT (Joint Video Team) formado por la ISO/IEC y ITU-T.

- Permite una compresión eficiente del video, lo que reduce significativamente el ancho de banda necesario para transmitir contenido de alta calidad.

- Soporta resoluciones hasta 4K (3840x2160 píxeles) y tasa de cuadros hasta 60 fps.

- Es compatible con una amplia gama de dispositivos y plataformas, desde smartphones hasta televisores inteligentes.

### Ventajas

- Alta calidad de video a bajas tasas de bits.
- Soporte para múltiples resoluciones y tamaños de pantalla.
- Eficiencia en el uso del ancho de banda.
- Amplia compatibilidad con diferentes dispositivos y sistemas operativos.

### Aplicaciones comunes

- Streaming de video en redes móviles y fijas.
- Transmisión de eventos en vivo (por ejemplo, deportes).
- Servicios de video bajo demanda (como Netflix, YouTube, etc.).

### Implementación

El protocolo se implementa generlmente utilizando codecs como x264 o H.264/AVC, que permiten la codificación y decodificación eficiente del video según
 este estándar.


En resumen, el protocolo de red H.264/MPEG-4 AVC es fundamental para la transmisión eficiente de video de alta calidad sobre redes, ya que logra una
excelente relación calidad-precio en términos de compresión y compatibilidad.

### A nivel de programacion

1. Funcionamiento básico:
   - RTSP permite a los clientes solicitar contenido multimedia a servidores.
   - El servidor puede estar ejecutando el flujo o simplemente actuar como un proxy.

4. Protocolo de transmisión:

   - Las cámaras IP suelen usar protocolos como RTSP (Real-Time Streaming Protocol) o HLS (HTTP Live Streaming) para transmitir video en tiempo real.
   - Estos protocolos permiten que el video se envíe continuamente desde la cámara hasta tu dispositivo móvil.

5. Seguridad:
   - RTSP soporta utenticación y autorización para proteger el acceso al contenido.
   - Puede utilizar criptografía para cifrar los datos en tránsito.
   
6. Implementación común:
   - Muchas aplicaciones de streaming utilizan RTSP junto con otros protocolos como RTP/RTCP 
   para manejar el flujo de datos.

El protocolo RTSP (Real-Time Streaming Protocol) es un protocolo de red que se utiliza principalmente para controlar y administrar flujos de video y
 audio en tiempo real. A nivel de programación, RTSP funciona de la siguiente manera:

1. Conexión inicial:
   - El cliente inicia una conexión TCP con el servidor RTSP.
   - El servidor responde con un mensaje de respuesta que incluye información sobre el flujo de streaming.

2. Autenticación:
   - Si está configurado, el servidor puede requerir autenticación del cliente antes de permitir el acceso al flujo.

3. Configuración del flujo:
   - El cliente envía solicitudes al servidor para establecer o modificar parámetros del flujo.
   - Estas solicitudes pueden incluir el formato del flujo, la velocidad de bits, y otros parámetros de calidad.

4. Control del flujo:
   - Una vez establecido el flujo, el cliente puede enviar comandos al servidor para controlar el streaming.
   - Comandos comunes incluyen pausar, reproducir, detener, y cambiar el volumen.

5. Recepción del flujo:
   - Mientras el flujo está activo, el cliente recibe los datos del servidor a través de un protocolo de transmisión separado (como RTP o MPEG-TS).
   - El cliente es responsable decodificar y reproducir los datos recibidos.

6. Cierre de la sesión:
   - Cuando el streaming termina, el cliente envía una solicitud de cierre de sesión al servidor.
   - El servidor confirma el cierre de la sesión.

En términos de programación, implementar RTSP generalmente implica:

1. Usar bibliotecas específicas para RTSP (como GStreamer o FFmpeg en C/C++).
2. Implementar el cliente RTSP que establece la conexión y envía las solicitudes necesarias.
3. Manejar las respuestas del servidor y actualizar el estado del flujo según sea necesario.
4. Implementar la lógica para controlar el flujo (pausar, reproducir, etc.) basándose en las capacidades del cliente.


##Herramientas de seguridad para escanear 


                                                                                                                                                       
1. Nmap:                                                                                                                                               
   Nmap es una herramienta poderosa y versátil para escaneo de redes y seguridad. Puedes usarlo para:                                                  

   - Escanear dispositivos en tu red local
   - Identificar puertos abiertos
   - Probar vulnerabilidades comunes

2. Wireshark:
   Es una herramienta de análisis de tráfico de red que te permitirá:

   - Capturar y analizar paquetes de red
   - Identificar protocolos y servicios en uso
   - Buscar signos de intrusiones

3. OpenVAS:
   Es una plataforma de vulnerabilidad que ofrece:

   - Escaneo de vulnerabilidades
   - Informe dtallado sobre las vulnerabilidades encontradas
   - Corrección automática de algunas vulnerabilidades

4. Metasploit:
   Una herramienta pr pruebas de penetración que te permite:

   - Exploitar vulnerabilidades conocidas
   - Crear exploits personalizados
   - Simular ataques comunes

5. Nessus:
   Otra herramienta de escaneo de vulnerabilidades que ofrece:

