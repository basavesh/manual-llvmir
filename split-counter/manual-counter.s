	.text
	.file	"manual-counter.ll"
	.globl	counter                         # -- Begin function counter
	.p2align	4, 0x90
	.type	counter,@function
counter:                                # @counter
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	movl	$.Lro0x2004, %esi
	callq	fopen@PLT
	movq	%rax, (%rsp)
	testq	%rax, %rax
	je	.LBB0_1
# %bb.2:
	movq	bss0x4068@GOTPCREL(%rip), %rbx
	movq	$0, (%rbx)
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rdi
	callq	getword@PLT
	testl	%eax, %eax
	jne	.LBB0_3
# %bb.4:
	movq	(%rsp), %rdi
	callq	fclose@PLT
	movq	8(%rsp), %rdi
	movq	(%rbx), %rsi
	callq	report@PLT
	movq	(%rbx), %rax
	movq	bss0x4060@GOTPCREL(%rip), %rcx
	addq	%rax, (%rcx)
	jmp	.LBB0_5
.LBB0_1:
	movq	8(%rsp), %rsi
	movl	$.Lro0x2006, %edi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_5:
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	counter, .Lfunc_end0-counter
	.cfi_endproc
                                        # -- End function
	.type	.Lro0x2004,@object              # @ro0x2004
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lro0x2004:
	.asciz	"r"
	.size	.Lro0x2004, 2

	.type	.Lro0x2006,@object              # @ro0x2006
.Lro0x2006:
	.asciz	"cannot open file `%s'\n"
	.size	.Lro0x2006, 23

	.section	".note.GNU-stack","",@progbits
