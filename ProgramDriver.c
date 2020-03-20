#include "cdecl.h"
int PRE_CDECL asm_main(void) POST_CDECL;
int main(){
	int ret_value;
	ret_value = asm_main();
	return ret_value;
}

