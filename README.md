# Docker - transmission with UID/GID handling [![Paypal donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/donate/?business=HZF49NM9D35SJ&no_recurring=0&currency_code=CAD)

### Table Of Content
<!-- TOC -->

- [Build](#build)
- [Usage](#usage)
  - [Host Directories and Volume Mapping](#host-directories-and-volume-mapping)
  - [Run](#run)
  - [Compose](#compose)
- [Repository](#repository)
- [Contributors](#contributors)
- [Change Log](#change-log)
- [License](#license)

<!-- /TOC -->

### Build

```sh
git clone https://github.com/J-Siu/docker_transmission.git
cd docker_transmission
docker build --network=host -t jsiu/transmission .
```

### Usage

#### Host Directories and Volume Mapping

Host|Inside Container|Mapping Required|Usage
---|---|---|---
${TZ}|P_TZ|no|time zone
${TRANSMISSION_UID}|PUID|yes|transmission uid
${TRANSMISSION_GID}|PGID|yes|transmission gid
${TRANSMISSION_CNF}|/transmission/.config/transmission-daemon|yes|transmission config directory
${TRANSMISSION_TWC}|PTWC|no|Optional Transmission Web Control(true/false)

#### Run

```docker
docker run \
-d \
-e PUID=1001 \
-e PGID=1002 \
-e P_TZ=America/New_York \
-v /home/jsiu/transmission:/transmission/.config/transmission-daemon \
--network=host \
jsiu/transmission
```

#### Compose

Get docker-compose template from image:

```docker
docker run --rm jsiu/transmission cat /docker-compose.yml > docker-compose.yml
docker run --rm jsiu/transmission cat /env > .env
```

Fill in `.env` according to your environment.

```sh
docker-compose up
```

### Repository

- [docker_transmission](https://github.com/J-Siu/docker_transmission)

### Contributors

- [John Sing Dao Siu](https://github.com/J-Siu)

### Change Log

- 2.94
  - transmission version 2.94
- 3.00-r0
  - transmission version 3.00-r0
- 3.00-r0-p1
  - transmission version 3.00-r0
  - Add postfix `-p1` to indicate container update
  - Dockerfile remove apk update
  - start.sh
    - Use exec so start.sh can exit
    - Remove delgroup ${PUSR}
- 3.00-r2
  - Auto update to 3.00-r2
- 3.00-r3
  - Auto update to 3.00-r3
- 3.00-r6
  - Auto update to 3.00-r6
- 3.00-r6-p1
  - Add docker push github workflow
- 4.0.2-r2
  - Auto update to 4.0.2-r2
- 4.0.3-r2
  - Auto update to 4.0.3-r2
<!--CHANGE-LOG-END-->

### License

The MIT License

Copyright (c) 2023

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
