# Week 1 — App Containerization

### Commands
#### Docker

- Memory
  - /tmp and /srv → Inside the container filesystem (image layers)
  - Volumes → Outside the container layers (Docker-managed)
- Run container:
  - Attached to terminal: 
  ```bash
  docker run -p 8081:80 container/name
  ```
  - Detached from the terminal: 
   ```bash
  docker run -p 8081:80 -d container/name
  ```

  Sure! Here's a quick guide to the main Dockerfile commands:

---

* **`FROM`** – Sets the base image for the container.
  *Example:*

  ```dockerfile
  FROM ubuntu:20.04
  ```

---

* **`LABEL`** – Adds metadata to the image (e.g. version, author).
  *Example:*

  ```dockerfile
  LABEL maintainer="you@example.com"
  ```

---

* **`COPY`** – Copies files from your machine into the image.
  *Example:*

  ```dockerfile
  COPY app.py /app/
  ```

---

* **`EXPOSE`** – Documents which port the container will use.
  *Example:*

  ```dockerfile
  EXPOSE 80
  ```

---

* **`CMD`** – Sets the default command to run when the container starts.
  *Example:*

  ```dockerfile
  CMD ["python3", "/app/app.py"]
  ```

---

Let me know if you want the same for `RUN`, `ENV`, or `ENTRYPOINT`.


 - Check All Containers (Including Stopped Ones):
```bash
docker ps -a
```

- Check if any container are running
```bash
docker images ps
```

- Stop all containers
```bash
docker stop $(docker ps -q)
```

#### Example (without running container ? ):

- Create a Dockerfile inside backend-flask
- Get an image from Docker hub
- Run:
 - source docker-venv-backend-flask/bin/activate
 - pip install -r requirements.txt
 - python3 -m flask run --host=0.0.0.0 --port=4567
 - Environment set in the app:
  - export FRONTEND_URL="*"
  - export BACKEND_URL="*"
- python3 -m flask run --host=0.0.0.0 --port=4567
- Visit: http://localhost:4567/api/activities/home
