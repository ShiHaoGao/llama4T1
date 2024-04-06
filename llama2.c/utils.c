#include "utils.h"
#include "uart.h"

// 将单个十六进制字符转换为4位的二进制值
unsigned char hexCharToValue(char c) {
    if (c >= '0' && c <= '9') return c - '0';
    if (c >= 'a' && c <= 'f') return 10 + c - 'a';
    if (c >= 'A' && c <= 'F') return 10 + c - 'A';
    return 0; // 非十六进制字符，应该添加错误处理
}

// 将十六进制字符串转换为字节序列
void hexStringToBytes(const char *hexString, unsigned char *bytes, size_t hexStringLength) {
    size_t i;
    for (i = 0; i < hexStringLength; i += 2) {
        bytes[i / 2] = (hexCharToValue(hexString[i]) << 4) | hexCharToValue(hexString[i + 1]);
    }
}

// Copy all hex_string's content to byte_data.
void convert_hex2mem(unsigned char* byte_data, const char* hex_string) {
    
    int hex_string_long = strlen(hex_string);
    int i;

    for (i = 0; i < hex_string_long; i += 2) {
        byte_data[i / 2] = (hexCharToValue(hex_string[i]) << 4) | hexCharToValue(hex_string[i + 1]);
    //   sscanf(hex_string + i, "%2hhx", &byte_data[i / 2]);
      // print_digit(*(hex_string + i));
      // print_digit(*(hex_string + i + 1));
    }
}

// Copy the front 2*N hexadecimals(N bytes) of hex_string's content to byte_data.  
void convert_n_hex2mem(unsigned char* byte_data, const char* hex_string, int n) {
    
    int hex_string_long = 2 * n;
    int i;

    for (i = 0; i < hex_string_long; i += 2) {
      byte_data[i / 2] = (hexCharToValue(hex_string[i]) << 4) | hexCharToValue(hex_string[i + 1]);
      // sscanf(hex_string + i, "%2hhx", &byte_data[i / 2]);
      // print_digit(*(hex_string + i));
      // print_digit(*(hex_string + i + 1));
    }
}

// From pos copy the front 2*N hexadecimals(N bytes) of hex_string's content to byte_data.  
void convert_n_hex2mem_from(unsigned char* byte_data, const char* hex_string, size_t pos, int n) {
    int hex_string_long = 2 * n;
    int hex_pos = 2 * pos;
    int i;

    for (i = 0; i < hex_string_long; i += 2) {
        // 注意调整hex_string的索引以考虑pos的偏移
        byte_data[i / 2] = (hexCharToValue(hex_string[hex_pos + i]) << 4) | hexCharToValue(hex_string[hex_pos + i + 1]);
        // sscanf的用法同上，但在此示例中保持使用直接计算方式
        // print_digit等函数的调用（如有需要）同时需要考虑到pos的偏移
    }
}
