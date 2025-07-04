 sudo apt-get install iftop

  sudo iftop -i eth0 --> error 

  ip link show ---> listar las interfaces ( invstigar el comando a fondo  )

  sudo iftop -i wlo1  --> si listo lista que dispositivos esta usando mas data 

Resumen .- con iftop solo puede ver el trafico saliente e entrante de mi pc ( si muestra los kb de uso)


--------------------------------///////---------------------

Para listar todos los dispositivos de tu red y ver quién está consumiendo más ancho de banda, 
una herramienta de terminal que podría ser útil es **nmap** combinada con **tshark**. 
Sin embargo, estas herramientas requieren un poco más de configuración y 
conocimiento técnico para obtener la información que buscas. Aquí te explico cómo podrías usarlas:

1. **nmap**: Esta herramienta te permite escanear la red para identificar dispositivos conectados. Aunque no mide el consumo de ancho de banda, te ayudará a saber qué dispositivos están presentes.

   - Instala nmap si no lo tienes:
     ```bash
     sudo apt install nmap
     ```

   - Escanea tu red local (sustituye `192.168.1.0/24` por el rango de IPs de tu red):
     ```bash
     sudo nmap -sn 192.168.1.0/24
     ```

2. **tshark**: Para capturar y analizar el tráfico de red, puedes usar tshark, que es la versión de línea de comandos de Wireshark. 

   - Instala tshark:
     ```bash
     sudo apt install tshark
     ```

   - Para capturar tráfico en tu red y analizar qué dispositivos están usando más ancho de banda, puedes usar:
     ```bash
     sudo tshark -i wlo1 -q -z conv,ip
     ```

   Este comando te dará una lista de las conversaciones IP y el volumen de tráfico asociado a cada una.

Para una solución más completa y fácil de entender, herramientas con interfaz gráfica como **ntopng** son más adecuadas, 
pero entiendo que prefieres herramientas de terminal. 
Usar tshark con nmap te dará información detallada, pero puede requerir más interpretación y análisis manual.


------------------------///////////----------------------------------------
ip addr show  --> lista tu ip y las interfaces (similar al ifconfig)

### Qué Muestra `ip route`:

1. **Ruta Predeterminada**: Esta es la ruta que toman los paquetes cuando no hay una ruta 
específica para un destino en la tabla de enrutamiento. Normalmente apunta a la puerta de enlace (router)
 que conecta tu red local con otras redes, como internet. Se muestra a menudo como:
   ```
   default via <IP de la puerta de enlace> dev <interfaz>
   ```

2. **Rutas de Red**: Son rutas específicas para redes definidas. Indican qué interfaz y puerta de enlace deben usarse 
para llegar a una red particular. Un ejemplo de entrada podría ser:
   ```
   192.168.1.0/24 dev wlo1 proto kernel scope link src 192.168.1.5
   ```

3. **Rutas de Host**: Son rutas a hosts específicos. Son menos comunes pero pueden usarse para dirigir el tráfico a una dirección IP específica a través de una puerta de enlace particular.

4. **Rutas de Enlace Local**: Son rutas que se utilizan para la comunicación dentro del segmento de red local. A menudo tienen un alcance de "link".

### Componentes Clave de la Salida:

- **default**: Indica la puerta de enlace predeterminada.
- **via**: Especifica la dirección IP del siguiente salto o puerta de enlace.
- **dev**: Muestra la interfaz de red utilizada para la ruta.
- **proto**: Indica el protocolo que instaló la ruta (por ejemplo, kernel, estático).
- **scope**: Define el alcance de la ruta (por ejemplo, link, global).

### Ejemplo de Uso:

- **Ver la Tabla de Enrutamiento**:
  ```bash
  ip route
  ```

- **Agregar una Ruta**:
  ```bash
  sudo ip route add 192.168.2.0/24 via 192.168.1.1 dev wlo1
  ```

- **Eliminar una Ruta**:
  ```bash
  sudo ip route del 192.168.2.0/24
  ```

Entender la tabla de enrutamiento es crucial para la configuración y solución de problemas de red, 
ya que dicta cómo se enrutan los datos dentro y fuera de tu red.
