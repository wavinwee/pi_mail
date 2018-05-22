# Install Docker (Raspbian Stretch)
The easiest method of installing Docker on a Raspberry Pi running Raspbian, is to execute a scripted install from the Docker website. 

1. `curl -sSL get.docker.com | sh` to install Docker
2. `sudo usermod -aG docker pi` to allow the pi user to manage Docker
3. `echo gpu_mem=16 >> /boot/config.txt` to decrease memory reserved for graphics operations (Optional step to improve performance)

# Launch and configure mail services
In its current state, this repository provides a minimally functional ARM-based mail environment based on separate postfix (SMTP), dovecot (IMAP), and rainloop (webmail) containers.

1. Clone or copy the repo to a raspberry pi or other ARM based device.
2. Navigate to the sub-directories for each service and build a tagged image. 
- `docker build -t postfix .` in `mail/postfix`
- `docker build -t dovecot .` in `mail/dovecot`
- `docker build -t rainloop .` in `mail/rainloop`
3. Create a user-defined container network: 
- `docker network create --driver bridge --subnet 172.18.0.0/24 mail`
4. Launch the containers as shown below:
- `docker run -itd --name dovecot --network mail --ip 172.18.0.2 -p 143:143 dovecot`
- `docker run -itd --name postfix --network mail --ip 172.18.0.3 -p 25:25 postfix`
- `docker run -itd --name rainloop --network mail --ip 172.18.0.4 -p 80:80 rainloop`
5. In a browser, navigate to `http://SERVER/?admin` to configure the domain:
- Test domain: `test.pi`
- SMTP: `172.18.0.3:587`
- IMAP: `172.18.0.2:25`
6. Navigate to `http://SERVER/` to access webmail.
- Test user: `test@test.pi` / `password`

# Restart containers
At the moment, restarting the device will result in the containers being suspended. You can restart a suspended container by calling `docker start` with the container name. To create a container that restarts itself, call `docker run` with the `--restart always` parameter.


