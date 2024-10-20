# Pi Hole

## Troubleshooting

### Port 53 is already in use!

If you're on Ubuntu, [the official documentation](https://github.com/pi-hole/docker-pi-hole/?tab=readme-ov-file#installing-on-ubuntu-or-fedora) for pi hole mentions you need to disable systemd-resolved which listens on port 53 by default:

```sh
sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'
sudo systemctl restart systemd-resolved
```
