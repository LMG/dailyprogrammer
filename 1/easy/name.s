  .data
  .globl name
name:
  .string "What's your name?"
  .globl age
age:
  .string "What's your age?"
  .globl nick
nick:
  .string "What's your username?"
  .text
.globl main
main:
  pushq %rbp
  movq  %rsp,   %rbp
  movq  $name,  %rdi
  call  printf
  movq  $0,     %rax
  leave
  ret
