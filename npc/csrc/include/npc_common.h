#ifndef __NPCCOMMON_H__
#define __NPCCOMMON_H__
#include "macro.h"
#include "npc_conf.h"
#include <assert.h>
#include <iostream>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <inttypes.h>
typedef uint32_t word_t;
typedef word_t vaddr_t;
typedef word_t paddr_t;
#define CONFIG_MSIZE 0x8000000
#define START_ADDR   0x7ffffffc
#define CONFIG_MBASE 0x7ffffffc
#define PG_ALIGN __attribute__((aligned(4096)))
#define FMT_WORD MUXDEF(CONFIG_ISA64, "0x%016" PRIx64, "0x%08" PRIx32)
#define FMT_PADDR MUXDEF(PMEM64, "0x%016" PRIx64, "0x%08" PRIx32)
#define PMEM_LEFT  ((paddr_t)CONFIG_MBASE)
#define PMEM_RIGHT ((paddr_t)CONFIG_MBASE + CONFIG_MSIZE - 1)
#define printf_red(...) \
    do { \
        printf("\033[1;32m"); \
        printf(__VA_ARGS__); \
        printf("\033[0m"); \
    } while (0)
#define gpr(idx) (read_reg_idx(check_reg_idx(idx)))
word_t paddr_read(paddr_t addr, int len);
void paddr_write(paddr_t addr, int len, word_t data);
word_t expr(char *e, bool *success);
void sdb_mainloop();

#include "npc_debug.h"
#endif