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
#include <cpu/cpu.h>
#include <difftest-def.h>
#include <memory/paddr.h>
void cpu_exec(uint64_t n);
__EXPORT void difftest_memcpy(paddr_t addr, void *buf, size_t n, bool direction) {
  if(direction == DIFFTEST_TO_REF){ //DIFFTEST_TO_REF,target is ref
    memcpy(guest_to_host(addr), buf, n);
  }else{ //DIFFTEST_TO_DUT,target is dut
    assert(0);
  }
}
//`direction`为`DIFFTEST_TO_DUT`时, 获取REF的寄存器状态到`dut`
//`direction`为`DIFFTEST_TO_REF`时, 设置REF的寄存器状态为`dut`
__EXPORT void difftest_regcpy(void *dut, bool direction) {
  CPU_state* tmp=dut; 
  if (direction == DIFFTEST_TO_REF) {
    for(int i=0;i<32;i++){
      cpu.gpr[i]=tmp->gpr[i];
    }
  }else{
    for(int i=0;i<32;i++){
      tmp->gpr[i]=cpu.gpr[i];
    }
  }
  // assert(0);
}

__EXPORT void difftest_exec(uint64_t n) {
  cpu_exec(n);
  // assert(0);
}

__EXPORT void difftest_raise_intr(word_t NO) {
  // assert(0);
}

__EXPORT void difftest_init(int port) {
  void init_mem();
  init_mem();
  /* Perform ISA dependent initialization. */
  init_isa();
}
