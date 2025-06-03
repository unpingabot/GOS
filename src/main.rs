#![no_std]
#![no_main]

mod multiboot;

use core::panic::PanicInfo;

#[no_mangle]
pub extern "C" fn _start() -> ! {
    let vga_buffer = 0xb8000 as *mut u8;
    unsafe {
        *vga_buffer.offset(0) = b'H';
        *vga_buffer.offset(1) = 0x0f;
    }
    loop {}
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}