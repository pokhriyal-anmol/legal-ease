#!/bin/bash

# This script sets up the Python environment and installs dependencies for the Legal FIR Filing System.

echo "Setting up the project environment..."

# 1. Create a Python virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "Virtual environment created."
else
    echo "Virtual environment 'venv' already exists."
fi

# 2. Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate
echo "Virtual environment activated."

# 3. Install Python dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing Python dependencies from requirements.txt..."
    pip install --upgrade pip
    pip install -r requirements.txt
    echo "Dependencies installed."
else
    echo "Error: requirements.txt not found. Please ensure it's in the same directory."
    exit 1
fi

# 4. Set LLAMA_CLOUD_API_KEY (IMPORTANT: Replace 'your_llama_cloud_api_key_here' with your actual API key)
# It's recommended to store this in a .env file and load it, but for a quick setup,
# you can export it directly.
echo "Please set your LLAMA_CLOUD_API_KEY."
echo "You can replace 'your_llama_cloud_api_key_here' in this script or set it manually:"
echo "export LLAMA_CLOUD_API_KEY='your_llama_cloud_api_key_here'"
# For demonstration, uncomment the line below and replace with your actual key if you want to set it directly in the script
# export LLAMA_CLOUD_API_KEY="your_llama_cloud_api_key_here"

echo "Setup complete!"
echo "To deactivate the virtual environment, run: deactivate"
echo "To activate the virtual environment again later, run: source venv/bin/activate"
