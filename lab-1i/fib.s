.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func
	.global fibonacci
	.type fibonacci, function

fibonacci:
	@n=r3, i=r4, X0=r5, X1=r6
	@X=X0+X1  r0=r5+r6
	
	push  {r3, r4, r5,r6, lr}
	cmp   r0,#0	 @if(n==0)
	IT    EQ
	popeq {r3, r4, r5,r6, pc}  @return
	cmp   r0,#1	 @if(n==1)
	IT    EQ
	popeq {r3, r4, r5,r6, pc}  @return

	mov r3,r0	@r3=n
	mov r4,#2	@r4=i
	mov r5,#0	@r5=0  X0
	mov r6,#1	@r6=1  X1
L1:	
	cmp  r4,r3	@if(i>n)
	IT  gt
	popgt {r3, r4, r5,r6, pc}  @return		

	add r0,r5,r6 @X=X0+X1
    mov r5,r6	 @X0=X1
    mov r6,r0 	 @X1=X
    add r4,r4,#1 @i=i+1
    bl  L1


	.size fibonacci, .-fibonacci
	.end