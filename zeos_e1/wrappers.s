# 0 "wrappers.ss"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "wrappers.ss"
# 1 "include/asm.h" 1
# 2 "wrappers.ss" 2

.globl write; .type write, @function; .align 0; write:
    pushl %ebp ;
    movl %esp, %ebp ;
    movl 8(%ebp), %edx ;
    movl 12(%ebp), %ecx ;
    movl 16(%ebp), %ebx ;
    movl $4, %eax ;
    pushl %edx ; #ecx and edx will be modified by sysexit
    pushl %ecx ;
    pushl $w1 ; #return address after sysexit
    pushl %ebp ; #add ebp parameter for the handler
    movl %esp, %ebp ;
    sysenter ;
w1: popl %ebp ; #restore previous ebp before sysenter
    addl $4, %esp ; #remove return address
    popl %ecx ; #restore ecx
    popl %edx ; #restore edx
    popl %ebp ; #restore ebp from caller
    ret ;

.globl gettime; .type gettime, @function; .align 0; gettime:
    pushl %ebp ;
    movl %esp, %ebp ;
    movl $10, %eax ;
    pushl %edx ; #ecx and edx will be modified by sysexit
    pushl %ecx ;
    pushl $t1 ; #return address after sysexit
    pushl %ebp ; #add ebp parameter for the handler
    movl %esp, %ebp ;
    sysenter ;
t1: addl $4, %esp ; #remove return address
    popl %ecx ; #restore ecx
    popl %edx ; #restore edx
    popl %eax ; #restore the return value
    popl %ebp ; #restore ebp from caller
    ret ;
