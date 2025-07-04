#Guardando solucion de caidas de cursor 

El problema para esta relacionado con el limite de archivos , que el sistema permite vigilar simultanemente ;

cuando el limite es demasiado bajo , el proceso de cargado de observar cambios archivos (filewathche) es terminado por el sistema 

se deb mejorar la configuracion inotify en sistemas Linux

inacons@Laptop-Alienware ~> cat /proc/sys/fs/inotify/max_user_watches
65536
inacons@Laptop-Alienware ~>

hay que configurar cambios :

inacons@Laptop-Alienware ~> echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/60
-max_user_watches.conf
                                                                           tee /etc/sysctl.d/60
-max_user_watches.conf

[sudo] contraseña para inacons: 
fs.inotify.max_user_watches=524288
inacons@Laptop-Alienware ~>


inacons@Laptop-Alienware ~> echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/60
-max_user_watches.conf
                                                                           tee /etc/sysctl.d/60
-max_user_watches.conf

[sudo] contraseña para inacons: 
fs.inotify.max_user_watches=524288
inacons@Laptop-Alienware ~>

inacons@Laptop-Alienware ~> Sudo sysctl -p --system

kernel.kptr_restrict = 1
kernel.sysrq = 176
vm.max_map_count = 1048576
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.all.rp_filter = 2
kernel.yama.ptrace_scope = 1
vm.mmap_min_addr = 65536
fs.inotify.max_user_watches = 65536
kernel.unprivileged_userns_clone = 1
kernel.pid_max = 4194304
fs.inotify.max_user_watches = 524288
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
inacons@Laptop-Alienware ~> 
#### Segunda posible solucion 


Abre Cursor.
Abre la Paleta de Comandos con Ctrl+Shift+P.
Escribe y selecciona la opción: Help: Start Extension Bisect (o en español podría aparecer como Ayuda: Iniciar Bisect de Extensiones).
Sigue las instrucciones. Cursor se reiniciará con un número reducido de extensiones activadas.
Intenta reproducir el problema (abriendo tu segundo proyecto).
Cursor te preguntará si el problema sigue ocurriendo ("Good" si se arregló, "Bad" si persiste).
Repite el proceso hasta que la herramienta te diga cuál es la extensión problemática.
Una vez que identifiques la extensión, puedes decidir si la deshabilitas, la desinstalas o buscas una alternativa.
Este método es la forma más eficiente de confirmar si el problema es una extensión y, de ser así, cuál es. ¡Pruébalo y cuéntame el resultado
