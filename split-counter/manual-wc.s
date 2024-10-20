	.text
	.file	"manual-wc.ll"
	.globl	report                          # -- Begin function report
	.p2align	4, 0x90
	.type	report,@function
report:                                 # @report
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rdx
	movq	%rdi, 16(%rsp)
	movq	%rsi, 8(%rsp)
	movl	$.Lrox201d, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	$0, 20(%rsp)
	callq	feof@PLT
	testl	%eax, %eax
	je	.LBB1_2
# %bb.1:
	movl	$0, 4(%rsp)
	jmp	.LBB1_9
	.p2align	4, 0x90
.LBB1_3:                                #   in Loop: Header=BB1_2 Depth=1
	movzbl	(%rsp), %edi
	callq	isword@PLT
	testl	%eax, %eax
	jne	.LBB1_4
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rdi
	callq	getc@PLT
	movl	%eax, (%rsp)
	cmpl	$-1, %eax
	jne	.LBB1_3
	jmp	.LBB1_5
.LBB1_4:
	incq	wcount(%rip)
	jmp	.LBB1_5
	.p2align	4, 0x90
.LBB1_6:                                #   in Loop: Header=BB1_5 Depth=1
	movzbl	(%rsp), %edi
	callq	isword@PLT
	testl	%eax, %eax
	je	.LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_5 Depth=1
	movq	8(%rsp), %rdi
	callq	getc@PLT
	movl	%eax, (%rsp)
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$-1, (%rsp)
	jne	.LBB1_6
.LBB1_8:
	xorl	%eax, %eax
	cmpl	$-1, (%rsp)
	setne	%al
	movl	%eax, 4(%rsp)
.LBB1_9:
	movl	4(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	getword, .Lfunc_end1-getword
	.cfi_endproc
                                        # -- End function
	.globl	isword                          # -- Begin function isword
	.p2align	4, 0x90
	.type	isword,@function
isword:                                 # @isword
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movb	%dil, 7(%rsp)
	callq	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movzbl	7(%rsp), %ecx
	movzwl	(%rax,%rcx,2), %eax
	andl	$1024, %eax                     # imm = 0x400
	popq	%rcx
	.cfi_def_cfa_offset 8
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, 8(%rsp)
	movq	%rsi, 12(%rsp)
	movq	%rsi, 16(%rsp)
	cmpl	$1, %esi
	jg	.LBB3_2
# %bb.1:
	movl	$.Lro0x2026, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$-1, 8(%rsp)
	jmp	.LBB3_8
.LBB3_2:
	movl	$1, 4(%rsp)
	.p2align	4, 0x90
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %eax
	cmpl	12(%rsp), %eax
	jge	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_3 Depth=1
	movq	16(%rsp), %rax
	movslq	4(%rsp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	counter@PLT
	incl	4(%rsp)
	jmp	.LBB3_3
.LBB3_5:
	cmpl	$3, 12(%rsp)
	jl	.LBB3_7
# %bb.6:
	movq	total_wcount(%rip), %rsi
	movl	$.Lrox203f, %edi
	callq	report
.LBB3_7:
	movl	$0, 8(%rsp)
.LBB3_8:
	movl	8(%rsp), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
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

	.type	.Lrox201d,@object               # @rox201d
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lrox201d:
	.asciz	"%6lu %s\n"
	.size	.Lrox201d, 9

	.type	wcount,@object                  # @wcount
	.bss
	.globl	wcount
	.p2align	3, 0x0
wcount:
	.quad	0                               # 0x0
	.size	wcount, 8

	.type	.Lro0x2026,@object              # @ro0x2026
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lro0x2026:
	.asciz	"usage: wc FILE [FILE...]"
	.size	.Lro0x2026, 25

	.type	.Lrox203f,@object               # @rox203f
.Lrox203f:
	.asciz	"total"
	.size	.Lrox203f, 6

	.section	".note.GNU-stack","",@progbits
