# Plex

This contains a docker compose file that can be used to run Plex via a Docker Swarm.

This guide assumes that you have a functional NFS share for your Plex library data, and know how to operate within Docker Swarm.

> [!NOTE]
> While it sounds like a good idea to have the config volume be NFS so that
you can deploy to any node, unfortunately Plex suffers from massive performance
issues when doing so. Luckily though, labels make it easy to pin the Plex server
to a specific node, and the anonymous volume works well enough.

## Usage

Configure the following environment variables:

- `PLEX_CLAIM_TOKEN`
- `PLEX_ADVERTISE_IP`
- `PLEX_NAS_ADDRESS`
- `PLEX_NAS_DEVICE`

### PLEX_CLAIM_TOKEN

This is the randomly generated token used to sync your Plex server with your Plex account.

You can obtain this token by going to: [plex.tv/claim](https://www.plex.tv/claim/)

However, be aware that this token only lasts for 4 minutes, so you will likely need to generate it around the time of deployment to prevent it expiring early.

This token is only needed on the first run, or whenever the configuration data is wiped and needs regenerated (e.g. migrating to a new node).

### PLEX_ADVERTISE_IP

The IP address that your Plex server will use as its canonical IP.

After testing, it appears that this does not appear to automatically redirect clients, e.g. when connecting to other nodes within a Docker Swarm. If you know more about what this does, please open a pull request.

### PLEX_NAS_ADDRESS and PLEX_NAS_DEVICE

These control access to the NFS share used to host your Plex data.

`PLEX_NAS_ADDRESS` is the IP of your NFS host.
`PLEX_NAS_DEVICE` is the mount point of the Plex data/library share.

### Setup from Plex GUI

After booting up the service, and visiting the web interface, you'll want to configure the LAN Networks value under Settings -> Network.

LAN Networks controls which subnets are treated as LAN, and won't be throttled by any bandwidth restrictions placed in Settings -> Remote Access.
