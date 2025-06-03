ENTRY(_start)

SECTIONS {
    . = 1M;

    /* Explicit placement of multiboot at start of file */
    .multiboot ALIGN(4) : {
        KEEP(*(.multiboot))
    }

    .text ALIGN(4) : {
        *(.text*)
    }

    .rodata ALIGN(4) : { *(.rodata*) }
    .data ALIGN(4)   : { *(.data*) }
    .bss  ALIGN(4)   : { *(.bss*) }
}
