.global prime
.text
# returns FALSE when N < 2
.loop:
movq %rdi, %rax # update N everytime
cqto 
idivq %r8  # divide by loop counter
cmp $0, %rdx   # if remainder is 0
je .not        # go to not
incq %r8    #  increment loop counter by 1
jmp .L4      # again go to loop if value is less than N


.not:
movq $1, %rax # move 1 to %rax
ret   # return %rax


prime:
cmp $2, %rdi # if N < 2 go to not
jl .not  
jmp .L3  # else go to L3

.L3:
movq $2, %r8 # %r8 contains 2
jmp .L4

.L4:
cmp %r8, %rdi # compare loop counter with N
jg .loop   # if less go to loop



