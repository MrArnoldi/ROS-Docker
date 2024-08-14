FROM osrf/ros:noetic-desktop-full

RUN apt-get update && apt-get install -y \
    tmux \
    nano \ 
    wget \
    python3-pip \
    python3-tk \
    python3-opencv \
    ros-${ROS_DISTRO}-realsense2-* \
    ros-${ROS_DISTRO}-rc-visard \
    ros-${ROS_DISTRO}-gazebo-ros \
    ros-${ROS_DISTRO}-gazebo-msgs \
    ros-${ROS_DISTRO}-gazebo-plugins \
    ros-${ROS_DISTRO}-opencv-apps \
    ros-${ROS_DISTRO}-tf2-ros \
    ros-${ROS_DISTRO}-tf2-geometry-msgs \
    ros-${ROS_DISTRO}-tf2-sensor-msgs \
    ros-${ROS_DISTRO}-tf2-tools \
    ros-${ROS_DISTRO}-tf2-py \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-image-transport 

RUN pip3 install --upgrade pip
RUN pip3 install -U setuptools
RUN pip3 install --ignore-installed PyYAML
RUN pip3 install \
    numpy \
    scipy \
    matplotlib \
    # scikit-learn \
    # pandas \
    # tensorflow \
    # keras \
    # torch \
    # torchvision \
    opencv-python \
    open3d \
    scikit-image \
    pyrealsense2 

RUN pip3 install --ignore-installed plantcv

ENTRYPOINT [ "tmux" ]

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && echo PATH="/root/miniconda3/bin":$PATH >> .bashrc \
    && exec bash \
    && conda --version

