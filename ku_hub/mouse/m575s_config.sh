#!/bin/bash

# Nombre del dispositivo tal cual aparece en xinput list
DEVICE="ERGO M575 Mouse"

# 1. Activa el método de scroll por botón (botón central por defecto)
xinput set-prop "$DEVICE" "libinput Scroll Method Enabled" 0, 0, 1

# 2. Ajusta la suavidad del arco de violín (el valor mágico que nos gustó)
xinput set-prop "$DEVICE" "libinput Scrolling Pixel Distance" 45

