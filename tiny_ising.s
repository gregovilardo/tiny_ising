	.text
	.file	"tiny_ising.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x3ff8000000000000              # double 1.5
.LCPI0_1:
	.quad	0x4008000000000000              # double 3
.LCPI0_2:
	.quad	0x3f847ae147ae147b              # double 0.01
.LCPI0_4:
	.quad	0x3ff0000000000000              # double 1
.LCPI0_6:
	.quad	0x3eb0000000000000              # double 9.5367431640625E-7
.LCPI0_7:
	.quad	0x3d70000000000000              # double 9.0949470177292824E-13
.LCPI0_8:
	.quad	0x3af0000000000000              # double 8.2718061255302767E-25
.LCPI0_9:
	.quad	0x4130000000000000              # double 1048576
.LCPI0_10:
	.quad	0x41cdcd6500000000              # double 1.0E+9
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI0_3:
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	1                               # 0x1
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI0_5:
	.long	0x35800000                      # float 9.53674316E-7
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	subq	$8552, %rsp                     # imm = 0x2168
	.cfi_def_cfa_offset 8608
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	96(%rsp), %rdi
	movl	$8456, %edx                     # imm = 0x2108
	xorl	%esi, %esi
	callq	memset@PLT
	movl	$.L.str, %edi
	movl	$1024, %esi                     # imm = 0x400
	xorl	%eax, %eax
	callq	printf
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = [1.5E+0,0.0E+0]
	movl	$.L.str.1, %edi
	movb	$1, %al
	callq	printf
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = [3.0E+0,0.0E+0]
	movl	$.L.str.2, %edi
	movb	$1, %al
	callq	printf
	movsd	.LCPI0_2(%rip), %xmm0           # xmm0 = [1.0E-2,0.0E+0]
	movl	$.L.str.3, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.4, %edi
	movl	$5, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.5, %edi
	movl	$25, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.6, %edi
	movl	$5, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.7, %edi
	movl	$151, %esi
	xorl	%eax, %eax
	callq	printf
	callq	wtime
	movsd	%xmm0, 72(%rsp)                 # 8-byte Spill
	movl	$4194304, %esi                  # imm = 0x400000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$262178, %ecx                   # imm = 0x40022
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap
	cmpq	$-1, %rax
	je	.LBB0_15
# %bb.1:                                # %vector.ph.preheader
	movq	%rax, %rbx
	addq	$112, %rax
	xorl	%ecx, %ecx
	movapd	.LCPI0_3(%rip), %xmm0           # xmm0 = [1,1,1,1]
	movsd	.LCPI0_0(%rip), %xmm4           # xmm4 = [1.5E+0,0.0E+0]
	.p2align	4, 0x90
.LBB0_2:                                # %vector.ph
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_3:                                # %vector.body
                                        #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movupd	%xmm0, -112(%rax,%rdx,4)
	movupd	%xmm0, -96(%rax,%rdx,4)
	movupd	%xmm0, -80(%rax,%rdx,4)
	movupd	%xmm0, -64(%rax,%rdx,4)
	movupd	%xmm0, -48(%rax,%rdx,4)
	movupd	%xmm0, -32(%rax,%rdx,4)
	movupd	%xmm0, -16(%rax,%rdx,4)
	movupd	%xmm0, (%rax,%rdx,4)
	addq	$32, %rdx
	cmpq	$1024, %rdx                     # imm = 0x400
	jne	.LBB0_3
# %bb.4:                                # %middle.block
                                        #   in Loop: Header=BB0_2 Depth=1
	incq	%rcx
	addq	$4096, %rax                     # imm = 0x1000
	cmpq	$1024, %rcx                     # imm = 0x400
	jne	.LBB0_2
# %bb.5:                                # %.preheader92.i.preheader
	xorl	%edx, %edx
	leaq	12(%rsp), %r14
	.p2align	4, 0x90
.LBB0_6:                                # %.preheader92.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	movq	%rdx, 88(%rsp)                  # 8-byte Spill
	movsd	%xmm4, 80(%rsp)                 # 8-byte Spill
	xorps	%xmm0, %xmm0
	cvtsd2ss	%xmm4, %xmm0
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
	callq	wtime
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	update
	callq	wtime
	subsd	(%rsp), %xmm0                   # 8-byte Folded Reload
	addsd	duration(%rip), %xmm0
	movsd	%xmm0, duration(%rip)
	movsd	nupdates(%rip), %xmm0           # xmm0 = mem[0],zero
	movsd	.LCPI0_4(%rip), %xmm1           # xmm1 = [1.0E+0,0.0E+0]
	addsd	%xmm1, %xmm0
	movsd	%xmm0, nupdates(%rip)
	callq	wtime
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	update
	callq	wtime
	subsd	(%rsp), %xmm0                   # 8-byte Folded Reload
	addsd	duration(%rip), %xmm0
	movsd	%xmm0, duration(%rip)
	movsd	nupdates(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	.LCPI0_4(%rip), %xmm0
	movsd	%xmm0, nupdates(%rip)
	callq	wtime
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	update
	callq	wtime
	subsd	(%rsp), %xmm0                   # 8-byte Folded Reload
	addsd	duration(%rip), %xmm0
	movsd	%xmm0, duration(%rip)
	movsd	nupdates(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	.LCPI0_4(%rip), %xmm0
	movsd	%xmm0, nupdates(%rip)
	callq	wtime
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	update
	callq	wtime
	subsd	(%rsp), %xmm0                   # 8-byte Folded Reload
	addsd	duration(%rip), %xmm0
	movsd	%xmm0, duration(%rip)
	movsd	nupdates(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	.LCPI0_4(%rip), %xmm0
	movsd	%xmm0, nupdates(%rip)
	callq	wtime
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	update
	callq	wtime
	subsd	(%rsp), %xmm0                   # 8-byte Folded Reload
	addsd	duration(%rip), %xmm0
	movsd	%xmm0, duration(%rip)
	movsd	nupdates(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	.LCPI0_4(%rip), %xmm0
	movsd	%xmm0, nupdates(%rip)
	xorpd	%xmm0, %xmm0
	movapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	movapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	movapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_9:                                #   in Loop: Header=BB0_7 Depth=2
	decl	%r13d
	incb	%r12b
	cmpl	$-25, %r13d
	je	.LBB0_10
.LBB0_7:                                #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	%r12b, %eax
	imull	$205, %eax, %eax
	shrl	$10, %eax
	leal	(%rax,%rax,4), %r15d
	negl	%r15d
	callq	wtime
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	update
	movsd	nupdates(%rip), %xmm0           # xmm0 = mem[0],zero
	addsd	.LCPI0_4(%rip), %xmm0
	movsd	%xmm0, nupdates(%rip)
	callq	wtime
	subsd	(%rsp), %xmm0                   # 8-byte Folded Reload
	addsd	duration(%rip), %xmm0
	movsd	%xmm0, duration(%rip)
	cmpb	%r13b, %r15b
	jne	.LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	movl	$0, 12(%rsp)
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	calculate
	movl	12(%rsp), %eax
	movl	%eax, %ecx
	negl	%ecx
	cmovsl	%eax, %ecx
	xorps	%xmm1, %xmm1
	cvtsi2ss	%ecx, %xmm1
	mulss	.LCPI0_5(%rip), %xmm1
	xorps	%xmm3, %xmm3
	cvtss2sd	%xmm1, %xmm3
	movapd	16(%rsp), %xmm4                 # 16-byte Reload
	movapd	%xmm4, %xmm1
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm4, %xmm4                    # xmm4 = xmm4[1,1]
	movapd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm2
	addsd	%xmm2, %xmm4
	unpcklpd	%xmm4, %xmm1                    # xmm1 = xmm1[0],xmm4[0]
	mulsd	%xmm0, %xmm2
	mulsd	%xmm0, %xmm2
	movapd	32(%rsp), %xmm0                 # 16-byte Reload
	addsd	%xmm0, %xmm2
	unpckhpd	%xmm0, %xmm0                    # xmm0 = xmm0[1,1]
	addsd	%xmm3, %xmm0
	unpcklpd	%xmm0, %xmm2                    # xmm2 = xmm2[0],xmm0[0]
	movapd	%xmm3, %xmm0
	mulsd	%xmm3, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm3, %xmm4
	unpcklpd	%xmm0, %xmm4                    # xmm4 = xmm4[0],xmm0[0]
	unpcklpd	%xmm3, %xmm3                    # xmm3 = xmm3[0,0]
	mulpd	%xmm4, %xmm3
	movapd	48(%rsp), %xmm0                 # 16-byte Reload
	addpd	%xmm3, %xmm0
	movapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	incl	%ebp
	movapd	%xmm1, 16(%rsp)                 # 16-byte Spill
	movapd	%xmm2, 32(%rsp)                 # 16-byte Spill
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=1
	movq	88(%rsp), %rdx                  # 8-byte Reload
	cmpq	$151, %rdx
	je	.LBB0_16
# %bb.11:                               #   in Loop: Header=BB0_6 Depth=1
	imulq	$56, %rdx, %rax
	movsd	80(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	movsd	%xmm4, 96(%rsp,%rax)
	movl	%ebp, %ecx
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rcx, %xmm0
	unpcklpd	%xmm0, %xmm0                    # xmm0 = xmm0[0,0]
	movapd	16(%rsp), %xmm2                 # 16-byte Reload
	divpd	%xmm0, %xmm2
	movupd	104(%rsp,%rax), %xmm1
	addpd	%xmm2, %xmm1
	movupd	120(%rsp,%rax), %xmm2
	movupd	136(%rsp,%rax), %xmm3
	movupd	%xmm1, 104(%rsp,%rax)
	movapd	32(%rsp), %xmm1                 # 16-byte Reload
	divpd	%xmm0, %xmm1
	addpd	%xmm2, %xmm1
	movupd	%xmm1, 120(%rsp,%rax)
	movapd	48(%rsp), %xmm1                 # 16-byte Reload
	divpd	%xmm0, %xmm1
	addpd	%xmm3, %xmm1
	movupd	%xmm1, 136(%rsp,%rax)
	incq	%rdx
	addsd	.LCPI0_2(%rip), %xmm4
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = [3.0E+0,0.0E+0]
	ucomisd	%xmm4, %xmm0
	jae	.LBB0_6
# %bb.12:                               # %cycle.exit
	callq	wtime
	subsd	72(%rsp), %xmm0                 # 8-byte Folded Reload
	movl	$.L.str.9, %edi
	movb	$1, %al
	callq	printf
	movl	$.Lstr, %edi
	callq	puts@PLT
	movl	$48, %r14d
	.p2align	4, 0x90
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	movsd	48(%rsp,%r14), %xmm0            # xmm0 = mem[0],zero
	movsd	56(%rsp,%r14), %xmm1            # xmm1 = mem[0],zero
	mulsd	.LCPI0_6(%rip), %xmm1
	movsd	64(%rsp,%r14), %xmm2            # xmm2 = mem[0],zero
	mulsd	.LCPI0_7(%rip), %xmm2
	movsd	72(%rsp,%r14), %xmm3            # xmm3 = mem[0],zero
	mulsd	.LCPI0_8(%rip), %xmm3
	movsd	80(%rsp,%r14), %xmm4            # xmm4 = mem[0],zero
	movsd	88(%rsp,%r14), %xmm5            # xmm5 = mem[0],zero
	movsd	96(%rsp,%r14), %xmm6            # xmm6 = mem[0],zero
	movl	$.L.str.11, %edi
	movb	$7, %al
	callq	printf
	addq	$56, %r14
	cmpq	$8504, %r14                     # imm = 0x2138
	jne	.LBB0_13
# %bb.14:
	movl	$.Lstr.1, %edi
	callq	puts@PLT
	movsd	nupdates(%rip), %xmm0           # xmm0 = mem[0],zero
	mulsd	.LCPI0_9(%rip), %xmm0
	movsd	duration(%rip), %xmm1           # xmm1 = mem[0],zero
	mulsd	.LCPI0_10(%rip), %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd	%xmm0, (%rsp)                   # 8-byte Spill
	movl	$.L.str.13, %edi
	movb	$1, %al
	callq	printf
	movl	$.L.str.14, %edi
	movl	$.L.str.15, %esi
	callq	fopen
	movq	%rax, %r14
	movl	$.L.str.16, %esi
	movq	%rax, %rdi
	movsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$1, %al
	callq	fprintf
	movq	%r14, %rdi
	callq	fclose
	movl	$4194304, %esi                  # imm = 0x400000
	movq	%rbx, %rdi
	callq	munmap
	xorl	%eax, %eax
	addq	$8552, %rsp                     # imm = 0x2168
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
.LBB0_16:
	.cfi_def_cfa_offset 8608
	movl	$.L.str.19, %edi
	movl	$.L.str.18, %esi
	movl	$.L__PRETTY_FUNCTION__.cycle, %ecx
	movl	$85, %edx
	callq	__assert_fail
.LBB0_15:
	movq	stderr(%rip), %rcx
	movl	$.L.str.8, %edi
	movl	$15, %esi
	movl	$1, %edx
	callq	fwrite@PLT
	movl	$1, %edi
	callq	exit
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	duration,@object                # @duration
	.bss
	.globl	duration
	.p2align	3, 0x0
duration:
	.quad	0x0000000000000000              # double 0
	.size	duration, 8

	.type	nupdates,@object                # @nupdates
	.globl	nupdates
	.p2align	3, 0x0
nupdates:
	.quad	0x0000000000000000              # double 0
	.size	nupdates, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"# L: %i\n"
	.size	.L.str, 9

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"# Minimum Temperature: %f\n"
	.size	.L.str.1, 27

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"# Maximum Temperature: %f\n"
	.size	.L.str.2, 27

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"# Temperature Step: %.12f\n"
	.size	.L.str.3, 27

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"# Equilibration Time: %i\n"
	.size	.L.str.4, 26

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"# Measurement Time: %i\n"
	.size	.L.str.5, 24

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"# Data Acquiring Step: %i\n"
	.size	.L.str.6, 27

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"# Number of Points: %i\n"
	.size	.L.str.7, 24

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"Error in mmap \n"
	.size	.L.str.8, 16

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"# Total Simulation Time (sec): %lf\n"
	.size	.L.str.9, 36

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"%lf,%.10lf,%.10lf,%.10lf,%.10lf,%.10lf,%.10lf\n"
	.size	.L.str.11, 47

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"cells/ns %f\n"
	.size	.L.str.13, 13

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"out"
	.size	.L.str.14, 4

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"a"
	.size	.L.str.15, 2

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"%f\n"
	.size	.L.str.16, 4

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"tiny_ising.c"
	.size	.L.str.18, 13

	.type	.L__PRETTY_FUNCTION__.cycle,@object # @__PRETTY_FUNCTION__.cycle
.L__PRETTY_FUNCTION__.cycle:
	.asciz	"void cycle(int (*)[1024], const double, const double, const double, const unsigned int, struct statpoint *)"
	.size	.L__PRETTY_FUNCTION__.cycle, 108

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"index < NPOINTS"
	.size	.L.str.19, 16

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"# Temp,E,E^2,E^4,M,M^2,M^4"
	.size	.Lstr, 27

	.type	.Lstr.1,@object                 # @str.1
.Lstr.1:
	.asciz	"====================="
	.size	.Lstr.1, 22

	.ident	"clang version 19.1.7 (Fedora 19.1.7-3.fc41)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
