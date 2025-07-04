### Ejemplos de uso

1. **Copiar texto al portapapeles:**

   Si quieres copiar el texto "Hola Mundo" al portapapeles, puedes usar el siguiente comando:

   ```bash
   echo "Hola Mundo" | xclip -selection clipboard
   ```

   Esto copia el texto "Hola Mundo" al portapapeles del sistema, lo que te permite pegarlo en cualquier otra aplicación usando `Ctrl + V`.

2. **Pegar texto desde el portapapeles:**

   Para pegar texto desde el portapapeles a la terminal, puedes usar:

   ```bash
   xclip -selection clipboard -o
   ```

   Este comando imprimirá el contenido del portapapeles en la terminal.

3. **Copiar contenido de un archivo al portapapeles:**

   Si tienes un archivo llamado `archivo.txt` y quieres copiar su contenido al portapapeles, usa:

   ```bash
   xclip -selection clipboard < archivo.txt
   ```

4. **Guardar el contenido del portapapeles en un archivo:**

   Para guardar el contenido del portapapeles en un archivo llamado `output.txt`, puedes hacer:

   ```bash
   xclip -selection clipboard -o > output.txt
