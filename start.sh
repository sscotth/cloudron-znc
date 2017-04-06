#!/bin/sh

echo "Running Cloudron-ZNC start script..."

echo "Setting up data directory for ZNC"
mkdir -p /app/data/configs

if ! [ -f /app/data/configs/znc.conf ]; then
  echo "Using a fresh installation"

  echo "Generating password and hash for ZNC default user"
  default_user=admin
  default_password=changeme
  rand_salt=$(pwgen -1cns 20)
  rand_hash="$(echo -n ${default_password}${rand_salt} | shasum -a 256 | awk '{print $1}')"

  echo "Editing ZNC config file with default user information and using port ${ZNC_PORT:-6697}"
  sed \
      -e "s/__ZNC_PORT__/${ZNC_PORT:-6697}/" \
      -e "s/__salt__/${rand_salt}/" \
      -e "s/__hash__/${rand_hash}/" \
      -e "s/__user__/${default_user}/" \
      /app/code/znc.conf.template > /app/data/configs/znc.conf

  echo "Done."
fi

echo "Generating a fresh pemfile for ZNC to use for SSL in the specified directory"
/usr/bin/znc -pd /app/data

echo "Setting permissions"
chown -R cloudron:cloudron /app/data

echo "Starting ZNC in debug mode in the specified directory as the cloudron user account"
/usr/local/bin/gosu cloudron:cloudron /usr/bin/znc -Dd /app/data
