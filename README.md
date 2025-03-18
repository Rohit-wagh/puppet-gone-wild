---

# 🏗️ **Puppet Playground with Docker** 

Welcome to the **Puppet Playground!** This is a simple setup that lets you experiment with **Puppet Server & Agent** inside Docker. Whether you're testing configurations, breaking things on purpose, or just trying to impress your crush(Not recommended BTW), this playground has got you covered!  

---

## **📌 Prerequisites**  
Before you jump in, make sure you have the following installed:  
- **Docker** (>= 20.x)  
- **Docker Compose** (>= 1.29.x)  
- **GNU Make** (pre-installed on Linux/macOS, install via `sudo apt install make` on Ubuntu & `choco install make` for Windows)  

---

## **📂 Project Structure**  
```
.
├── Makefile                   # Automates common tasks
├── README.md                  # You're reading this!
├── docker-compose.yaml        # Defines Puppet server & agent services
├── puppet/                    # Puppet configuration directory
│   ├── code/
│   │   ├── environments/
│   │   │   ├── production/    # Default environment
│   │   │   │   ├── manifests/
│   │   │   │   │   ├── site.pp  # Main Puppet manifest
├── scripts/
│   ├── start-puppetagent.sh   # Startup script for Puppet Agent
│   ├── start-puppetserver.sh  # Startup script for Puppet Server
```

---

## **🚀 Getting Started**  

### **1️⃣ Setup & Start the Playground**  
Run the following to set up and start everything:  
```sh
make setup
make start
```

### **2️⃣ Verify Everything is Running**  
Check if your containers are up and running:  
```sh
docker ps
```

### **3️⃣ Apply Puppet Manifests**  
The Puppet agent should auto-run every 10 minutes (via cron), but if you want to force an immediate run:  
```sh
docker exec -it puppetagent puppet agent --onetime --no-daemonize --splay --quiet
```

### **4️⃣ Stop or Clean Up**  
To stop everything:  
```sh
make stop
```
To restart containers:  
```sh
make restart
```
To remove containers and volumes:  
```sh
make clean
```

---

## **🎮 Makefile Shortcuts**  
Run `make help` to see available commands:  

| Command       | Description                         |
|--------------|-------------------------------------|
| `make setup`  | Sets up the environment (chmod scripts) |
| `make start`  | Starts the Puppet Server & Agent  |
| `make stop`   | Stops all running containers      |
| `make restart` | Recreates the containers         |
| `make clean`  | Stops & removes containers + volumes |
| `make help`   | Shows available commands          |

---

## **🐞 Troubleshooting**  

- **Puppet Agent is not applying changes?**  
  Run the agent manually with:  
  ```sh
  docker exec -it puppetagent puppet agent -tv
  ```
  
- **Need logs?**  
  ```sh
  docker logs puppetserver
  docker logs puppetagent
  ```

- **Puppet Server acting up?**  
  Try restarting everything:  
  ```sh
  make restart
  ```

---

## **Why This Playground?**  
This project is **not** meant for production use! It’s just a fun way to test Puppet setups inside Docker without messing up your actual system. Go wild, experiment, and break things—because that's how we learn! 🚀  

---

Enjoy the playground! 🏗️🐧
SSBoYXRlIFB1cHBldCBCVFchCg==
