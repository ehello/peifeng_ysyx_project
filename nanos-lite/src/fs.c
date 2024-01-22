#include <fs.h>
size_t ramdisk_read(void *buf, size_t offset, size_t len);
size_t ramdisk_write(const void *buf, size_t offset, size_t len);
typedef size_t (*ReadFn) (void *buf, size_t offset, size_t len);
typedef size_t (*WriteFn) (const void *buf, size_t offset, size_t len);

typedef struct {
  char *name;
  size_t size;
  size_t disk_offset;
  size_t open_offset;
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
  [FD_STDIN]  = {"stdin", 0, 0, 0,invalid_read, invalid_write},
  [FD_STDOUT] = {"stdout", 0, 0, 0,invalid_read, invalid_write},
  [FD_STDERR] = {"stderr", 0, 0, 0,invalid_read, invalid_write},
#include "files.h"
};
int file_nums=sizeof(file_table)/sizeof(file_table[0]);
int fs_open(const char *pathname, int flags, int mode){
  for(int i=0;i<file_nums;i++){
    if(strcmp(pathname,file_table[i].name)==0){
      return i;
    }
  }
  panic("file not found");
}
size_t fs_read(int fd, void *buf, size_t len){
  ramdisk_read (buf,file_table[fd].disk_offset+file_table[fd].open_offset,len);
  file_table[fd].open_offset=len+1;
  return len;
}
int fs_close(int fd){
  return 0;
}
size_t fs_write(int fd, const void *buf, size_t len){
  ramdisk_write(buf,file_table[fd].disk_offset+file_table[fd].open_offset,len);
  file_table[fd].open_offset=len+1;
  return len;
}
size_t fs_lseek(int fd, size_t offset, int whence){
  switch (whence)
  {
  case SEEK_SET:
    file_table[fd].open_offset=0+offset;
    break;
  case SEEK_CUR:
    file_table[fd].open_offset+=offset;
    break;
  case SEEK_END:
    file_table[fd].open_offset=file_table[fd].size+offset;
    break;
  default:
    panic("Invalid whence");
    break;
  }
  return file_table[fd].open_offset;
}


void init_fs() {
  // int num_files = sizeof(file_table) / sizeof(file_table[0]);

  // for (int i = 0; i < num_files; i++) {
  //   printf("File %d:\n", i);
  //   printf("  Name: %s\n", file_table[i].name);
  //   printf("  Size: %d\n", file_table[i].size);
  //   printf("  Disk Offset: %x\n", file_table[i].disk_offset);
  //   printf("\n");
  // }
  // TODO: initialize the size of /dev/fb
}
