#include <asm.h>
//#include <errno.h>


ENTRY(write)
   pushl %ebp
   movl %esp, %ebp
   
   movl 8(%ebp), %edx
   movl 12(%ebp), %ecx
   movl 16(%ebp), %ebx
   movl $4, %eax
   int $0x80
   cmpl $0, %eax
   jl error
   jmp fin
 error:
   movl %eax, errno
   movl $-1, %eax
 fin:
   movl %ebp, %esp
   popl %ebp
   ret

ENTRY(gettime)
   pushl %ebp
   movl %esp, %ebp
   
   movl $10, %eax
   int $0x80
   
   movl %ebp, %esp
   popl %ebp
   ret
   
