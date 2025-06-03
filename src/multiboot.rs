#[used]
#[no_mangle]
#[link_section = ".multiboot"]
pub static MULTIBOOT_HEADER: [u32; 3] = [
    0x1BADB002, // magic
    0x00000000, // flags
    0xE4524FFE, // checksum
];
