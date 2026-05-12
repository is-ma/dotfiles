# Bluetooth

Instalación y habilitación del servicio base:
```bash
sudo apt update && sudo apt install bluez bluez-tools blueman -y
sudo systemctl enable --now bluetooth
```

Revisa el servicio:
```bash
sudo systemctl status bluetooth
```

Configuración de persistencia:
```bash
# Descomenta AutoEnable en la configuración de bluez
sudo sed -i 's/^#AutoEnable=true/AutoEnable=true/' /etc/bluetooth/main.conf

# Reinicia el servicio para aplicar el cambio y verifica
sudo systemctl restart bluetooth
systemctl status bluetooth
```

Entorno de usuario (Comando para la sesión de Xfce o config de i3wm):
```bash
# Lanza el gestor en la barra de tareas (systray)
blueman-applet &
```

