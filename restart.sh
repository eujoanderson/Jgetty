#!/bin/bash
docker restart wingetty
docker exec -it wingetty nginx
