#!/bin/bash

CUSTOM_PKG_MICROROS=potmessage
TOP_DIR=$(pwd)

# Copy custom msgs pkg to microros folder
mkdir -p $TOP_DIR/micro_ros_arduino/extras/library_generation/extra_packages/$CUSTOM_PKG_MICROROS
cp -r $TOP_DIR/src/$CUSTOM_PKG_MICROROS/*  $TOP_DIR/micro_ros_arduino/extras/library_generation/extra_packages/$CUSTOM_PKG_MICROROS/

# Build custom messages
cd $TOP_DIR/micro_ros_arduino
docker run -it --rm -v $(pwd):/project --env MICROROS_LIBRARY_FOLDER=extras microros/micro_ros_static_library_builder:humble -p esp32

# Zip builded state of micro_ros_arduino
zip -r micro_ros_arduino.zip micro_ros_arduino


