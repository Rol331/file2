###Primero debo saber el rango de  con este comando:
ip addr show wlo1 -->solo en ubunto 
####Segundo se escanea el rango :
nmap -sn 192.168.20.0/24

#############NMAP#########################

1. **Escaneo básico de puertos:**
   Para obtener información sobre los puertos abiertos en los dispositivos de tu red, puedes usar el siguiente comando:

   ```bash
   nmap 192.168.20.0/24
   ```

   Esto escaneará todos los dispositivos en la red y mostrará los puertos abiertos en cada uno.

2. **Escaneo de servicios:**
   Si deseas obtener más información sobre los servicios que se están ejecutando en los puertos abiertos, puedes usar la opción `-sV`:

   ```bash
   nmap -sV 192.168.20.0/24
   ```

   Esto intentará identificar los servicios y versiones que están corriendo en los puertos abiertos.

3. **Escaneo de sistema operativo:**
   Para intentar identificar el sistema operativo de los dispositivos, puedes usar la opción `-O`:

   ```bash
   nmap -O 192.168.20.0/24
   ```

   Ten en cuenta que para identificar el sistema operativo de manera precisa, Nmap puede necesitar permisos de superusuario, así que podrías necesitar ejecutar el comando con `sudo`:

   ```bash
   sudo nmap -O 192.168.20.0/24
   ```

4. **Escaneo detallado:**
   Si deseas un escaneo más detallado que incluya información sobre los scripts de Nmap, puedes utilizar la opción `-sC`:

   ```bash
   nmap -sC 192.168.20.0/24
   ```

   Esto ejecutará algunos scripts predeterminados que pueden proporcionar información adicional sobre los dispositivos.

5. **Combinando opciones:**
   También puedes combinar varias opciones para obtener un escaneo más completo. Por ejemplo:

   ```bash
   sudo nmap -sV -O -sC 192.168.20.0/24
   ```

   Esto realizará un escaneo de versiones de servicios, intentará identificar el sistema operativo y ejecutará scripts prede


