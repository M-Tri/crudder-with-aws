## Week 1 — App Containerization

#### Commands
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

#### Example (without running container ? )

- Create a Dockerfile inside backend-flask
- Get an image from Docker hub
- Run locally:
 - Move to backend-flask file
 - Make sure that you ran: conda deactivate
 - source docker-venv-backend-flask/bin/activate
 - pip install -r requirements.txt
 - Environment set in the app:
  - export FRONTEND_URL="*"
  - export BACKEND_URL="*"
- python3 -m flask run --host=0.0.0.0 --port=4567
- Visit: http://localhost:4567/api/activities/home

#### Example (with using docker ?)

- Run with image:
  - Open docker app (daemon)
  - Unset un-needed env variables : unset BACKEND_URL FRONTEND_URL
  - Then, move current directory to 'aws-bootcamp-cruddur' folder
  - Now, in vscode, navigate to docker extension tab. There you will find confirmation that the image has been created
  - docker run --rm -p 4567:4567 -it backend-flask : wrong
  - http://localhost:4567/api/activities/home : will not work
  - how wo fix ?
  - Make sure you are in the correct file. In this case inside aws-bootcamp-cruddur
  - You need to explicitly pass them in when you run the container: 
    - **Option 1**: 
      - export FRONTEND_URL="*"
      - export BACKEND_URL="*"
      then,
      - docker run -e FRONTEND_URL -e BACKEND_URL backend-flask
    - **Option 2**:
      - Set variables ,give it a name and run it at the same time :
        - docker run --name aws-docker -e FRONTEND_URL="*" -e BACKEND_URL="*" -p 4567:4567 backend-flask
  - If the container already exist (stopped), use 'docker start container name'
  - Check with docker ps -a for all containers, and docker ps for currently running containers
  - Go to : http://localhost:4567/api/activities/home


#### Trouble shoot
- docker run --help or docker run --help | less (open with less, can also use vim)
  - Open help and use /(search backward) or ?(search forward). Example type '/env' to find : -e to set environment variables.
- Go to vscode -> docker extension -> right click on container -> find logs or use attach shell (you are in the container, you need to start it first)

#### Clean up
- Understand the differences between removing images vs removing containers.


#### Set up the project frontend
- cd frontend-react-js/
- install npm
- Create file Dockerfile in frontend, add : image. 
  - FROM: node:16.18, you’re starting with a prebuilt container image that already has Node installed in it.
- Go back to main file aws-bootcamp-cruddur

#### Build both frontend/backend using a .yml and docker compose lib (connects all)

- run : docker compose -f docker compose.yaml up -d --build. 
  - Note: You do not have 'docker-compose' but you do have 'docker compose' installed.
- To check frontend, 
- open link http://localhost:3000.
  - This can be found with docker ps, where you will see 0.0.0.0:3000->3000/tcp
  - Or you can check .yml
Error: cors issue error in the browser console:
  - You do not have local env variables set for BACKEND_URL and FRONTEND_URL. Different ways to set this up. I just added them to .yml file.
  - Then run : docker compose down; docker compose up --build.
  - These env are needed in the app.py code
Error: when i update backend files, browser does not detect it live.
- add --reload in .yml
- Make sure volumes are mounted to corresponding WORKDIR.
  - Backend -> /backend-flask
  - Frontend -> /app
- recompose and run.

#### Documentation with OpenAPI, swagger-jsdoc, express-openapi, postman, readme
- Gathers all info concerning API from your code into one file. This can be used as a quick reference.
- OpenAPI tools like swagger-jsdoc or express-openapi just collect and organize all the details about your API — routes, parameters, request/response formats — into one clear, standard document (the OpenAPI spec).
- You can open openapi-3.0.yml with swagger extension and get an UI rendering of your API spec.
- You can also open .yml file and then go to the OpenAPI extension tab.
#### Set up dynamodb
- https://github.com/100DaysOfCloud/challenge-dynamodb-local

#### Install postgres client

- brew services start postgresql@13
- brew services list
- psql