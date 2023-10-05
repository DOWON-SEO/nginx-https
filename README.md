# NGINX HTTPS Deployment

This Repository provides a set of files for hassle-free HTTPS deployment using NGINX and Let's Encrypt, ensuring your web services are secure.

## Getting Started

### Prerequisites

-   Docker and Docker Compose installed on your system.
-   Domain names pointing to your server.

### Installation

1. Clone this repository to your server.
2. Copy `.env.example` to a new file named `.env`.
3. Edit the `.env` file and fill in your email, domain details, and other configuration settings.

## Usage

1. Run `docker compose up` script to create new container.
2. `init-letsencrypt.sh` will be executed and generate an SSL Certificate
3. Your NGINX will be up and configured to serve your domains over HTTPS.

### Files Explanation

-   `init-letsencrypt.sh`: This script automates the process of getting certificates from Let's Encrypt.
-   `nginx.conf.template`: This is the configuration template for your NGINX server.
-   `.env.example`: An example environment file. Copy this to `.env` and fill in your details.

### Detailed Steps

**Setting up Environment Variables**

Open the `.env` file and update the values:

-   `SERVER_EMAIL`: Your email address.
-   `SERVER_DOMAIN_LIST`: Space-separated list of domains you want to get SSL certificates for (e.g., "test.example.com api.example.com").
-   `SERVER_TEST_DOMAIN`: Your test domain name.
-   `SERVER_TEST_PORT`: Port number for your test server.
-   `SERVER_TEST_NAME`: Name of your test service.

**Initializing Let's Encrypt**

You'll have to run the `init-letsencrypt.sh` script manually sometimes. This script performs the following tasks:

-   Checks for existing data and prompts for replacement if found.
-   Downloads recommended TLS parameters.
-   Creates a dummy certificate.
-   Starts NGINX.
-   Deletes the dummy certificate.
-   Requests a Let’s Encrypt certificate.
-   Reloads NGINX.

**NGINX Configuration**

The `nginx.conf.template` file is used for the NGINX configuration. It includes settings for listening on ports 80 and 443, server name, SSL certificates paths, and proxy pass configuration.

`nginx.conf.generate.sh` will be executed automatically when Docker is generated. then `nginx.conf` will be generated. You don't have to run the script manually.

## Contributing

If you'd like to improve this project, feel free to fork the repository and submit a pull request.

## Tips

-   Make sure your domains are pointing to the correct server IP.
-   Ensure ports 80 and 443 are open and forwarded to your server.
-   For testing purposes, you can set the `staging` variable in the `init-letsencrypt.sh` script to avoid hitting request limits.

## License

This project is open-source and available under the [MIT License](LICENSE).

## Acknowledgments

Thanks to the Let's Encrypt community and everyone contributing to this project.

---

Enjoy secure and fast hosting with NGINX and Let's Encrypt
