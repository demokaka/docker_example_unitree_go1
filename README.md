# docker_example_unitree_go1
Experiment with Unitree Go1 robot using docker

# Clone this repository
```
git clone https://github.com/demokaka/docker_example_unitree_go1.git
cd docker_example_unitree_go1
```
# Build the docker image
```
docker build -t [name_of_image] .
```
This command will build an image named `[name_of_image]`

# Configure shell script before running 
Before running the docker image to create a docker container, find the following line 
`ros_noetic_go1:1.0.0` and change it to your `[name_of_image]`.
Also find the name tag for the docker container at line 
```
--name=r1_go_v1 \
```
and change it to `--name=[name_of_container] \`
# Run the docker image
```
sudo chmod +x run_docker.sh
./run_docker.sh
```

# Start simulation with Gazebo and rviz
Follow this [resource](https://github.com/macc-n/ros_unitree) for all the simulations

# Using docker
- To enter an **already running container** run,
   ```
   docker exec -it r2_pathplanning_container bash
   ```
- Open a new terminal, then enter into the running container by executing the following command:
      ```
      docker exec -it r2_pathplanning_container bash
      ```
