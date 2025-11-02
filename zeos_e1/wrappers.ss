#include <asm.h>

ENTRY(write)
    pushl %ebp              ;
    movl %esp, %ebp         ;
    movl 8(%ebp), %edx      ;
    movl 12(%ebp), %ecx     ;
    movl 16(%ebp), %ebx     ;
    movl $4, %eax           ;
    pushl %edx              ;   #ecx and edx will be modified by sysexit
    pushl %ecx              ;
    pushl $w1               ;   #return address after sysexit
    pushl %ebp              ;   #add ebp parameter for the handler
    movl %esp, %ebp         ;   
    sysenter                ;   
w1: popl %ebp               ;   #restore previous ebp before sysenter
    addl $4, %esp           ;   #remove return address
    popl %ecx               ;   #restore ecx 
    popl %edx               ;   #restore edx 
    popl %ebp               ;   #restore ebp from caller
    ret                     ;

ENTRY(gettime)
    pushl %ebp              ;
    movl %esp, %ebp         ;
    movl $10, %eax          ;
    pushl %edx              ;   #ecx and edx will be modified by sysexit
    pushl %ecx              ;
    pushl $t1               ;   #return address after sysexit
    pushl %ebp              ;   #add ebp parameter for the handler
    movl %esp, %ebp         ;   
    sysenter                ;   
t1: addl $4, %esp           ;   #remove return address
    popl %ecx               ;   #restore ecx 
    popl %edx               ;   #restore edx 
    popl %eax               ;   #restore the return value
    popl %ebp               ;   #restore ebp from caller
    ret                     ;