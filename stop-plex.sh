#!/usr/bin/fish

# Stop docker container
echo "Stopping Plex server..."
docker compose down

# Unmount media partition
if mountpoint -q /mnt/media
    echo "Unmounting media partition..."
    sudo umount /mnt/media
end

echo "Plex server stopped and partition unmounted."