#include "uart.h"

#define SR_TX_FIFO_FULL         (1<<3) /* transmit FIFO full */
#define SR_TX_FIFO_EMPTY        (1<<2) /* transmit FIFO empty */
#define SR_RX_FIFO_VALID_DATA   (1<<0) /* data in receive FIFO */
#define SR_RX_FIFO_FULL         (1<<1) /* receive FIFO full */

#define ULITE_CONTROL_RST_TX	0x01
#define ULITE_CONTROL_RST_RX	0x02

struct uartlite_regs *const ttyUL0 = (struct uartlite_regs *)0x10000000;

void uart_put_c(char c) {
    while (ttyUL0->status & SR_TX_FIFO_FULL);
    ttyUL0->tx_fifo = c;
}

char uart_check_read() { // 1: data ready, 0: no data
    return (ttyUL0->status & SR_RX_FIFO_VALID_DATA) != 0;
}

char uart_get_c() {
    return ttyUL0->rx_fifo;
}

void get(char *s, int n) {
    char debug[20] = "Enter get()";
    print_s(debug);
    int i = 0;
    while (uart_check_read() != 1);
    while (uart_check_read() && i < n - 1) {
        print_s(debug);
        char c = uart_get_c();
        uart_put_c(c);
        if (c == '\r' || c == '\n') {
            break; // Break if carriage return or newline is encountered
        }
        *(s + i) = c;
        i++;
    }
    s[i] = '\0';
}

void print_s(const char *c) {
    while (*c) {
        uart_put_c(*c);
        c ++;
    }
}

void print_long(long x) {
    char buffer[30];
    if (x < 0) {
        uart_put_c('-');
        x = -x;
    }
    int idx = 0;
    while (x) {
        long new_x = x / 10;
        long rem_x = x % 10;
        buffer[idx ++] = '0' + rem_x;
        x = new_x;
    }
    if (idx == 0) uart_put_c('0');
    else while (idx) uart_put_c(buffer[--idx]);
}

void print_digit(unsigned char x) {
    uart_put_c('0'+x);
}

void dump_hex(unsigned long x) {
    uart_put_c('0');
    uart_put_c('x');
    char buffer[16];
    for (int i=0;i<16;i++) {
        unsigned long cur = x & 0xf;
        buffer[i] = cur < 10 ? ('0' + cur) : ('a' + cur - 10);
        x >>= 4;
    }
    for (int i=15;i>=0;i--) uart_put_c(buffer[i]);
    uart_put_c('\r');
    uart_put_c('\n');
}