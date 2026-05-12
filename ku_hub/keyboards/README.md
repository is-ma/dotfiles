# Forzar el Fn Lock en el K380 de Logitech

## Descargar herramientas
sudo apt update
sudo apt install build-essential libusb-1.0-0-dev

## Descarga y compila
git clone https://github.com/jergusg/k380-function-keys-conf.git
cd k380-conf
make

## Prueba el comando:
Primero identifica en qué "puerto" de HID quedó tu teclado. Suele ser /dev/hidraw2 o similar.

`sudo ./k380_conf -d /dev/hidraw2 -f on`

Si te da error de "Device not found", prueba con hidraw1, hidraw3, etc., hasta que no dé error. En cuanto el comando sea exitoso, tu teclado hará el "swap" al instante.

## Automatiza
- Movimos la repo que descargamos a /opt/
- Hicimos un script para encontrar el hidrawN adecuado (con copia para ku_hub/)
- Automatizamos metiendo el script en Autostart
