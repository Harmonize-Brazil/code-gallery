#!/usr/bin/env bash
set -e  # stop the script if any command fails

# === Color Codes ===
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
NC="\033[0m"  # No Color

echo -e "${YELLOW}=== Cloning repository ===${NC}"
git clone https://github.com/Harmonize-Brazil/cube4health.git
cd cube4health

echo -e "${YELLOW}=== Creating Conda environment (py310) ===${NC}"
conda create -n py310 python=3.10 -y
echo -e "${GREEN}Conda environment created.${NC}"

echo -e "${YELLOW}=== Activating Conda environment ===${NC}"
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate py310
echo -e "${GREEN}Conda environment activated.${NC}"

echo -e "${YELLOW}=== Creating Python venv environment ===${NC}"
python -m venv venv
echo -e "${GREEN}Python venv created.${NC}"

echo -e "${YELLOW}=== Deactivating Conda ===${NC}"
conda deactivate
echo -e "${GREEN}Conda deactivated.${NC}"

echo -e "${YELLOW}=== Activating venv ===${NC}"
source venv/bin/activate
echo -e "${GREEN}venv activated.${NC}"

echo -e "${YELLOW}=== Running setup_env.sh ===${NC}"
chmod +x setup_env.sh
./setup_env.sh
echo -e "${GREEN}setup_env.sh completed.${NC}"

echo -e "${YELLOW}=== (Optional) Adding venv_cube4health kernel to Jupyter ===${NC}"
pip3 install ipykernel
python -m ipykernel install --user --name=venv_cube4health
echo -e "${GREEN}Jupyter kernel added (venv_cube4health).${NC}"

echo -e "${GREEN}=== Environment successfully configured! ===${NC}"



