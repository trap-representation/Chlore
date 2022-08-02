set POINTER_HEAP -9223372036854775808
set POINTER_DATA 9223372036854775807

:oentry force_panic

:exposed$__std_string_strlen (
	swap ;the [top] of the stack now has an explicit pointer to data or the heap
	pushu8 0 ;this is the length of the string initially
	swap dup
	pushi64 POINTER_HEAP
	andi64
	pushi64 POINTER_HEAP
	rjeq __std_string_strlen_heap
	rjmp __std_string_strlen_data

:exposed$__std_string_strlen_heap
	pushi64 POINTER_DATA andi64 ;get the implicit address to the heap
	:exposed$__std_string_strlen_heap_loop
		dup ;both the [top] and [top-1] have (the same dup'ed) pointers to the heap
		& lfhu8 rjnz __std_string_strlen_heap_loop_inc ;jump to `std_string_strlen_heap_loop_inc' if the character encountered is not a nul terminator
	pop swap
	pushu8 0 str0 ;save a zero return value in GPR 0
	ret

:exposed$__std_string_strlen_heap_loop_inc
	pushu8 1 addi64 ;increment the heap pointer
	swap pushu8 1 addi64 ;increment the length of the string
	swap
	rjmp __std_string_strlen_heap

:exposed$__std_string_strlen_data
	pushi64 POINTER_DATA andi64 ;get the implicit address to the data
	:exposed$__std_string_strlen_data_loop
		dup ;both the [top] and [top-1] have (the same dup'ed) pointers to the data
		loadcu8 rjnz __std_string_strlen_data_loop_inc ;jump to `std_string_strlen_data_loop_inc' if the character encountered is not a nul terminator
	pop swap
	pushu8 0 str0 ;save a zero return value in GPR 0
	ret

:exposed$__std_string_strlen_data_loop_inc
	pushu8 1 addi64 ;increment the data pointer
	swap pushu8 1 addi64 ;increment the length of the string
	swap
	rjmp __std_string_strlen_data
)

