/ example 6: FizzBuzz
  Just a simple fizzbuzz program
/

import "./lib/import/io.clh"
import "./lib/import/shorthand.clh"
import "./lib/import/porttypes.clh"

:fizz_string dat str "fizz\n"
:buzz_string dat str "buzz\n"
:fizz_buzz_string dat str "fizzbuzz\n"

:main
%pushuc 0
%reg_std_io

%pushuc 0 %pushuc 0
%reg_std_io_putstr

%pushuc 0 %pushuc 1
%reg_std_io_putl

%pushuc 0 %pushuc 2
%reg_std_io_putchar

set MAX_CNT 100

%pushuc 0

:loop
	%++l ;increment the number at the top of the stack

	dup
	%pushuc 15 swap %reml ;check if the number is divisible by 15
	jnz check_fizz ;if not, jump to `check_fizz' to check if it divisible by 3
	%pushp fizz_buzz_string ;print "fizzbuzz"
	%pushuc 0 !
	jmp continue

	:check_fizz
	dup
	%pushuc 3 swap %reml ;check if the number is divisible by 3
	jnz check_buzz ;if not, jump to `check_buzz' to check if it divisible by 5
	%pushp fizz_string ;print "fizz"
	%pushuc 0 !
	jmp continue

	:check_buzz
	dup
	%pushuc 5 swap %reml ;check if the number is divisible by 5
	jnz print_num ;if not, jump to `print_num' to just print the number at the top of the stack
	%pushp buzz_string ;print "buzz"
	%pushuc 0 !
	jmp continue

	:print_num
	dup
	%pushuc 1 ! ;print the number
	%pushuc '\n' %pushuc 2 ! ;print a linefeed

	:continue
	dup %pushl MAX_CNT jne loop ;loop until the number is > MAX_CNT

hlt
