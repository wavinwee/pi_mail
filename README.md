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
