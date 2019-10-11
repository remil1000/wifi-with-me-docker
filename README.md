Wifi-With-Me Dockerfile setup

Building Docker image
=====================

    # export myname="remil_example"
    # docker build -t "$myname:wifi-with-me" .

Cloning repo and running container
==================================

    export repo_path="/opt/wifi-with-me"
    
    # git clone https://github.com/JocelynDelalande/wifi-with-me.git

and run the container

    # docker run -v "$repo_path:/wifi-with-me" -p 8081:8081 "$myname:wifi-with-me"

should be available on port 8081, you can reverse proxy if needed
