	.text
	.file	"ising.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function update
.LCPI0_0:
	.long	0x2f800000                      # float 2.32830644E-10
	.text
	.globl	update
	.p2align	4, 0x90
	.type	update,@function
update:                                 # @update
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movss	%xmm0, 16(%rsp)                 # 4-byte Spill
	movw	$1023, %cx                      # imm = 0x3FF
	movw	$1, %dx
	movl	update.prng_state(%rip), %eax
	xorl	%r13d, %r13d
	movq	%rdi, 24(%rsp)                  # 8-byte Spill
	movq	%rdi, %r15
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
	addq	$4096, %r15                     # imm = 0x1000
	movl	12(%rsp), %ecx                  # 4-byte Reload
	incl	%ecx
	movl	8(%rsp), %edx                   # 4-byte Reload
	incl	%edx
	movq	32(%rsp), %r13                  # 8-byte Reload
	cmpq	$1024, %r13                     # imm = 0x400
	je	.LBB0_7
.LBB0_1:                                # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	%ecx, 12(%rsp)                  # 4-byte Spill
	movl	%ecx, %ebx
	andl	$1023, %ebx                     # imm = 0x3FF
	shll	$12, %ebx
	movq	24(%rsp), %rcx                  # 8-byte Reload
	addq	%rcx, %rbx
	movl	%edx, 8(%rsp)                   # 4-byte Spill
	movl	%edx, %r12d
	andl	$1023, %r12d                    # imm = 0x3FF
	shll	$12, %r12d
	addq	%rcx, %r12
	leaq	1(%r13), %rdx
	movq	%rdx, 32(%rsp)                  # 8-byte Spill
	movl	$1023, %ebp                     # imm = 0x3FF
	shlq	$12, %r13
	addq	%rcx, %r13
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=2
	negl	%r14d
	movl	%r14d, -4092(%r15,%rbp,4)
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=2
	incq	%rbp
	cmpq	$2047, %rbp                     # imm = 0x7FF
	je	.LBB0_6
.LBB0_2:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1022(%rbp), %ecx
	andl	$1023, %ecx                     # imm = 0x3FF
	movl	(%r13,%rcx,4), %ecx
	movl	%ebp, %edx
	andl	$1023, %edx                     # imm = 0x3FF
	addl	-4092(%rbx,%rbp,4), %ecx
	addl	(%r13,%rdx,4), %ecx
	movl	-4092(%r15,%rbp,4), %r14d
	addl	-4092(%r12,%rbp,4), %ecx
	imull	%r14d, %ecx
	addl	%ecx, %ecx
	movl	%eax, %edx
	shll	$13, %edx
	xorl	%eax, %edx
	movl	%edx, %esi
	shrl	$17, %esi
	xorl	%edx, %esi
	movl	%esi, %eax
	shll	$5, %eax
	xorl	%esi, %eax
	movl	%eax, update.prng_state(%rip)
	testl	%ecx, %ecx
	jle	.LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=2
	movl	%eax, %eax
	xorps	%xmm0, %xmm0
	cvtsi2ss	%rax, %xmm0
	mulss	.LCPI0_0(%rip), %xmm0
	movss	%xmm0, 20(%rsp)                 # 4-byte Spill
	negl	%ecx
	xorps	%xmm0, %xmm0
	cvtsi2ss	%ecx, %xmm0
	divss	16(%rsp), %xmm0                 # 4-byte Folded Reload
	callq	expf
	ucomiss	20(%rsp), %xmm0                 # 4-byte Folded Reload
	movl	update.prng_state(%rip), %eax
	jae	.LBB0_4
	jmp	.LBB0_5
.LBB0_7:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	update, .Lfunc_end0-update
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function calculate
.LCPI1_0:
	.quad	0xbfe0000000000000              # double -0.5
	.text
	.globl	calculate
	.p2align	4, 0x90
	.type	calculate,@function
calculate:                              # @calculate
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	(%rsi), %eax
	xorl	%r10d, %r10d
	movw	$1, %cx
	movw	$1023, %dx                      # imm = 0x3FF
	movq	%rdi, %r8
	xorl	%r9d, %r9d
	.p2align	4, 0x90
.LBB1_1:                                # %.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movq	%r10, %r11
	movl	%ecx, %ebx
	andl	$1023, %ebx                     # imm = 0x3FF
	shll	$12, %ebx
	addq	%rdi, %rbx
	movl	%edx, %r14d
	andl	$1023, %r14d                    # imm = 0x3FF
	shll	$12, %r14d
	addq	%rdi, %r14
	incq	%r10
	movl	$1023, %r15d                    # imm = 0x3FF
	shlq	$12, %r11
	addq	%rdi, %r11
	.p2align	4, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4092(%r8,%r15,4), %ebp
	leal	-1022(%r15), %r12d
	andl	$1023, %r12d                    # imm = 0x3FF
	movl	(%r11,%r12,4), %r12d
	movl	%r15d, %r13d
	andl	$1023, %r13d                    # imm = 0x3FF
	addl	-4092(%rbx,%r15,4), %r12d
	addl	(%r11,%r13,4), %r12d
	addl	-4092(%r14,%r15,4), %r12d
	imull	%ebp, %r12d
	addl	%r12d, %r9d
	addl	%ebp, %eax
	movl	%eax, (%rsi)
	incq	%r15
	cmpq	$2047, %r15                     # imm = 0x7FF
	jne	.LBB1_2
# %bb.3:                                # %.loopexit
                                        #   in Loop: Header=BB1_1 Depth=1
	addq	$4096, %r8                      # imm = 0x1000
	incl	%ecx
	incl	%edx
	cmpq	$1024, %r10                     # imm = 0x400
	jne	.LBB1_1
# %bb.4:
	cvtsi2sd	%r9d, %xmm0
	mulsd	.LCPI1_0(%rip), %xmm0
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	calculate, .Lfunc_end1-calculate
	.cfi_endproc
                                        # -- End function
	.type	update.prng_state,@object       # @update.prng_state
	.data
	.p2align	2, 0x0
update.prng_state:
	.long	123456789                       # 0x75bcd15
	.size	update.prng_state, 4

	.ident	"clang version 19.1.7 (Fedora 19.1.7-3.fc41)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
