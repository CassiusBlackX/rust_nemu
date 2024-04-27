void check(int condition)
{
    if (!condition)
    {
        // 说明执行出现问题，跳转到异常推出机器指令的地址，退出
        asm volatile("li a0, 0x83fffff4\n"
                     "jalr zero, 0(a0)\n");
    }
}

#define LENGTH(arr) (sizeof(arr) / sizeof((arr)[0]))
#include <stdbool.h>
#include <stddef.h>