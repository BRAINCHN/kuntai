#!/bin/bash
# fast slam for a local Kuntai
# save as install.sh
# chmod+x install.sh && sudo .,/install.sh
# Update and install required system dependencies
echo "Updating system and installing dependencies..."
sudo apt update
sudo apt install -y curl git git-lfs python3 python3-pip python3-venv build-essential libopenblas-dev libssl-dev

# Install Git LFS
echo "Installing Git LFS..."
git lfs install

# Create a Python virtual environment
echo "Creating Python virtual environment..."
python3 -m venv kuntai

# Activate the virtual environment
echo "Activating Python virtual environment..."
source kuntai/bin/activate

# Install Hugging Face and other Python dependencies in the virtual environment
echo "Installing Python dependencies in the virtual environment..."
pip install torch transformers sentencepiece huggingface_hub

# Check if Ollama is installed
if ! command -v ollama &> /dev/null
then
    echo "Ollama could not be found. Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "Ollama is already installed."
fi

# Clone Llama 3 model from Hugging Face
echo "Cloning Llama 3 model from Hugging Face..."
git clone https://huggingface.co/models/llama-3-7b-hf

# Create Modelfile to import Hugging Face model into Ollama
echo "Creating Modelfile for Llama 3 model..."
cat <<EOL > Modelfile
FROM ./llama-3-7b-hf  # Path to the Llama 3 7B Hugging Face model

PARAMETER stop "<|im_start|>"
PARAMETER stop "<|im_end|>"
EOL

# Create the model in Ollama
echo "Creating the Llama 3 model in Ollama..."
ollama create llama3-kuntai -f ./Modelfile

# Customize Kuntai Modelfile
echo "Customizing Modelfile for Kuntai..."
cat <<EOL > Modelfile
FROM llama3-kuntai  # This is the imported Llama 3 model

PARAMETER stop "<|im_start|>"
PARAMETER stop "<|im_end|>"

TEMPLATE
<|im_start|>system
You are Kuntai, the ultimate genius AI. Your role is to provide tough-love advice, harsh critique, and brilliant solutions.
<|im_end|>
<|im_start|>user
{{ .User }}<|im_end|>
<|im_start|>assistant
EOL

# Create Kuntai model
echo "Creating Kuntai model..."
ollama create kuntai -f ./Modelfile

# Run Kuntai
echo "Running Kuntai..."
ollama run kuntai

	
