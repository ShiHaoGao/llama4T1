# llama4T1

## Setup 

### 一、准备
- git clone 本项目。
```shell
git clone https://github.com/ShiHaoGao/llama4T1.git
```
- 安装docker，并挂载本地项目目录
```shell
docker run -v /path/to/your/llama4T1/:/exp --name t1 -it -d --rm -p 12222:22 t1/yizhu:latest 
```

- 运行docker
```shell
docker exec -it t1 /bin/bash
```

### 二、下载，并编译musl库

- 下载musl库

```shell
cd llama4T1
git clone https://github.com/bminor/musl.git
```

- 在docker中编译musl库
```shell
cd /exp/musl
./configure CROSS_COMPILE=riscv32-none-elf- CC=riscv32-none-elf-gcc --target=riscv32 --prefix=/exp/musl_libc --disable-shared
make 
make install
```

### 三、编译运行llama2.c

- 编译
```shell
make run
```

- 运行
```shell
soc-emulator run.elf
```

- 查看汇编代码
```shell
make asm
```
