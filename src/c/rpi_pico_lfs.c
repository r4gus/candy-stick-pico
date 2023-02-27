#include "rpi_pico_lfs.h"

lfs_t lfs;
lfs_file_t file;

int fs_mount(void) {
    return lfs_mount(&lfs, &PICO_FLASH_CFG);
}

