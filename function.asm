.text
main:
	addi $s0, $0, 8 # s0 =  a
	addi $s1, $0, 8 # s1 = b
	bne $s0, $s1, else # if s0 != s1, go to else
	mul $s3, $s0, $s1 # s3 = s0 * s1 = return
	jal done #call done
else:
	jal asses #call asses
	jal done #call done
asses:
	slt $t0, $s1, $s0 # if s1<s0 , then t0 = 1
	bne $t0, $0, else_one # if t0 != 0, go to else_one
	jal demote # call demote 
	add $s3, $v0, $0 # return value
	jal done #call done
else_one:
	jal upgrade # call upgrade
	add $s3, $v0, $0 # return value
	jal done # call done
upgrade:
	add $s3, $s1, $s0 # s3 = s1 + s0
	sll $s3, $s3, 2 # s3 = s3 * 4
	add $v0, $s3, $0 # return value
	jr $ra # back to caller
demote:
	sub $s3, $s1, $s0 # s3 = s1 - s0
	sll $s3, $s3, 2 # s3 = s3 * 4
	add $v0, $s3, $0 # return value
	jr $ra # back to caller
done:
	li $v0, 10
	syscall

