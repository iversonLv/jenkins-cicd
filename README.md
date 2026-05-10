# React + TypeScript + Vite

## Docker

Bash:

```bash
docker build -t my-jenkins .
```

```bash
docker ps
docker stop <container-id>
```

```bash
docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v jenkins_home:/var/jenkins_home \
  --name my-jenkins \
  my-jenkins
```
