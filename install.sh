#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
DELIGHT_FOR_MAYA_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[INSTALL][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[INSTALL][ARGS] 3DFM VERSION: ${DELIGHT_FOR_MAYA_VERSION}"

# We check if the arguments variables we need are correctly set.
# If not, we abort the process.
if [[ -z ${EXTRACT_PATH} || -z ${INSTALL_PATH} || -z ${DELIGHT_FOR_MAYA_VERSION} ]]; then
    echo -e "\n"
    echo -e "[INSTALL][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"

    exit 1
fi

# We install 3DFM.
echo -e "\n"
echo -e "[INSTALL] Installing 3DFM-${DELIGHT_FOR_MAYA_VERSION}..."

PLATFORM=$(uname -s)-$(uname -m)

# We copy the necessary files to the install directory.
cp -R ${EXTRACT_PATH}/3delight/${PLATFORM}/maya ${INSTALL_PATH}

# We only keep the DCC directory related to Maya.
rm -rf ${INSTALL_PATH}/3DelightForKatana ${INSTALL_PATH}/houdini

echo -e "[INSTALL] Finished installing 3DFM-${DELIGHT_FOR_MAYA_VERSION}!"
echo -e "\n"
