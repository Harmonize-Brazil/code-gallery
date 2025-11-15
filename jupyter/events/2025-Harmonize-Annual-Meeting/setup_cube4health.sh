#!/usr/bin/env bash
set -e  # stop the script if any command fails

echo "=== Cloning repository ==="
git clone https://github.com/Harmonize-Brazil/cube4health.git
cd cube4health

echo "=== Creating Conda environment (py310) ==="
conda create -n py310 python=3.10 -y

echo "=== Activating Conda environment ==="
# conda activate only works inside scripts if we load the profile script
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate py310

echo "=== Creating Python venv environment ==="
python -m venv venv

echo "=== Deactivating Conda ==="
conda deactivate

echo "=== Activating venv ==="
source venv/bin/activate

echo "=== Running setup_env.sh ==="
chmod +x setup_env.sh
./setup_env.sh

echo "=== Environment successfully configured! ==="


