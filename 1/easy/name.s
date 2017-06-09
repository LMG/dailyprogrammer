  .data
  .globl name
askname:
  .string "What's your name?\n"
  .globl age
askage:
  .string "What's your age?\n"
  .globl nick
asknick:
  .string "What's your username?\n"
  .globl answer
answer:
  .string "your name is %s, you are %s years old, and your username is %s\n"
  .bss
  .lcomm name, 80#10 characters for the name
  .lcomm age, 32#4 characters for the age
  .lcomm nick, 80
  .text
.globl main
main:
  #save rbp, reset the stack
  pushq %rbp
  movq  %rsp,     %rbp

  #ask name
  movq  $askname, %rdi
  movq  $0,       %rax  #no arguments in vector register
  call  printf
  movq  $0,       %rdi #stdin
  movq  $name,    %rsi
  movq  $10,      %rdx 
  call  read
  #flush \n
  movq  $name,    %rdi
  addq  %rax,     %rdi
  subq  $1,       %rdi
  movq  $0,       (%rdi)

  #ask age
  movq  $askage,  %rdi
  movq  $0,       %rax  #no arguments in vector register
  call  printf
  movq  $0,       %rdi #stdin
  movq  $age,     %rsi
  movq  $4,       %rdx 
  call  read
  #flush \n
  movq  $age,    %rdi
  addq  %rax,     %rdi
  subq  $1,       %rdi
  movq  $0,       (%rdi)

  #ask nick
  movq  $asknick, %rdi
  movq  $0,       %rax  #no arguments in vector register
  call  printf
  movq  $0,       %rdi #stdin
  movq  $nick,    %rsi
  movq  $10,      %rdx 
  call  read
  #flush \n
  movq  $nick,    %rdi
  addq  %rax,     %rdi
  subq  $1,       %rdi
  movq  $0,       (%rdi)

  #display answer
  movq  $answer,  %rdi
  movq  $name,    %rsi
  movq  $age,     %rdx
  movq  $nick,    %rcx
  movq  $0,       %rax  #no arguments in vector register
  call  printf
  movq  $0,       %rax
  leave
  ret
