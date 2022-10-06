.global largeprime
.text

largeprime:
cmp $0, %rdi  
jl .convert   # if N < 0 go to convert
jmp .check    # else go to check

.convert:
imulq $-1, %rdi # multiply by -1. N becomes > 0
jmp .check      # go to check

.check:
cmp $0, %rdi # if N == 0
je .return   # go to return
jmp .checkagain  # else go to checkagain
 
.return:
mov $-1, %rax  # return -1 when N is 0 or 1
ret

.checkagain:
cmp $1, %rdi   # if N == -1
je .return     # go to return
jmp .assign    # else go to assign

.assign:
movq $2, %r8      # %r8 is now 2. this is loop counter
# movq %rdi, %rax   # move N in %rax 
jmp .condition    # go to condition

.condition:
cmp $0, %rdi     # condition that will be checked each time before entering loop 
jne .loop

.loop:
movq %rdi, %rax
cqto
idivq %r8        # divide %rax(N) by %r8 and store quotient here
cmp $0, %rdx     # check if rem is zero
je .list         # if rem==0 go to list
jmp .else        # else go to else

.list: 
movq %rdi, %r9
movq %rdi, %rax  # %r9 has current value
cqto
idivq %r8        # divide and store quotient in %rax
movq %rax, %rdi  
cmp $1, %rdi     # if N == 1
je .retur        # go to retur
jmp .condition   # else check condition again


# when N % i != 0
.else:
incq %r8        #   increment i  
jmp .condition   # go to condition

.retur:
movq %r9, %rax   
ret







