Aquí tienes una guía básica para comenzar:

1. **Instalar Tor**: Primero, necesitas instalar Tor. En Ubuntu, puedes hacerlo desde los repositorios oficiales:

   ```bash
   sudo apt update
   sudo apt install tor
   ```

2. **Configurar Tor**: Asegúrate de que el servicio de Tor esté corriendo. Puedes iniciarlo con:

   ```bash
   sudo service tor start
   ```

3. **Asegúrate de que Tor esté corriendo**: Verifica que el servicio Tor esté activo. Puedes comprobarlo con el siguiente comando:

   ```bash
   sudo service tor status
   ```

   Si no está corriendo, inicia el servicio con:

   ```bash
   sudo service tor start
   ```

4. **Instalar y usar `torsocks`**: Si no lo tienes instalado, puedes instalar `torsocks` con:

   ```bash
   sudo apt install torsocks
   ```

   Luego, ejecuta `w3m` con `torsocks`:

   ```bash
   torsocks w3m http://kfj2am4ee2asdqflt4tuxxwbeuzmh6tv64ojbqscc4u55skrechsxzad.onion/
   ```

5. **Verificar la configuración de `torsocks`**: Asegúrate de que `torsocks` esté configurado correctamente para usar el puerto SOCKS de Tor.
 Esto normalmente se configura automáticamente, 
 pero puedes verificar el archivo de configuración en `/etc/tor/torsocks.conf` si es necesario.

6. **Links**

hiden wiki: http://xmh57jrknzkhv6y3ls3ubitzfqnkrwxhopf5aygthi7d6rplyvk3noyd.onion/cgi-bin/omega/omega

