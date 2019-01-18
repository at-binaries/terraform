#!/bin/bash

mkdir -p tmp
mkdir -p prebuilds
cd tmp

VERSION=0.11.11
PKG_VERSION=1

dl () {
  wget -O terraform.zip https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_$1.zip
  unzip terraform.zip
  mkdir build
  mv terraform build/
  tar czfv terraform-v${VERSION}-${PKG_VERSION}-bin-v${PKG_VERSION}-$2.tar.gz build
  mv terraform-v${VERSION}-${PKG_VERSION}-bin-v${PKG_VERSION}-$2.tar.gz ../prebuilds/
  rm -rf build terraform.zip
}

dl darwin_amd64 darwin-x64
dl linux_amd64 linux-x64
dl linux_386 linux-ia32
