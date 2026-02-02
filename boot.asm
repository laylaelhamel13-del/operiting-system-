 cli ; 1. Disable interrupts
 lgdt [gdt_descriptor] ; 2. Load GDT

 mov eax, cr0
 or eax, 0x1 ; 3. Set PE bit in CR0
 mov cr0, eax

 jmp CODE_SEG:init_pm ; 4. Far jump

 [bits 32] ; Tell NASM to output 32-bit opcodes
 init_pm:
 mov ax, DATA_SEG ; 5. Update segment registers
 mov ds, ax
 mov ss, ax
 mov es, ax
 mov fs, ax
 mov gs, ax

 mov ebp, 0x90000 ; 6. Update stack to top of free space
 mov esp, ebp

 call BEGIN_PM ; 7. Call our 32-bit label

 call main :
 mov ebx, MSG_PROT_MODE
 call print_string_pm
 jmp $
 MSG_PROT_MODE: db "Successfully␣landed␣in␣32-bit␣Protected␣Mode", 0