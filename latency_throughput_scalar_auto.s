	.file	"latency_throughput_scalar_auto.c"
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
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC17:
	.string	"\nNum var: %d"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC18:
	.string	"\nResult of arithmetic operations: %lf\n"
	.align 8
.LC19:
	.string	"Time for executing %lf operations: %lf\n"
	.section	.rodata.str1.1
.LC20:
	.string	"Performance: %lf GFLOP/s\n\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	$1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	xorl	%ebx, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
.L22:
	movq	%rbx, %rbp
	addq	$8, %rbx
	movsd	%xmm3, (%rsp)
	movq	%rbx, %rdi
	call	malloc
	cmpl	$1, %r13d
	movsd	(%rsp), %xmm3
	movq	%rax, %r12
	movq	.LC1(%rip), %rax
	movq	%rax, (%r12)
	movq	.LC11(%rip), %rax
	movq	%rax, %xmm2
	je	.L5
	movq	.LC2(%rip), %rax
	movq	%rax, 8(%r12)
	cmpl	$2, %r13d
	je	.L6
	movq	.LC3(%rip), %rax
	movq	%rax, 16(%r12)
	cmpl	$3, %r13d
	je	.L6
	movq	.LC4(%rip), %rax
	movq	%rax, 24(%r12)
	cmpl	$4, %r13d
	je	.L6
	movq	.LC5(%rip), %rax
	movq	%rax, 32(%r12)
	cmpl	$5, %r13d
	je	.L6
	movq	.LC6(%rip), %rax
	movq	%rax, 40(%r12)
	cmpl	$6, %r13d
	je	.L6
	movq	.LC7(%rip), %rax
	movq	%rax, 48(%r12)
	cmpl	$7, %r13d
	je	.L6
	movq	.LC8(%rip), %rax
	movq	%rax, 56(%r12)
	cmpl	$8, %r13d
	je	.L6
	movq	.LC9(%rip), %rax
	movq	%rax, 64(%r12)
	cmpl	$10, %r13d
	jne	.L6
	movq	.LC10(%rip), %rax
	movq	%rax, 72(%r12)
.L6:
	movupd	(%r12), %xmm0
	movapd	.LC12(%rip), %xmm5
	movl	%r13d, %eax
	movl	%r13d, %r14d
	movapd	.LC13(%rip), %xmm1
	shrl	%eax
	mulpd	%xmm5, %xmm0
	addpd	%xmm1, %xmm0
	movups	%xmm0, (%r12)
	cmpl	$1, %eax
	je	.L8
	movupd	16(%r12), %xmm6
	mulpd	%xmm5, %xmm6
	addpd	%xmm1, %xmm6
	movups	%xmm6, 16(%r12)
	cmpl	$2, %eax
	je	.L8
	movupd	32(%r12), %xmm6
	mulpd	%xmm5, %xmm6
	addpd	%xmm1, %xmm6
	movups	%xmm6, 32(%r12)
	cmpl	$3, %eax
	je	.L8
	movupd	48(%r12), %xmm6
	mulpd	%xmm5, %xmm6
	addpd	%xmm1, %xmm6
	movups	%xmm6, 48(%r12)
	cmpl	$5, %eax
	jne	.L8
	movupd	64(%r12), %xmm7
	mulpd	%xmm7, %xmm5
	addpd	%xmm5, %xmm1
	movups	%xmm1, 64(%r12)
.L8:
	movl	%r13d, %eax
	andl	$-2, %eax
	testb	$1, %r13b
	je	.L9
	cltq
	movsd	.LC1(%rip), %xmm0
	leaq	(%r12,%rax,8), %rax
	mulsd	(%rax), %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rax)
	cmpl	$1, %r13d
	je	.L7
	movupd	(%r12), %xmm0
.L9:
	movapd	.LC14(%rip), %xmm1
	movl	%r13d, %eax
	shrl	%eax
	mulpd	%xmm1, %xmm0
	movups	%xmm0, (%r12)
	cmpl	$1, %eax
	je	.L11
	movupd	16(%r12), %xmm0
	mulpd	%xmm1, %xmm0
	movups	%xmm0, 16(%r12)
	cmpl	$2, %eax
	je	.L11
	movupd	32(%r12), %xmm0
	mulpd	%xmm1, %xmm0
	movups	%xmm0, 32(%r12)
	cmpl	$3, %eax
	je	.L11
	movupd	48(%r12), %xmm0
	mulpd	%xmm1, %xmm0
	movups	%xmm0, 48(%r12)
	cmpl	$5, %eax
	jne	.L11
	movupd	64(%r12), %xmm0
	mulpd	%xmm1, %xmm0
	movups	%xmm0, 64(%r12)
.L11:
	movl	%r13d, %eax
	andl	$-2, %eax
	testb	$1, %r13b
	je	.L12
.L10:
	cltq
	movsd	.LC15(%rip), %xmm0
	leaq	(%r12,%rax,8), %rax
	mulsd	(%rax), %xmm0
	movsd	%xmm0, (%rax)
.L12:
	leaq	24(%rsp), %rsi
	leaq	32(%rsp), %rdi
	movsd	%xmm3, 8(%rsp)
	call	gettimeofday
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movl	%r14d, %edi
	movl	%r14d, %esi
	movsd	8(%rsp), %xmm3
	leal	-1(%r14), %r8d
	shrl	$2, %edi
	cvtsi2sdq	32(%rsp), %xmm1
	andl	$-4, %esi
	movq	.LC11(%rip), %rax
	movapd	.LC13(%rip), %xmm4
	cvtsi2sdq	40(%rsp), %xmm0
	divsd	.LC0(%rip), %xmm0
	movl	$1, %ecx
	movq	%rax, %xmm2
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsp)
	jmp	.L13
.L91:
	movupd	16(%r12), %xmm0
	movupd	(%r12), %xmm1
	addpd	%xmm4, %xmm0
	addpd	%xmm4, %xmm1
	addpd	%xmm4, %xmm0
	addpd	%xmm4, %xmm1
	movups	%xmm0, 16(%r12)
	movups	%xmm1, (%r12)
	cmpl	$2, %edi
	jne	.L14
	movupd	48(%r12), %xmm0
	movupd	32(%r12), %xmm1
	addpd	%xmm4, %xmm0
	addpd	%xmm4, %xmm1
	addpd	%xmm4, %xmm0
	addpd	%xmm4, %xmm1
	movups	%xmm0, 48(%r12)
	movups	%xmm1, 32(%r12)
.L14:
	movl	%esi, %eax
	cmpl	%r14d, %esi
	je	.L15
.L19:
	movslq	%eax, %rdx
	salq	$3, %rdx
	leaq	(%r12,%rdx), %r9
	movsd	(%r9), %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%r9)
	leal	1(%rax), %r9d
	cmpl	%r9d, %r13d
	jle	.L15
	leaq	8(%r12,%rdx), %r9
	addl	$2, %eax
	movsd	(%r9), %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%r9)
	cmpl	%eax, %r13d
	jle	.L15
	leaq	16(%r12,%rdx), %rax
	movsd	(%rax), %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rax)
.L15:
	addl	$2, %ecx
	cmpl	$99999999, %ecx
	je	.L94
.L13:
	cmpl	$2, %r8d
	ja	.L91
	xorl	%eax, %eax
	jmp	.L19
.L5:
	movq	.LC21(%rip), %rax
	movl	$1, %r14d
	movq	%rax, (%r12)
.L7:
	xorl	%eax, %eax
	jmp	.L10
.L94:
	movq	%r12, %rdx
	leaq	0(%rbp,%r12), %rcx
	.p2align 4,,10
	.p2align 3
.L17:
	movsd	(%rdx), %xmm0
	movl	$2, %eax
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L24:
	movl	$1, %eax
.L16:
	addsd	%xmm2, %xmm0
	cmpl	$1, %eax
	jne	.L24
	movsd	%xmm0, (%rdx)
	leaq	8(%rdx), %rax
	cmpq	%rdx, %rcx
	je	.L95
	movq	%rax, %rdx
	jmp	.L17
.L95:
	leaq	24(%rsp), %rsi
	leaq	32(%rsp), %rdi
	movsd	%xmm3, 8(%rsp)
	call	gettimeofday
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movsd	8(%rsp), %xmm3
	cvtsi2sdq	32(%rsp), %xmm1
	addsd	(%r12), %xmm3
	cvtsi2sdq	40(%rsp), %xmm0
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	subsd	(%rsp), %xmm0
	movsd	%xmm0, (%rsp)
	cmpl	$1, %r13d
	je	.L21
	addsd	8(%r12), %xmm3
	cmpl	$2, %r13d
	je	.L21
	addsd	16(%r12), %xmm3
	cmpl	$3, %r13d
	je	.L21
	addsd	24(%r12), %xmm3
	cmpl	$4, %r13d
	je	.L21
	addsd	32(%r12), %xmm3
	cmpl	$5, %r13d
	je	.L21
	addsd	40(%r12), %xmm3
	cmpl	$6, %r13d
	je	.L21
	addsd	48(%r12), %xmm3
	cmpl	$7, %r13d
	je	.L21
	addsd	56(%r12), %xmm3
	cmpl	$8, %r13d
	je	.L21
	addsd	64(%r12), %xmm3
	cmpl	$10, %r13d
	jne	.L21
	addsd	72(%r12), %xmm3
.L21:
	movq	%r12, %rdi
	movsd	%xmm3, 8(%rsp)
	call	free
	pxor	%xmm0, %xmm0
	movl	%r13d, %esi
	xorl	%eax, %eax
	cvtsi2sdl	%r13d, %xmm0
	movl	$.LC17, %edi
	addl	$1, %r13d
	addsd	%xmm0, %xmm0
	mulsd	.LC16(%rip), %xmm0
	movq	%xmm0, %rbp
	call	printf
	movsd	8(%rsp), %xmm3
	movl	$.LC18, %edi
	movl	$1, %eax
	movapd	%xmm3, %xmm0
	call	printf
	movsd	(%rsp), %xmm1
	movq	%rbp, %xmm0
	movl	$.LC19, %edi
	movl	$2, %eax
	call	printf
	movq	%rbp, %xmm0
	movl	$.LC20, %edi
	movl	$1, %eax
	mulsd	.LC15(%rip), %xmm0
	divsd	(%rsp), %xmm0
	call	printf
	cmpl	$11, %r13d
	movsd	8(%rsp), %xmm3
	jne	.L22
	addq	$48, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	num_var
	.section	.rodata
	.align 4
	.type	num_var, @object
	.size	num_var, 4
num_var:
	.long	10
	.globl	num_iter
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
	.set	.LC1,.LC12
	.align 8
.LC2:
	.long	417264663
	.long	1072693250
	.align 8
.LC3:
	.long	625896994
	.long	1072693251
	.align 8
.LC4:
	.long	834529325
	.long	1072693252
	.align 8
.LC5:
	.long	1043161657
	.long	1072693253
	.align 8
.LC6:
	.long	1251793988
	.long	1072693254
	.align 8
.LC7:
	.long	1460426320
	.long	1072693255
	.align 8
.LC8:
	.long	1669058651
	.long	1072693256
	.align 8
.LC9:
	.long	1877690982
	.long	1072693257
	.align 8
.LC10:
	.long	2086323314
	.long	1072693258
	.set	.LC11,.LC13
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC12:
	.long	208632331
	.long	1072693249
	.long	208632331
	.long	1072693249
	.align 16
.LC13:
	.long	-1598689907
	.long	1051772663
	.long	-1598689907
	.long	1051772663
	.align 16
.LC14:
	.long	-400107883
	.long	1041313291
	.long	-400107883
	.long	1041313291
	.set	.LC15,.LC14
	.section	.rodata.cst8
	.align 8
.LC16:
	.long	0
	.long	1100470148
	.align 8
.LC21:
	.long	625901497
	.long	1072693251
	.ident	"GCC: (GNU) 11.0.1 20210324 (Red Hat 11.0.1-0)"
	.section	.note.GNU-stack,"",@progbits
