	.text
	.file	"demo.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x3ff8000000000000              # double 1.5
.LCPI0_1:
	.quad	0x4008000000000000              # double 3
.LCPI0_2:
	.quad	0x3f847ae147ae147b              # double 0.01
.LCPI0_3:
	.quad	0xbff0000000000000              # double -1
.LCPI0_4:
	.quad	0x3ff0000000000000              # double 1
.LCPI0_12:
	.quad	0x3f91111111111111              # double 0.016666666666666666
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI0_5:
	.long	0x3f800000                      # float 1
.LCPI0_6:
	.long	0x30000000                      # float 4.65661287E-10
.LCPI0_7:
	.long	0x3f000000                      # float 0.5
.LCPI0_8:
	.long	0x40400000                      # float 3
.LCPI0_9:
	.long	0x3fc00000                      # float 1.5
.LCPI0_10:
	.long	0xbfc00000                      # float -1.5
.LCPI0_11:
	.long	0x3bc0c0c1                      # float 0.00588235306
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
	subq	$4206664, %rsp                  # imm = 0x403048
	.cfi_def_cfa_offset 4206720
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	xorl	%r13d, %r13d
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
	xorl	%edi, %edi
	callq	time
	movl	%eax, %edi
	callq	srand
	movl	$gl2d__error_callback, %edi
	callq	glfwSetErrorCallback
	callq	glfwInit
	testl	%eax, %eax
	je	.LBB0_4
# %bb.1:
	movl	$1, %edi
	movl	$24, %esi
	callq	calloc
	movq	%rax, %r13
	movl	$.L.str.6, %edx
	movl	$1024, %edi                     # imm = 0x400
	movl	$1024, %esi                     # imm = 0x400
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	callq	glfwCreateWindow
	movq	%rax, 8(%r13)
	testq	%rax, %rax
	je	.LBB0_2
# %bb.3:
	movabsq	$4398046512128, %rcx            # imm = 0x40000000400
	movq	%rcx, (%r13)
	movq	%rax, %rdi
	callq	glfwMakeContextCurrent
	movl	$1, %edi
	callq	glfwSwapInterval
	movl	$3553, %edi                     # imm = 0xDE1
	callq	glEnable
	movl	$2929, %edi                     # imm = 0xB71
	callq	glDisable
	movq	%r13, %rsi
	addq	$16, %rsi
	movl	$1, %edi
	callq	glGenTextures
	movl	16(%r13), %esi
	movl	$3553, %edi                     # imm = 0xDE1
	callq	glBindTexture
	movl	$3553, %edi                     # imm = 0xDE1
	movl	$10241, %esi                    # imm = 0x2801
	movl	$9729, %edx                     # imm = 0x2601
	callq	glTexParameteri
	movl	$3553, %edi                     # imm = 0xDE1
	movl	$10240, %esi                    # imm = 0x2800
	movl	$9729, %edx                     # imm = 0x2601
	callq	glTexParameteri
	movl	$3553, %edi                     # imm = 0xDE1
	movl	$10242, %esi                    # imm = 0x2802
	movl	$10497, %edx                    # imm = 0x2901
	callq	glTexParameteri
	movl	$3553, %edi                     # imm = 0xDE1
	movl	$10243, %esi                    # imm = 0x2803
	movl	$10497, %edx                    # imm = 0x2901
	callq	glTexParameteri
	movl	$3553, %edi                     # imm = 0xDE1
	movl	$32882, %esi                    # imm = 0x8072
	movl	$10497, %edx                    # imm = 0x2901
	callq	glTexParameteri
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$3553, %edi                     # imm = 0xDE1
	xorl	%esi, %esi
	movl	$6407, %edx                     # imm = 0x1907
	movl	$1024, %ecx                     # imm = 0x400
	movl	$1024, %r8d                     # imm = 0x400
	xorl	%r9d, %r9d
	pushq	$0
	.cfi_adjust_cfa_offset 8
	pushq	$5121                           # imm = 0x1401
	.cfi_adjust_cfa_offset 8
	pushq	$6407                           # imm = 0x1907
	.cfi_adjust_cfa_offset 8
	callq	glTexImage2D
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movl	$3553, %edi                     # imm = 0xDE1
	xorl	%esi, %esi
	callq	glBindTexture
	movl	(%r13), %ebp
	movl	4(%r13), %r14d
	movl	$5889, %edi                     # imm = 0x1701
	callq	glMatrixMode
	callq	glLoadIdentity
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	%ebp, %edx
	movl	%r14d, %ecx
	callq	glViewport
	movsd	.LCPI0_3(%rip), %xmm4           # xmm4 = [-1.0E+0,0.0E+0]
	movsd	.LCPI0_4(%rip), %xmm1           # xmm1 = [1.0E+0,0.0E+0]
	xorps	%xmm0, %xmm0
	xorpd	%xmm2, %xmm2
	movaps	%xmm1, %xmm3
	movaps	%xmm1, %xmm5
	callq	glOrtho
	movl	$5888, %edi                     # imm = 0x1700
	callq	glMatrixMode
	movq	8(%r13), %rdi
	movl	$gl2d__framebuffer_size_callback, %esi
	callq	glfwSetFramebufferSizeCallback
	movss	.LCPI0_5(%rip), %xmm3           # xmm3 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	xorps	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	xorpd	%xmm2, %xmm2
	callq	glClearColor
	movl	$16640, %edi                    # imm = 0x4100
	callq	glClear
	jmp	.LBB0_4
.LBB0_2:
	callq	glfwTerminate
	movq	%r13, %rdi
	callq	free
	xorl	%r13d, %r13d
.LBB0_4:                                # %gl2d_init.exit
	callq	wtime
	movsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	leaq	12352(%rsp), %r14
	xorl	%ebx, %ebx
	movl	$4194304, %edx                  # imm = 0x400000
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
	.p2align	4, 0x90
.LBB0_5:                                # %.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	rand
	movss	.LCPI0_6(%rip), %xmm1           # xmm1 = [4.65661287E-10,0.0E+0,0.0E+0,0.0E+0]
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	mulss	%xmm1, %xmm0
	xorl	%eax, %eax
	movss	.LCPI0_7(%rip), %xmm1           # xmm1 = [5.0E-1,0.0E+0,0.0E+0,0.0E+0]
	ucomiss	%xmm0, %xmm1
	setbe	%al
	leal	-1(,%rax,2), %eax
	movl	%eax, (%r14,%r15,4)
	incq	%r15
	cmpq	$1024, %r15                     # imm = 0x400
	jne	.LBB0_6
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=1
	incq	%rbx
	addq	$4096, %r14                     # imm = 0x1000
	cmpq	$1024, %rbx                     # imm = 0x400
	jne	.LBB0_5
# %bb.8:                                # %init.exit
	leaq	16(%r13), %r14
	leaq	12352(%rsp), %rbx
	leaq	64(%rsp), %r12
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = [1.5E+0,0.0E+0]
	jmp	.LBB0_9
	.p2align	4, 0x90
.LBB0_21:                               #   in Loop: Header=BB0_9 Depth=1
	movsd	16(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	.LCPI0_2(%rip), %xmm0
	movsd	.LCPI0_1(%rip), %xmm1           # xmm1 = [3.0E+0,0.0E+0]
	ucomisd	%xmm0, %xmm1
	jb	.LBB0_22
.LBB0_9:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_12 Depth 3
                                        #         Child Loop BB0_13 Depth 4
	movl	$.L.str.11, %edi
	movsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	movb	$1, %al
	callq	printf
	movsd	16(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	minss	.LCPI0_8(%rip), %xmm0
	maxss	.LCPI0_9(%rip), %xmm0
	addss	.LCPI0_10(%rip), %xmm0
	divss	.LCPI0_11(%rip), %xmm0
	movss	%xmm0, 8(%rsp)                  # 4-byte Spill
	xorl	%ebp, %ebp
	jmp	.LBB0_10
	.p2align	4, 0x90
.LBB0_19:                               #   in Loop: Header=BB0_10 Depth=2
	movl	$16640, %edi                    # imm = 0x4100
	callq	glClear
	movq	%r15, %r13
	movl	16(%r15), %esi
	movl	$3553, %edi                     # imm = 0xDE1
	callq	glBindTexture
	movl	$7, %edi
	callq	glBegin
	xorpd	%xmm0, %xmm0
	movss	.LCPI0_5(%rip), %xmm1           # xmm1 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	callq	glTexCoord2f
	xorpd	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	callq	glVertex3f
	xorpd	%xmm0, %xmm0
	xorps	%xmm1, %xmm1
	callq	glTexCoord2f
	xorpd	%xmm0, %xmm0
	xorps	%xmm2, %xmm2
	movss	.LCPI0_5(%rip), %xmm1           # xmm1 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	callq	glVertex3f
	xorps	%xmm1, %xmm1
	movss	.LCPI0_5(%rip), %xmm0           # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	callq	glTexCoord2f
	xorps	%xmm2, %xmm2
	movss	.LCPI0_5(%rip), %xmm0           # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	movaps	%xmm0, %xmm1
	callq	glVertex3f
	movss	.LCPI0_5(%rip), %xmm0           # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	movapd	%xmm0, %xmm1
	callq	glTexCoord2f
	xorpd	%xmm1, %xmm1
	xorps	%xmm2, %xmm2
	movss	.LCPI0_5(%rip), %xmm0           # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	callq	glVertex3f
	callq	glEnd
	movl	$3553, %edi                     # imm = 0xDE1
	xorl	%esi, %esi
	callq	glBindTexture
	movq	8(%r15), %rdi
	callq	glfwSwapBuffers
	callq	glfwPollEvents
	leaq	12352(%rsp), %rbx
.LBB0_20:                               # %draw.exit.i
                                        #   in Loop: Header=BB0_10 Depth=2
	incl	%ebp
	cmpl	$30, %ebp
	je	.LBB0_21
.LBB0_10:                               #   Parent Loop BB0_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
                                        #         Child Loop BB0_13 Depth 4
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	callq	update
	callq	wtime
	movapd	%xmm0, %xmm1
	subsd	draw.last_frame(%rip), %xmm1
	movsd	.LCPI0_12(%rip), %xmm2          # xmm2 = [1.6666666666666666E-2,0.0E+0]
	ucomisd	%xmm1, %xmm2
	ja	.LBB0_20
# %bb.11:                               #   in Loop: Header=BB0_10 Depth=2
	movq	%r13, %r15
	movsd	%xmm0, draw.last_frame(%rip)
	movss	8(%rsp), %xmm0                  # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	movq	%r12, %rdi
	callq	modff
	cvttss2si	64(%rsp), %eax
	movaps	%xmm0, %xmm4
	leal	1(%rax), %ecx
	cmpl	$255, %eax
	movl	$255, %edx
	cmovgel	%edx, %ecx
	cltq
	shlq	$2, %rax
	movslq	%ecx, %rcx
	shlq	$2, %rcx
	movss	.LCPI0_5(%rip), %xmm0           # xmm0 = [1.0E+0,0.0E+0,0.0E+0,0.0E+0]
	subss	%xmm4, %xmm0
	movsd	colormap__viridis(%rax,%rax,2), %xmm1 # xmm1 = mem[0],zero
	movsd	colormap__viridis(%rcx,%rcx,2), %xmm2 # xmm2 = mem[0],zero
	movaps	%xmm0, %xmm3
	shufps	$0, %xmm0, %xmm3                # xmm3 = xmm3[0,0],xmm0[0,0]
	mulps	%xmm1, %xmm3
	movaps	%xmm4, %xmm1
	shufps	$0, %xmm4, %xmm1                # xmm1 = xmm1[0,0],xmm4[0,0]
	mulps	%xmm2, %xmm1
	mulss	colormap__viridis+8(%rax,%rax,2), %xmm0
	mulss	colormap__viridis+8(%rcx,%rcx,2), %xmm4
	addps	%xmm3, %xmm1
	movaps	%xmm1, 32(%rsp)                 # 16-byte Spill
	addss	%xmm0, %xmm4
	movaps	%xmm4, 48(%rsp)                 # 16-byte Spill
	leaq	12356(%rsp), %rbx
	xorl	%r13d, %r13d
	jmp	.LBB0_12
	.p2align	4, 0x90
.LBB0_18:                               #   in Loop: Header=BB0_12 Depth=3
	movl	(%r14), %esi
	movl	$3553, %edi                     # imm = 0xDE1
	callq	glBindTexture
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$3553, %edi                     # imm = 0xDE1
	xorl	%esi, %esi
	xorl	%edx, %edx
	movl	%r13d, %ecx
	movl	$1024, %r8d                     # imm = 0x400
	movl	$1, %r9d
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	$5126                           # imm = 0x1406
	.cfi_adjust_cfa_offset 8
	pushq	$6407                           # imm = 0x1907
	.cfi_adjust_cfa_offset 8
	callq	glTexSubImage2D
	addq	$32, %rsp
	.cfi_adjust_cfa_offset -32
	movl	$3553, %edi                     # imm = 0xDE1
	xorl	%esi, %esi
	callq	glBindTexture
	incq	%r13
	addq	$4096, %rbx                     # imm = 0x1000
	cmpq	$1024, %r13                     # imm = 0x400
	je	.LBB0_19
.LBB0_12:                               #   Parent Loop BB0_9 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB0_13 Depth 4
	movl	$12288, %edx                    # imm = 0x3000
	movq	%r12, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
	movl	$5, %eax
	movq	%rbx, %rcx
	movapd	48(%rsp), %xmm0                 # 16-byte Reload
	movaps	32(%rsp), %xmm1                 # 16-byte Reload
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_13 Depth=4
	addq	$8, %rcx
	addq	$6, %rax
	cmpq	$3077, %rax                     # imm = 0xC05
	je	.LBB0_18
.LBB0_13:                               #   Parent Loop BB0_9 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        #       Parent Loop BB0_12 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	cmpl	$0, -4(%rcx)
	jle	.LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=4
	movlps	%xmm1, 44(%rsp,%rax,4)
	movss	%xmm0, 52(%rsp,%rax,4)
.LBB0_15:                               #   in Loop: Header=BB0_13 Depth=4
	cmpl	$0, (%rcx)
	jle	.LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_13 Depth=4
	movlps	%xmm1, 56(%rsp,%rax,4)
	movss	%xmm0, 64(%rsp,%rax,4)
	jmp	.LBB0_17
.LBB0_22:                               # %cycle.exit
	callq	wtime
	subsd	24(%rsp), %xmm0                 # 8-byte Folded Reload
	movl	$.L.str.7, %edi
	movb	$1, %al
	callq	printf
	movl	$1, %edi
	movq	%r14, %rsi
	callq	glDeleteTextures
	movq	8(%r13), %rdi
	callq	glfwDestroyWindow
	callq	glfwTerminate
	movq	%r13, %rdi
	callq	free
	xorl	%eax, %eax
	addq	$4206664, %rsp                  # imm = 0x403048
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
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function gl2d__error_callback
	.type	gl2d__error_callback,@function
gl2d__error_callback:                   # @gl2d__error_callback
	.cfi_startproc
# %bb.0:
	movq	%rsi, %rcx
	movl	%edi, %edx
	movq	stderr(%rip), %rdi
	movl	$.L.str.8, %esi
	xorl	%eax, %eax
	jmp	fprintf                         # TAILCALL
.Lfunc_end1:
	.size	gl2d__error_callback, .Lfunc_end1-gl2d__error_callback
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function gl2d__framebuffer_size_callback
.LCPI2_0:
	.quad	0xbff0000000000000              # double -1
.LCPI2_1:
	.quad	0x3ff0000000000000              # double 1
	.text
	.p2align	4, 0x90
	.type	gl2d__framebuffer_size_callback,@function
gl2d__framebuffer_size_callback:        # @gl2d__framebuffer_size_callback
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebx
	movl	%esi, %ebp
	movl	$5889, %edi                     # imm = 0x1701
	callq	glMatrixMode
	callq	glLoadIdentity
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	%ebp, %edx
	movl	%ebx, %ecx
	callq	glViewport
	movsd	.LCPI2_0(%rip), %xmm4           # xmm4 = [-1.0E+0,0.0E+0]
	movsd	.LCPI2_1(%rip), %xmm1           # xmm1 = [1.0E+0,0.0E+0]
	xorps	%xmm0, %xmm0
	xorps	%xmm2, %xmm2
	movaps	%xmm1, %xmm3
	movaps	%xmm1, %xmm5
	callq	glOrtho
	movl	$5888, %edi                     # imm = 0x1700
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	glMatrixMode                    # TAILCALL
.Lfunc_end2:
	.size	gl2d__framebuffer_size_callback, .Lfunc_end2-gl2d__framebuffer_size_callback
	.cfi_endproc
                                        # -- End function
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
	.asciz	"tiny_ising"
	.size	.L.str.6, 11

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"# Total Simulation Time (sec): %lf\n"
	.size	.L.str.7, 36

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"GL Error %d: %s\n"
	.size	.L.str.8, 17

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Temp: %f\n"
	.size	.L.str.11, 10

	.type	draw.last_frame,@object         # @draw.last_frame
	.local	draw.last_frame
	.comm	draw.last_frame,8,8
	.type	colormap__viridis,@object       # @colormap__viridis
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
colormap__viridis:
	.long	0x3e88b4c0                      # float 0.267004013
	.long	0x3b9fb613                      # float 0.00487399986
	.long	0x3ea8a915                      # float 0.329414994
	.long	0x3e897a25                      # float 0.268510014
	.long	0x3c1d5e4a                      # float 0.00960499979
	.long	0x3eabbd16                      # float 0.335426986
	.long	0x3e8a361a                      # float 0.269944012
	.long	0x3c6f9db2                      # float 0.0146249998
	.long	0x3eaec93a                      # float 0.341378987
	.long	0x3e8ae87d                      # float 0.271304995
	.long	0x3ca35d68                      # float 0.0199420005
	.long	0x3eb1cd3e                      # float 0.347268999
	.long	0x3e8b9171                      # float 0.272594005
	.long	0x3cd1697f                      # float 0.0255629998
	.long	0x3eb4c89b                      # float 0.353092998
	.long	0x3e8c30b1                      # float 0.273808986
	.long	0x3d010300                      # float 0.0314970016
	.long	0x3eb7bb95                      # float 0.358853012
	.long	0x3e8cc682                      # float 0.274951994
	.long	0x3d1aa1d7                      # float 0.0377519988
	.long	0x3ebaa561                      # float 0.364542991
	.long	0x3e8d52c1                      # float 0.276021987
	.long	0x3d34e875                      # float 0.0441670008
	.long	0x3ebd8623                      # float 0.370164007
	.long	0x3e8dd54e                      # float 0.277018011
	.long	0x3d4e3583                      # float 0.0503440015
	.long	0x3ec05db7                      # float 0.375714988
	.long	0x3e8e4e48                      # float 0.277940989
	.long	0x3d66b3ff                      # float 0.0563240014
	.long	0x3ec32b77                      # float 0.381190985
	.long	0x3e8ebdb2                      # float 0.27879101
	.long	0x3d7e8bc1                      # float 0.0621449984
	.long	0x3ec5ef63                      # float 0.386592001
	.long	0x3e8f2346                      # float 0.27956599
	.long	0x3d8aed9a                      # float 0.0678360015
	.long	0x3ec8a958                      # float 0.39191699
	.long	0x3e8f7f28                      # float 0.280267
	.long	0x3d965ba7                      # float 0.0734170005
	.long	0x3ecb58f3                      # float 0.397163004
	.long	0x3e8fd157                      # float 0.280894011
	.long	0x3da199fe                      # float 0.078906998
	.long	0x3ecdfe11                      # float 0.402328998
	.long	0x3e9019b1                      # float 0.28144601
	.long	0x3dacaff7                      # float 0.0843200013
	.long	0x3ed09891                      # float 0.407413989
	.long	0x3e905858                      # float 0.281924009
	.long	0x3db7a2cf                      # float 0.0896660014
	.long	0x3ed3280f                      # float 0.412414998
	.long	0x3e908d2a                      # float 0.282326996
	.long	0x3dc277c4                      # float 0.0949549973
	.long	0x3ed5ac69                      # float 0.41733101
	.long	0x3e90b84a                      # float 0.282656014
	.long	0x3dcd338f                      # float 0.100195996
	.long	0x3ed8255b                      # float 0.42216
	.long	0x3e90d994                      # float 0.282909989
	.long	0x3dd7d849                      # float 0.105393
	.long	0x3eda92e6                      # float 0.426901996
	.long	0x3e90f14e                      # float 0.283091009
	.long	0x3de2699c                      # float 0.110552996
	.long	0x3edcf4a5                      # float 0.43155399
	.long	0x3e90ff32                      # float 0.283196986
	.long	0x3dece9a3                      # float 0.115680002
	.long	0x3edf4a77                      # float 0.436114997
	.long	0x3e910364                      # float 0.283228993
	.long	0x3df759ef                      # float 0.120777003
	.long	0x3ee1943a                      # float 0.440584004
	.long	0x3e90fde3                      # float 0.283187002
	.long	0x3e00de4c                      # float 0.125847995
	.long	0x3ee3d1cc                      # float 0.444959998
	.long	0x3e90eed0                      # float 0.283071995
	.long	0x3e060957                      # float 0.130895004
	.long	0x3ee602eb                      # float 0.449241012
	.long	0x3e90d62c                      # float 0.282884002
	.long	0x3e0b2e9d                      # float 0.135920003
	.long	0x3ee82795                      # float 0.453426987
	.long	0x3e90b3f6                      # float 0.282622993
	.long	0x3e104ee8                      # float 0.140926003
	.long	0x3eea3fab                      # float 0.457516998
	.long	0x3e908851                      # float 0.282290012
	.long	0x3e1569f5                      # float 0.145912006
	.long	0x3eec4b0a                      # float 0.461510003
	.long	0x3e90537e                      # float 0.281886995
	.long	0x3e1a808d                      # float 0.150881007
	.long	0x3eee4990                      # float 0.465404987
	.long	0x3e90153c                      # float 0.281412005
	.long	0x3e1f92f3                      # float 0.155834004
	.long	0x3ef03b1d                      # float 0.469200999
	.long	0x3e8fcdee                      # float 0.280867994
	.long	0x3e24a127                      # float 0.160770997
	.long	0x3ef21fd1                      # float 0.47289899
	.long	0x3e8f7d95                      # float 0.28025499
	.long	0x3e29ab6d                      # float 0.165693
	.long	0x3ef3f78c                      # float 0.476498008
	.long	0x3e8f2453                      # float 0.279574007
	.long	0x3e2eb181                      # float 0.170598999
	.long	0x3ef5c22b                      # float 0.479997009
	.long	0x3e8ec248                      # float 0.278825998
	.long	0x3e33b3a7                      # float 0.175490007
	.long	0x3ef77fd0                      # float 0.483397007
	.long	0x3e8e5797                      # float 0.278012007
	.long	0x3e38b220                      # float 0.180366993
	.long	0x3ef93059                      # float 0.486696988
	.long	0x3e8de482                      # float 0.277134001
	.long	0x3e3dac69                      # float 0.185228005
	.long	0x3efad3e9                      # float 0.489897996
	.long	0x3e8d694d                      # float 0.276194006
	.long	0x3e42a2c2                      # float 0.190073997
	.long	0x3efc6aa1                      # float 0.493001014
	.long	0x3e8ce5d6                      # float 0.275191009
	.long	0x3e47952d                      # float 0.194904998
	.long	0x3efdf45e                      # float 0.496004999
	.long	0x3e8c5a81                      # float 0.27412799
	.long	0x3e4c83a9                      # float 0.199720994
	.long	0x3eff7143                      # float 0.498910993
	.long	0x3e8bc771                      # float 0.273005992
	.long	0x3e516db1                      # float 0.204520002
	.long	0x3f0070ca                      # float 0.501721025
	.long	0x3e8b2d0a                      # float 0.271827996
	.long	0x3e565387                      # float 0.209303007
	.long	0x3f012296                      # float 0.50443399
	.long	0x3e8a8b6e                      # float 0.270595014
	.long	0x3e5b34e7                      # float 0.214068994
	.long	0x3f01ce29                      # float 0.507052004
	.long	0x3e89e2bd                      # float 0.269308001
	.long	0x3e6011d3                      # float 0.218817994
	.long	0x3f0273a3                      # float 0.509576976
	.long	0x3e89331a                      # float 0.267967999
	.long	0x3e64ea07                      # float 0.223548993
	.long	0x3f0312f5                      # float 0.512008011
	.long	0x3e887d2c                      # float 0.266579986
	.long	0x3e69bd84                      # float 0.228262007
	.long	0x3f03ac60                      # float 0.514348984
	.long	0x3e87c116                      # float 0.265145004
	.long	0x3e6e8c05                      # float 0.232956007
	.long	0x3f043fd5                      # float 0.516599
	.long	0x3e86fed6                      # float 0.263662994
	.long	0x3e73558a                      # float 0.237630993
	.long	0x3f04cd96                      # float 0.518761992
	.long	0x3e8636f4                      # float 0.262138009
	.long	0x3e7819d2                      # float 0.242285997
	.long	0x3f055593                      # float 0.520837009
	.long	0x3e856990                      # float 0.260571003
	.long	0x3e7cd91f                      # float 0.246922001
	.long	0x3f05d80e                      # float 0.522827983
	.long	0x3e84970f                      # float 0.258964986
	.long	0x3e80c975                      # float 0.251536995
	.long	0x3f065519                      # float 0.524735987
	.long	0x3e83bfb6                      # float 0.257322013
	.long	0x3e832379                      # float 0.25613001
	.long	0x3f06ccd5                      # float 0.526562989
	.long	0x3e82e3e7                      # float 0.255645007
	.long	0x3e857add                      # float 0.260702997
	.long	0x3f073f75                      # float 0.528312027
	.long	0x3e8203c5                      # float 0.253935009
	.long	0x3e87cf5f                      # float 0.265253991
	.long	0x3f07acf7                      # float 0.529982984
	.long	0x3e811f92                      # float 0.252193987
	.long	0x3e8a20ff                      # float 0.26978299
	.long	0x3f081590                      # float 0.531579018
	.long	0x3e8037b5                      # float 0.250425011
	.long	0x3e8c6fbd                      # float 0.274289995
	.long	0x3f087970                      # float 0.533102989
	.long	0x3e7e989a                      # float 0.248629004
	.long	0x3e8ebb99                      # float 0.278775007
	.long	0x3f08d8a9                      # float 0.534555972
	.long	0x3e7cbc06                      # float 0.246811002
	.long	0x3e910471                      # float 0.28323701
	.long	0x3f09336e                      # float 0.535941005
	.long	0x3e7ad9f1                      # float 0.244972005
	.long	0x3e934a23                      # float 0.287674993
	.long	0x3f0989df                      # float 0.537259996
	.long	0x3e78f29d                      # float 0.243112996
	.long	0x3e958d15                      # float 0.292091995
	.long	0x3f09dc2f                      # float 0.538515985
	.long	0x3e7706d5                      # float 0.241237
	.long	0x3e97cce2                      # float 0.296485007
	.long	0x3f0a2a5e                      # float 0.539708972
	.long	0x3e75171e                      # float 0.239345998
	.long	0x3e9a09ab                      # float 0.300855011
	.long	0x3f0a74c1                      # float 0.540844023
	.long	0x3e7323bc                      # float 0.237441003
	.long	0x3e9c4370                      # float 0.305202007
	.long	0x3f0abb56                      # float 0.54192102
	.long	0x3e712dba                      # float 0.235525995
	.long	0x3e9e7a53                      # float 0.30952701
	.long	0x3f0afe61                      # float 0.542944014
	.long	0x3e6f35a0                      # float 0.233603001
	.long	0x3ea0ae10                      # float 0.313827991
	.long	0x3f0b3df3                      # float 0.54391402
	.long	0x3e6d3bf3                      # float 0.231674001
	.long	0x3ea2deca                      # float 0.318105996
	.long	0x3f0b7a3e                      # float 0.544834018
	.long	0x3e6b40b3                      # float 0.229738995
	.long	0x3ea50c80                      # float 0.322360992
	.long	0x3f0bb363                      # float 0.545705974
	.long	0x3e6944ed                      # float 0.227801993
	.long	0x3ea73754                      # float 0.326593995
	.long	0x3f0be985                      # float 0.546531975
	.long	0x3e6748a1                      # float 0.225862995
	.long	0x3ea95f46                      # float 0.330805004
	.long	0x3f0c1cc5                      # float 0.547313988
	.long	0x3e654c98                      # float 0.223924994
	.long	0x3eab8455                      # float 0.334993988
	.long	0x3f0c4d34                      # float 0.548053026
	.long	0x3e635116                      # float 0.221989006
	.long	0x3eada683                      # float 0.339161009
	.long	0x3f0c7b03                      # float 0.54875201
	.long	0x3e61569f                      # float 0.220056996
	.long	0x3eafc5ef                      # float 0.343306988
	.long	0x3f0ca655                      # float 0.549413025
	.long	0x3e5f5d79                      # float 0.218130007
	.long	0x3eb1e29b                      # float 0.347431988
	.long	0x3f0ccf4a                      # float 0.55003798
	.long	0x3e5d6627                      # float 0.216209993
	.long	0x3eb3fc65                      # float 0.351534992
	.long	0x3f0cf5e4                      # float 0.550626993
	.long	0x3e5b70ef                      # float 0.214297995
	.long	0x3eb613b2                      # float 0.355619013
	.long	0x3f0d1a65                      # float 0.551183999
	.long	0x3e597e13                      # float 0.212394997
	.long	0x3eb8285f                      # float 0.359683007
	.long	0x3f0d3cde                      # float 0.55171001
	.long	0x3e578e19                      # float 0.210502997
	.long	0x3eba3a6d                      # float 0.363727003
	.long	0x3f0d5d5f                      # float 0.55220598
	.long	0x3e55a145                      # float 0.208623007
	.long	0x3ebc49fd                      # float 0.367751986
	.long	0x3f0d7c1c                      # float 0.552675009
	.long	0x3e53b7d8                      # float 0.206755996
	.long	0x3ebe5711                      # float 0.371758014
	.long	0x3f0d9913                      # float 0.553116977
	.long	0x3e51d218                      # float 0.204903007
	.long	0x3ec061c8                      # float 0.375746012
	.long	0x3f0db457                      # float 0.553533018
	.long	0x3e4fefbf                      # float 0.203062996
	.long	0x3ec26a23                      # float 0.379716009
	.long	0x3f0dce07                      # float 0.553924978
	.long	0x3e4e1199                      # float 0.201239005
	.long	0x3ec47065                      # float 0.383670002
	.long	0x3f0de636                      # float 0.55429399
	.long	0x3e4c3761                      # float 0.199430004
	.long	0x3ec6746d                      # float 0.387607008
	.long	0x3f0dfd05                      # float 0.554642022
	.long	0x3e4a6117                      # float 0.197635993
	.long	0x3ec8765c                      # float 0.39152801
	.long	0x3f0e1273                      # float 0.554969013
	.long	0x3e488f86                      # float 0.195859998
	.long	0x3eca7632                      # float 0.395433009
	.long	0x3f0e2691                      # float 0.555275977
	.long	0x3e46c227                      # float 0.194100007
	.long	0x3ecc7410                      # float 0.399322987
	.long	0x3f0e3982                      # float 0.555565
	.long	0x3e44f93c                      # float 0.192357004
	.long	0x3ece7019                      # float 0.403198987
	.long	0x3f0e4b45                      # float 0.555836022
	.long	0x3e4334c6                      # float 0.190631002
	.long	0x3ed06a4d                      # float 0.407061011
	.long	0x3f0e5bd9                      # float 0.556088984
	.long	0x3e417508                      # float 0.188923001
	.long	0x3ed262cc                      # float 0.41091001
	.long	0x3f0e6b61                      # float 0.556325972
	.long	0x3e3fb97c                      # float 0.187231004
	.long	0x3ed45996                      # float 0.414745986
	.long	0x3f0e79dd                      # float 0.556546986
	.long	0x3e3e0264                      # float 0.185555995
	.long	0x3ed64ecf                      # float 0.418570012
	.long	0x3f0e875d                      # float 0.55675298
	.long	0x3e3c4fc2                      # float 0.183898002
	.long	0x3ed84296                      # float 0.42238301
	.long	0x3f0e93e2                      # float 0.556944013
	.long	0x3e3aa151                      # float 0.182255998
	.long	0x3eda34ca                      # float 0.426183999
	.long	0x3f0e9f6b                      # float 0.557120025
	.long	0x3e38f6cf                      # float 0.180629
	.long	0x3edc25af                      # float 0.429975003
	.long	0x3f0eaa08                      # float 0.557281971
	.long	0x3e3750c2                      # float 0.179019004
	.long	0x3ede1544                      # float 0.433755994
	.long	0x3f0eb3bc                      # float 0.557430029
	.long	0x3e35ae60                      # float 0.177423
	.long	0x3ee0038a                      # float 0.437527001
	.long	0x3f0ebc94                      # float 0.557564974
	.long	0x3e340faa                      # float 0.175841004
	.long	0x3ee1f0c3                      # float 0.441289991
	.long	0x3f0ec472                      # float 0.557685018
	.long	0x3e3274e2                      # float 0.174273998
	.long	0x3ee3dccf                      # float 0.445044011
	.long	0x3f0ecb75                      # float 0.557792008
	.long	0x3e30dd40                      # float 0.172719002
	.long	0x3ee5c7ef                      # float 0.448790997
	.long	0x3f0ed18d                      # float 0.557884991
	.long	0x3e2f48c3                      # float 0.171176001
	.long	0x3ee7b203                      # float 0.452529997
	.long	0x3f0ed6cb                      # float 0.557964981
	.long	0x3e2db7ae                      # float 0.169645995
	.long	0x3ee99b2c                      # float 0.456261992
	.long	0x3f0edb0e                      # float 0.558030009
	.long	0x3e2c2939                      # float 0.168126002
	.long	0x3eeb838c                      # float 0.459987998
	.long	0x3f0ede76                      # float 0.558081985
	.long	0x3e2a9da6                      # float 0.166617006
	.long	0x3eed6b23                      # float 0.463708013
	.long	0x3f0ee0e3                      # float 0.558118999
	.long	0x3e29146e                      # float 0.165116996
	.long	0x3eef5211                      # float 0.467422992
	.long	0x3f0ee254                      # float 0.558140993
	.long	0x3e278d50                      # float 0.163625002
	.long	0x3ef13858                      # float 0.471132994
	.long	0x3f0ee2ca                      # float 0.558148026
	.long	0x3e26088d                      # float 0.162141994
	.long	0x3ef31df7                      # float 0.474837989
	.long	0x3f0ee243                      # float 0.55813998
	.long	0x3e24855e                      # float 0.160665005
	.long	0x3ef50332                      # float 0.478540003
	.long	0x3f0ee0a0                      # float 0.558115005
	.long	0x3e2303c0                      # float 0.159193993
	.long	0x3ef6e7c5                      # float 0.482237011
	.long	0x3f0edddf                      # float 0.558072984
	.long	0x3e2183b6                      # float 0.157729
	.long	0x3ef8cc14                      # float 0.485931993
	.long	0x3f0ed9f1                      # float 0.558013022
	.long	0x3e20053e                      # float 0.156269997
	.long	0x3efaafff                      # float 0.489623994
	.long	0x3f0ed4e5                      # float 0.557936013
	.long	0x3e1e87d3                      # float 0.154815003
	.long	0x3efc9386                      # float 0.493313015
	.long	0x3f0ece9a                      # float 0.55783999
	.long	0x3e1d0b74                      # float 0.153364003
	.long	0x3efe76c9                      # float 0.497000009
	.long	0x3f0ec700                      # float 0.557723999
	.long	0x3e1b9064                      # float 0.151917994
	.long	0x3f002ce4                      # float 0.500684977
	.long	0x3f0ebe06                      # float 0.557587028
	.long	0x3e1a1661                      # float 0.150475994
	.long	0x3f011e54                      # float 0.50436902
	.long	0x3f0eb3bc                      # float 0.557430029
	.long	0x3e189dae                      # float 0.149039
	.long	0x3f020fa1                      # float 0.508050978
	.long	0x3f0ea7f0                      # float 0.557250023
	.long	0x3e17264a                      # float 0.147606999
	.long	0x3f0300ef                      # float 0.511732996
	.long	0x3f0e9ac3                      # float 0.557048976
	.long	0x3e15b036                      # float 0.146180004
	.long	0x3f03f21b                      # float 0.515412986
	.long	0x3f0e8bf4                      # float 0.556823015
	.long	0x3e143bb4                      # float 0.144758999
	.long	0x3f04e347                      # float 0.519092977
	.long	0x3f0e7b81                      # float 0.55657202
	.long	0x3e12c882                      # float 0.143343002
	.long	0x3f05d474                      # float 0.522773027
	.long	0x3f0e6959                      # float 0.556294978
	.long	0x3e115769                      # float 0.141935006
	.long	0x3f06c5a0                      # float 0.526453018
	.long	0x3f0e556d                      # float 0.555990994
	.long	0x3e0fe8ab                      # float 0.140535995
	.long	0x3f07b6bb                      # float 0.530131996
	.long	0x3f0e3fab                      # float 0.555658996
	.long	0x3e0e7c8d                      # float 0.139146999
	.long	0x3f08a7e7                      # float 0.533811986
	.long	0x3f0e2802                      # float 0.555297971
	.long	0x3e0d1394                      # float 0.137769997
	.long	0x3f099913                      # float 0.537491977
	.long	0x3f0e0e52                      # float 0.554906011
	.long	0x3e0bae8a                      # float 0.136408001
	.long	0x3f0a8a50                      # float 0.541172981
	.long	0x3f0df299                      # float 0.554482996
	.long	0x3e0a4ebe                      # float 0.135066003
	.long	0x3f0b7b7c                      # float 0.544852972
	.long	0x3f0dd4d8                      # float 0.554028988
	.long	0x3e08f3ed                      # float 0.133743003
	.long	0x3f0c6cca                      # float 0.548534989
	.long	0x3f0db4dd                      # float 0.553541005
	.long	0x3e079f66                      # float 0.132443994
	.long	0x3f0d5e07                      # float 0.552215993
	.long	0x3f0d9296                      # float 0.553017974
	.long	0x3e0651f4                      # float 0.131172001
	.long	0x3f0e4f66                      # float 0.555899024
	.long	0x3f0d6df4                      # float 0.552459002
	.long	0x3e050d28                      # float 0.129933
	.long	0x3f0f40c4                      # float 0.559581995
	.long	0x3f0d46f6                      # float 0.551864028
	.long	0x3e03d189                      # float 0.128729001
	.long	0x3f103223                      # float 0.563265026
	.long	0x3f0d1d58                      # float 0.551229
	.long	0x3e02a130                      # float 0.127568007
	.long	0x3f112392                      # float 0.56694901
	.long	0x3f0cf13d                      # float 0.550556004
	.long	0x3e017ce5                      # float 0.126452997
	.long	0x3f121501                      # float 0.570632994
	.long	0x3f0cc261                      # float 0.549840987
	.long	0x3e006749                      # float 0.125394002
	.long	0x3f130681                      # float 0.574317992
	.long	0x3f0c90e6                      # float 0.549085975
	.long	0x3dfec2ce                      # float 0.124394998
	.long	0x3f13f7f0                      # float 0.578001976
	.long	0x3f0c5c89                      # float 0.548286974
	.long	0x3dfcda2b                      # float 0.123462997
	.long	0x3f14e970                      # float 0.581686974
	.long	0x3f0c255b                      # float 0.547444999
	.long	0x3dfb18db                      # float 0.122606002
	.long	0x3f15dae0                      # float 0.585371017
	.long	0x3f0beb29                      # float 0.546557009
	.long	0x3df98288                      # float 0.121831
	.long	0x3f16cc4f                      # float 0.589055002
	.long	0x3f0badf3                      # float 0.545623004
	.long	0x3df81c71                      # float 0.121147998
	.long	0x3f17bdbe                      # float 0.592738986
	.long	0x3f0b6d98                      # float 0.544641018
	.long	0x3df6eac8                      # float 0.120564997
	.long	0x3f18af1d                      # float 0.596422017
	.long	0x3f0b2a17                      # float 0.54361099
	.long	0x3df5f2cb                      # float 0.120091997
	.long	0x3f19a06a                      # float 0.600103974
	.long	0x3f0ae33f                      # float 0.54253
	.long	0x3df53932                      # float 0.119737998
	.long	0x3f1a91a7                      # float 0.603784978
	.long	0x3f0a9931                      # float 0.541400015
	.long	0x3df4c2b5                      # float 0.119511999
	.long	0x3f1b82c3                      # float 0.607464015
	.long	0x3f0a4bba                      # float 0.540217996
	.long	0x3df4940c                      # float 0.119423002
	.long	0x3f1c73bd                      # float 0.611141026
	.long	0x3f09fab9                      # float 0.538981974
	.long	0x3df4b381                      # float 0.119483002
	.long	0x3f1d64a6                      # float 0.614817023
	.long	0x3f09a62f                      # float 0.53769201
	.long	0x3df524c0                      # float 0.119699001
	.long	0x3f1e555c                      # float 0.618489981
	.long	0x3f094e09                      # float 0.536346972
	.long	0x3df5ed07                      # float 0.120081
	.long	0x3f1f45f1                      # float 0.622160971
	.long	0x3f08f239                      # float 0.534946024
	.long	0x3df7110e                      # float 0.120637998
	.long	0x3f203644                      # float 0.625828028
	.long	0x3f0892ab                      # float 0.533487976
	.long	0x3df89614                      # float 0.121380001
	.long	0x3f212663                      # float 0.629491984
	.long	0x3f082f62                      # float 0.531973004
	.long	0x3dfa7eb7                      # float 0.122312002
	.long	0x3f221651                      # float 0.633153021
	.long	0x3f07c82a                      # float 0.530398011
	.long	0x3dfcd035                      # float 0.123443998
	.long	0x3f2305ea                      # float 0.636808991
	.long	0x3f075d03                      # float 0.528762996
	.long	0x3dff8ca8                      # float 0.124779999
	.long	0x3f23f541                      # float 0.640461027
	.long	0x3f06edee                      # float 0.527068019
	.long	0x3e015b9a                      # float 0.126325995
	.long	0x3f24e432                      # float 0.644106984
	.long	0x3f067ac8                      # float 0.525310993
	.long	0x3e03293d                      # float 0.128086999
	.long	0x3f25d2e1                      # float 0.647749006
	.long	0x3f060382                      # float 0.523491025
	.long	0x3e053049                      # float 0.130067006
	.long	0x3f26c11a                      # float 0.651383996
	.long	0x3f05881a                      # float 0.521607995
	.long	0x3e077143                      # float 0.132267997
	.long	0x3f27aeff                      # float 0.655013978
	.long	0x3f050881                      # float 0.519661009
	.long	0x3e09ecb3                      # float 0.134691998
	.long	0x3f289c5e                      # float 0.658635974
	.long	0x3f0484a5                      # float 0.517648995
	.long	0x3e0ca298                      # float 0.137338996
	.long	0x3f298959                      # float 0.662252008
	.long	0x3f03fc76                      # float 0.515570998
	.long	0x3e0f9336                      # float 0.140210003
	.long	0x3f2a75bc                      # float 0.665858984
	.long	0x3f036ff4                      # float 0.513427019
	.long	0x3e12be06                      # float 0.143303007
	.long	0x3f2b61aa                      # float 0.669458985
	.long	0x3f02defc                      # float 0.511214972
	.long	0x3e162281                      # float 0.146615997
	.long	0x3f2c4d01                      # float 0.673049986
	.long	0x3f0249a1                      # float 0.508935988
	.long	0x3e19c066                      # float 0.150148004
	.long	0x3f2d37b0                      # float 0.676630974
	.long	0x3f01afd1                      # float 0.506588995
	.long	0x3e1d9664                      # float 0.153894007
	.long	0x3f2e21c9                      # float 0.68020302
	.long	0x3f01116b                      # float 0.504172027
	.long	0x3e21a3b1                      # float 0.157850996
	.long	0x3f2f0b39                      # float 0.683764994
	.long	0x3f006e7e                      # float 0.501685977
	.long	0x3e25e786                      # float 0.162016004
	.long	0x3f2ff3f1                      # float 0.687316
	.long	0x3eff8dd6                      # float 0.499128997
	.long	0x3e2a604e                      # float 0.166382998
	.long	0x3f30dbf0                      # float 0.69085598
	.long	0x3efe3583                      # float 0.496502012
	.long	0x3e2f0cfe                      # float 0.170947999
	.long	0x3f31c326                      # float 0.694383979
	.long	0x3efcd3bf                      # float 0.493802994
	.long	0x3e33ec89                      # float 0.175706998
	.long	0x3f32a993                      # float 0.697899997
	.long	0x3efb68ad                      # float 0.491032988
	.long	0x3e38fd1a                      # float 0.180653006
	.long	0x3f338f15                      # float 0.701402008
	.long	0x3ef9f3e9                      # float 0.488189012
	.long	0x3e3e3de6                      # float 0.185782999
	.long	0x3f3473bd                      # float 0.704891026
	.long	0x3ef875b4                      # float 0.485273004
	.long	0x3e43ad19                      # float 0.191090003
	.long	0x3f355779                      # float 0.708365976
	.long	0x3ef6edee                      # float 0.482284009
	.long	0x3e4949e9                      # float 0.196571007
	.long	0x3f363a4b                      # float 0.71182698
	.long	0x3ef55c74                      # float 0.479220986
	.long	0x3e4f127f                      # float 0.202218994
	.long	0x3f371c11                      # float 0.715272009
	.long	0x3ef3c148                      # float 0.476083994
	.long	0x3e5505d1                      # float 0.20803
	.long	0x3f37fcca                      # float 0.718701005
	.long	0x3ef21c69                      # float 0.472873002
	.long	0x3e5b22d1                      # float 0.214000002
	.long	0x3f38dc77                      # float 0.722114026
	.long	0x3ef06dd7                      # float 0.469588012
	.long	0x3e616830                      # float 0.220124006
	.long	0x3f39baf5                      # float 0.725508987
	.long	0x3eeeb52d                      # float 0.466226012
	.long	0x3e67d49d                      # float 0.226396993
	.long	0x3f3a9867                      # float 0.728887975
	.long	0x3eecf2ae                      # float 0.462788999
	.long	0x3e6e670e                      # float 0.232814997
	.long	0x3f3b748a                      # float 0.732246995
	.long	0x3eeb265b                      # float 0.459277004
	.long	0x3e751e75                      # float 0.239373997
	.long	0x3f3c4f7f                      # float 0.735588014
	.long	0x3ee94ff0                      # float 0.455688
	.long	0x3e7bf9c6                      # float 0.246069998
	.long	0x3f3d2935                      # float 0.738910019
	.long	0x3ee76fb1                      # float 0.452024013
	.long	0x3e817bfa                      # float 0.252898991
	.long	0x3f3e018a                      # float 0.742210984
	.long	0x3ee5857b                      # float 0.448284
	.long	0x3e850bfa                      # float 0.259856999
	.long	0x3f3ed890                      # float 0.745491981
	.long	0x3ee3912e                      # float 0.444467008
	.long	0x3e88ac7e                      # float 0.266941011
	.long	0x3f3fae25                      # float 0.748750984
	.long	0x3ee192c9                      # float 0.440573007
	.long	0x3e8c5d42                      # float 0.274149001
	.long	0x3f408249                      # float 0.751987993
	.long	0x3edf8a2b                      # float 0.436601013
	.long	0x3e901dc1                      # float 0.281477004
	.long	0x3f4154fc                      # float 0.755203009
	.long	0x3edd7775                      # float 0.43255201
	.long	0x3e93ed74                      # float 0.288920999
	.long	0x3f42261c                      # float 0.758394003
	.long	0x3edb5aa7                      # float 0.428425997
	.long	0x3e97cc18                      # float 0.296478987
	.long	0x3f42f5a9                      # float 0.761560976
	.long	0x3ed933c2                      # float 0.424223006
	.long	0x3e9bb949                      # float 0.304147989
	.long	0x3f43c3a4                      # float 0.764703989
	.long	0x3ed702c5                      # float 0.419943005
	.long	0x3e9fb4a2                      # float 0.311924994
	.long	0x3f448ffc                      # float 0.767822027
	.long	0x3ed4c7b0                      # float 0.415585995
	.long	0x3ea3be01                      # float 0.31980899
	.long	0x3f455a9f                      # float 0.770914018
	.long	0x3ed28284                      # float 0.411152005
	.long	0x3ea7d4e1                      # float 0.327796012
	.long	0x3f46238e                      # float 0.773980021
	.long	0x3ed0331e                      # float 0.406639993
	.long	0x3eabf91e                      # float 0.335884988
	.long	0x3f46eaa7                      # float 0.77701801
	.long	0x3ecdd95e                      # float 0.402049005
	.long	0x3eb02a78                      # float 0.344074011
	.long	0x3f47affb                      # float 0.780028998
	.long	0x3ecb7586                      # float 0.397381008
	.long	0x3eb46888                      # float 0.35236001
	.long	0x3f487369                      # float 0.783011019
	.long	0x3ec90796                      # float 0.392636001
	.long	0x3eb8b30b                      # float 0.360740989
	.long	0x3f4934f0                      # float 0.785964012
	.long	0x3ec68f8e                      # float 0.387813985
	.long	0x3ebd099e                      # float 0.369213998
	.long	0x3f49f490                      # float 0.788887977
	.long	0x3ec40d4e                      # float 0.382914007
	.long	0x3ec16c40                      # float 0.377779007
	.long	0x3f4ab229                      # float 0.791781008
	.long	0x3ec18138                      # float 0.377938986
	.long	0x3ec5da8c                      # float 0.386433005
	.long	0x3f4b6dca                      # float 0.794643998
	.long	0x3ebeeaea                      # float 0.372886002
	.long	0x3eca543f                      # float 0.395173997
	.long	0x3f4c2752                      # float 0.79747498
	.long	0x3ebc4aa5                      # float 0.367756993
	.long	0x3eced938                      # float 0.404000998
	.long	0x3f4cded3                      # float 0.800275027
	.long	0x3eb9a06a                      # float 0.362551987
	.long	0x3ed36955                      # float 0.412912995
	.long	0x3f4d9418                      # float 0.803040981
	.long	0x3eb6ebf6                      # float 0.357268989
	.long	0x3ed80453                      # float 0.421907991
	.long	0x3f4e4734                      # float 0.805773973
	.long	0x3eb42d8c                      # float 0.351909995
	.long	0x3edca9ce                      # float 0.430983007
	.long	0x3f4ef816                      # float 0.80847299
	.long	0x3eb1654d                      # float 0.346475989
	.long	0x3ee159a3                      # float 0.440136999
	.long	0x3f4fa6bd                      # float 0.811137974
	.long	0x3eae933a                      # float 0.340967
	.long	0x3ee61390                      # float 0.449368
	.long	0x3f50531a                      # float 0.813768029
	.long	0x3eabb774                      # float 0.335384011
	.long	0x3eead752                      # float 0.458674014
	.long	0x3f50fd2a                      # float 0.816362977
	.long	0x3ea8d1fa                      # float 0.329726994
	.long	0x3eefa4a5                      # float 0.468053013
	.long	0x3f51a4cf                      # float 0.818921029
	.long	0x3ea5e311                      # float 0.323998004
	.long	0x3ef47b67                      # float 0.477503985
	.long	0x3f524a27                      # float 0.821443974
	.long	0x3ea2ea74                      # float 0.318194985
	.long	0x3ef95b79                      # float 0.487026006
	.long	0x3f52ed03                      # float 0.823929011
	.long	0x3e9fe88a                      # float 0.312321007
	.long	0x3efe4452                      # float 0.496614993
	.long	0x3f538d61                      # float 0.82637602
	.long	0x3e9cdd72                      # float 0.306376994
	.long	0x3f019afa                      # float 0.506271005
	.long	0x3f542b52                      # float 0.828786015
	.long	0x3e99c90c                      # float 0.300361991
	.long	0x3f04180d                      # float 0.515991986
	.long	0x3f54c6c5                      # float 0.831157982
	.long	0x3e96abbd                      # float 0.294279009
	.long	0x3f069942                      # float 0.525776029
	.long	0x3f555fab                      # float 0.833491027
	.long	0x3e938562                      # float 0.288127005
	.long	0x3f091e75                      # float 0.535620987
	.long	0x3f55f601                      # float 0.835784971
	.long	0x3e90563f                      # float 0.281908005
	.long	0x3f0ba776                      # float 0.545524001
	.long	0x3f5689b9                      # float 0.83803898
	.long	0x3e8d1eda                      # float 0.275626004
	.long	0x3f0e3433                      # float 0.555483997
	.long	0x3f571ae3                      # float 0.840254008
	.long	0x3e89df33                      # float 0.269281
	.long	0x3f10c47a                      # float 0.565497994
	.long	0x3f57a97e                      # float 0.842429995
	.long	0x3e8697d0                      # float 0.262876987
	.long	0x3f135819                      # float 0.575563014
	.long	0x3f58357a                      # float 0.844565987
	.long	0x3e8348d4                      # float 0.256415009
	.long	0x3f15eefe                      # float 0.585677981
	.long	0x3f58bec6                      # float 0.846660971
	.long	0x3e7fe500                      # float 0.249897003
	.long	0x3f1888e8                      # float 0.595839023
	.long	0x3f594584                      # float 0.848716974
	.long	0x3e792b3d                      # float 0.243329003
	.long	0x3f1b25c4                      # float 0.606045008
	.long	0x3f59c9a3                      # float 0.850732982
	.long	0x3e7264a1                      # float 0.236711994
	.long	0x3f1dc561                      # float 0.616293013
	.long	0x3f5a4b23                      # float 0.852708995
	.long	0x3e6b92c0                      # float 0.230051994
	.long	0x3f20677b                      # float 0.626578986
	.long	0x3f5aca04                      # float 0.854645014
	.long	0x3e64b6a6                      # float 0.223352998
	.long	0x3f230c02                      # float 0.636901975
	.long	0x3f5b4656                      # float 0.856541991
	.long	0x3e5dd1a2                      # float 0.216619998
	.long	0x3f25b2a2                      # float 0.64725697
	.long	0x3f5bc01a                      # float 0.858399987
	.long	0x3e56e5cd                      # float 0.209860995
	.long	0x3f285b3a                      # float 0.657642007
	.long	0x3f5c3750                      # float 0.860219001
	.long	0x3e4ff4ba                      # float 0.203081995
	.long	0x3f2b0596                      # float 0.668053985
	.long	0x3f5cabf7                      # float 0.861998975
	.long	0x3e490108                      # float 0.196292996
	.long	0x3f2db175                      # float 0.678489029
	.long	0x3f5d1e32                      # float 0.863741993
	.long	0x3e420d13                      # float 0.189502999
	.long	0x3f305ea2                      # float 0.688943982
	.long	0x3f5d8e00                      # float 0.865447998
	.long	0x3e3b1c43                      # float 0.182724997
	.long	0x3f330cdd                      # float 0.699415028
	.long	0x3f5dfb61                      # float 0.867116987
	.long	0x3e3431be                      # float 0.175971001
	.long	0x3f35bbe0                      # float 0.709897995
	.long	0x3f5e6677                      # float 0.868750989
	.long	0x3e2d51b5                      # float 0.169257
	.long	0x3f386b8b                      # float 0.720390975
	.long	0x3f5ecf42                      # float 0.870350003
	.long	0x3e268167                      # float 0.162603006
	.long	0x3f3b1b8b                      # float 0.730889022
	.long	0x3f5f35e3                      # float 0.871915996
	.long	0x3e1fc611                      # float 0.156029001
	.long	0x3f3dcb9b                      # float 0.741388022
	.long	0x3f5f9a5b                      # float 0.873449027
	.long	0x3e192685                      # float 0.149561003
	.long	0x3f407b78                      # float 0.751883983
	.long	0x3f5ffcca                      # float 0.874951004
	.long	0x3e12aa5c                      # float 0.143227994
	.long	0x3f432ae0                      # float 0.762372971
	.long	0x3f605d53                      # float 0.876424014
	.long	0x3e0c5a81                      # float 0.137063995
	.long	0x3f45d9a1                      # float 0.772852003
	.long	0x3f60bbf5                      # float 0.877867996
	.long	0x3e064170                      # float 0.131108999
	.long	0x3f488755                      # float 0.783315002
	.long	0x3f6118d2                      # float 0.879284977
	.long	0x3e006a2b                      # float 0.125404999
	.long	0x3f4b33db                      # float 0.793760001
	.long	0x3f61741d                      # float 0.880677998
	.long	0x3df5c52e                      # float 0.120004997
	.long	0x3f4ddedf                      # float 0.804181993
	.long	0x3f61cdc4                      # float 0.882045984
	.long	0x3deb72c5                      # float 0.114964999
	.long	0x3f50880e                      # float 0.814576029
	.long	0x3f62260b                      # float 0.883392989
	.long	0x3de1fd9c                      # float 0.110347003
	.long	0x3f532f45                      # float 0.824940025
	.long	0x3f627d03                      # float 0.884720027
	.long	0x3dd9884c                      # float 0.106216997
	.long	0x3f55d441                      # float 0.835269987
	.long	0x3f62d2cc                      # float 0.886029005
	.long	0x3dd23811                      # float 0.102646001
	.long	0x3f5876b0                      # float 0.845561027
	.long	0x3f632789                      # float 0.887322008
	.long	0x3dcc3090                      # float 0.0997020006
	.long	0x3f5b165d                      # float 0.855809986
	.long	0x3f637b5b                      # float 0.888601005
	.long	0x3dc794ea                      # float 0.0974519997
	.long	0x3f5db307                      # float 0.86601299
	.long	0x3f63ce64                      # float 0.889868021
	.long	0x3dc48302                      # float 0.0959530026
	.long	0x3f604c8c                      # float 0.876168013
	.long	0x3f6420c5                      # float 0.891125023
	.long	0x3dc3126f                      # float 0.095250003
	.long	0x3f62e2a8                      # float 0.886270999
	.long	0x3f64729f                      # float 0.892373979
	.long	0x3dc35372                      # float 0.0953740031
	.long	0x3f65753a                      # float 0.896319985
	.long	0x3f64c405                      # float 0.89361602
	.long	0x3dc54b49                      # float 0.0963350012
	.long	0x3f6803ff                      # float 0.906310975
	.long	0x3f651538                      # float 0.894855022
	.long	0x3dc8f5c3                      # float 0.0981250032
	.long	0x3f6a8ed6                      # float 0.916242003
	.long	0x3f656638                      # float 0.896090984
	.long	0x3dce44b7                      # float 0.100717001
	.long	0x3f6d1548                      # float 0.926105976
	.long	0x3f65b76b                      # float 0.897329986
	.long	0x3dd5232d                      # float 0.104070999
	.long	0x3f6f9768                      # float 0.935904026
	.long	0x3f6608af                      # float 0.898570001
	.long	0x3ddd73c9                      # float 0.108130999
	.long	0x3f721533                      # float 0.945635974
	.long	0x3f665a47                      # float 0.899815022
	.long	0x3de7179c                      # float 0.112838
	.long	0x3f748e8a                      # float 0.955299973
	.long	0x3f66ac32                      # float 0.901064991
	.long	0x3df1ed18                      # float 0.118128002
	.long	0x3f77034b                      # float 0.964893996
	.long	0x3f66fea4                      # float 0.902323008
	.long	0x3dfdd4c7                      # float 0.123940997
	.long	0x3f797364                      # float 0.974416971
	.long	0x3f6751ad                      # float 0.903590023
	.long	0x3e055715                      # float 0.130215004
	.long	0x3f7bdec6                      # float 0.983868002
	.long	0x3f67a55d                      # float 0.904866993
	.long	0x3e0c2eba                      # float 0.136896998
	.long	0x3f7e4580                      # float 0.993247985
	.long	0x3f67f9e8                      # float 0.906157016
	.long	0x3e1363f5                      # float 0.143935993
	.size	colormap__viridis, 3072

	.ident	"clang version 19.1.7 (Fedora 19.1.7-3.fc41)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym gl2d__error_callback
	.addrsig_sym gl2d__framebuffer_size_callback
