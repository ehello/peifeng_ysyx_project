#include <fs.h>

typedef size_t (*ReadFn) (void *buf, size_t offset, size_t len);
typedef size_t (*WriteFn) (const void *buf, size_t offset, size_t len);

typedef struct {
  char *name;
  size_t size;
  size_t disk_offset;
  ReadFn read;
  WriteFn write;
} Finfo;

enum {FD_STDIN, FD_STDOUT, FD_STDERR, FD_FB};

size_t invalid_read(void *buf, size_t offset, size_t len) {
  panic("should not reach here");
  return 0;
}

size_t invalid_write(const void *buf, size_t offset, size_t len) {
  panic("should not reach here");
  return 0;
}

/* This is the information about all files in disk. */
static Finfo file_table[] __attribute__((used)) = {
  [FD_STDIN]  = {"stdin", 0, 0, invalid_read, invalid_write},
  [FD_STDOUT] = {"stdout", 0, 0, invalid_read, invalid_write},
  [FD_STDERR] = {"stderr", 0, 0, invalid_read, invalid_write},
#include "files.h"
};

int fs_open(const char *pathname, int flags, int mode){
  return 0;
}
size_t fs_read(int fd, void *buf, size_t len){
  return 0;
}
int fs_close(int fd){
  return 0;
}


void init_fs() {
  int num_files = sizeof(file_table) / sizeof(file_table[0]);

  for (int i = 0; i < num_files; i++) {
    printf("File %d:\n", i);
    printf("  Name: %s\n", file_table[i].name);
    printf("  Size: %zu\n", file_table[i].size);
    printf("  Disk Offset: %zu\n", file_table[i].disk_offset);
    printf("\n");
  }
  // TODO: initialize the size of /dev/fb
}
