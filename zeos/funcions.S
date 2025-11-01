#include <asm.h>
#include <funcions.h>

ENTRY(geteip)
    push %ebp;
    movl %esp, %ebp;
    movl 48(%ebp), %eax;
    movl %ebp, %esp;
    popl %ebp;
    ret;
