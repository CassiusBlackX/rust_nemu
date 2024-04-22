extern int main();

void _start()
{
    asm volatile(
        "lui a0, %hi(0x0000006b)\n"
        "addi a0, a0, %lo(0x0000006b)\n" //对应机器码0000000 00000 00000 000 00000 11010 11，表示正常退出
        "li a1, 0x83ffff00\n"
        "sw a0, 0(a1)\n");
    asm volatile(
        "lui a0, %hi(0x000000eb)\n"
        "addi a0, a0, %lo(0x000000eb)\n" //对应机器码0000000 00000 00000 000 00001 11010 11，表示异常退出
        "li a1, 0x83ffff04\n"
        "sw a0, 0(a1)\n"
                 );         
        
    main();

    // 尝试通过内链汇编的方式告知模拟器运行到程序结束了
    asm volatile("li a0, 0x83ffff00\n"
                 "jalr zero, 0(a0)\n"
    );
}


void check(int condition) {
    if (!condition) {
        // 说明执行出现问题，跳转到异常推出机器指令的地址，退出
        asm volatile("li a0, 0x83ffff04\n"
                    "jalr zero, 0(a0)\n"
        );
    }
}

#define LENGTH(arr)         (sizeof(arr) / sizeof((arr)[0]))
#include <stdbool.h>
#include <stddef.h>