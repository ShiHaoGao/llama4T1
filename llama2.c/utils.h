#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void convert_hex2mem(unsigned char *byte_data, const char *hex_string);

void convert_n_hex2mem(unsigned char *byte_data, const char *hex_string, int n);

void convert_n_hex2mem_from(unsigned char* byte_data, const char* hex_string, size_t pos, int n);

#endif