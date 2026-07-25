```
/interface veth
  add address=192.168.40.2/24 dhcp=no gateway=192.168.40.1 name=veth2-occlient
/container
  add envlists=occlient interface=veth2-occlient name=oc-client remote-image=registry-1.docker.io/romka/mikrotik-openconnect-client restart-policy=always root-dir=/usb1/containers/openconnect-client start-on-boot=yes workdir=/
/container envs
  add key=CONNECTION_LOGS list=occlient value=/dev/null
  add key=INTERFACE_NAME list=occlient value=vpn0
  add key=SERVER list=occlient value="__URL__"
  add key=USERNAME list=occlient value=__NAME__
  add key=PASSWORD list=occlient value=___PASSWORD__
  add key=OC_OPTIONS list=occlient value="--servercert pin-sha256:__SHA256__ --reconnect-timeout=300"
```
