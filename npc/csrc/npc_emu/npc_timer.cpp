#include "../include/npc_common.h"
#include <sys/time.h>

static uint64_t boot_time = 0;
static uint64_t get_time_internal() {
#if defined(CONFIG_TARGET_AM)
  uint64_t us = io_read(AM_TIMER_UPTIME).us;
#else
  struct timeval now;
  gettimeofday(&now, NULL);
  uint64_t us = now.tv_sec * 1000000 + now.tv_usec;
#endif
  return us;
}

uint64_t get_time() {
  if (boot_time == 0) boot_time = get_time_internal();
  uint64_t now = get_time_internal();
  return now - boot_time;
}

void init_rand() {
  srand(get_time_internal());
}
