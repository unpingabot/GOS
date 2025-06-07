#!/bin/bash
set -e

echo "[*] Building kernel"
cargo +nightly build \
    -Z build-std=core,compiler_builtins \
    -Z build-std-features=compiler-builtins-mem \
    --target x86_64-gos.json

echo "[*] Copying kernel to ISO folder"
mkdir -p iso/boot/grub
cp target/x86_64-gos/debug/gos iso/boot/gos

echo "[*] Creating GRUB config"
cat > iso/boot/grub/grub.cfg <<EOF
set timeout=0
set default=0

menuentry "GOS" {
    multiboot /boot/gos
}
EOF

echo "[*] Making ISO"
grub-mkrescue -o gos.iso iso

echo "[*] Running in QEMU"
qemu-system-x86_64 -cdrom gos.iso
