#!/bin/bash

# --- Configuración del Teclado K380 ---
# 1. Buscamos el ID dinámico
DEV_K380=$(grep -l "Keyboard K380" /sys/class/hidraw/hidraw*/device/uevent | cut -d/ -f5)

# 2. Aplicamos el swap de teclas F si lo encontramos
if [ -n "$DEV_K380" ]; then
    # Usamos la ruta absoluta donde dejaste el binario compilado
    sudo /opt/k380-function-keys-conf/k380_conf -d /dev/$DEV_K380 -f on
fi

