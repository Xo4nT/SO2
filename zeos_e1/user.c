#include <libc.h>

char buff[24];

int pid;

int __attribute__ ((optimize("0"))) add(int par1, int par2) {
  return par1 + par2;
}

int __attribute__ ((optimize("0"))) addASM(int par1, int par2);

int __attribute__ ((__section__(".text.main")))
  main(void)
{
    /* Next line, tries to move value 0 to CR3 register. This register is a privileged one, and so it will raise an exception */
     /* __asm__ __volatile__ ("mov %0, %%cr3"::"r" (0) ); */

  //int addition = add(6,15);
  //int assembly_addition = addASM(6,5);
  char buffer[32] = "hello";
  write(1, buffer, 5);

  //Page fault generation
  char* p = 0;
  *p = 'x';

  while(1) { 
  }
}
