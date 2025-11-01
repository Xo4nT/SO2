#include <libc.h>
#include <suma.h>

char buff[24];

int pid;

/**int suma(int var1, int var2) 
{
  return var1 + var2;
}*/

int __attribute__ ((__section__(".text.main")))
  main(void)
{
    /* Next line, tries to move value 0 to CR3 register. This register is a privileged one, and so it will raise an exception */
     /* __asm__ __volatile__ ("mov %0, %%cr3"::"r" (0) ); */

  int res = addAsm(0x42, 0x666);
  char * par = "Ticks des de boot:";
  write (1, par, strlen(par));
  
  itoa (gettime(), par);
  write (1, par, strlen(par));
  
  char* p = 0;
  *p = 'x';
  
  while(1) { }
}
