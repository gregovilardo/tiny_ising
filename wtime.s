	.text
	.file	"wtime.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function wtime
.LCPI0_0:
	.quad	0x3e112e0be826d695              # double 1.0000000000000001E-9
	.text
	.globl	wtime
	.p2align	4, 0x90
	.type	wtime,@function
wtime:                                  # @wtime
	.cfi_startproc
# %bb.0:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	leaq	8(%rsp), %rsi
	movl	$4, %edi
	callq	clock_gettime
	cvtsi2sdq	16(%rsp), %xmm0
	cvtsi2sdq	8(%rsp), %xmm1
	mulsd	.LCPI0_0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	wtime, .Lfunc_end0-wtime
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.7 (Fedora 19.1.7-3.fc41)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
