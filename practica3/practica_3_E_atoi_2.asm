.data
str: .space 1024
	.text
main:
	la $a0, str
        la $a1, 1024
	li $v0,8
	syscall
	move $s0,$zero
	move $t2,$zero
	
str_to_int:
	lb $t3,str($s0)
	beq $t3,45,minus
	beq $t3,10,end
	mul $t2,$t2,10
	subi $t3,$t3,48
	add $t2,$t2,$t3
	addi $s0,$s0,1
	b str_to_int

minus:
	addi $s0,$s0,1
	b str_to_int

change_to_minus:
	mul $t2,$t2,-1
	b print

end:
	lb $t3,str($zero)
	beq $t3,45,change_to_minus

print:	
	move $a0,$t2
	li $v0,1
	syscall
	li $v0,10
	syscall
