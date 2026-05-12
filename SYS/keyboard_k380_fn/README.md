# Make function keys default on Logitech k380 bluetooth keyboard.
# 
# https://github.com/jergusg/k380-function-keys-conf
# c0363e2 - 2021/Nov/28
# - k380_conf: El binario que hace la magia.
# - fn_on.sh: Ejecuta cuando se detecta el dispositivo.
# - 80-k380.rules: El disparador que automatiza todo.
# (ejecución para scripts, 755; lectura para reglas, 644)

sudo install -o root -g root -m 755 k380_conf /usr/local/bin/
sudo install -o root -g root -m 755 fn_on.sh /usr/local/bin/
sudo install -o root -g root -m 644 80-k380.rules /etc/udev/rules.d/

# recarga UDEV en caliente (también se cargan tras un reboot)
sudo udevadm control --reload-rules && sudo udevadm trigger

