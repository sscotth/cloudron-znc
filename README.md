# Cloudron-ZNC

ZNC is an IRC network bounce or proxy service that remains persistently connected to your preferred IRC networks and channels.

## Installation

### CLI

`cloudron install --appstore-id io.sscotth.cloudronznc@0.1.4`

### Web

[https://__yourcloudronserver__/#/appstore/io.sscotth.cloudronznc?version=0.1.4](https://__yourcloudronserver__/#/appstore/io.sscotth.cloudronznc?version=0.1.4)

During the install, you will be asked for a "ZNC Port" number. This will be the port that you will use to connect with your IRC client.

## Usage

ZNC is **not** yet integrated with the Cloudron user management.

The app comes with a pre-setup admin account with the following credentials:

* Username: `admin`
* Password: `changeme`

**Please change the admin password on first login!**

To login from IRC, you need to use port 6697 or the port selected during installation and SSL.

The default configuration will login to freenode and join the #cloudron channel to make sure everything works. Upload your own znc.conf with `cloudron push znc.conf /app/data/configs/znc.conf` or make changes with the web interface.

## TODO:

* Multi-users/Single sign-on
* Add tests
* Submit for review
