FROM osrf/ros:noetic-desktop-full




SHELL [ "/bin/bash" , "-c" ]



RUN apt-get update

RUN apt-get install -y git && apt-get install -y python3-pip \

	liblcm-dev \

	ros-noetic-controller-interface \

	ros-noetic-gazebo-ros-pkgs \

	ros-noetic-gazebo-ros-control \

	ros-noetic-joint-state-controller \

	ros-noetic-effort-controllers \

	ros-noetic-joint-trajectory-controller \

	ros-noetic-amcl \

	ros-noetic-move-base \

	ros-noetic-slam-gmapping \

	ros-noetic-hector-slam \

	ros-noetic-map-server \

	ros-noetic-global-planner \

	ros-noetic-dwa-local-planner

	

RUN source /ros_entrypoint.sh \

    && cd ~/ \

    && mkdir -p catkin_ws/src && cd catkin_ws/src \

    && git clone https://github.com/macc-n/ros_unitree \

    && sed -i 's|home/unitree/catkin_ws|home/catkin_ws|' ./ros_unitree/unitree_ros/unitree_gazebo/worlds/stairs.world \

#    && filename="./ros_unitree/unitree_ros/unitree_gazebo/worlds/stairs.world" \

#    && search="home/unitree/catkin_ws" && replace="home/catkin_ws" \

#    && sed -i "s/$search/$replace/" $filename \

    && cd ~/catkin_ws && catkin_make

    

RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

RUN echo "All Done "
