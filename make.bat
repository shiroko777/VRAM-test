#!/bin/bash
nasm -f bin kernel.asm -o kernel.bin

qemu-system-x86_64 -drive format=raw,file=kernel.bin,if=floppy
