# Minecraft

Hosts a Modded Minecraft server running Medieval Minecraft.

Requires some preconfiguration on the NFS share before you can boot up for the
first time.

TODO: Copy my notes on initial setup into this README.

## Usage

Get docker swarm going

Set node(s) as placement target with a node label:
Key: `deployment.target.minecraft`
Value: `true`
