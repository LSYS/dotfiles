#!/bin/bash

#============================================================================
# Install Miniconda
#============================================================================
curl -sL "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > "Miniconda3.sh"
bash Miniconda3.sh
python --version

# Should already be in my .exports (see bash/.exports)
# export PATH=$PATH:/miniconda3/bin

conda update conda --yes
conda update --all --yes

rm Miniconda3.sh

#============================================================================
# Set up Jupyter
#============================================================================
conda install jupyter --yes
conda update jupyter --yes

# Install the jupyter_notebook_config.py
DOTFILES_MASTER="$HOME"/dotfiles
INSTALL_PATH="$HOME"/.jupyter/jupyter_notebook_config.py
ln -sfv "$DOTFILES_MASTER"/monty/jupyter_notebook_config.py "$INSTALL_PATH"


# Jupyter extensions
conda install -c conda-forge jupyter_contrib_nbextensions --yes
conda install -c conda-forge jupyter_nbextensions_configurator --yes
# (Extensions only available with older versions of Jupyter Notebook)
conda install notebook==6.4.8 --yes


#============================================================================
# Set up environments
#============================================================================
path2requirements="$DOTFILES_MASTER/monty/requirements"
# Install to base
pip install -r "$path2requirements"/requirements_base.txt
pip install -r "$path2requirements"/requirements_docs.txt
pip install -r "$path2requirements"/requirements_dev.txt


################
# Set up GIS env
################
venv_name="venv_gis"

cd "$HOME" || exit 1

if [ -d "$venv_name" ]; then
    echo "Virtual environment '$venv_name'"
else
    echo "Creating new virtual environment '$venv_name'..."
    # Create a new virtual environment
    python3 -m venv $venv_name
fi

echo "Activating $venv_name..."
source "$venv_name"/bin/activate

echo "Installing packages into $venv_name..."
requirementsfile="$path2requirements/requirements_gis.txt" 
cat "$requirementsfile"
pip install -r "$requirementsfile"

which pip
pip list

# Define the trim function to remove leading/trailing whitespace
function trim {
    local var="$*"
    # Remove leading whitespace
    var="${var#"${var%%[![:space:]]*}"}"
    # Remove trailing whitespace
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}
	
skipcheck=(  # list of lines in the requirements_gis file to ignore in the import test
    notebook==6.4.8
)

echo "-----------------------------------------------------------------------"
echo "Verifying that packages are installed in $venv_name"
while read -r pkg; do
	# Trim and clean the lineread from file for whitespaces and invis char
	pkg=$(echo "$pkg" | tr -d '\r')
	pkg=$(trim "$pkg")

	# Check if pkg is in skipcheck list of exceptions
    skip=false
    for skip_pkg in "${skipcheck[@]}"
    do
    	if [[ "$skip_pkg" == "$pkg" ]]; then
    		echo "Skipping $pkg check"
    		skip=true
    		break
    	fi
    done
   	# Check if the package is installed in the virtual environment
    if [[ "$skip" == true ]]; then
    	continue
    elif ! python -c "import $pkg" &> /dev/null; then
        echo >&2 "Missing dependency: $pkg"
    fi
done < "$requirementsfile"
echo "Done. Verified."
echo "-----------------------------------------------------------------------"

deactivate