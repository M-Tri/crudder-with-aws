# Week 1 — App Containerization

### Commands

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