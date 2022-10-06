.global gcd
.text

# every function in this question is repeated for 2 different cases:
# a) when M>N
# b) when M<N

# hence the functions loop1, loop2, decre1, decre2 serve the same purpose, but correspond to different registers

gcd:
cmp $0, %rdi
jl .convert1
jmp .check

.convert1:
imulq $-1 ,%rdi # multiply M with -1 to make it positive
jmp .check # go to check

.check:
cmp $0, %rsi # if N < 0 go to convert2
jl .convert2
jmp .main  # else go to main

.convert2:
imulq $-1, %rsi # multiply N with -1 to make it positive
jmp .main       # go to main

.main:   # both numbers > 0
cmp %rdi, %rsi
jl .case1  # if N < M go to case1
jmp .case2 # else go to case 2
decq %r8

.case1:     # N < M
movq %rsi, %r8   # N stored in %r8
jmp .loop1

.case2:
movq %rdi, %r8   # M stored in %r8
jmp .loop2

.equal:
movq %rdi, %rax  # move M to %rax
ret              # return %rax

.zero:      
mov %rdi, %rax
ret

.loop1:
movq %rdi, %rax  
cqto
idivq %r8     # divide by loop counter
cmp $0, %rdx  # if rem is zero
je .check2    # go to check2
jmp .decre1   # else go to decre1

.loop2:
movq %rsi, %rax
cqto
idivq %r8       # divide by loop counter
cmp $0, %rdx    # if rem is zero
je .check3      # go to check3
jmp .decre2      # else go to decre2

.check2:
movq %rsi, %rax  # control reaches here when %rdi is divisible by i
cqto
idivq %r8
cmp $0, %rdx
je .found
jmp .decre1

.check3:
movq %rdi, %rax
cqto
idivq %r8
cmp $0, %rdx
je .found
jmp .decre2


.found:   # when both numbers are divisible by counter
movq %r8, %rax
ret       # return counter

.decre1:  # decrementing value of loop counter
decq %r8
cmp $1, %r8  # if counter > 1
jg .loop1    # go to loop
jmp .base    # else go to base case

.decre2:
decq %r8
cmp $1, %r8
jg .loop2
jmp .base


.base:
movq $1, %rax  # base case - return 1
ret






