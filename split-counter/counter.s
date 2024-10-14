	.text
	.file	"counter.c"
	.globl	counter                         # -- Begin function counter
	.p2align	4, 0x90
	.type	counter,@function
counter:                                # @counter
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movabsq	$.L.str, %rsi
	callq	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.LBB0_2
# %bb.1:
	movq	-16(%rbp), %rsi
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_6
.LBB0_2:
	movq	wcount@GOTPCREL(%rip), %rax
	movq	$0, (%rax)
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rdi
	callq	getword@PLT
	cmpl	$0, %eax
	je	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	jmp	.LBB0_3
.LBB0_5:
	movq	-8(%rbp), %rdi
	callq	fclose@PLT
	movq	-16(%rbp), %rdi
	movq	wcount@GOTPCREL(%rip), %rax
	movq	(%rax), %rsi
	callq	report@PLT
	movq	wcount@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	total_wcount@GOTPCREL(%rip), %rcx
	addq	(%rcx), %rax
	movq	total_wcount@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
.LBB0_6:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	counter, .Lfunc_end0-counter
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"r"
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"cannot open file `%s'\n"
	.size	.L.str.1, 23

	.ident	"Ubuntu clang version 18.1.8 (++20240731025011+3b5b5c1ec4a3-1~exp1~20240731145104.143)"
	.section	".note.GNU-stack","",@progbits
