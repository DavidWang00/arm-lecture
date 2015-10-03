	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func
	.global fibonacci
	.type fibonacci, function

fibonacci:
	@r1=x  r2=x0
	@return fibonacci(x-1) +fibonacci(x-2)

LL1:
	push  {r1,r2,LR}
	cmp   r0,#0			@if(x==0)
	IT    EQ
	popeq {r1,r2,pc}
	
	cmp   r0,#1			@if(x==1)
	IT    EQ
	popeq {r1,r2,pc}	
	
	mov   r1,r0			@save x
	sub   r0,r0,#1		@fibonacci(x-1)
	bl    LL1
	
	mov   r2,r0         @x0=r2
	mov   r0,r1
	sub   r0,r0,#2		@fibonacci(x-2)
	bl    LL1

	add   r0,r2,r0		@fibonacci(x-1)+fibonacci(x-2)   x0+x1
	pop   {r1,r2,pc}

	.size fibonacci, .-fibonacci
	.end
