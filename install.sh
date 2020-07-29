#!/bin/bash

# Load variables
. config.sh

# Create directories and copy dependency files
mkdir -p $INSTALL_DIR

cp -r Images $INSTALL_DIR/Images
cp -r Scripts $INSTALL_DIR/Scripts
cp ./conky.conf $INSTALL_DIR/