cat << EOF >> ~/.bash_profile
#
### IS-MA: ALIAZ (Mac OS) ### [type 'alim' to list them all]
source ~/.is-ma/aliaz/mods/mac_only.sh
source ~/.is-ma/aliaz/mods/any_os.sh
EOF

# silent source
source ~/.bash_profile > /dev/null 2>&1
