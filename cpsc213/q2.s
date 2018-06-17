.pos 0x0
                 ld   $0x1028, r5         # r5 = &0x1028
                 ld   $0xfffffff4, r0     # r0 = -12
                 add  r0, r5              # r5 = 0x1016
                 ld   $0x200, r0          # r0 = 0x200
                 ld   0x0(r0), r0         # r0 = value at 0x200 -> 0
                 st   r0, 0x0(r5)         # m[r5] or 0x1016 = m[0x204] or0
                 ld   $0x204, r0          # r0 = 0x204
                 ld   0x0(r0), r0         # r0 = value at 0x204
                 st   r0, 0x4(r5)         # m[r5] or 0x1020 = m[0x204] or 0
                 ld   $0x208, r0          # r0 = 0x208
                 ld   0x0(r0), r0         # r0 = value at 0x208
                 st   r0, 0x8(r5)         # m[r5] or 0x1024 = m[0x204] or 0
                 gpc  $6, r6              # r6 = pc + 6
                 j    0x300               # goto 0x300
                 ld   $0x20c, r1          # r1 = 0x20c
                 st   r0, 0x0(r1)         # m[r1] = r0
                 halt                     
.pos 0x200
                 .long 0x00000000         # 0
                 .long 0x00000000         # 0
                 .long 0x00000000         # 0
                 .long 0x00000000         # 0
.pos 0x300
                 ld   0x0(r5), r0         # r0 = m[r5]
                 ld   0x4(r5), r1         # r0 = m[r5 + 4]
                 ld   0x8(r5), r2         # r0 = m[r5 + 8]
                 ld   $0xfffffff6, r3     # r3 = -10
                 add  r3, r0              # r0 += r3
                 mov  r0, r3              # r3 = r0
                 not  r3                  # r3 = -r3 -1
                 inc  r3                  # r3 = -r3
                 bgt  r3, L6              # if r3 > 0, then goto L6
                 mov  r0, r3              # r3 = r0
                 ld   $0xfffffff8, r4     # r4 = -8
                 add  r4, r3              # r4 += r4
                 bgt  r3, L6              # if r3 > 0, then goto L6
                 ld   $0x400, r3          # r3 = 0x400
                 j    *(r3, r0, 4)        # double jump to the address stored at m[r3[r0]]
.pos 0x330
                 add  r1, r2              # r2 += r1
                 br   L7                  # goto L7
                 not  r2                  # r2 = -r2 -1
                 inc  r2                  # r2 = -r2
                 add  r1, r2              # r2 += r1
                 br   L7                  # goto L7
                 not  r2                  # r2 = -r2 -1
                 inc  r2                  # r2 = -r2
                 add  r1, r2              # r2 += r1
                 bgt  r2, L0              # if r2 > 0, then goto L0
                 ld   $0x0, r2            # r2 = 0
                 br   L1                  # goto L1
L0:              ld   $0x1, r2            # r2 = 1
L1:              br   L7                  # goto L7
                 not  r1                  # r2 = -r2 -1
                 inc  r1                  # r2 = -r2
                 add  r2, r1              # r1 += r2
                 bgt  r1, L2              # if r1 > 0, then goto L2
                 ld   $0x0, r2            # r2 = 0
                 br   L3                  # goto L3
L2:              ld   $0x1, r2            # r2 = 1
L3:              br   L7                  # goto L7
                 not  r2                  # r2 = -r2 -1
                 inc  r2                  # r2 = -r2
                 add  r1, r2              # r2 += r1
                 beq  r2, L4              # if r2 = 0, then goto L4
                 ld   $0x0, r2            # r2 = 0
                 br   L5                  # goto L5
L4:              ld   $0x1, r2            # r2 = 1
L5:              br   L7                  # goto L7
L6:              ld   $0x0, r2            # r2 = 0
                 br   L7                  # goto L7
L7:              mov  r2, r0              # r0 = r2
                 j    0x0(r6)             # goto address stored in r6
.pos 0x400
                 .long 0x00000330         
                 .long 0x00000384         
                 .long 0x00000334         
                 .long 0x00000384         
                 .long 0x0000033c         
                 .long 0x00000384         
                 .long 0x00000354         
                 .long 0x00000384         
                 .long 0x0000036c         
.pos 0x1000
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
