	.text
	.file	"wc.c"
	.globl	report                          # -- Begin function report
	.p2align	4, 0x90
	.type	report,@function
report:                                 # @report
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdx
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	report, .Lfunc_end0-report
	.cfi_endproc
                                        # -- End function
	.globl	getword                         # -- Begin function getword
	.p2align	4, 0x90
	.type	getword,@function
getword:                                # @getword
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
	movq	-16(%rbp), %rdi
	callq	feof@PLT
	cmpl	$0, %eax
	je	.LBB1_2
# %bb.1:
	movl	$0, -8(%rbp)
	jmp	.LBB1_16
.LBB1_2:
	jmp	.LBB1_3
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rdi
	callq	getc@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, %eax
	je	.LBB1_7
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	movl	-4(%rbp), %eax
	movzbl	%al, %edi
	callq	isword
	cmpl	$0, %eax
	je	.LBB1_6
# %bb.5:
	movq	wcount, %rax
	addq	$1, %rax
	movq	%rax, wcount
	jmp	.LBB1_8
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_3
.LBB1_7:                                # %.loopexit1
	jmp	.LBB1_8
.LBB1_8:
	jmp	.LBB1_9
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	cmpl	$-1, -4(%rbp)
	je	.LBB1_14
# %bb.10:                               #   in Loop: Header=BB1_9 Depth=1
	movl	-4(%rbp), %eax
	movzbl	%al, %edi
	callq	isword
	cmpl	$0, %eax
	jne	.LBB1_12
# %bb.11:
	jmp	.LBB1_15
.LBB1_12:                               #   in Loop: Header=BB1_9 Depth=1
	jmp	.LBB1_13
.LBB1_13:                               #   in Loop: Header=BB1_9 Depth=1
	movq	-16(%rbp), %rdi
	callq	getc@PLT
	movl	%eax, -4(%rbp)
	jmp	.LBB1_9
.LBB1_14:                               # %.loopexit
	jmp	.LBB1_15
.LBB1_15:
	cmpl	$-1, -4(%rbp)
	setne	%al
	andb	$1, %al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
.LBB1_16:
	movl	-8(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	getword, .Lfunc_end1-getword
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function isword
	.type	isword,@function
isword:                                 # @isword
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%dil, -1(%rbp)
	callq	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movzbl	-1(%rbp), %ecx
	movslq	%ecx, %rcx
	movzwl	(%rax,%rcx,2), %eax
	andl	$1024, %eax                     # imm = 0x400
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	isword, .Lfunc_end2-isword
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -12(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -24(%rbp)
	cmpl	$2, -8(%rbp)
	jge	.LBB3_2
# %bb.1:
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$-1, -12(%rbp)
	jmp	.LBB3_9
.LBB3_2:
	movl	$1, -4(%rbp)
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB3_6
# %bb.4:                                #   in Loop: Header=BB3_3 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	counter@PLT
# %bb.5:                                #   in Loop: Header=BB3_3 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB3_3
.LBB3_6:
	cmpl	$2, -8(%rbp)
	jle	.LBB3_8
# %bb.7:
	movq	total_wcount, %rsi
	movabsq	$.L.str.2, %rdi
	callq	report
.LBB3_8:
	movl	$0, -12(%rbp)
.LBB3_9:
	movl	-12(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	total_wcount,@object            # @total_wcount
	.bss
	.globl	total_wcount
	.p2align	3, 0x0
total_wcount:
	.quad	0                               # 0x0
	.size	total_wcount, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%6lu %s\n"
	.size	.L.str, 9

	.type	wcount,@object                  # @wcount
	.bss
	.globl	wcount
	.p2align	3, 0x0
wcount:
	.quad	0                               # 0x0
	.size	wcount, 8

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"usage: wc FILE [FILE...]"
	.size	.L.str.1, 25

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"total"
	.size	.L.str.2, 6

	.ident	"Ubuntu clang version 18.1.8 (++20240731025011+3b5b5c1ec4a3-1~exp1~20240731145104.143)"
	.section	".note.GNU-stack","",@progbits
