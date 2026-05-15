

# [a]

# [b]
alias b="batcat"

# [c]
alias c="clear"

# [d]

# [e]
alias e="vim"
ee() {  # plocate && edit
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    vim "$file"
  fi
}
ee0() {  # plocate && edit (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo vim "$file"
  fi
}

# [f]

# [g]

# [h]
alias h="history | grep -E"

# [i]
alias i="cd ~/is-ma/ && ls -F"
alias ipull='back=$(pwd); cd ~/is-ma/ && for repo in */; do cd $repo; echo -n "----- ----- ----- ----- $repo"; git for-each-ref --format="%(push:track)" refs/heads; git pull; gs; cd ..; done; cd $back'

# [j]

# [k]

# [l]
alias ll="ls -AlFh"
alias ls="ls -F"

# [m]

# [n]
alias n="nvim"

# [o]

# [p]

# [q]
alias q="exit"

# [r]
alias r='RIPGREP_CONFIG_PATH=/home/rich/is-ma/dotfiles/rg/rg.conf rg'
alias r0='sudo RIPGREP_CONFIG_PATH=/home/rich/is-ma/dotfiles/rg/rg.conf rg'

# [s]
alias s="source ~/.bashrc"
alias su="echo ''; su"
sumcol(){ awk "{s+=\$$1} END {print s}"; }  # sum numbers in column n

# [t]

# [u]
alias uu="sudo updatedb"  # updates plocate db manually (instead of 1/day)

# [v]
alias vi="vim"

# [w]
ww() {  # plocate && read
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    batcat "$file"
  fi
}
ww0() {  # plocate && read (global)
  local file=$(plocate "$1" | fzf --height=40% --layout=reverse)
  if [[ -n "$file" ]]; then
    sudo batcat "$file"
  fi
}
wo () { whois $1 | egrep "^   (Admin|Creation|Updated)"; }

# [x]

# [y]

# [z]





10:44:27|rank-4x2|~/.is-ma/custom_bash|master ✓
cat utilities.sh
# Linux configs
bind 'set enable-bracketed-paste off'                          # pega sin caracteres especiales
set -o vi                                                      # edit command-line with VI

# Historial
HISTSIZE=50000                   # Líneas en memoria
HISTFILESIZE=200000              # Líneas en ~/.bash_history
HISTCONTROL=ignoreboth:erasedups # Evita comandos duplicados en el historial
HISTTIMEFORMAT="%d/%m/%y %T "    # Formato de fecha/hora para cada comando
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND" # Sincroniza el historial
export HISTIGNORE="ls:cd:pwd:exit:clear:history" # Ignora comandos comunes

# Core
alias c="clear"
alias e="exit"
lias grept='grep -F --color=auto'   # Busca texto literal: "error crítico"
alias grepx='grep -E --color=auto'  # Busca regex extendidas: "error|warning"
alias h="history | grep -F"
alias l='ls -CF --color=auto'       # Columnas con indicadores (/ para dirs, * ejecutables)
alias la='ls -A --color=auto'       # Muestra también ocultos (excepto . y ..)
alias lk="ls -d $PWD/{*,.*} | grep -v '/\.$' | grep -v '/\.\.$'"
alias ll='ls -alhF --color=auto'     # Lista detallada (permisos, tamaño, fecha) + ocultos

# With files
alias b="source ~/.bashrc"                               # edita ~/.bashrc
alias be="vi ~/.is-ma/rk_hub/bash.sh"                    # edita ~/.bashrc
alias bee="vi ~/.is-ma/custom_bash/utilities.sh"         # edita custom_bash.sh
alias bh="less ~/.is-ma/rk_hub/custom_bash.sh"           # works as help
alias h='tac ~/.bash_history | grep --color "$1" | head -n 10' # busca fácil en el historial
alias mrm="rm /var/mail/deploy"
alias mvi="vi /var/mail/deploy"

# Utilities
replace () { find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s@$1@$2@g"; }
sumcol(){ awk "{s+=\$$1} END {print s}"; }  # sum numbers in column n

# Gestión de procesos y sistema
alias cpu='echo "CPU Usage:" && grep -E "^cpu " /proc/stat | awk "{total=\$2+\$3+\$4+\$5+\$6+\$7+\$8; used=total-\$5-\$6; printf(\"Total: %.1f%% (User: %.1f%%, System: %.1f%%, Idle: %.1f%%)\\\n\", (used/total)*100, (\$2/total)*100, (\$4/total)*100, (\$5/total)*100)}" && echo "" && ps aux --sort=-%cpu | head -n 10'
alias dfh='df -h | grep -E "^(Filesystem|/dev)"'  # Solo discos reales
alias duh='du -sh * | sort -h'  # Tamaño de directorios ordenado
alias envgrep='env | grep -i'  # Buscar en variables de entorno
alias etcm='sudo find /etc -type f -mtime -7 2>/dev/null | head -20'  # Archivos modificados en /etc
alias killing='pkill -f'      # Matar procesos por nombre: killing nombre_proceso
alias mem='free -h && echo "" && ps aux --sort=-%mem | head -n 10'
alias myps='ps -u $USER -o pid,pcpu,pmem,comm'  # Procesos del usuario actual
alias topc='top -o %CPU'      # Ordenar por CPU
alias topm='top -o %MEM'      # Ordenar por memoria
alias sys='uname -a && echo "---" && lsb_release -a 2>/dev/null || cat /etc/os-release'  # Info del sistema

# Redes y seguridad
alias curlt='curl -D - -o /dev/null -s -w "\nTTFB: %{time_starttransfer}s | Total: %{time_total}s\n"' # https://rankeando.com/2000000-bicicletas-paulini
alias curlz='curl -H "Accept-Encoding: gzip" -D - -o /dev/null -s -w "\nTTFB: %{time_starttransfer}s | Total: %{time_total}s\n"'
alias ports='sudo netstat -tulpn | grep LISTEN'  # Puertos abiertos
alias portsd='sudo lsof -i -P -n | grep LISTEN'  # Puertos con detalles de proceso
alias myip='curl -s ifconfig.me'  # IP pública
alias conn='sudo netstat -an | grep ESTABLISHED | wc -l'  # Conexiones activas
alias pingt='ping -D'  # Ping con timestamp
wo () { whois $1 | egrep "^   (Admin|Creation|Updated)"; }

# Utilidades generales
mkdircd() { mkdir -p "$1" && cd "$1"; }  # Crear directorio y entrar
alias findf='find . -type f -name'    # Buscar archivos por nombre: findf "*.log"
alias findbig='find . -type f -exec du -h {} + | sort -rh | head -20'  # Archivos más grandes
alias countfiles='find . -type f | sed -e "s/.*\.//" | sort | uniq -c | sort -rn'  # Contar por extensión
alias md5='md5sum'                    # Calcular checksum MD5
alias sha='sha256sum'                 # Calcular checksum SHA256
alias sha1='sha1sum'                  # Calcular checksum SHA1
alias serve='python3 -m http.server 8000'  # Servidor web rápido en puerto 8000
alias latest='ls -lt | head -20'      # Archivos más recientes
alias dudir='du -sh .'                # Tamaño del directorio actual

# Búsqueda y filtrado
alias hf='history | fzf'  # Buscar en historial (sudo apt-get install fzf)
alias ftext='grep -rnw . -e'  # Buscar archivos por contenido: ftext "texto"
alias toph='history | awk '\''{print $2}'\'' | sort | uniq -c | sort -rn | head -10'  # Comandos más usados

# Fail2ban aliases
alias f2="sudo /etc/init.d/fail2ban" # start | stop | restart | status
alias f2jails="sudo /usr/bin/fail2ban-client status" # ej. f2jails | f2jails sshd
alias f2live="sudo tail -f /var/log/fail2ban.log"
alias f2reload="sudo /usr/bin/fail2ban-client reload" # carga nueva configuración al vuelo
alias sshf='sudo grep "Failed password" /var/log/auth.log | wc -l'  # Intentos SSH fallidos
f2summary() {
  echo -e "\e[1;33m>>> Fail2Ban Stats <<<\e[0m"
  sudo /usr/bin/fail2ban-client status | grep "Jail list:" | sed 's/.*Jail list:\s*//' | tr ',' '\n' | while read -r jail; do
    jail=$(echo "$jail" | xargs)
    if [ -n "$jail" ]; then
      echo "$jail:"
      sudo /usr/bin/fail2ban-client status "$jail" | grep --color=auto -E "(Currently banned|Total banned)"
      sudo grep "$jail.*Ban" /var/log/fail2ban.log | awk '{gsub(/,.*/, "", $2); print $1, $2, $7, $NF}' | tail -n 5
      echo ""
      fi
  done
}

# Nginx Stats Tools
alias s='/home/deploy/.is-ma/nginx_my_stats/nginx_stats.sh'
# ej. statspair ip 17.22.245.138
# ej. date "13/Jan/2026:00:28:08 -0600"
# ej. timestamp:1768285688.391
# ej. ip 82.25.215.238
# ej. method GET
# ej. uri "/4096083-guarderia-colinas-de-san-gerardo"
# ej. status 200
# ej. bytes 6595
# ej. time 0.001
# ej. ua "Mozilla/5.0 (Windows NT 10.0; Win64; x64)..."
# ej. referer ""
# ej. host rankeando.com
minuto_anterior() {
    local minuto_anterior=$(date -d "1 minute ago" +"%d/%b/%Y:%H:%M")
    sudo tail -n 10000 /var/log/nginx/shield_access.log | grep "\"$minuto_anterior:" | jq '(.ip)' | cut -d'.' -f1-2 | sort | uniq -c | sort -n
}

### IS-MA: Serveret [Nginx] ###
alias n-status='sudo service nginx status'
alias n-start='sudo service nginx start'
alias n-stop='sudo service nginx stop'
alias n-restart='sudo service nginx restart'
alias n-reload='sudo service nginx reload'

# Nginx logs con colores y seguimiento (sudo apt-get install ccze)
alias n-tail='sudo tail -f /var/log/nginx/shield-access.log | ccze -A'  # Logs de acceso con colores
alias n-err='sudo tail -f /var/log/nginx/error.log'              # Logs de error en tiempo real

# Nginx configuración y pruebas
alias n-test='sudo nginx -t'  # Probar sintaxis de configuración
alias n-conf='sudo nginx -T'  # Mostrar configuración completa
n-go() { sudo nginx -t && sudo service nginx reload; }  # Probar y recargar si está bien

### IS-MA: Serveret [ACK] ###
alias ackf='ack --smart-case --type-add=frontend:ext:js,coffee,scss,css,haml,html,yml,md,txt --type=frontend'
alias ackr='ack --smart-case --type-add=rubyrails:ext:gitignore,js,coffee,scss,css,rb,erb,haml,html,yml,md,txt --type=rubyrails --ignore-dir=bin/ --ignore-dir=lib/ --ignore-dir=log/ --ignore-dir=public/assets/ --ignore-dir=tmp/ --ignore-dir=vendor/ --ignore-file=ext:keep,ico,cache,ackrc --ignore-file=is:package.json'
alias ackv="ack 'v\d+\.\d+\.\d+'"
function ackx { ack "$1" -l --print0 | xargs -0 -n1 sed -i '' -e "s+$1+$2+"; }  # search and replace: ackx v3.0.5 v3.0.6

# Ruby/Rails shortcuts
alias bex='bundle exec'               # bundle exec
alias bers='bundle exec rails server' # bundle exec rails server
alias bec='bundle exec rails console' # Rails console
alias bet='bundle exec rails test'    # Rails test
alias betf='bundle exec rails test:system test:controllers'  # Tests rápidos
alias bem='bundle exec rails db:migrate'  # Migrar base de datos
alias ber='bundle exec rails db:rollback' # Rollback de migración
alias routesg='bundle exec rails routes | grep'  # Buscar rutas: routesg "controller"

### IS-MA: RK_UBUNTU ###
alias u_backup="source /home/deploy/.is-ma/rk_ubuntu/backup.sh"

### IS-MA: PUSHOVER ###
alias pushover="$HOME/.is-ma/pushover/pushover.sh"

# PostgreSQL [asdf]
alias pg-start="$HOME/.asdf/installs/postgres/11.7/bin/pg_ctl -D $HOME/.asdf/installs/postgres/11.7/data -l $HOME/.asdf/installs/postgres/11.7/server.log start"
alias pg-status="$HOME/.asdf/installs/postgres/11.7/bin/pg_ctl -D $HOME/.asdf/installs/postgres/11.7/data status"
alias pg-stop="$HOME/.asdf/installs/postgres/11.7/bin/pg_ctl -D $HOME/.asdf/installs/postgres/11.7/data stop"
alias pg-con='psql -h localhost -U postgres -d'  # Conexión rápida a BD: pgcon nombre_db
alias pg-dbs='psql -h localhost -U postgres -c "\l+"'  # Ver bases de datos y tamaños

# Cache
alias cache-count="sudo find /mnt/nginx_gziped_cache -type f | wc -l"
alias cache-recent="sudo ls -lt /mnt/nginx_gziped_cache/*/* 2>/dev/null | head -20"
alias cache-size="sudo du -sh /mnt/nginx_gziped_cache"
alias uncache='curl -s -I -H "Cubeta-Purgadora: 1"' # + RK URL

# Docker (si usas)
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'  # Contenedores activos
alias dim='docker images'  # Ver imágenes
alias dlogs='docker logs -f'  # Seguir logs de contenedor
alias dstop='docker stop $(docker ps -q)'  # Detener todos los contenedores
alias dprune='docker system prune -af'  # Limpiar todo Docker
alias dclean='docker container prune'  # Limpiar contenedores detenidos
alias dstats='docker stats --no-stream'  # Estadísticas de Docker

# Aider
# -- Qwen: Qwen3 Coder 480B A35B
alias qwenfree='aider --model openrouter/qwen/qwen3-coder:free \
	              --weak-model groq/llama-3.1-8b-instant \
	              --editor-model openrouter/qwen/qwen3-coder:free
		      --no-show-model-warnings'
# 🎯 DEEPSEEK - Daily driver optimizado: 90% del tiempo
alias deepseek='aider --model deepseek/deepseek-chat \
                      --weak-model groq/llama-3.1-8b-instant \
                      --editor-model deepseek/deepseek-chat'
# 🔬 ANALYST - Cambios de arquitectura; decisiones de diseño
alias analyst='aider --model deepseek/deepseek-reasoner \
                     --weak-model groq/llama-3.1-8b-instant \
                     --editor-model deepseek/deepseek-chat'
# 👑 CLAUDE - Bug complejo que DEEPSEEK no resolvió
alias claude='aider --model claude-sonnet-4-5-20250929 \
                    --weak-model groq/llama-3.1-8b-instant \
                    --editor-model deepseek/deepseek-chat'
# 🧠 GENIUS - "Ya me rendí, trae al genio"
alias genius='aider --model claude-opus-4-5-20251101 \
                    --weak-model groq/llama-3.1-8b-instant \
                    --editor-model deepseek/deepseek-chat'


# Continue.DEV (fast)
alias groq='aider --model groq/llama-3.3-70b-versatile --weak-model groq/llama-3.1-8b-instant'
alias mistral='aider --model mistral/codestral-latest'

# Secrets
[ -f "$HOME/.secrets/ai_keys/.env" ] && source "$HOME/.secrets/ai_keys/.env"

# Disk I/O monitoring for all non-loop disks
# Usage: disks
# Shows await (ms) and %util columns with warnings for each disk
disks() {
    # Find all non-loop disks
    local disks
    disks=$(iostat | tail -n +7 | cut -d' ' -f1 | grep -v '^loop')

    # Check if any disks were found
    if [ -z "$disks" ]; then
        echo "No se encontraron discos no-loop"
        return 1
    fi

    # Show general warnings
    echo "- Mucho tiempo en cola: await > 10ms"
    echo "- Alta utilización: %util > 80%"
    echo ""

    # For each disk
    for d in $disks; do
        echo "======== Mostrando info de: $d ========"
        echo "await      %util"
        # Get 10 samples, skip the first sample (often average since boot)
        iostat -x 1 11 | grep -E "^$d" | tail -10 | awk '{printf "%-10.2f %-10.2f\n", $10, $14}'
        echo ""
    done
}

# Systemd
alias failed='systemctl --failed'  # Ver servicios systemd fallidos
alias trunc='truncate -s 0'
# Función vix: crear archivo ejecutable y abrir con vi
vix() {
  touch "$1"
  chmod +x "$1"
  vi "$1"
}

# Tabby current path support
function __tabby_prompt_command() {
  echo -ne "\033]9;9;${PWD}\007"
}
PROMPT_COMMAND="__tabby_prompt_command; $PROMPT_COMMAND"


############################### HOSTNAME-SPECIFIC CONFIG ###############################
if [[ $(hostname) == "cubeta" ]]; then
  echo ""
fi

if [[ $(hostname) == "rank-4x2" ]]; then
  ### IS-MA: Serveret [asdf] ###
  source ~/.asdf/asdf.sh
  source ~/.asdf/completions/asdf.bash

  # Show Fail2ban summary
  f2summary

  # Show last 1000 Nginx stats
  echo -e "\e[1;33m>>> RK hoy (last 1000 lines) <<<\e[0m"
  sudo tail -n1000 /var/log/nginx/shield_access.log | jq '(.status)' | sort | uniq -c | sort -nr
  echo ""

  # Show fast cache health
  echo -e "\e[1;33m>>> Cache health <<<\e[0m"
  df -h | grep 'sdb'
  echo ""





  # --- IPSET Aliases para "ataques" ---
  alias ipset_list='sudo ipset list -n'
  # Gestión de Estructura (Crea e inmediatamente vincula a iptables)
  ataques_create_ipset() {
    sudo ipset create ataques hash:ip -! timeout 0
    sudo iptables -C INPUT -m set --match-set ataques src -j DROP 2>/dev/null || \
    sudo iptables -I INPUT -m set --match-set ataques src -j DROP
    echo "Lista 'ataques' creada y vinculada a iptables."
  }
  # Visualización y Conteo
  alias ataques_count='sudo ipset list ataques | grep "Number of entries"'
  alias ataques_list='sudo ipset list ataques | less'
  alias ataques_tail='sudo ipset list ataques | grep -A 100 "Members" | tail -n 10'
  alias ataques_check='sudo iptables -L -n -v | grep ataques'
  # Operaciones con IPs
  ataques_push() {
    sudo ipset add ataques "$1"
  }
  ataques_pop() {
    sudo ipset del ataques "$1"
  }
  # Meter una IP de prueba (Cloudflare DNS) para verificar flujo
  alias ataques_test='sudo ipset add ataques 1.1.1.1 && echo "IP 1.1.1.1 añadida para pruebas."'
  alias ataques_flush='sudo ipset flush ataques'
  # Borrado total y desvinculación
  ataques_delete_ipset() {
    sudo iptables -D INPUT -m set --match-set ataques src -j DROP 2>/dev/null
    sudo ipset destroy ataques 2>/dev/null
    echo "Regla de iptables removida e ipset 'ataques' eliminado."
  }







fi
10:44:56|rank-4x2|~/.is-ma/custom_bash|master ✓
