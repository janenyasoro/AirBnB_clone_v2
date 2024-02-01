#!/usr/bin/env bash
# Prepare web server for deployment
apt-get -y update
apt-get -y install nginx
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
# Create the folder /data/ if it doesn’t already exist
# Create the folder /data/web_static/ if it doesn’t already exist
# Create the folder /data/web_static/releases/ if it doesn’t already exist
# Create the folder /data/web_static/releases/test/ if it doesn’t already exist
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test/ /data/web_static/current
# Create a symbolic link /data/web_static/current linked to the...
# .../data/web_static/releases/test/ folder. If the symbolic link already...
# ...exists, it should be deleted and recreated every time the script is ran.
chown -R ubuntu:ubuntu /data/
# Give ownership of the /data/ folder to the ubuntu user AND group (you can
# assume this user and group exist). This should be recursive; everything
# inside should be created/owned by this user/group.
sed -i '51 i \\n\tlocation /hbnb_static {\n\talias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default
# Update the Nginx configuration to serve the content of
# /data/web_static/current/ to hbnb_static
# (ex: https://mydomainname.tech/hbnb_static).
# Don’t forget to restart Nginx after updating the configuration:
service nginx restart
