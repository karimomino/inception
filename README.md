
# Inception

## About

**Inception** is an infrastructure-as-code project designed to set up a multi-service application using Docker. It involves deploying several services in isolated containers and ensuring they work together seamlessly.

## How It Works

The project utilizes Docker to containerize each service, with Docker Compose orchestrating the interaction between the different containers. The services set up in this project include:

- **NGINX**: A web server to handle HTTP requests.
- **WordPress**: A content management system (CMS) for building websites.
- **MariaDB**: A relational database management system.

All services are built on the Alpine Linux image to ensure a lightweight and efficient setup.

## Quick Start

### Prerequisites

- Docker and Docker Compose installed on your machine.
- Basic understanding of Docker and networking concepts.

### Steps to Run

1. **Clone the repository:**
   ```sh
   git clone https://github.com/karimomino/inception.git
   cd inception
   ```

2. **Build and start the Docker images:**
   ```sh
   make
   ```

   This will set up and start the multi-service application as defined in the `docker-compose.yml` file.

### Clean up & Rebuilding
**To stop the services:**
   ```sh
   make down
   ```

**To rebuild and restart the services:**
   ```sh
   make re
   ```

**To clean up Docker containers, images, volumes, and networks:**
   ```sh
   make clean
   ```

## Contact

For any questions or issues, please open an issue on GitHub or contact me.
