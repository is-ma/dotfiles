cat << EOF >> ~/.bashrc
#
### IS-MA: ALIAZ (Bash) ### [type 'alib' to list them all]
source ~/.is-ma/aliaz/mods/linux_only.sh
source ~/.is-ma/aliaz/mods/any_os.sh
EOF

# silent source
source ~/.bashrc > /dev/null 2>&1
