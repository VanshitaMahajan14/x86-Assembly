.global sums
.text

sums:
mov $0, %r8    # sum
movq $1, %r9   # counter for each number 
jmp .start 

.start:
cmp %rdi, %r9  # compare N with i
jle .loop      # if i<= N go to loop
jmp .done

.done:
mov %r8, %rax
cmp $0, %rax
jl .neg
jmp .retur

.retur:
ret

.neg:
movabsq $9223372036854775807,%rax

.loop:      # go to calc
jmp .calc

.calc:           
mov %r9, %r10     # move i to %r10
imulq %r9, %r10   # multiply i by i
addq %r10, %r8    # add product to sum
incq %r9          # increment i
jmp .start        # go to start


; .global sum_square
; .text
; sum_square:

; movq %rdi, %rax  # moving input i.e., N to %rax
; movq %rax, %r8   # moving N to %r8
; incq %r8         # increment %r8 by 1. %r8 is now N+1
; movq %rax, %r9   # moving N %to r9
; imulq $2, %r9    # multiplying %r9 by 2. %r9 is now 2N
; incq %r9         # increment %r9 by 1. %r9 is now 2N+1
; imulq %r8, %rax  # multiplying %rax by %r8. %rax is now N(N+1)
; imulq %r9, %rax  # multiplying %rax by %r9. %rax is now N(N+1)(2N+1)
; movq $6, %r10    # moving 6 to %r10
; idivq %r10       # dividing %rax by %r10. %rax is now N(N+1)(2N+1)/6
; cmp $0, %rax
; jl .neg
; jmp .retur

; .neg:
; movabsq $9223372036854775807,%rax
; .retur:
; ret              # return %rax(answer)
