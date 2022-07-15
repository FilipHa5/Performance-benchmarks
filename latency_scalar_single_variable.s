	.file	"latency_scalar.c"
	.text
	.p2align 4
	.globl	time_clock
	.type	time_clock, @function
time_clock:
.LFB22:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	8(%rsp), %rsi
	leaq	16(%rsp), %rdi
	call	gettimeofday
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdq	16(%rsp), %xmm1
	cvtsi2sdq	24(%rsp), %xmm0
	divsd	.LC0(%rip), %xmm0
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	addsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE22:
	.size	time_clock, .-time_clock
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"\nResult of arithmetic operations: %lf\n"
	.align 8
.LC9:
	.string	"Time for executing %lf operations: %lf\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC11:
	.string	"Performance: %lf GFLOP/s\n\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movsd	.LC1(%rip), %xmm0
	movl	$1000000000, %eax
	movsd	.LC2(%rip), %xmm1
	movsd	.LC3(%rip), %xmm2
	.p2align 4,,10
	.p2align 3
.L5:
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	subl	$1, %eax
	jne	.L5
	mulsd	.LC4(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	clock
	leaq	24(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	pxor	%xmm4, %xmm4
	pxor	%xmm3, %xmm3
	movq	.LC3(%rip), %rdx
	cvtsi2sdq	32(%rsp), %xmm4
	movq	.LC2(%rip), %rcx
	movl	$100000000, %eax
	movsd	8(%rsp), %xmm0
	cvtsi2sdq	40(%rsp), %xmm3
	divsd	.LC0(%rip), %xmm3
	movq	%rdx, %xmm2
	movq	%rcx, %xmm1
	addsd	%xmm4, %xmm3
	movsd	%xmm3, (%rsp)
	.p2align 4,,10
	.p2align 3
.L6:
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	subl	$1, %eax
	jne	.L6
	movsd	%xmm0, 8(%rsp)
	call	clock
	leaq	24(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	movsd	8(%rsp), %xmm0
	cvtsi2sdq	32(%rsp), %xmm2
	movl	$.LC7, %edi
	movl	$1, %eax
	cvtsi2sdq	40(%rsp), %xmm1
	addsd	.LC5(%rip), %xmm0
	divsd	.LC0(%rip), %xmm1
	addsd	.LC6(%rip), %xmm0
	addsd	%xmm2, %xmm1
	subsd	(%rsp), %xmm1
	movsd	%xmm1, (%rsp)
	call	printf
	movsd	(%rsp), %xmm1
	movl	$.LC9, %edi
	movsd	.LC8(%rip), %xmm0
	movl	$2, %eax
	call	printf
	movl	$.LC11, %edi
	movl	$1, %eax
	movsd	.LC10(%rip), %xmm0
	divsd	(%rsp), %xmm0
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	jmp	printf
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	num_iter
	.section	.rodata
	.align 4
	.type	num_iter, @object
	.size	num_iter, 4
num_iter:
	.long	100000000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC1:
	.long	208632331
	.long	1072693249
	.align 8
.LC2:
	.long	45035996
	.long	1072693248
	.align 8
.LC3:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC4:
	.long	-400107883
	.long	1041313291
	.align 8
.LC5:
	.long	417264663
	.long	1072693250
	.align 8
.LC6:
	.long	625896994
	.long	1072693251
	.align 8
.LC8:
	.long	0
	.long	1101518724
	.align 8
.LC10:
	.long	-1717986918
	.long	1070176665
	.ident	"GCC: (GNU) 11.0.1 20210324 (Red Hat 11.0.1-0)"
	.section	.note.GNU-stack,"",@progbits
