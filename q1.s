.global quotient
.global rem
.text

# %rdi - M
# %rsi - N
# quotient flag is zero when M.N > 0 
# quotient flag is 1 when M.N < 0


quotient:
mov $0, %rax # to store count
jmp .check1

.check1:
cmp $0, %rdi # check if M < 0
jl .check2   # if yes, go to check2
jmp .check3  # else go to check3

.check2:
cmp $0, %rsi  # check if N < 0 
jl .flag1     # if yes, flag1
jmp .check6   # else check6

.check6: # M<0 ,N>0
imulq $-1, %rdi  # make M positive
mov $1, %r8      # as M.N < 0 flag = 1
jmp .loop        # go to loop

.check3:  
cmp $0, %rsi    
jl .check4
jmp .check5

.check5:  # M>0, N>0
mov $0, %r8      # as  M.N > 0 flag = 0 
jmp .loop        # go to loop

.check4:         # M>0, N <0
imulq $-1, %rsi  # make N positive
mov $1, %r8      # M.N < 0, hence flag = 1
jmp .loop        # go to loop

.flag1:  # both M,N< 0
mov $0, %r8
imulq $-1, %rdi  # make M positive 
imulq $-1, %rsi   # make N positive
jmp .loop    # go to loop

.loop:
cmp %rsi, %rdi   # compare M,N
jge .while      # if M >= N go to while
jmp .over       # else calculation over, go to over

.over:
# movq %r10, %rax
cmp $0 , %r8    # if flag = 0
je .no          # go to no
jmp .yes        # else go to yes

.no:          # flag = 0
ret            # simply return count

.yes:  # flag = 1
imulq $-1, %rax # make count(quotient) negative
ret             # return count

.while:
inc %rax      # increment count by 1
subq %rsi, %rdi # subtract N from M
jmp .loop      #



rem:
cmp $0, %rdi   # when M is zero
je .flag       # go to flag
jmp .L4        # else go to L4

.L4:
cmpq $0,%rdi   
jl .convertM  # go to convert M
jmp .checkonlyN

.flag:
jmp .checkN

.checkN:       # when both M and N are zero
cmp $0, %rsi
je .bothzero
jmp .L3
.L3:
movq $0,%rax
ret

.checkonlyN:
cmp $0, %rsi    # check N with 0
jl .convertN    # if yes go to convert N
jmp .looprem    # else to looprem

.convertM:
movq $1, %r11     # flag 1 stored in %r11
imulq $-1, %rdi   # multiply M by -1
jmp .checkonlyN   # check N

.convertN:
imulq $-1, %rsi   # multiply M by -1
jmp .looprem      # go to looprem


.bothzero:
mov $-1, %rax     # when both zero return -1
ret

.looprem:
cmp %rsi, %rdi   # compare N with M
jge .while2      # if M>=N go to while2
jmp .done        # else, operation is done

.while2:
subq %rsi, %rdi  # subtract N from M
jmp .looprem     # jump to looprem

.done:
cmp $1, %r11     # check flag (set when M<0)
je .flagexists   # if flag is 1 go to flagexists
jmp .noflag      # else go to noflag

.noflag:
mov %rdi, %rax   # return final M after all subtractions
ret  


.flagexists:
imulq $-1, %rdi  # return negative of rem
mov %rdi, %rax
ret





