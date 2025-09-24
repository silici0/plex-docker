#!/usr/bin/fish

# Create mount point if it doesn't exist
sudo mkdir -p /mnt/media

# Unmount if already mounted and mount correct partition
if mountpoint -q /mnt/media
    echo "Unmounting current partition..."
    sudo umount /mnt/media
end

echo "Mounting media partition..."
sudo mount /dev/nvme0n1p5 /mnt/media

# Create symlink for media access
rm -f /home/rafael/media
ln -sf /mnt/media/media /home/rafael/media

# Wait for Docker to be ready
echo "Waiting for Docker..."
sleep 5

# Start docker-compose
echo "Starting Plex server..."
docker compose up -d

echo "Plex server started. Check status with: docker compose ps"