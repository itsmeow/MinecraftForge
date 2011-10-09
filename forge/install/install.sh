#!/bin/bash

echo "MinecraftForge Linux Setup Program"
echo 

pushd .. > /dev/null

./cleanup.sh
./decompile.sh

pushd src > /dev/null
	find . -name *.java -exec sed -i 's/\r//g' \{\} \;
	patch -p2 -i ../forge/modLoaderMP.patch
	patch -p1 -i ../forge/mlprop.patch
	for i in `find ../forge/patches/ -type f`
	do
		patch -p2 -i $i
	done
popd > /dev/null

cp -r forge/src/* src

./updatemd5.sh
