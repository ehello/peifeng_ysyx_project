#include <common.h>
#include "syscall.h"
void strace_log(int gpr){
  char *syscall_name;
  switch (gpr)
  {
  case SYS_exit:  syscall_name="SYS_exit" ; break;
  case SYS_yield: syscall_name="SYS_yield"; break;
  case SYS_write: syscall_name="SYS_write"; break;
  default:
    panic("Unhandled syscall ID  = %d by strace", gpr);
    break;
  }
  Log("Syscall:%s!!!",syscall_name);
}
void do_syscall(Context *c) {
  uintptr_t a[4];
  a[0] = c->GPR1;
  a[1] = c->GPR2;
  a[2] = c->GPR3;
  a[3] = c->GPR4;
  a[4] = c->GPR1;
  #ifdef CONFIG_STRACE
  strace_log(a[0]);
  #endif
  switch (a[0]) {
    case SYS_exit:
      printf("%d",c->GPRx);
      halt(c->GPRx); break;
    case SYS_yield:
      yield(); c->GPRx=0; break;
    case SYS_write:
      if(a[1]==1||a[1]==2){
        putch(a[2]); c->GPRx=0;
      }else c->GPRx=-1;
      break;
    default: panic("Unhandled syscall ID = %d", a[0]);
  }
}
