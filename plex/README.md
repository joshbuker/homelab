# Plex

NOTE: While it sounds like a good idea to have the config volume be NFS so that
you can deploy to any node, unfortunately Plex suffers from massive performance
issues when doing so. Luckily though, labels make it easy to pin the Plex server
to a specific node, and the anonymous volume works well enough.
