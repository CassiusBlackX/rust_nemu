extern int main();

void _start()
{
    asm volatile(  // 初始化gp的地址
        "la a0, _data\n"
        "la a1, _bss_start\n"
        "add gp, a0, a1\n"
        "srai gp, gp, 1\n"
        );
    asm volatile(
        "lui a0, %hi(0x0000006b)\n"
        "addi a0, a0, %lo(0x0000006b)\n" // 对应机器码0000000 00000 00000 000 00000 11010 11，表示正常退出
        "li a1, 0x83fffff0\n"
        "sw a0, 0(a1)\n");
    asm volatile(
        "lui a0, %hi(0x000000eb)\n"
        "addi a0, a0, %lo(0x000000eb)\n" // 对应机器码0000000 00000 00000 000 00001 11010 11，表示异常退出
        "li a1, 0x83fffff4\n"
        "sw a0, 0(a1)\n");

    main();

    // 尝试通过内链汇编的方式告知模拟器运行到程序结束了
    asm volatile(
        "li a0, 0x83fffff0\n"
                 "jalr zero, 0(a0)\n");
}