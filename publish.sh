#!/bin/bash

SRC_DIR="$PWD/src"
WORKSHOP_DIR="$PWD/workshop"

if [[ ! -f "${WORKSHOP_DIR}/metadata.vdf" ]]; then
    echo "metadata.vdf not found, generating now.."
    cp "${WORKSHOP_DIR}/metadata.template" "${WORKSHOP_DIR}/metadata.vdf"
    sed -i "s|==SRC==|${SRC_DIR}|g" "${WORKSHOP_DIR}/metadata.vdf"
    sed -i "s|==WC==|${WORKSHOP_DIR}|g" "${WORKSHOP_DIR}/metadata.vdf"
fi

read -rp "Steam username: " STEAM_USER
read -rps "Steam password: " STEAM_PASSWORD


steamcmd +login "${STEAM_USER}" "${STEAM_PASSWORD}" +workshop_build_item "$WORKSHOP_DIR/metadata.vdf" +quit