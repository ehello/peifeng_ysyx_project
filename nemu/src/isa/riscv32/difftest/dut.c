/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>
#include <cpu/difftest.h>
#include "../local-include/reg.h"
extern const char *regs[];

#define DIFF_CHECK(addr1, addr2, name) if(addr1!=addr2){\
  wLog("The %s is different\ntrue:0x%08x false:0x%08x",name,addr1,addr2); \
  return false;\
}

bool isa_difftest_checkregs(CPU_state *ref_r, vaddr_t pc) {
  for(int i=0;i<32;i++){
    if(ref_r->gpr[i]!=gpr(i)){
      wLog("The reg:%s(rf_%d) is different\ntrue:0x%08x false:0x%08x",regs[i],i,ref_r->gpr[i],gpr(i));
      return false;
    }
  }
  DIFF_CHECK(ref_r->pc,pc+4,"pc");
  DIFF_CHECK(ref_r->mtvec,cpu.mtvec,"mtvec");
  DIFF_CHECK(ref_r->mepc ,cpu.mepc ,"mepc ");
  DIFF_CHECK(ref_r->mstatus,cpu.mstatus,"mstatus");
  // DIFF_CHECK(ref_r->mcause ,cpu.mcause ,"mcause");

  return true;
}

void isa_difftest_attach() {
}
