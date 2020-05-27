#include <stdio.h>

/*void dummy(){
	__asm__ __volatile__("sta %0, [%1] %2\n\t" : : "r" (0), "r" (0x8), "i" (31) : "memory");

	return;
}*/

void align(){
	__asm__ __volatile__("sta %0, [%1] %2\n\t" : : "r" (3), "r" (0x8), "i" (31) : "memory");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
		__asm__ __volatile__(".word 0x4820f548");

		__asm__ __volatile__("nop");

	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
			__asm__ __volatile__("nop");
				__asm__ __volatile__("nop");

}
void patch(){
		__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");

}
#pragma GCC pop_options

int main(){
	int a = 1;
	int b = 2;
	int mode = 0x00000003;

	__asm__ __volatile__("sta %0, [%1] %2\n\t" : : "r" (a), "r" (0x200), "i" (31) : "memory");
	__asm__ __volatile__("sta %0, [%1] %2\n\t" : : "r" (b), "r" (0x204), "i" (31) : "memory");
	__asm__ __volatile__("sta %0, [%1] %2\n\t" : : "r" (0), "r" (0x208), "i" (31) : "memory");

	void* (*newfunc)(void);
	newfunc = (void*) (&patch);

	/*((int*)newfunc)[0] = 0x01000000;
	((int*)newfunc)[1] = 0x01000000;
	((int*)newfunc)[2] = 0x81c3e008;
	((int*)newfunc)[3] = 0x01000000;*/

	((int*)newfunc)[0] = 0x546948ed;
	((int*)newfunc)[1] = 0x3572eb5c;
	((int*)newfunc)[2] = 0xbacf170b;
	((int*)newfunc)[3] = 0x15f64748;
	((int*)newfunc)[4] = 0x01000000;

	__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
	__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
				__asm__ __volatile__("nop");



	__asm__ __volatile__("sta %0, [%1] %2\n\t" : : "r" (3), "r" (0x8), "i" (31) : "memory");


	newfunc();
	printf("Hello world 7\n");



}
