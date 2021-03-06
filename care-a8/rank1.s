	.file	"rank1.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	quicksort
	.type	quicksort, @function
quicksort:
.LFB37:
	.cfi_startproc
	cmpl	%edx, %esi
	jg	.L26
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%edx, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
.L22:
	movl	%r12d, %eax
	movl	%r12d, %edx
	movl	%esi, %ebx
	subl	%esi, %eax
	sarl	%eax
	addl	%esi, %eax
	cmpl	%edx, %ebx
	cltq
	movss	0(%rbp,%rax,4), %xmm1
	jge	.L8
.L27:
	movslq	%ebx, %rax
	salq	$2, %rax
	leaq	0(%rbp,%rax), %rdi
	leaq	4(%rbp,%rax), %rax
	movss	(%rdi), %xmm2
	ucomiss	%xmm1, %xmm2
	jbe	.L9
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%rax, %rdi
	addq	$4, %rax
	addl	$1, %ebx
	movss	-4(%rax), %xmm2
	ucomiss	%xmm1, %xmm2
	ja	.L19
.L9:
	movslq	%edx, %rax
	salq	$2, %rax
	leaq	0(%rbp,%rax), %rcx
	leaq	-4(%rbp,%rax), %rax
	movss	(%rcx), %xmm0
	ucomiss	%xmm0, %xmm1
	jbe	.L5
	.p2align 4,,10
	.p2align 3
.L18:
	movq	%rax, %rcx
	subq	$4, %rax
	subl	$1, %edx
	movss	4(%rax), %xmm0
	ucomiss	%xmm0, %xmm1
	ja	.L18
.L5:
	cmpl	%edx, %ebx
	jg	.L8
	addl	$1, %ebx
	subl	$1, %edx
	movss	%xmm0, (%rdi)
	cmpl	%edx, %ebx
	movss	%xmm2, (%rcx)
	jl	.L27
.L8:
	cmpl	%esi, %edx
	jg	.L28
	cmpl	%ebx, %r12d
	jle	.L29
.L15:
	movl	%ebx, %esi
	jmp	.L22
.L28:
	movq	%rbp, %rdi
	call	quicksort
	cmpl	%ebx, %r12d
	jg	.L15
.L29:
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
	ret
.L26:
	ret
	.cfi_endproc
.LFE37:
	.size	quicksort, .-quicksort
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	binary_search
	.type	binary_search, @function
binary_search:
.LFB38:
	.cfi_startproc
	.p2align 4,,10
	.p2align 3
.L31:
	movl	%edx, %eax
	subl	%esi, %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%ecx, %eax
	sarl	%eax
	addl	%esi, %eax
	movslq	%eax, %rcx
	movss	(%rdi,%rcx,4), %xmm1
	ucomiss	%xmm0, %xmm1
	jp	.L32
	je	.L41
.L32:
	ucomiss	%xmm1, %xmm0
	jbe	.L40
	leal	-1(%rax), %edx
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L40:
	leal	1(%rax), %esi
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L41:
	addl	$1, %eax
	ret
	.cfi_endproc
.LFE38:
	.size	binary_search, .-binary_search
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	cmp
	.type	cmp, @function
cmp:
.LFB39:
	.cfi_startproc
	movl	(%rsi), %eax
	subl	(%rdi), %eax
	ret
	.cfi_endproc
.LFE39:
	.size	cmp, .-cmp
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
	.p2align 4,,15
	.globl	compute_ranks
	.type	compute_ranks, @function
compute_ranks:
.LFB40:
	.cfi_startproc
	testl	%esi, %esi
	movl	$0, (%r9)
	movl	$0x00000000, (%rcx)
	movl	$0x00000000, (%r8)
	jle	.L64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r9, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rcx, %r12
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdx, 8(%rsp)
	movslq	%esi, %rdx
	movq	%rdx, %r13
	salq	$2, %rdx
	movq	%rdx, %rdi
	movq	%rdx, (%rsp)
	call	malloc
	movq	(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	memcpy
	leal	-1(%r13), %r8d
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movl	%r8d, %edx
	call	quicksort
	movq	8(%rsp), %rcx
	movss	(%r12), %xmm1
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L53:
	movss	0(%rbp,%rsi,4), %xmm0
	movl	%r8d, %edi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L45:
	movl	%edi, %eax
	subl	%edx, %eax
	movl	%eax, %r9d
	shrl	$31, %r9d
	addl	%r9d, %eax
	sarl	%eax
	addl	%edx, %eax
	movslq	%eax, %r9
	ucomiss	(%rbx,%r9,4), %xmm0
	jp	.L57
	je	.L65
	jbe	.L57
	leal	-1(%rax), %edi
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L57:
	leal	1(%rax), %edx
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L65:
	addss	%xmm0, %xmm1
	addl	$1, %eax
	movl	%eax, (%rcx,%rsi,4)
	movss	%xmm1, (%r12)
	movss	0(%rbp,%rsi,4), %xmm0
	ucomiss	.LC4(%rip), %xmm0
	jb	.L49
	addss	(%r14), %xmm0
	movss	%xmm0, (%r14)
	addl	$1, (%r15)
	movss	(%r12), %xmm1
.L49:
	addq	$1, %rsi
	cmpl	%esi, %r13d
	jg	.L53
	pxor	%xmm0, %xmm0
	movl	(%r15), %eax
	cvtsi2ss	%r13d, %xmm0
	testl	%eax, %eax
	divss	%xmm0, %xmm1
	movss	%xmm1, (%r12)
	je	.L54
	pxor	%xmm0, %xmm0
	movss	(%r14), %xmm1
	cvtsi2ss	%eax, %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, (%r14)
.L54:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	free
.L64:
	rep ret
	.cfi_endproc
.LFE40:
	.size	compute_ranks, .-compute_ranks
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	1112014848
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
