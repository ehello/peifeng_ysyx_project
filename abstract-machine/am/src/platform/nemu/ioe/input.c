#include <am.h>
#include <nemu.h>

#define KEYDOWN_MASK 0x8000

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
  uint32_t tmp_key=inl(KBD_ADDR);
  kbd->keydown = (bool)((tmp_key>>31)&1);
  kbd->keycode = tmp_key;
}
