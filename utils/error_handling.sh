#!/bin/bash

# Function to set up error handling
setUpErrorHandling() {
    trap 'echo ">>> An error occurred in $packageName installation. Exiting..." >&2; exit 1' ERR
}
