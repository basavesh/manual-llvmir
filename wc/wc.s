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
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -16(%rbp)
	movq	%rcx, -8(%rbp)
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %r8
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$32, %rsp
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
	jmp	.LBB1_20
.LBB1_2:
	jmp	.LBB1_3
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rdi
	callq	getc@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, %eax
	je	.LBB1_9
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
	jmp	.LBB1_10
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	movq	ccount, %rax
	addq	$1, %rax
	movq	%rax, ccount
	cmpl	$10, -4(%rbp)
	jne	.LBB1_8
# %bb.7:                                #   in Loop: Header=BB1_3 Depth=1
	movq	lcount, %rax
	addq	$1, %rax
	movq	%rax, lcount
.LBB1_8:                                #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_3
.LBB1_9:                                # %.loopexit1
	jmp	.LBB1_10
.LBB1_10:
	jmp	.LBB1_11
.LBB1_11:                               # =>This Inner Loop Header: Depth=1
	cmpl	$-1, -4(%rbp)
	je	.LBB1_18
# %bb.12:                               #   in Loop: Header=BB1_11 Depth=1
	movq	ccount, %rax
	addq	$1, %rax
	movq	%rax, ccount
	cmpl	$10, -4(%rbp)
	jne	.LBB1_14
# %bb.13:                               #   in Loop: Header=BB1_11 Depth=1
	movq	lcount, %rax
	addq	$1, %rax
	movq	%rax, lcount
.LBB1_14:                               #   in Loop: Header=BB1_11 Depth=1
	movl	-4(%rbp), %eax
	movzbl	%al, %edi
	callq	isword
	cmpl	$0, %eax
	jne	.LBB1_16
# %bb.15:
	jmp	.LBB1_19
.LBB1_16:                               #   in Loop: Header=BB1_11 Depth=1
	jmp	.LBB1_17
.LBB1_17:                               #   in Loop: Header=BB1_11 Depth=1
	movq	-16(%rbp), %rdi
	callq	getc@PLT
	movl	%eax, -4(%rbp)
	jmp	.LBB1_11
.LBB1_18:                               # %.loopexit
	jmp	.LBB1_19
.LBB1_19:
	cmpl	$-1, -4(%rbp)
	setne	%al
	andb	$1, %al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
.LBB1_20:
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
	movabsq	$.L.str.1, %rsi
	callq	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.LBB3_2
# %bb.1:
	movq	-16(%rbp), %rsi
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	perrf
.LBB3_2:
	movq	$0, lcount
	movq	$0, wcount
	movq	$0, ccount
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rdi
	callq	getword
	cmpl	$0, %eax
	je	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_3 Depth=1
	jmp	.LBB3_3
.LBB3_5:
	movq	-8(%rbp), %rdi
	callq	fclose@PLT
	movq	-16(%rbp), %rdi
	movq	ccount, %rsi
	movq	wcount, %rdx
	movq	lcount, %rcx
	callq	report
	movq	ccount, %rax
	addq	total_ccount, %rax
	movq	%rax, total_ccount
	movq	wcount, %rax
	addq	total_wcount, %rax
	movq	%rax, total_wcount
	movq	lcount, %rax
	addq	total_lcount, %rax
	movq	%rax, total_lcount
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	counter, .Lfunc_end3-counter
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function perrf
	.type	perrf,@function
perrf:                                  # @perrf
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	testb	%al, %al
	je	.LBB4_2
# %bb.1:
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm1, -144(%rbp)
	movaps	%xmm2, -128(%rbp)
	movaps	%xmm3, -112(%rbp)
	movaps	%xmm4, -96(%rbp)
	movaps	%xmm5, -80(%rbp)
	movaps	%xmm6, -64(%rbp)
	movaps	%xmm7, -48(%rbp)
.LBB4_2:
	movq	%r9, -168(%rbp)
	movq	%r8, -176(%rbp)
	movq	%rcx, -184(%rbp)
	movq	%rdx, -192(%rbp)
	movq	%rsi, -200(%rbp)
	movq	%rdi, -8(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, -16(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$48, -28(%rbp)
	movl	$8, -32(%rbp)
	movq	-8(%rbp), %rsi
	leaq	-32(%rbp), %rdx
	movl	$1, %edi
	callq	error_print
	addq	$208, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	perrf, .Lfunc_end4-perrf
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
	movl	$0, -20(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -8(%rbp)
	jge	.LBB5_2
# %bb.1:
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	errf
.LBB5_2:
	movl	$1, -4(%rbp)
.LBB5_3:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB5_6
# %bb.4:                                #   in Loop: Header=BB5_3 Depth=1
	movq	-16(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	counter
# %bb.5:                                #   in Loop: Header=BB5_3 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB5_3
.LBB5_6:
	cmpl	$2, -8(%rbp)
	jle	.LBB5_8
# %bb.7:
	movq	total_ccount, %rsi
	movq	total_wcount, %rdx
	movq	total_lcount, %rcx
	movabsq	$.L.str.4, %rdi
	callq	report
.LBB5_8:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function errf
	.type	errf,@function
errf:                                   # @errf
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	testb	%al, %al
	je	.LBB6_2
# %bb.1:
	movaps	%xmm0, -160(%rbp)
	movaps	%xmm1, -144(%rbp)
	movaps	%xmm2, -128(%rbp)
	movaps	%xmm3, -112(%rbp)
	movaps	%xmm4, -96(%rbp)
	movaps	%xmm5, -80(%rbp)
	movaps	%xmm6, -64(%rbp)
	movaps	%xmm7, -48(%rbp)
.LBB6_2:
	movq	%r9, -168(%rbp)
	movq	%r8, -176(%rbp)
	movq	%rcx, -184(%rbp)
	movq	%rdx, -192(%rbp)
	movq	%rsi, -200(%rbp)
	movq	%rdi, -8(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, -16(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$48, -28(%rbp)
	movl	$8, -32(%rbp)
	movq	-8(%rbp), %rsi
	leaq	-32(%rbp), %rdx
	xorl	%edi, %edi
	callq	error_print
	addq	$208, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	errf, .Lfunc_end6-errf
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function error_print
	.type	error_print,@function
error_print:                            # @error_print
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -16(%rbp)
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rsi
	movq	-16(%rbp), %rdx
	callq	vfprintf@PLT
	cmpl	$0, -4(%rbp)
	je	.LBB7_2
# %bb.1:
	movabsq	$.L.str.5, %rdi
	callq	perror@PLT
	jmp	.LBB7_3
.LBB7_2:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movabsq	$.L.str.6, %rsi
	movb	$0, %al
	callq	fprintf@PLT
.LBB7_3:
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end7:
	.size	error_print, .Lfunc_end7-error_print
	.cfi_endproc
                                        # -- End function
	.type	total_ccount,@object            # @total_ccount
	.bss
	.globl	total_ccount
	.p2align	3, 0x0
total_ccount:
	.quad	0                               # 0x0
	.size	total_ccount, 8

	.type	total_wcount,@object            # @total_wcount
	.globl	total_wcount
	.p2align	3, 0x0
total_wcount:
	.quad	0                               # 0x0
	.size	total_wcount, 8

	.type	total_lcount,@object            # @total_lcount
	.globl	total_lcount
	.p2align	3, 0x0
total_lcount:
	.quad	0                               # 0x0
	.size	total_lcount, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%6lu %6lu %6lu %s\n"
	.size	.L.str, 19

	.type	wcount,@object                  # @wcount
	.bss
	.globl	wcount
	.p2align	3, 0x0
wcount:
	.quad	0                               # 0x0
	.size	wcount, 8

	.type	ccount,@object                  # @ccount
	.globl	ccount
	.p2align	3, 0x0
ccount:
	.quad	0                               # 0x0
	.size	ccount, 8

	.type	lcount,@object                  # @lcount
	.globl	lcount
	.p2align	3, 0x0
lcount:
	.quad	0                               # 0x0
	.size	lcount, 8

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"r"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"cannot open file `%s'"
	.size	.L.str.2, 22

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"usage: wc FILE [FILE...]"
	.size	.L.str.3, 25

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"total"
	.size	.L.str.4, 6

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	" "
	.size	.L.str.5, 2

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"\n"
	.size	.L.str.6, 2

	.ident	"Ubuntu clang version 18.1.8 (++20240731025011+3b5b5c1ec4a3-1~exp1~20240731145104.143)"
	.section	".note.GNU-stack","",@progbits
