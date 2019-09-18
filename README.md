# ghost-blog

Everything you need to bootstrap a containerized Ghost blog on Google Cloud Platform Free Tier. 
Runs Ghost behind Nginx and encrypts web traffic with auto-renewing Let's Encrypt certificates.

## Getting started

1. Edit the values in `.env`, replacing the dummy values by your own domain name and email address.
2. Launch nginx-letsencrypt without SSL enabled.
```
docker-compose -f nginx-letsencrypt/docker-compose.yml \
  -f nginx-letsencrypt/overide.no-cert.yml up -d
```
3. Run Certbot via letsencrypt-manager to request a certificate for your blog domain.
```
docker-compose -f letsencrypt-manager/docker-compose.yml \
  run cli add blog.whatever-your-domain-is.io
```
4. Launch Ghost.
docker-compose -f ghost/docker-compose.yml up -d
5. Stop and relaunch nginx-letsencrypt, this time with SSL enabled.
```
docker-compose -f nginx-letsencrypt/docker-compose.yml up -d
```

For more details see my [blog post](https://blog.things-on-top-of-other-things.de/ghost-with-certbot-in-docker-on-gcp-free-tier).