1. Rendimiento:                                                                                                                        
- Aceleración GPU                                                                                                                      
- Muy rápido y ligero                                                                                                                  
- Bajo consumo de recursos                                                                                                             
                                                                                                                                       
2. Características avanzadas:                                                                                                          
- Soporte para imágenes en terminal                                                                                                    
- Ligaduras de fuentes                                                                                                                 
- Múltiples pestañas y ventanas                                                                                                        
- Compatibilidad con emojis y Unicode                                                                                                  
                                                                                                                                       
Sugerencias para ser más productivo con Kitty:                                                                                         
                                                                                                                                       
1. Atajos de teclado útiles:                                                                                                           
- Ctrl+Shift+T: Nueva pestaña                                                                                                          
- Ctrl+Shift+Enter: Nuevo split horizontal (pendiente configurar split verical)                                                                                                      
- Ctrl+Shift+W: Cerrar ventana
- Ctrl+Shift+Left/Right: Navegar entre pestañas
- Ctrl+Shift+J: Duplicar pestaña 

2. Configuraciones recomendadas:
- Crear un archivo de configuración: ~/.config/kitty/kitty.conf
- Personalizar fuentes y colores
- Configurar atajos personalizados
- abrir con un editor micro o emacs  

3. Funcionalidades avanzadas:
- Usar layouts predefinidos
- Configurar sesiones guardadas
- Integrar con tmux para más flexibilidad

4. Productividad:
- Usar el modo de copiar/pegar
- Configurar scripts personalizados
- Usar el modo de búsqueda (Ctrl+Shift+F)

5. Personalización:
- Temas personalizados
- Ajustar opacidad
- Configurar bordes y padding

1. Layouts predefinidos:                                                                                                               
- Kitty permite guardar y cargar layouts personalizados                                                                                
- Puedes definirlos en el archivo kitty.conf                                                                                           
- Ejemplo básico de layout:                                                                                                            
```                                                                                                                                    
layout tall                                                                                                                            
# o                                                                                                                                    
layout fat                                                                                                                             
# o                                                                                                                                    
layout grid                                                                                                                            
```                     
2. Sesiones:                                                                                                                           
- Puedes crear archivos de sesión (.conf)                                                                                              
- Estos definen cómo se abrirá Kitty con ventanas y comandos específicos                                                               
- Ejemplo de archivo de sesión:                                                                                                        
```                                                                                                                                    
new_tab mi_proyecto                                                                                                                    
cd ~/proyectos/mi_proyecto                                                                                                             
launch zsh                                                                                                                             
                                                                                                                                       
new_tab logs                                                                                                                           
cd ~/logs                                                                                                                              
launch tail -f app.log
```

3. Startup Sessions:
- Define cómo quieres que Kitty arranque
- Se configura en kitty.conf o en un archivo separado
- Se puede iniciar con: `kitty --session nombre_sesion.conf`

4. Temas:
- Kitty incluye temas predefinidos
- Puedes crear tus propios temas
- Se pueden cambiar en tiempo real


2. Sesiones:                                                                                                                           
- Puedes crear archivos de sesión (.conf)                                                                                              
- Estos definen cómo se abrirá Kitty con ventanas y comandos específicos                                                               
- Ejemplo de archivo de sesión:                                                                                                        
```                                                                                                                                    
new_tab mi_proyecto                                                                                                                    
cd ~/proyectos/mi_proyecto                                                                                                             
launch zsh                                                                                                                             
                                                                                                                                       
new_tab logs                                                                                                                           
cd ~/logs                                                                                                                              
launch tail -f app.log
```

3. Startup Sessions:
- Define cómo quieres que Kitty arranque
- Se configura en kitty.conf o en un archivo separado
- Se puede iniciar con: `kitty --session nombre_sesion.conf`

4. Temas:
- Kitty incluye temas predefinidos
- Puedes crear tus propios temas
- Se pueden cambiar en tiempo real



5. Algunos temas populares incluidos:
- Dracula
- Monokai
- Solarized Dark/Light
- Tomorrow Night
- Material

```
  escribe el comando directamente en el terminal para listar los themas 
kitty +kitten themes
```
6. Para volver al tema por defecto:
```bash
kitty +kitten themes --reload-in=all Default
```

1. Abre el archivo de configuración de Kitty:
   Usa un editor de texto para abrir el archivo. Si no existe, créalo:
   ```
   nano ~/.config/kitty/kitty.conf
   ```

2. Añade o modifica la línea que especifica la fuente:
   ```
   font_family NombreDeTuFuente
   ```
   Por ejemplo:
   ```
   font_family DejaVu Sans Mono
   ```

3. También puedes especificar el tamaño de la fuente:
   ```
   font_size 12.0
   ```

4. Guarda el archivo y ciérralo.

5. Reinicia Kitty para que los cambios surtan efecto.

Para ver las fuentes disponibles en tu sistema, puedes usar el comando:
```
fc-list : family
```

Asegúrate de que la fuente que elijas esté instalada en tu sistema. Si quieres instalar nuevas fuentes, puedes hacerlo con:
```
sudo apt install fonts-nome-del-paquete

```

#Entrar al terminal de kitty 

-Ctrl + Shif + Esc 

#Salir de terminal 

- Ctrl + Shift + w 





