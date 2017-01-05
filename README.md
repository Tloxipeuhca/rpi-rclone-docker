# rpi-rclone

Docker image containing RCLONE that is compatible to the Raspberry Pi.
Rclone is a command line program to sync files and directories to and from
+Google Drive
+Amazon S3
+Openstack Swift / Rackspace cloud files / Memset Memstore
+Dropbox
+Google Cloud Storage
+Amazon Drive
+Microsoft One Drive
+Hubic
+Backblaze B2
+Yandex Disk
+The local filesystem

### Build the Docker Image
```bash
make build
```

### Run the Docker Image and get version of installed RCLONE
```bash
make version
```

### Push Docker Image to Docker Hub
* First, use a `docker login` with username, password and email address
* Second, push Docker Image to the official Docker Hub
```bash
make push
```

### How to use this image
```docker
docker run -it --rm=true \
  -v $HOME/dropbox:/home/pi/dropbox \
  -v ./.rclone.conf:/root/.rclone.conf \
  tloxipeuhca/rpi-rclone \
  rclone --transfers=1 -v sync /home/pi/dropbox Dropbox:/
```

### Links
+[rclone](http://rclone.org/)
+[rpi-golang](https://github.com/hypriot/rpi-golang)
