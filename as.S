
as:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 dd 7f 00 00 	mov    0x7fdd(%rip),%rax        # 8fe8 <__gmon_start__>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	callq  *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 e2 7f 00 00    	pushq  0x7fe2(%rip)        # 9008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 7f 00 00    	jmpq   *0x7fe4(%rip)        # 9010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <putchar@plt>:
    1030:	ff 25 e2 7f 00 00    	jmpq   *0x7fe2(%rip)        # 9018 <putchar@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	pushq  $0x0
    103b:	e9 e0 ff ff ff       	jmpq   1020 <.plt>

0000000000001040 <__errno_location@plt>:
    1040:	ff 25 da 7f 00 00    	jmpq   *0x7fda(%rip)        # 9020 <__errno_location@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	pushq  $0x1
    104b:	e9 d0 ff ff ff       	jmpq   1020 <.plt>

0000000000001050 <puts@plt>:
    1050:	ff 25 d2 7f 00 00    	jmpq   *0x7fd2(%rip)        # 9028 <puts@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	pushq  $0x2
    105b:	e9 c0 ff ff ff       	jmpq   1020 <.plt>

0000000000001060 <write@plt>:
    1060:	ff 25 ca 7f 00 00    	jmpq   *0x7fca(%rip)        # 9030 <write@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	pushq  $0x3
    106b:	e9 b0 ff ff ff       	jmpq   1020 <.plt>

0000000000001070 <strlen@plt>:
    1070:	ff 25 c2 7f 00 00    	jmpq   *0x7fc2(%rip)        # 9038 <strlen@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	pushq  $0x4
    107b:	e9 a0 ff ff ff       	jmpq   1020 <.plt>

0000000000001080 <htons@plt>:
    1080:	ff 25 ba 7f 00 00    	jmpq   *0x7fba(%rip)        # 9040 <htons@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	pushq  $0x5
    108b:	e9 90 ff ff ff       	jmpq   1020 <.plt>

0000000000001090 <printf@plt>:
    1090:	ff 25 b2 7f 00 00    	jmpq   *0x7fb2(%rip)        # 9048 <printf@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	pushq  $0x6
    109b:	e9 80 ff ff ff       	jmpq   1020 <.plt>

00000000000010a0 <lseek@plt>:
    10a0:	ff 25 aa 7f 00 00    	jmpq   *0x7faa(%rip)        # 9050 <lseek@GLIBC_2.2.5>
    10a6:	68 07 00 00 00       	pushq  $0x7
    10ab:	e9 70 ff ff ff       	jmpq   1020 <.plt>

00000000000010b0 <__assert_fail@plt>:
    10b0:	ff 25 a2 7f 00 00    	jmpq   *0x7fa2(%rip)        # 9058 <__assert_fail@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	pushq  $0x8
    10bb:	e9 60 ff ff ff       	jmpq   1020 <.plt>

00000000000010c0 <memset@plt>:
    10c0:	ff 25 9a 7f 00 00    	jmpq   *0x7f9a(%rip)        # 9060 <memset@GLIBC_2.2.5>
    10c6:	68 09 00 00 00       	pushq  $0x9
    10cb:	e9 50 ff ff ff       	jmpq   1020 <.plt>

00000000000010d0 <close@plt>:
    10d0:	ff 25 92 7f 00 00    	jmpq   *0x7f92(%rip)        # 9068 <close@GLIBC_2.2.5>
    10d6:	68 0a 00 00 00       	pushq  $0xa
    10db:	e9 40 ff ff ff       	jmpq   1020 <.plt>

00000000000010e0 <fputc@plt>:
    10e0:	ff 25 8a 7f 00 00    	jmpq   *0x7f8a(%rip)        # 9070 <fputc@GLIBC_2.2.5>
    10e6:	68 0b 00 00 00       	pushq  $0xb
    10eb:	e9 30 ff ff ff       	jmpq   1020 <.plt>

00000000000010f0 <read@plt>:
    10f0:	ff 25 82 7f 00 00    	jmpq   *0x7f82(%rip)        # 9078 <read@GLIBC_2.2.5>
    10f6:	68 0c 00 00 00       	pushq  $0xc
    10fb:	e9 20 ff ff ff       	jmpq   1020 <.plt>

0000000000001100 <memcmp@plt>:
    1100:	ff 25 7a 7f 00 00    	jmpq   *0x7f7a(%rip)        # 9080 <memcmp@GLIBC_2.2.5>
    1106:	68 0d 00 00 00       	pushq  $0xd
    110b:	e9 10 ff ff ff       	jmpq   1020 <.plt>

0000000000001110 <fprintf@plt>:
    1110:	ff 25 72 7f 00 00    	jmpq   *0x7f72(%rip)        # 9088 <fprintf@GLIBC_2.2.5>
    1116:	68 0e 00 00 00       	pushq  $0xe
    111b:	e9 00 ff ff ff       	jmpq   1020 <.plt>

0000000000001120 <strtol@plt>:
    1120:	ff 25 6a 7f 00 00    	jmpq   *0x7f6a(%rip)        # 9090 <strtol@GLIBC_2.2.5>
    1126:	68 0f 00 00 00       	pushq  $0xf
    112b:	e9 f0 fe ff ff       	jmpq   1020 <.plt>

0000000000001130 <memcpy@plt>:
    1130:	ff 25 62 7f 00 00    	jmpq   *0x7f62(%rip)        # 9098 <memcpy@GLIBC_2.14>
    1136:	68 10 00 00 00       	pushq  $0x10
    113b:	e9 e0 fe ff ff       	jmpq   1020 <.plt>

0000000000001140 <malloc@plt>:
    1140:	ff 25 5a 7f 00 00    	jmpq   *0x7f5a(%rip)        # 90a0 <malloc@GLIBC_2.2.5>
    1146:	68 11 00 00 00       	pushq  $0x11
    114b:	e9 d0 fe ff ff       	jmpq   1020 <.plt>

0000000000001150 <fflush@plt>:
    1150:	ff 25 52 7f 00 00    	jmpq   *0x7f52(%rip)        # 90a8 <fflush@GLIBC_2.2.5>
    1156:	68 12 00 00 00       	pushq  $0x12
    115b:	e9 c0 fe ff ff       	jmpq   1020 <.plt>

0000000000001160 <memmove@plt>:
    1160:	ff 25 4a 7f 00 00    	jmpq   *0x7f4a(%rip)        # 90b0 <memmove@GLIBC_2.2.5>
    1166:	68 13 00 00 00       	pushq  $0x13
    116b:	e9 b0 fe ff ff       	jmpq   1020 <.plt>

0000000000001170 <open@plt>:
    1170:	ff 25 42 7f 00 00    	jmpq   *0x7f42(%rip)        # 90b8 <open@GLIBC_2.2.5>
    1176:	68 14 00 00 00       	pushq  $0x14
    117b:	e9 a0 fe ff ff       	jmpq   1020 <.plt>

0000000000001180 <getopt@plt>:
    1180:	ff 25 3a 7f 00 00    	jmpq   *0x7f3a(%rip)        # 90c0 <getopt@GLIBC_2.2.5>
    1186:	68 15 00 00 00       	pushq  $0x15
    118b:	e9 90 fe ff ff       	jmpq   1020 <.plt>

0000000000001190 <exit@plt>:
    1190:	ff 25 32 7f 00 00    	jmpq   *0x7f32(%rip)        # 90c8 <exit@GLIBC_2.2.5>
    1196:	68 16 00 00 00       	pushq  $0x16
    119b:	e9 80 fe ff ff       	jmpq   1020 <.plt>

00000000000011a0 <fwrite@plt>:
    11a0:	ff 25 2a 7f 00 00    	jmpq   *0x7f2a(%rip)        # 90d0 <fwrite@GLIBC_2.2.5>
    11a6:	68 17 00 00 00       	pushq  $0x17
    11ab:	e9 70 fe ff ff       	jmpq   1020 <.plt>

00000000000011b0 <__ctype_b_loc@plt>:
    11b0:	ff 25 22 7f 00 00    	jmpq   *0x7f22(%rip)        # 90d8 <__ctype_b_loc@GLIBC_2.3>
    11b6:	68 18 00 00 00       	pushq  $0x18
    11bb:	e9 60 fe ff ff       	jmpq   1020 <.plt>

Disassembly of section .plt.got:

00000000000011c0 <__cxa_finalize@plt>:
    11c0:	ff 25 32 7e 00 00    	jmpq   *0x7e32(%rip)        # 8ff8 <__cxa_finalize@GLIBC_2.2.5>
    11c6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000011d0 <_start>:
    11d0:	31 ed                	xor    %ebp,%ebp
    11d2:	49 89 d1             	mov    %rdx,%r9
    11d5:	5e                   	pop    %rsi
    11d6:	48 89 e2             	mov    %rsp,%rdx
    11d9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    11dd:	50                   	push   %rax
    11de:	54                   	push   %rsp
    11df:	4c 8d 05 ca 3f 00 00 	lea    0x3fca(%rip),%r8        # 51b0 <__libc_csu_fini>
    11e6:	48 8d 0d 63 3f 00 00 	lea    0x3f63(%rip),%rcx        # 5150 <__libc_csu_init>
    11ed:	48 8d 3d 2c 38 00 00 	lea    0x382c(%rip),%rdi        # 4a20 <main>
    11f4:	ff 15 e6 7d 00 00    	callq  *0x7de6(%rip)        # 8fe0 <__libc_start_main@GLIBC_2.2.5>
    11fa:	f4                   	hlt    
    11fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001200 <deregister_tm_clones>:
    1200:	48 8d 3d 69 80 00 00 	lea    0x8069(%rip),%rdi        # 9270 <__TMC_END__>
    1207:	48 8d 05 62 80 00 00 	lea    0x8062(%rip),%rax        # 9270 <__TMC_END__>
    120e:	48 39 f8             	cmp    %rdi,%rax
    1211:	74 15                	je     1228 <deregister_tm_clones+0x28>
    1213:	48 8b 05 be 7d 00 00 	mov    0x7dbe(%rip),%rax        # 8fd8 <_ITM_deregisterTMCloneTable>
    121a:	48 85 c0             	test   %rax,%rax
    121d:	74 09                	je     1228 <deregister_tm_clones+0x28>
    121f:	ff e0                	jmpq   *%rax
    1221:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1228:	c3                   	retq   
    1229:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001230 <register_tm_clones>:
    1230:	48 8d 3d 39 80 00 00 	lea    0x8039(%rip),%rdi        # 9270 <__TMC_END__>
    1237:	48 8d 35 32 80 00 00 	lea    0x8032(%rip),%rsi        # 9270 <__TMC_END__>
    123e:	48 29 fe             	sub    %rdi,%rsi
    1241:	48 c1 fe 03          	sar    $0x3,%rsi
    1245:	48 89 f0             	mov    %rsi,%rax
    1248:	48 c1 e8 3f          	shr    $0x3f,%rax
    124c:	48 01 c6             	add    %rax,%rsi
    124f:	48 d1 fe             	sar    %rsi
    1252:	74 14                	je     1268 <register_tm_clones+0x38>
    1254:	48 8b 05 95 7d 00 00 	mov    0x7d95(%rip),%rax        # 8ff0 <_ITM_registerTMCloneTable>
    125b:	48 85 c0             	test   %rax,%rax
    125e:	74 08                	je     1268 <register_tm_clones+0x38>
    1260:	ff e0                	jmpq   *%rax
    1262:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1268:	c3                   	retq   
    1269:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001270 <__do_global_dtors_aux>:
    1270:	80 3d 31 80 00 00 00 	cmpb   $0x0,0x8031(%rip)        # 92a8 <completed.7325>
    1277:	75 2f                	jne    12a8 <__do_global_dtors_aux+0x38>
    1279:	55                   	push   %rbp
    127a:	48 83 3d 76 7d 00 00 	cmpq   $0x0,0x7d76(%rip)        # 8ff8 <__cxa_finalize@GLIBC_2.2.5>
    1281:	00 
    1282:	48 89 e5             	mov    %rsp,%rbp
    1285:	74 0c                	je     1293 <__do_global_dtors_aux+0x23>
    1287:	48 8b 3d 5a 7e 00 00 	mov    0x7e5a(%rip),%rdi        # 90e8 <__dso_handle>
    128e:	e8 2d ff ff ff       	callq  11c0 <__cxa_finalize@plt>
    1293:	e8 68 ff ff ff       	callq  1200 <deregister_tm_clones>
    1298:	c6 05 09 80 00 00 01 	movb   $0x1,0x8009(%rip)        # 92a8 <completed.7325>
    129f:	5d                   	pop    %rbp
    12a0:	c3                   	retq   
    12a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12a8:	c3                   	retq   
    12a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012b0 <frame_dummy>:
    12b0:	e9 7b ff ff ff       	jmpq   1230 <register_tm_clones>

00000000000012b5 <u16_print>:
    12b5:	55                   	push   %rbp
    12b6:	48 89 e5             	mov    %rsp,%rbp
    12b9:	48 83 ec 20          	sub    $0x20,%rsp
    12bd:	89 f8                	mov    %edi,%eax
    12bf:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
    12c3:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
    12c7:	89 c6                	mov    %eax,%esi
    12c9:	48 8d 3d 94 4d 00 00 	lea    0x4d94(%rip),%rdi        # 6064 <_IO_stdin_used+0x64>
    12d0:	b8 00 00 00 00       	mov    $0x0,%eax
    12d5:	e8 b6 fd ff ff       	callq  1090 <printf@plt>
    12da:	c7 45 fc 0f 00 00 00 	movl   $0xf,-0x4(%rbp)
    12e1:	eb 27                	jmp    130a <u16_print+0x55>
    12e3:	0f b7 55 ec          	movzwl -0x14(%rbp),%edx
    12e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12ea:	89 c1                	mov    %eax,%ecx
    12ec:	d3 fa                	sar    %cl,%edx
    12ee:	89 d0                	mov    %edx,%eax
    12f0:	83 e0 01             	and    $0x1,%eax
    12f3:	89 c6                	mov    %eax,%esi
    12f5:	48 8d 3d 6f 4d 00 00 	lea    0x4d6f(%rip),%rdi        # 606b <_IO_stdin_used+0x6b>
    12fc:	b8 00 00 00 00       	mov    $0x0,%eax
    1301:	e8 8a fd ff ff       	callq  1090 <printf@plt>
    1306:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
    130a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    130e:	79 d3                	jns    12e3 <u16_print+0x2e>
    1310:	90                   	nop
    1311:	c9                   	leaveq 
    1312:	c3                   	retq   

0000000000001313 <_print_reg>:
    1313:	55                   	push   %rbp
    1314:	48 89 e5             	mov    %rsp,%rbp
    1317:	48 83 ec 10          	sub    $0x10,%rsp
    131b:	89 f8                	mov    %edi,%eax
    131d:	88 45 fc             	mov    %al,-0x4(%rbp)
    1320:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    1324:	83 f8 0e             	cmp    $0xe,%eax
    1327:	74 30                	je     1359 <_print_reg+0x46>
    1329:	83 f8 0f             	cmp    $0xf,%eax
    132c:	74 18                	je     1346 <_print_reg+0x33>
    132e:	83 f8 0d             	cmp    $0xd,%eax
    1331:	75 39                	jne    136c <_print_reg+0x59>
    1333:	48 8d 3d 34 4d 00 00 	lea    0x4d34(%rip),%rdi        # 606e <_IO_stdin_used+0x6e>
    133a:	b8 00 00 00 00       	mov    $0x0,%eax
    133f:	e8 4c fd ff ff       	callq  1090 <printf@plt>
    1344:	eb 3e                	jmp    1384 <_print_reg+0x71>
    1346:	48 8d 3d 24 4d 00 00 	lea    0x4d24(%rip),%rdi        # 6071 <_IO_stdin_used+0x71>
    134d:	b8 00 00 00 00       	mov    $0x0,%eax
    1352:	e8 39 fd ff ff       	callq  1090 <printf@plt>
    1357:	eb 2b                	jmp    1384 <_print_reg+0x71>
    1359:	48 8d 3d 14 4d 00 00 	lea    0x4d14(%rip),%rdi        # 6074 <_IO_stdin_used+0x74>
    1360:	b8 00 00 00 00       	mov    $0x0,%eax
    1365:	e8 26 fd ff ff       	callq  1090 <printf@plt>
    136a:	eb 18                	jmp    1384 <_print_reg+0x71>
    136c:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
    1370:	89 c6                	mov    %eax,%esi
    1372:	48 8d 3d fe 4c 00 00 	lea    0x4cfe(%rip),%rdi        # 6077 <_IO_stdin_used+0x77>
    1379:	b8 00 00 00 00       	mov    $0x0,%eax
    137e:	e8 0d fd ff ff       	callq  1090 <printf@plt>
    1383:	90                   	nop
    1384:	90                   	nop
    1385:	c9                   	leaveq 
    1386:	c3                   	retq   

0000000000001387 <inst_print>:
    1387:	55                   	push   %rbp
    1388:	48 89 e5             	mov    %rsp,%rbp
    138b:	48 83 ec 20          	sub    $0x20,%rsp
    138f:	66 89 7d ee          	mov    %di,-0x12(%rbp)
    1393:	48 8d 45 ee          	lea    -0x12(%rbp),%rax
    1397:	0f b7 00             	movzwl (%rax),%eax
    139a:	0f b7 c0             	movzwl %ax,%eax
    139d:	89 c7                	mov    %eax,%edi
    139f:	e8 11 ff ff ff       	callq  12b5 <u16_print>
    13a4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    13ab:	00 
    13ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    13b3:	eb 48                	jmp    13fd <inst_print+0x76>
    13b5:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
    13b9:	83 e0 0f             	and    $0xf,%eax
    13bc:	0f b6 d0             	movzbl %al,%edx
    13bf:	8b 45 f4             	mov    -0xc(%rbp),%eax
    13c2:	48 98                	cltq   
    13c4:	48 c1 e0 04          	shl    $0x4,%rax
    13c8:	48 89 c1             	mov    %rax,%rcx
    13cb:	48 8d 05 38 7d 00 00 	lea    0x7d38(%rip),%rax        # 910a <opcode_map+0xa>
    13d2:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
    13d6:	0f b6 c0             	movzbl %al,%eax
    13d9:	39 c2                	cmp    %eax,%edx
    13db:	75 1c                	jne    13f9 <inst_print+0x72>
    13dd:	8b 45 f4             	mov    -0xc(%rbp),%eax
    13e0:	48 98                	cltq   
    13e2:	48 c1 e0 04          	shl    $0x4,%rax
    13e6:	48 89 c2             	mov    %rax,%rdx
    13e9:	48 8d 05 10 7d 00 00 	lea    0x7d10(%rip),%rax        # 9100 <opcode_map>
    13f0:	48 01 d0             	add    %rdx,%rax
    13f3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    13f7:	eb 0a                	jmp    1403 <inst_print+0x7c>
    13f9:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    13fd:	83 7d f4 07          	cmpl   $0x7,-0xc(%rbp)
    1401:	7e b2                	jle    13b5 <inst_print+0x2e>
    1403:	48 8d 3d 71 4c 00 00 	lea    0x4c71(%rip),%rdi        # 607b <_IO_stdin_used+0x7b>
    140a:	b8 00 00 00 00       	mov    $0x0,%eax
    140f:	e8 7c fc ff ff       	callq  1090 <printf@plt>
    1414:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    1419:	75 16                	jne    1431 <inst_print+0xaa>
    141b:	48 8d 3d 5c 4c 00 00 	lea    0x4c5c(%rip),%rdi        # 607e <_IO_stdin_used+0x7e>
    1422:	b8 00 00 00 00       	mov    $0x0,%eax
    1427:	e8 64 fc ff ff       	callq  1090 <printf@plt>
    142c:	e9 21 01 00 00       	jmpq   1552 <inst_print+0x1cb>
    1431:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1435:	48 8b 00             	mov    (%rax),%rax
    1438:	48 89 c6             	mov    %rax,%rsi
    143b:	48 8d 3d 40 4c 00 00 	lea    0x4c40(%rip),%rdi        # 6082 <_IO_stdin_used+0x82>
    1442:	b8 00 00 00 00       	mov    $0x0,%eax
    1447:	e8 44 fc ff ff       	callq  1090 <printf@plt>
    144c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1450:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    1454:	0f b6 c0             	movzbl %al,%eax
    1457:	83 e0 01             	and    $0x1,%eax
    145a:	85 c0                	test   %eax,%eax
    145c:	0f 84 ef 00 00 00    	je     1551 <inst_print+0x1ca>
    1462:	48 8d 3d 12 4c 00 00 	lea    0x4c12(%rip),%rdi        # 607b <_IO_stdin_used+0x7b>
    1469:	b8 00 00 00 00       	mov    $0x0,%eax
    146e:	e8 1d fc ff ff       	callq  1090 <printf@plt>
    1473:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
    1477:	c0 e8 04             	shr    $0x4,%al
    147a:	0f b6 c0             	movzbl %al,%eax
    147d:	89 c7                	mov    %eax,%edi
    147f:	e8 8f fe ff ff       	callq  1313 <_print_reg>
    1484:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1488:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    148c:	0f b6 c0             	movzbl %al,%eax
    148f:	83 e0 02             	and    $0x2,%eax
    1492:	85 c0                	test   %eax,%eax
    1494:	0f 84 89 00 00 00    	je     1523 <inst_print+0x19c>
    149a:	48 8d 3d da 4b 00 00 	lea    0x4bda(%rip),%rdi        # 607b <_IO_stdin_used+0x7b>
    14a1:	b8 00 00 00 00       	mov    $0x0,%eax
    14a6:	e8 e5 fb ff ff       	callq  1090 <printf@plt>
    14ab:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    14af:	83 e0 0f             	and    $0xf,%eax
    14b2:	0f b6 c0             	movzbl %al,%eax
    14b5:	89 c7                	mov    %eax,%edi
    14b7:	e8 57 fe ff ff       	callq  1313 <_print_reg>
    14bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14c0:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    14c4:	0f b6 c0             	movzbl %al,%eax
    14c7:	83 e0 04             	and    $0x4,%eax
    14ca:	85 c0                	test   %eax,%eax
    14cc:	74 24                	je     14f2 <inst_print+0x16b>
    14ce:	48 8d 3d a6 4b 00 00 	lea    0x4ba6(%rip),%rdi        # 607b <_IO_stdin_used+0x7b>
    14d5:	b8 00 00 00 00       	mov    $0x0,%eax
    14da:	e8 b1 fb ff ff       	callq  1090 <printf@plt>
    14df:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    14e3:	c0 e8 04             	shr    $0x4,%al
    14e6:	0f b6 c0             	movzbl %al,%eax
    14e9:	89 c7                	mov    %eax,%edi
    14eb:	e8 23 fe ff ff       	callq  1313 <_print_reg>
    14f0:	eb 60                	jmp    1552 <inst_print+0x1cb>
    14f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14f6:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    14fa:	0f b6 c0             	movzbl %al,%eax
    14fd:	83 e0 08             	and    $0x8,%eax
    1500:	85 c0                	test   %eax,%eax
    1502:	74 4e                	je     1552 <inst_print+0x1cb>
    1504:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    1508:	c0 e8 04             	shr    $0x4,%al
    150b:	0f b6 c0             	movzbl %al,%eax
    150e:	89 c6                	mov    %eax,%esi
    1510:	48 8d 3d 6e 4b 00 00 	lea    0x4b6e(%rip),%rdi        # 6085 <_IO_stdin_used+0x85>
    1517:	b8 00 00 00 00       	mov    $0x0,%eax
    151c:	e8 6f fb ff ff       	callq  1090 <printf@plt>
    1521:	eb 2f                	jmp    1552 <inst_print+0x1cb>
    1523:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1527:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    152b:	0f b6 c0             	movzbl %al,%eax
    152e:	83 e0 08             	and    $0x8,%eax
    1531:	85 c0                	test   %eax,%eax
    1533:	74 1c                	je     1551 <inst_print+0x1ca>
    1535:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    1539:	0f b6 c0             	movzbl %al,%eax
    153c:	89 c6                	mov    %eax,%esi
    153e:	48 8d 3d 40 4b 00 00 	lea    0x4b40(%rip),%rdi        # 6085 <_IO_stdin_used+0x85>
    1545:	b8 00 00 00 00       	mov    $0x0,%eax
    154a:	e8 41 fb ff ff       	callq  1090 <printf@plt>
    154f:	eb 01                	jmp    1552 <inst_print+0x1cb>
    1551:	90                   	nop
    1552:	bf 0a 00 00 00       	mov    $0xa,%edi
    1557:	e8 d4 fa ff ff       	callq  1030 <putchar@plt>
    155c:	90                   	nop
    155d:	c9                   	leaveq 
    155e:	c3                   	retq   

000000000000155f <new_arena>:
    155f:	55                   	push   %rbp
    1560:	48 89 e5             	mov    %rsp,%rbp
    1563:	48 83 ec 20          	sub    $0x20,%rsp
    1567:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    156b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    156f:	48 89 c7             	mov    %rax,%rdi
    1572:	e8 c9 fb ff ff       	callq  1140 <malloc@plt>
    1577:	48 89 c1             	mov    %rax,%rcx
    157a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    157e:	48 89 c2             	mov    %rax,%rdx
    1581:	be 00 00 00 00       	mov    $0x0,%esi
    1586:	48 89 cf             	mov    %rcx,%rdi
    1589:	e8 32 fb ff ff       	callq  10c0 <memset@plt>
    158e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1592:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1596:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    159a:	48 89 50 08          	mov    %rdx,0x8(%rax)
    159e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15a2:	c9                   	leaveq 
    15a3:	c3                   	retq   

00000000000015a4 <arena_alloc>:
    15a4:	55                   	push   %rbp
    15a5:	48 89 e5             	mov    %rsp,%rbp
    15a8:	48 83 ec 20          	sub    $0x20,%rsp
    15ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    15b0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    15b4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    15bb:	00 
    15bc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    15c1:	75 7e                	jne    1641 <arena_alloc+0x9d>
    15c3:	48 8d 0d c6 4f 00 00 	lea    0x4fc6(%rip),%rcx        # 6590 <__PRETTY_FUNCTION__.4371>
    15ca:	ba 17 00 00 00       	mov    $0x17,%edx
    15cf:	48 8d 35 b4 4a 00 00 	lea    0x4ab4(%rip),%rsi        # 608a <_IO_stdin_used+0x8a>
    15d6:	48 8d 3d b5 4a 00 00 	lea    0x4ab5(%rip),%rdi        # 6092 <_IO_stdin_used+0x92>
    15dd:	e8 ce fa ff ff       	callq  10b0 <__assert_fail@plt>
    15e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    15e6:	48 8b 50 08          	mov    0x8(%rax),%rdx
    15ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    15ee:	48 8b 40 10          	mov    0x10(%rax),%rax
    15f2:	48 29 c2             	sub    %rax,%rdx
    15f5:	48 89 d0             	mov    %rdx,%rax
    15f8:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    15fc:	77 30                	ja     162e <arena_alloc+0x8a>
    15fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1602:	48 8b 50 10          	mov    0x10(%rax),%rdx
    1606:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    160a:	48 01 c2             	add    %rax,%rdx
    160d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1611:	48 89 50 10          	mov    %rdx,0x10(%rax)
    1615:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1619:	48 8d 50 18          	lea    0x18(%rax),%rdx
    161d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1621:	48 8b 40 10          	mov    0x10(%rax),%rax
    1625:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
    1629:	48 01 d0             	add    %rdx,%rax
    162c:	eb 69                	jmp    1697 <arena_alloc+0xf3>
    162e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1632:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1636:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    163a:	48 8b 00             	mov    (%rax),%rax
    163d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1641:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    1646:	75 9a                	jne    15e2 <arena_alloc+0x3e>
    1648:	b8 00 04 00 00       	mov    $0x400,%eax
    164d:	48 81 7d e0 00 04 00 	cmpq   $0x400,-0x20(%rbp)
    1654:	00 
    1655:	48 0f 43 45 e0       	cmovae -0x20(%rbp),%rax
    165a:	48 89 c7             	mov    %rax,%rdi
    165d:	e8 fd fe ff ff       	callq  155f <new_arena>
    1662:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1666:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    166b:	74 0b                	je     1678 <arena_alloc+0xd4>
    166d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1671:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1675:	48 89 10             	mov    %rdx,(%rax)
    1678:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    167c:	48 8b 50 10          	mov    0x10(%rax),%rdx
    1680:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1684:	48 01 c2             	add    %rax,%rdx
    1687:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    168b:	48 89 50 10          	mov    %rdx,0x10(%rax)
    168f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1693:	48 83 c0 18          	add    $0x18,%rax
    1697:	c9                   	leaveq 
    1698:	c3                   	retq   

0000000000001699 <arena_write>:
    1699:	55                   	push   %rbp
    169a:	48 89 e5             	mov    %rsp,%rbp
    169d:	48 83 ec 10          	sub    $0x10,%rsp
    16a1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    16a5:	89 75 f4             	mov    %esi,-0xc(%rbp)
    16a8:	e9 ac 00 00 00       	jmpq   1759 <arena_write+0xc0>
    16ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16b1:	48 8b 50 10          	mov    0x10(%rax),%rdx
    16b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16b9:	48 8d 48 18          	lea    0x18(%rax),%rcx
    16bd:	8b 45 f4             	mov    -0xc(%rbp),%eax
    16c0:	48 89 ce             	mov    %rcx,%rsi
    16c3:	89 c7                	mov    %eax,%edi
    16c5:	e8 96 f9 ff ff       	callq  1060 <write@plt>
    16ca:	48 89 c2             	mov    %rax,%rdx
    16cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16d1:	48 8b 40 10          	mov    0x10(%rax),%rax
    16d5:	48 39 c2             	cmp    %rax,%rdx
    16d8:	74 74                	je     174e <arena_write+0xb5>
    16da:	48 8b 05 9f 7b 00 00 	mov    0x7b9f(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    16e1:	48 89 c7             	mov    %rax,%rdi
    16e4:	e8 67 fa ff ff       	callq  1150 <fflush@plt>
    16e9:	48 8b 05 b0 7b 00 00 	mov    0x7bb0(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    16f0:	b9 2d 00 00 00       	mov    $0x2d,%ecx
    16f5:	48 8d 15 a4 4e 00 00 	lea    0x4ea4(%rip),%rdx        # 65a0 <__func__.4379>
    16fc:	48 8d 35 95 49 00 00 	lea    0x4995(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    1703:	48 89 c7             	mov    %rax,%rdi
    1706:	b8 00 00 00 00       	mov    $0x0,%eax
    170b:	e8 00 fa ff ff       	callq  1110 <fprintf@plt>
    1710:	48 8b 05 89 7b 00 00 	mov    0x7b89(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1717:	48 89 c1             	mov    %rax,%rcx
    171a:	ba 0f 00 00 00       	mov    $0xf,%edx
    171f:	be 01 00 00 00       	mov    $0x1,%esi
    1724:	48 8d 3d 75 49 00 00 	lea    0x4975(%rip),%rdi        # 60a0 <_IO_stdin_used+0xa0>
    172b:	e8 70 fa ff ff       	callq  11a0 <fwrite@plt>
    1730:	48 8b 05 69 7b 00 00 	mov    0x7b69(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1737:	48 89 c6             	mov    %rax,%rsi
    173a:	bf 0a 00 00 00       	mov    $0xa,%edi
    173f:	e8 9c f9 ff ff       	callq  10e0 <fputc@plt>
    1744:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    1749:	e8 42 fa ff ff       	callq  1190 <exit@plt>
    174e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1752:	48 8b 00             	mov    (%rax),%rax
    1755:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1759:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    175e:	0f 85 49 ff ff ff    	jne    16ad <arena_write+0x14>
    1764:	90                   	nop
    1765:	c9                   	leaveq 
    1766:	c3                   	retq   

0000000000001767 <arena_size>:
    1767:	55                   	push   %rbp
    1768:	48 89 e5             	mov    %rsp,%rbp
    176b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    176f:	66 c7 45 fe 00 00    	movw   $0x0,-0x2(%rbp)
    1775:	eb 17                	jmp    178e <arena_size+0x27>
    1777:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    177b:	48 8b 40 10          	mov    0x10(%rax),%rax
    177f:	66 01 45 fe          	add    %ax,-0x2(%rbp)
    1783:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1787:	48 8b 00             	mov    (%rax),%rax
    178a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    178e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    1793:	75 e2                	jne    1777 <arena_size+0x10>
    1795:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    1799:	5d                   	pop    %rbp
    179a:	c3                   	retq   

000000000000179b <arena_at>:
    179b:	55                   	push   %rbp
    179c:	48 89 e5             	mov    %rsp,%rbp
    179f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    17a7:	eb 36                	jmp    17df <arena_at+0x44>
    17a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17ad:	48 8b 40 10          	mov    0x10(%rax),%rax
    17b1:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
    17b5:	73 11                	jae    17c8 <arena_at+0x2d>
    17b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17bb:	48 8d 50 18          	lea    0x18(%rax),%rdx
    17bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    17c3:	48 01 d0             	add    %rdx,%rax
    17c6:	eb 23                	jmp    17eb <arena_at+0x50>
    17c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17cc:	48 8b 40 10          	mov    0x10(%rax),%rax
    17d0:	48 29 45 f0          	sub    %rax,-0x10(%rbp)
    17d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17d8:	48 8b 00             	mov    (%rax),%rax
    17db:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    17df:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    17e4:	75 c3                	jne    17a9 <arena_at+0xe>
    17e6:	b8 00 00 00 00       	mov    $0x0,%eax
    17eb:	5d                   	pop    %rbp
    17ec:	c3                   	retq   

00000000000017ed <arena_offsetof>:
    17ed:	55                   	push   %rbp
    17ee:	48 89 e5             	mov    %rsp,%rbp
    17f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    17f5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    17f9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1800:	eb 5c                	jmp    185e <arena_offsetof+0x71>
    1802:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1806:	48 83 c0 18          	add    $0x18,%rax
    180a:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    180e:	72 31                	jb     1841 <arena_offsetof+0x54>
    1810:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1814:	48 8d 50 18          	lea    0x18(%rax),%rdx
    1818:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    181c:	48 8b 40 10          	mov    0x10(%rax),%rax
    1820:	48 01 d0             	add    %rdx,%rax
    1823:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    1827:	73 18                	jae    1841 <arena_offsetof+0x54>
    1829:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    182d:	48 8d 50 18          	lea    0x18(%rax),%rdx
    1831:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1835:	48 29 d0             	sub    %rdx,%rax
    1838:	89 c2                	mov    %eax,%edx
    183a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    183d:	01 d0                	add    %edx,%eax
    183f:	eb 29                	jmp    186a <arena_offsetof+0x7d>
    1841:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1845:	48 8b 40 10          	mov    0x10(%rax),%rax
    1849:	89 c2                	mov    %eax,%edx
    184b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    184e:	01 d0                	add    %edx,%eax
    1850:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1853:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1857:	48 8b 00             	mov    (%rax),%rax
    185a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    185e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    1863:	75 9d                	jne    1802 <arena_offsetof+0x15>
    1865:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    186a:	5d                   	pop    %rbp
    186b:	c3                   	retq   

000000000000186c <crc16>:
    186c:	55                   	push   %rbp
    186d:	48 89 e5             	mov    %rsp,%rbp
    1870:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1874:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1878:	89 d0                	mov    %edx,%eax
    187a:	66 89 45 dc          	mov    %ax,-0x24(%rbp)
    187e:	0f b7 45 dc          	movzwl -0x24(%rbp),%eax
    1882:	f7 d0                	not    %eax
    1884:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    1888:	eb 47                	jmp    18d1 <crc16+0x65>
    188a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    188e:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1892:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1896:	0f b6 00             	movzbl (%rax),%eax
    1899:	0f b6 c0             	movzbl %al,%eax
    189c:	66 31 45 fe          	xor    %ax,-0x2(%rbp)
    18a0:	c6 45 fd 00          	movb   $0x0,-0x3(%rbp)
    18a4:	eb 25                	jmp    18cb <crc16+0x5f>
    18a6:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    18aa:	66 d1 e8             	shr    %ax
    18ad:	89 c2                	mov    %eax,%edx
    18af:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    18b3:	83 e0 01             	and    $0x1,%eax
    18b6:	66 69 c0 b8 ed       	imul   $0xedb8,%ax,%ax
    18bb:	31 d0                	xor    %edx,%eax
    18bd:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    18c1:	0f b6 45 fd          	movzbl -0x3(%rbp),%eax
    18c5:	83 c0 01             	add    $0x1,%eax
    18c8:	88 45 fd             	mov    %al,-0x3(%rbp)
    18cb:	80 7d fd 07          	cmpb   $0x7,-0x3(%rbp)
    18cf:	76 d5                	jbe    18a6 <crc16+0x3a>
    18d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    18d5:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
    18d9:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    18dd:	48 85 c0             	test   %rax,%rax
    18e0:	75 a8                	jne    188a <crc16+0x1e>
    18e2:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    18e6:	f7 d0                	not    %eax
    18e8:	5d                   	pop    %rbp
    18e9:	c3                   	retq   

00000000000018ea <strtab_find>:
    18ea:	55                   	push   %rbp
    18eb:	48 89 e5             	mov    %rsp,%rbp
    18ee:	48 83 ec 30          	sub    $0x30,%rsp
    18f2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    18f6:	89 f0                	mov    %esi,%eax
    18f8:	66 89 45 d4          	mov    %ax,-0x2c(%rbp)
    18fc:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    1903:	00 
    1904:	48 8b 05 a5 79 00 00 	mov    0x79a5(%rip),%rax        # 92b0 <strtab_arena>
    190b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    190f:	e9 81 00 00 00       	jmpq   1995 <strtab_find+0xab>
    1914:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1918:	48 83 c0 18          	add    $0x18,%rax
    191c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1920:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1924:	48 8d 50 18          	lea    0x18(%rax),%rdx
    1928:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    192c:	48 8b 40 10          	mov    0x10(%rax),%rax
    1930:	48 01 d0             	add    %rdx,%rax
    1933:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1937:	eb 47                	jmp    1980 <strtab_find+0x96>
    1939:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    193d:	48 89 c7             	mov    %rax,%rdi
    1940:	e8 2b f7 ff ff       	callq  1070 <strlen@plt>
    1945:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1949:	0f b7 45 d4          	movzwl -0x2c(%rbp),%eax
    194d:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
    1951:	75 21                	jne    1974 <strtab_find+0x8a>
    1953:	0f b7 55 d4          	movzwl -0x2c(%rbp),%edx
    1957:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    195b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    195f:	48 89 ce             	mov    %rcx,%rsi
    1962:	48 89 c7             	mov    %rax,%rdi
    1965:	e8 96 f7 ff ff       	callq  1100 <memcmp@plt>
    196a:	85 c0                	test   %eax,%eax
    196c:	75 06                	jne    1974 <strtab_find+0x8a>
    196e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1972:	eb 31                	jmp    19a5 <strtab_find+0xbb>
    1974:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1978:	48 83 c0 01          	add    $0x1,%rax
    197c:	48 01 45 f0          	add    %rax,-0x10(%rbp)
    1980:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1984:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    1988:	72 af                	jb     1939 <strtab_find+0x4f>
    198a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    198e:	48 8b 00             	mov    (%rax),%rax
    1991:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1995:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    199a:	0f 85 74 ff ff ff    	jne    1914 <strtab_find+0x2a>
    19a0:	b8 00 00 00 00       	mov    $0x0,%eax
    19a5:	c9                   	leaveq 
    19a6:	c3                   	retq   

00000000000019a7 <strtab_alloc>:
    19a7:	55                   	push   %rbp
    19a8:	48 89 e5             	mov    %rsp,%rbp
    19ab:	48 83 ec 20          	sub    $0x20,%rsp
    19af:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    19b3:	89 f0                	mov    %esi,%eax
    19b5:	66 89 45 e4          	mov    %ax,-0x1c(%rbp)
    19b9:	48 8b 05 f0 78 00 00 	mov    0x78f0(%rip),%rax        # 92b0 <strtab_arena>
    19c0:	48 85 c0             	test   %rax,%rax
    19c3:	75 11                	jne    19d6 <strtab_alloc+0x2f>
    19c5:	bf 05 00 00 00       	mov    $0x5,%edi
    19ca:	e8 90 fb ff ff       	callq  155f <new_arena>
    19cf:	48 89 05 da 78 00 00 	mov    %rax,0x78da(%rip)        # 92b0 <strtab_arena>
    19d6:	0f b7 45 e4          	movzwl -0x1c(%rbp),%eax
    19da:	83 c0 01             	add    $0x1,%eax
    19dd:	48 63 d0             	movslq %eax,%rdx
    19e0:	48 8b 05 c9 78 00 00 	mov    0x78c9(%rip),%rax        # 92b0 <strtab_arena>
    19e7:	48 89 d6             	mov    %rdx,%rsi
    19ea:	48 89 c7             	mov    %rax,%rdi
    19ed:	e8 b2 fb ff ff       	callq  15a4 <arena_alloc>
    19f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    19f6:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    19fb:	75 1f                	jne    1a1c <strtab_alloc+0x75>
    19fd:	48 8d 0d ac 4b 00 00 	lea    0x4bac(%rip),%rcx        # 65b0 <__PRETTY_FUNCTION__.4442>
    1a04:	ba 4a 00 00 00       	mov    $0x4a,%edx
    1a09:	48 8d 35 a0 46 00 00 	lea    0x46a0(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    1a10:	48 8d 3d 9e 46 00 00 	lea    0x469e(%rip),%rdi        # 60b5 <_IO_stdin_used+0xb5>
    1a17:	e8 94 f6 ff ff       	callq  10b0 <__assert_fail@plt>
    1a1c:	0f b7 55 e4          	movzwl -0x1c(%rbp),%edx
    1a20:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1a24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a28:	48 89 ce             	mov    %rcx,%rsi
    1a2b:	48 89 c7             	mov    %rax,%rdi
    1a2e:	e8 fd f6 ff ff       	callq  1130 <memcpy@plt>
    1a33:	0f b7 55 e4          	movzwl -0x1c(%rbp),%edx
    1a37:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a3b:	48 01 d0             	add    %rdx,%rax
    1a3e:	c6 00 00             	movb   $0x0,(%rax)
    1a41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a45:	48 89 c2             	mov    %rax,%rdx
    1a48:	48 8d 35 71 4b 00 00 	lea    0x4b71(%rip),%rsi        # 65c0 <__func__.4443>
    1a4f:	48 8d 3d 63 46 00 00 	lea    0x4663(%rip),%rdi        # 60b9 <_IO_stdin_used+0xb9>
    1a56:	b8 00 00 00 00       	mov    $0x0,%eax
    1a5b:	e8 30 f6 ff ff       	callq  1090 <printf@plt>
    1a60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a64:	c9                   	leaveq 
    1a65:	c3                   	retq   

0000000000001a66 <sym_find>:
    1a66:	55                   	push   %rbp
    1a67:	48 89 e5             	mov    %rsp,%rbp
    1a6a:	48 83 ec 40          	sub    $0x40,%rsp
    1a6e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    1a72:	89 f0                	mov    %esi,%eax
    1a74:	66 89 45 c4          	mov    %ax,-0x3c(%rbp)
    1a78:	48 8b 05 39 78 00 00 	mov    0x7839(%rip),%rax        # 92b8 <symtab_arena>
    1a7f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1a83:	e9 98 00 00 00       	jmpq   1b20 <sym_find+0xba>
    1a88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1a8c:	48 83 c0 18          	add    $0x18,%rax
    1a90:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1a94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1a98:	48 8d 50 18          	lea    0x18(%rax),%rdx
    1a9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1aa0:	48 8b 40 10          	mov    0x10(%rax),%rax
    1aa4:	48 01 d0             	add    %rdx,%rax
    1aa7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1aab:	eb 5e                	jmp    1b0b <sym_find+0xa5>
    1aad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ab1:	0f b7 00             	movzwl (%rax),%eax
    1ab4:	0f b7 d0             	movzwl %ax,%edx
    1ab7:	48 8b 05 f2 77 00 00 	mov    0x77f2(%rip),%rax        # 92b0 <strtab_arena>
    1abe:	48 89 d6             	mov    %rdx,%rsi
    1ac1:	48 89 c7             	mov    %rax,%rdi
    1ac4:	e8 d2 fc ff ff       	callq  179b <arena_at>
    1ac9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1acd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1ad1:	48 89 c7             	mov    %rax,%rdi
    1ad4:	e8 97 f5 ff ff       	callq  1070 <strlen@plt>
    1ad9:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1adc:	0f b7 45 c4          	movzwl -0x3c(%rbp),%eax
    1ae0:	39 45 dc             	cmp    %eax,-0x24(%rbp)
    1ae3:	75 21                	jne    1b06 <sym_find+0xa0>
    1ae5:	0f b7 55 c4          	movzwl -0x3c(%rbp),%edx
    1ae9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1aed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1af1:	48 89 ce             	mov    %rcx,%rsi
    1af4:	48 89 c7             	mov    %rax,%rdi
    1af7:	e8 04 f6 ff ff       	callq  1100 <memcmp@plt>
    1afc:	85 c0                	test   %eax,%eax
    1afe:	75 06                	jne    1b06 <sym_find+0xa0>
    1b00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b04:	eb 2a                	jmp    1b30 <sym_find+0xca>
    1b06:	48 83 45 f8 06       	addq   $0x6,-0x8(%rbp)
    1b0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b0f:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    1b13:	72 98                	jb     1aad <sym_find+0x47>
    1b15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1b19:	48 8b 00             	mov    (%rax),%rax
    1b1c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1b20:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    1b25:	0f 85 5d ff ff ff    	jne    1a88 <sym_find+0x22>
    1b2b:	b8 00 00 00 00       	mov    $0x0,%eax
    1b30:	c9                   	leaveq 
    1b31:	c3                   	retq   

0000000000001b32 <sym_alloc>:
    1b32:	55                   	push   %rbp
    1b33:	48 89 e5             	mov    %rsp,%rbp
    1b36:	48 83 ec 20          	sub    $0x20,%rsp
    1b3a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1b3e:	89 f1                	mov    %esi,%ecx
    1b40:	89 d0                	mov    %edx,%eax
    1b42:	89 ca                	mov    %ecx,%edx
    1b44:	66 89 55 e4          	mov    %dx,-0x1c(%rbp)
    1b48:	66 89 45 e0          	mov    %ax,-0x20(%rbp)
    1b4c:	48 8b 05 65 77 00 00 	mov    0x7765(%rip),%rax        # 92b8 <symtab_arena>
    1b53:	48 85 c0             	test   %rax,%rax
    1b56:	75 11                	jne    1b69 <sym_alloc+0x37>
    1b58:	bf 00 04 00 00       	mov    $0x400,%edi
    1b5d:	e8 fd f9 ff ff       	callq  155f <new_arena>
    1b62:	48 89 05 4f 77 00 00 	mov    %rax,0x774f(%rip)        # 92b8 <symtab_arena>
    1b69:	48 8b 05 48 77 00 00 	mov    0x7748(%rip),%rax        # 92b8 <symtab_arena>
    1b70:	be 06 00 00 00       	mov    $0x6,%esi
    1b75:	48 89 c7             	mov    %rax,%rdi
    1b78:	e8 27 fa ff ff       	callq  15a4 <arena_alloc>
    1b7d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1b81:	0f b7 55 e4          	movzwl -0x1c(%rbp),%edx
    1b85:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1b89:	89 d6                	mov    %edx,%esi
    1b8b:	48 89 c7             	mov    %rax,%rdi
    1b8e:	e8 14 fe ff ff       	callq  19a7 <strtab_alloc>
    1b93:	48 89 c2             	mov    %rax,%rdx
    1b96:	48 8b 05 13 77 00 00 	mov    0x7713(%rip),%rax        # 92b0 <strtab_arena>
    1b9d:	48 89 d6             	mov    %rdx,%rsi
    1ba0:	48 89 c7             	mov    %rax,%rdi
    1ba3:	e8 45 fc ff ff       	callq  17ed <arena_offsetof>
    1ba8:	89 c2                	mov    %eax,%edx
    1baa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1bae:	66 89 10             	mov    %dx,(%rax)
    1bb1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1bb5:	0f b7 55 e0          	movzwl -0x20(%rbp),%edx
    1bb9:	66 89 50 02          	mov    %dx,0x2(%rax)
    1bbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1bc1:	c9                   	leaveq 
    1bc2:	c3                   	retq   

0000000000001bc3 <sym_get>:
    1bc3:	55                   	push   %rbp
    1bc4:	48 89 e5             	mov    %rsp,%rbp
    1bc7:	48 83 ec 20          	sub    $0x20,%rsp
    1bcb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1bcf:	89 f0                	mov    %esi,%eax
    1bd1:	66 89 45 e4          	mov    %ax,-0x1c(%rbp)
    1bd5:	0f b7 55 e4          	movzwl -0x1c(%rbp),%edx
    1bd9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1bdd:	89 d6                	mov    %edx,%esi
    1bdf:	48 89 c7             	mov    %rax,%rdi
    1be2:	e8 7f fe ff ff       	callq  1a66 <sym_find>
    1be7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1beb:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    1bf0:	75 1b                	jne    1c0d <sym_get+0x4a>
    1bf2:	0f b7 4d e4          	movzwl -0x1c(%rbp),%ecx
    1bf6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1bfa:	ba 00 00 00 00       	mov    $0x0,%edx
    1bff:	89 ce                	mov    %ecx,%esi
    1c01:	48 89 c7             	mov    %rax,%rdi
    1c04:	e8 29 ff ff ff       	callq  1b32 <sym_alloc>
    1c09:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1c0d:	0f b7 45 e4          	movzwl -0x1c(%rbp),%eax
    1c11:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1c15:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1c19:	49 89 c8             	mov    %rcx,%r8
    1c1c:	48 89 d1             	mov    %rdx,%rcx
    1c1f:	89 c2                	mov    %eax,%edx
    1c21:	48 8d 35 a8 49 00 00 	lea    0x49a8(%rip),%rsi        # 65d0 <__func__.4470>
    1c28:	48 8d 3d 91 44 00 00 	lea    0x4491(%rip),%rdi        # 60c0 <_IO_stdin_used+0xc0>
    1c2f:	b8 00 00 00 00       	mov    $0x0,%eax
    1c34:	e8 57 f4 ff ff       	callq  1090 <printf@plt>
    1c39:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c3d:	c9                   	leaveq 
    1c3e:	c3                   	retq   

0000000000001c3f <reg>:
    1c3f:	55                   	push   %rbp
    1c40:	48 89 e5             	mov    %rsp,%rbp
    1c43:	48 83 ec 10          	sub    $0x10,%rsp
    1c47:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1c4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c4f:	48 83 c0 01          	add    $0x1,%rax
    1c53:	0f b6 00             	movzbl (%rax),%eax
    1c56:	0f be d0             	movsbl %al,%edx
    1c59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c5d:	0f b6 00             	movzbl (%rax),%eax
    1c60:	0f be c0             	movsbl %al,%eax
    1c63:	89 c6                	mov    %eax,%esi
    1c65:	48 8d 3d 63 44 00 00 	lea    0x4463(%rip),%rdi        # 60cf <_IO_stdin_used+0xcf>
    1c6c:	b8 00 00 00 00       	mov    $0x0,%eax
    1c71:	e8 1a f4 ff ff       	callq  1090 <printf@plt>
    1c76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c7a:	0f b6 00             	movzbl (%rax),%eax
    1c7d:	3c 72                	cmp    $0x72,%al
    1c7f:	75 2d                	jne    1cae <reg+0x6f>
    1c81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c85:	48 83 c0 01          	add    $0x1,%rax
    1c89:	0f b6 00             	movzbl (%rax),%eax
    1c8c:	3c 30                	cmp    $0x30,%al
    1c8e:	7e 1e                	jle    1cae <reg+0x6f>
    1c90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c94:	48 83 c0 01          	add    $0x1,%rax
    1c98:	0f b6 00             	movzbl (%rax),%eax
    1c9b:	3c 38                	cmp    $0x38,%al
    1c9d:	7f 0f                	jg     1cae <reg+0x6f>
    1c9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ca3:	48 83 c0 01          	add    $0x1,%rax
    1ca7:	0f b6 00             	movzbl (%rax),%eax
    1caa:	66 98                	cbtw   
    1cac:	eb 74                	jmp    1d22 <reg+0xe3>
    1cae:	48 8b 05 cb 75 00 00 	mov    0x75cb(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    1cb5:	48 89 c7             	mov    %rax,%rdi
    1cb8:	e8 93 f4 ff ff       	callq  1150 <fflush@plt>
    1cbd:	48 8b 05 dc 75 00 00 	mov    0x75dc(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1cc4:	b9 c2 00 00 00       	mov    $0xc2,%ecx
    1cc9:	48 8d 15 08 49 00 00 	lea    0x4908(%rip),%rdx        # 65d8 <__func__.4475>
    1cd0:	48 8d 35 c1 43 00 00 	lea    0x43c1(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    1cd7:	48 89 c7             	mov    %rax,%rdi
    1cda:	b8 00 00 00 00       	mov    $0x0,%eax
    1cdf:	e8 2c f4 ff ff       	callq  1110 <fprintf@plt>
    1ce4:	48 8b 05 b5 75 00 00 	mov    0x75b5(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1ceb:	48 89 c1             	mov    %rax,%rcx
    1cee:	ba 10 00 00 00       	mov    $0x10,%edx
    1cf3:	be 01 00 00 00       	mov    $0x1,%esi
    1cf8:	48 8d 3d df 43 00 00 	lea    0x43df(%rip),%rdi        # 60de <_IO_stdin_used+0xde>
    1cff:	e8 9c f4 ff ff       	callq  11a0 <fwrite@plt>
    1d04:	48 8b 05 95 75 00 00 	mov    0x7595(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1d0b:	48 89 c6             	mov    %rax,%rsi
    1d0e:	bf 0a 00 00 00       	mov    $0xa,%edi
    1d13:	e8 c8 f3 ff ff       	callq  10e0 <fputc@plt>
    1d18:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    1d1d:	e8 6e f4 ff ff       	callq  1190 <exit@plt>
    1d22:	c9                   	leaveq 
    1d23:	c3                   	retq   

0000000000001d24 <gettok>:
    1d24:	55                   	push   %rbp
    1d25:	48 89 e5             	mov    %rsp,%rbp
    1d28:	48 83 ec 30          	sub    $0x30,%rsp
    1d2c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1d30:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1d34:	89 d0                	mov    %edx,%eax
    1d36:	88 45 dc             	mov    %al,-0x24(%rbp)
    1d39:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1d40:	00 
    1d41:	eb 21                	jmp    1d64 <gettok+0x40>
    1d43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d47:	48 8b 00             	mov    (%rax),%rax
    1d4a:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1d4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d52:	48 89 10             	mov    %rdx,(%rax)
    1d55:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d59:	8b 00                	mov    (%rax),%eax
    1d5b:	8d 50 ff             	lea    -0x1(%rax),%edx
    1d5e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d62:	89 10                	mov    %edx,(%rax)
    1d64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1d68:	8b 00                	mov    (%rax),%eax
    1d6a:	85 c0                	test   %eax,%eax
    1d6c:	7e 2b                	jle    1d99 <gettok+0x75>
    1d6e:	e8 3d f4 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    1d73:	48 8b 10             	mov    (%rax),%rdx
    1d76:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d7a:	48 8b 00             	mov    (%rax),%rax
    1d7d:	0f b6 00             	movzbl (%rax),%eax
    1d80:	48 0f be c0          	movsbq %al,%rax
    1d84:	48 01 c0             	add    %rax,%rax
    1d87:	48 01 d0             	add    %rdx,%rax
    1d8a:	0f b7 00             	movzwl (%rax),%eax
    1d8d:	0f b7 c0             	movzwl %ax,%eax
    1d90:	25 00 20 00 00       	and    $0x2000,%eax
    1d95:	85 c0                	test   %eax,%eax
    1d97:	75 aa                	jne    1d43 <gettok+0x1f>
    1d99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1d9d:	48 8b 00             	mov    (%rax),%rax
    1da0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1da4:	eb 21                	jmp    1dc7 <gettok+0xa3>
    1da6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1daa:	48 8b 00             	mov    (%rax),%rax
    1dad:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1db1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1db5:	48 89 10             	mov    %rdx,(%rax)
    1db8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1dbc:	8b 00                	mov    (%rax),%eax
    1dbe:	8d 50 ff             	lea    -0x1(%rax),%edx
    1dc1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1dc5:	89 10                	mov    %edx,(%rax)
    1dc7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1dcb:	8b 00                	mov    (%rax),%eax
    1dcd:	85 c0                	test   %eax,%eax
    1dcf:	7e 3a                	jle    1e0b <gettok+0xe7>
    1dd1:	e8 da f3 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    1dd6:	48 8b 10             	mov    (%rax),%rdx
    1dd9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1ddd:	48 8b 00             	mov    (%rax),%rax
    1de0:	0f b6 00             	movzbl (%rax),%eax
    1de3:	48 0f be c0          	movsbq %al,%rax
    1de7:	48 01 c0             	add    %rax,%rax
    1dea:	48 01 d0             	add    %rdx,%rax
    1ded:	0f b7 00             	movzwl (%rax),%eax
    1df0:	0f b7 c0             	movzwl %ax,%eax
    1df3:	25 00 20 00 00       	and    $0x2000,%eax
    1df8:	85 c0                	test   %eax,%eax
    1dfa:	75 0f                	jne    1e0b <gettok+0xe7>
    1dfc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1e00:	48 8b 00             	mov    (%rax),%rax
    1e03:	0f b6 00             	movzbl (%rax),%eax
    1e06:	38 45 dc             	cmp    %al,-0x24(%rbp)
    1e09:	75 9b                	jne    1da6 <gettok+0x82>
    1e0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e0f:	c9                   	leaveq 
    1e10:	c3                   	retq   

0000000000001e11 <parse_reg>:
    1e11:	55                   	push   %rbp
    1e12:	48 89 e5             	mov    %rsp,%rbp
    1e15:	48 83 ec 10          	sub    $0x10,%rsp
    1e19:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1e1d:	89 75 f4             	mov    %esi,-0xc(%rbp)
    1e20:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
    1e24:	0f 85 a5 00 00 00    	jne    1ecf <parse_reg+0xbe>
    1e2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e2e:	0f b6 00             	movzbl (%rax),%eax
    1e31:	3c 72                	cmp    $0x72,%al
    1e33:	75 31                	jne    1e66 <parse_reg+0x55>
    1e35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e39:	48 83 c0 01          	add    $0x1,%rax
    1e3d:	0f b6 00             	movzbl (%rax),%eax
    1e40:	3c 2f                	cmp    $0x2f,%al
    1e42:	7e 22                	jle    1e66 <parse_reg+0x55>
    1e44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e48:	48 83 c0 01          	add    $0x1,%rax
    1e4c:	0f b6 00             	movzbl (%rax),%eax
    1e4f:	3c 38                	cmp    $0x38,%al
    1e51:	7f 13                	jg     1e66 <parse_reg+0x55>
    1e53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e57:	48 83 c0 01          	add    $0x1,%rax
    1e5b:	0f b6 00             	movzbl (%rax),%eax
    1e5e:	83 e8 30             	sub    $0x30,%eax
    1e61:	e9 dd 00 00 00       	jmpq   1f43 <parse_reg+0x132>
    1e66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e6a:	0f b6 00             	movzbl (%rax),%eax
    1e6d:	3c 70                	cmp    $0x70,%al
    1e6f:	75 19                	jne    1e8a <parse_reg+0x79>
    1e71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e75:	48 83 c0 01          	add    $0x1,%rax
    1e79:	0f b6 00             	movzbl (%rax),%eax
    1e7c:	3c 63                	cmp    $0x63,%al
    1e7e:	75 0a                	jne    1e8a <parse_reg+0x79>
    1e80:	b8 0f 00 00 00       	mov    $0xf,%eax
    1e85:	e9 b9 00 00 00       	jmpq   1f43 <parse_reg+0x132>
    1e8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e8e:	0f b6 00             	movzbl (%rax),%eax
    1e91:	3c 73                	cmp    $0x73,%al
    1e93:	75 19                	jne    1eae <parse_reg+0x9d>
    1e95:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1e99:	48 83 c0 01          	add    $0x1,%rax
    1e9d:	0f b6 00             	movzbl (%rax),%eax
    1ea0:	3c 70                	cmp    $0x70,%al
    1ea2:	75 0a                	jne    1eae <parse_reg+0x9d>
    1ea4:	b8 0d 00 00 00       	mov    $0xd,%eax
    1ea9:	e9 95 00 00 00       	jmpq   1f43 <parse_reg+0x132>
    1eae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1eb2:	0f b6 00             	movzbl (%rax),%eax
    1eb5:	3c 6c                	cmp    $0x6c,%al
    1eb7:	75 16                	jne    1ecf <parse_reg+0xbe>
    1eb9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ebd:	48 83 c0 01          	add    $0x1,%rax
    1ec1:	0f b6 00             	movzbl (%rax),%eax
    1ec4:	3c 72                	cmp    $0x72,%al
    1ec6:	75 07                	jne    1ecf <parse_reg+0xbe>
    1ec8:	b8 0e 00 00 00       	mov    $0xe,%eax
    1ecd:	eb 74                	jmp    1f43 <parse_reg+0x132>
    1ecf:	48 8b 05 aa 73 00 00 	mov    0x73aa(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    1ed6:	48 89 c7             	mov    %rax,%rdi
    1ed9:	e8 72 f2 ff ff       	callq  1150 <fflush@plt>
    1ede:	48 8b 05 bb 73 00 00 	mov    0x73bb(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1ee5:	b9 14 01 00 00       	mov    $0x114,%ecx
    1eea:	48 8d 15 ef 46 00 00 	lea    0x46ef(%rip),%rdx        # 65e0 <__func__.4492>
    1ef1:	48 8d 35 a0 41 00 00 	lea    0x41a0(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    1ef8:	48 89 c7             	mov    %rax,%rdi
    1efb:	b8 00 00 00 00       	mov    $0x0,%eax
    1f00:	e8 0b f2 ff ff       	callq  1110 <fprintf@plt>
    1f05:	48 8b 05 94 73 00 00 	mov    0x7394(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1f0c:	48 89 c1             	mov    %rax,%rcx
    1f0f:	ba 10 00 00 00       	mov    $0x10,%edx
    1f14:	be 01 00 00 00       	mov    $0x1,%esi
    1f19:	48 8d 3d be 41 00 00 	lea    0x41be(%rip),%rdi        # 60de <_IO_stdin_used+0xde>
    1f20:	e8 7b f2 ff ff       	callq  11a0 <fwrite@plt>
    1f25:	48 8b 05 74 73 00 00 	mov    0x7374(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    1f2c:	48 89 c6             	mov    %rax,%rsi
    1f2f:	bf 0a 00 00 00       	mov    $0xa,%edi
    1f34:	e8 a7 f1 ff ff       	callq  10e0 <fputc@plt>
    1f39:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    1f3e:	e8 4d f2 ff ff       	callq  1190 <exit@plt>
    1f43:	c9                   	leaveq 
    1f44:	c3                   	retq   

0000000000001f45 <parse_imm>:
    1f45:	55                   	push   %rbp
    1f46:	48 89 e5             	mov    %rsp,%rbp
    1f49:	48 83 ec 20          	sub    $0x20,%rsp
    1f4d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1f51:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    1f54:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
    1f58:	0f 8e a6 00 00 00    	jle    2004 <parse_imm+0xbf>
    1f5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1f62:	0f b6 00             	movzbl (%rax),%eax
    1f65:	3c 30                	cmp    $0x30,%al
    1f67:	0f 85 97 00 00 00    	jne    2004 <parse_imm+0xbf>
    1f6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1f71:	48 83 c0 01          	add    $0x1,%rax
    1f75:	0f b6 00             	movzbl (%rax),%eax
    1f78:	0f be c0             	movsbl %al,%eax
    1f7b:	83 f8 6f             	cmp    $0x6f,%eax
    1f7e:	74 29                	je     1fa9 <parse_imm+0x64>
    1f80:	83 f8 78             	cmp    $0x78,%eax
    1f83:	74 07                	je     1f8c <parse_imm+0x47>
    1f85:	83 f8 62             	cmp    $0x62,%eax
    1f88:	74 3c                	je     1fc6 <parse_imm+0x81>
    1f8a:	eb 57                	jmp    1fe3 <parse_imm+0x9e>
    1f8c:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
    1f90:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1f94:	ba 10 00 00 00       	mov    $0x10,%edx
    1f99:	48 89 ce             	mov    %rcx,%rsi
    1f9c:	48 89 c7             	mov    %rax,%rdi
    1f9f:	e8 7c f1 ff ff       	callq  1120 <strtol@plt>
    1fa4:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1fa7:	eb 56                	jmp    1fff <parse_imm+0xba>
    1fa9:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
    1fad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1fb1:	ba 08 00 00 00       	mov    $0x8,%edx
    1fb6:	48 89 ce             	mov    %rcx,%rsi
    1fb9:	48 89 c7             	mov    %rax,%rdi
    1fbc:	e8 5f f1 ff ff       	callq  1120 <strtol@plt>
    1fc1:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1fc4:	eb 39                	jmp    1fff <parse_imm+0xba>
    1fc6:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
    1fca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1fce:	ba 02 00 00 00       	mov    $0x2,%edx
    1fd3:	48 89 ce             	mov    %rcx,%rsi
    1fd6:	48 89 c7             	mov    %rax,%rdi
    1fd9:	e8 42 f1 ff ff       	callq  1120 <strtol@plt>
    1fde:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1fe1:	eb 1c                	jmp    1fff <parse_imm+0xba>
    1fe3:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
    1fe7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1feb:	ba 02 00 00 00       	mov    $0x2,%edx
    1ff0:	48 89 ce             	mov    %rcx,%rsi
    1ff3:	48 89 c7             	mov    %rax,%rdi
    1ff6:	e8 25 f1 ff ff       	callq  1120 <strtol@plt>
    1ffb:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1ffe:	90                   	nop
    1fff:	e9 21 01 00 00       	jmpq   2125 <parse_imm+0x1e0>
    2004:	e8 a7 f1 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    2009:	48 8b 10             	mov    (%rax),%rdx
    200c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2010:	0f b6 00             	movzbl (%rax),%eax
    2013:	48 0f be c0          	movsbq %al,%rax
    2017:	48 01 c0             	add    %rax,%rax
    201a:	48 01 d0             	add    %rdx,%rax
    201d:	0f b7 00             	movzwl (%rax),%eax
    2020:	0f b7 c0             	movzwl %ax,%eax
    2023:	25 00 04 00 00       	and    $0x400,%eax
    2028:	85 c0                	test   %eax,%eax
    202a:	0f 85 f5 00 00 00    	jne    2125 <parse_imm+0x1e0>
    2030:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2034:	0f b6 00             	movzbl (%rax),%eax
    2037:	3c 40                	cmp    $0x40,%al
    2039:	0f 84 e6 00 00 00    	je     2125 <parse_imm+0x1e0>
    203f:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
    2043:	75 30                	jne    2075 <parse_imm+0x130>
    2045:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2049:	0f b6 00             	movzbl (%rax),%eax
    204c:	3c 27                	cmp    $0x27,%al
    204e:	75 25                	jne    2075 <parse_imm+0x130>
    2050:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2054:	48 83 c0 02          	add    $0x2,%rax
    2058:	0f b6 00             	movzbl (%rax),%eax
    205b:	3c 27                	cmp    $0x27,%al
    205d:	75 16                	jne    2075 <parse_imm+0x130>
    205f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2063:	48 83 c0 01          	add    $0x1,%rax
    2067:	0f b6 00             	movzbl (%rax),%eax
    206a:	0f be c0             	movsbl %al,%eax
    206d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    2070:	e9 b0 00 00 00       	jmpq   2125 <parse_imm+0x1e0>
    2075:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
    2079:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    207d:	ba 0a 00 00 00       	mov    $0xa,%edx
    2082:	48 89 ce             	mov    %rcx,%rsi
    2085:	48 89 c7             	mov    %rax,%rdi
    2088:	e8 93 f0 ff ff       	callq  1120 <strtol@plt>
    208d:	89 45 fc             	mov    %eax,-0x4(%rbp)
    2090:	e8 ab ef ff ff       	callq  1040 <__errno_location@plt>
    2095:	8b 00                	mov    (%rax),%eax
    2097:	85 c0                	test   %eax,%eax
    2099:	75 16                	jne    20b1 <parse_imm+0x16c>
    209b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    209e:	48 63 d0             	movslq %eax,%rdx
    20a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20a5:	48 01 c2             	add    %rax,%rdx
    20a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20ac:	48 39 c2             	cmp    %rax,%rdx
    20af:	74 74                	je     2125 <parse_imm+0x1e0>
    20b1:	48 8b 05 c8 71 00 00 	mov    0x71c8(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    20b8:	48 89 c7             	mov    %rax,%rdi
    20bb:	e8 90 f0 ff ff       	callq  1150 <fflush@plt>
    20c0:	48 8b 05 d9 71 00 00 	mov    0x71d9(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    20c7:	b9 43 01 00 00       	mov    $0x143,%ecx
    20cc:	48 8d 15 1d 45 00 00 	lea    0x451d(%rip),%rdx        # 65f0 <__func__.4504>
    20d3:	48 8d 35 be 3f 00 00 	lea    0x3fbe(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    20da:	48 89 c7             	mov    %rax,%rdi
    20dd:	b8 00 00 00 00       	mov    $0x0,%eax
    20e2:	e8 29 f0 ff ff       	callq  1110 <fprintf@plt>
    20e7:	48 8b 05 b2 71 00 00 	mov    0x71b2(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    20ee:	48 89 c1             	mov    %rax,%rcx
    20f1:	ba 17 00 00 00       	mov    $0x17,%edx
    20f6:	be 01 00 00 00       	mov    $0x1,%esi
    20fb:	48 8d 3d ed 3f 00 00 	lea    0x3fed(%rip),%rdi        # 60ef <_IO_stdin_used+0xef>
    2102:	e8 99 f0 ff ff       	callq  11a0 <fwrite@plt>
    2107:	48 8b 05 92 71 00 00 	mov    0x7192(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    210e:	48 89 c6             	mov    %rax,%rsi
    2111:	bf 0a 00 00 00       	mov    $0xa,%edi
    2116:	e8 c5 ef ff ff       	callq  10e0 <fputc@plt>
    211b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    2120:	e8 6b f0 ff ff       	callq  1190 <exit@plt>
    2125:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2128:	c9                   	leaveq 
    2129:	c3                   	retq   

000000000000212a <emit_word>:
    212a:	55                   	push   %rbp
    212b:	48 89 e5             	mov    %rsp,%rbp
    212e:	48 83 ec 20          	sub    $0x20,%rsp
    2132:	89 f8                	mov    %edi,%eax
    2134:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
    2138:	48 8b 05 89 71 00 00 	mov    0x7189(%rip),%rax        # 92c8 <inst_arena>
    213f:	be 02 00 00 00       	mov    $0x2,%esi
    2144:	48 89 c7             	mov    %rax,%rdi
    2147:	e8 58 f4 ff ff       	callq  15a4 <arena_alloc>
    214c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    2150:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
    2154:	89 c7                	mov    %eax,%edi
    2156:	e8 25 ef ff ff       	callq  1080 <htons@plt>
    215b:	89 c2                	mov    %eax,%edx
    215d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2161:	66 89 10             	mov    %dx,(%rax)
    2164:	0f b7 05 65 71 00 00 	movzwl 0x7165(%rip),%eax        # 92d0 <offset>
    216b:	83 c0 02             	add    $0x2,%eax
    216e:	66 89 05 5b 71 00 00 	mov    %ax,0x715b(%rip)        # 92d0 <offset>
    2175:	90                   	nop
    2176:	c9                   	leaveq 
    2177:	c3                   	retq   

0000000000002178 <emit_data2>:
    2178:	55                   	push   %rbp
    2179:	48 89 e5             	mov    %rsp,%rbp
    217c:	48 83 ec 20          	sub    $0x20,%rsp
    2180:	66 89 7d ee          	mov    %di,-0x12(%rbp)
    2184:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    2188:	0f b7 05 41 71 00 00 	movzwl 0x7141(%rip),%eax        # 92d0 <offset>
    218f:	0f b7 c0             	movzwl %ax,%eax
    2192:	89 c6                	mov    %eax,%esi
    2194:	48 8d 3d 6c 3f 00 00 	lea    0x3f6c(%rip),%rdi        # 6107 <_IO_stdin_used+0x107>
    219b:	b8 00 00 00 00       	mov    $0x0,%eax
    21a0:	e8 eb ee ff ff       	callq  1090 <printf@plt>
    21a5:	0f b7 45 ee          	movzwl -0x12(%rbp),%eax
    21a9:	0f b7 c0             	movzwl %ax,%eax
    21ac:	89 c7                	mov    %eax,%edi
    21ae:	e8 02 f1 ff ff       	callq  12b5 <u16_print>
    21b3:	bf 0a 00 00 00       	mov    $0xa,%edi
    21b8:	e8 73 ee ff ff       	callq  1030 <putchar@plt>
    21bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    21c1:	48 89 c6             	mov    %rax,%rsi
    21c4:	48 8d 3d 49 3f 00 00 	lea    0x3f49(%rip),%rdi        # 6114 <_IO_stdin_used+0x114>
    21cb:	b8 00 00 00 00       	mov    $0x0,%eax
    21d0:	e8 bb ee ff ff       	callq  1090 <printf@plt>
    21d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    21dc:	eb 12                	jmp    21f0 <emit_data2+0x78>
    21de:	0f b7 45 ee          	movzwl -0x12(%rbp),%eax
    21e2:	0f b7 c0             	movzwl %ax,%eax
    21e5:	89 c7                	mov    %eax,%edi
    21e7:	e8 3e ff ff ff       	callq  212a <emit_word>
    21ec:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    21f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
    21f3:	48 98                	cltq   
    21f5:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    21f9:	77 e3                	ja     21de <emit_data2+0x66>
    21fb:	90                   	nop
    21fc:	c9                   	leaveq 
    21fd:	c3                   	retq   

00000000000021fe <emit_data>:
    21fe:	55                   	push   %rbp
    21ff:	48 89 e5             	mov    %rsp,%rbp
    2202:	48 83 ec 10          	sub    $0x10,%rsp
    2206:	66 89 7d fe          	mov    %di,-0x2(%rbp)
    220a:	0f b7 05 bf 70 00 00 	movzwl 0x70bf(%rip),%eax        # 92d0 <offset>
    2211:	0f b7 c0             	movzwl %ax,%eax
    2214:	89 c6                	mov    %eax,%esi
    2216:	48 8d 3d ea 3e 00 00 	lea    0x3eea(%rip),%rdi        # 6107 <_IO_stdin_used+0x107>
    221d:	b8 00 00 00 00       	mov    $0x0,%eax
    2222:	e8 69 ee ff ff       	callq  1090 <printf@plt>
    2227:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    222b:	0f b7 c0             	movzwl %ax,%eax
    222e:	89 c7                	mov    %eax,%edi
    2230:	e8 80 f0 ff ff       	callq  12b5 <u16_print>
    2235:	bf 0a 00 00 00       	mov    $0xa,%edi
    223a:	e8 f1 ed ff ff       	callq  1030 <putchar@plt>
    223f:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    2243:	0f b7 c0             	movzwl %ax,%eax
    2246:	89 c7                	mov    %eax,%edi
    2248:	e8 dd fe ff ff       	callq  212a <emit_word>
    224d:	90                   	nop
    224e:	c9                   	leaveq 
    224f:	c3                   	retq   

0000000000002250 <emit>:
    2250:	55                   	push   %rbp
    2251:	48 89 e5             	mov    %rsp,%rbp
    2254:	48 83 ec 10          	sub    $0x10,%rsp
    2258:	66 89 7d fe          	mov    %di,-0x2(%rbp)
    225c:	0f b7 05 6d 70 00 00 	movzwl 0x706d(%rip),%eax        # 92d0 <offset>
    2263:	0f b7 c0             	movzwl %ax,%eax
    2266:	89 c6                	mov    %eax,%esi
    2268:	48 8d 3d 98 3e 00 00 	lea    0x3e98(%rip),%rdi        # 6107 <_IO_stdin_used+0x107>
    226f:	b8 00 00 00 00       	mov    $0x0,%eax
    2274:	e8 17 ee ff ff       	callq  1090 <printf@plt>
    2279:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    227d:	89 c7                	mov    %eax,%edi
    227f:	e8 03 f1 ff ff       	callq  1387 <inst_print>
    2284:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
    2288:	0f b7 c0             	movzwl %ax,%eax
    228b:	89 c7                	mov    %eax,%edi
    228d:	e8 98 fe ff ff       	callq  212a <emit_word>
    2292:	90                   	nop
    2293:	c9                   	leaveq 
    2294:	c3                   	retq   

0000000000002295 <print_arg>:
    2295:	55                   	push   %rbp
    2296:	48 89 e5             	mov    %rsp,%rbp
    2299:	48 83 ec 10          	sub    $0x10,%rsp
    229d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    22a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    22a5:	0f b6 00             	movzbl (%rax),%eax
    22a8:	0f b6 c0             	movzbl %al,%eax
    22ab:	83 f8 02             	cmp    $0x2,%eax
    22ae:	0f 84 84 00 00 00    	je     2338 <print_arg+0xa3>
    22b4:	83 f8 03             	cmp    $0x3,%eax
    22b7:	74 38                	je     22f1 <print_arg+0x5c>
    22b9:	83 f8 01             	cmp    $0x1,%eax
    22bc:	0f 85 96 00 00 00    	jne    2358 <print_arg+0xc3>
    22c2:	48 8d 3d 55 3e 00 00 	lea    0x3e55(%rip),%rdi        # 611e <_IO_stdin_used+0x11e>
    22c9:	b8 00 00 00 00       	mov    $0x0,%eax
    22ce:	e8 bd ed ff ff       	callq  1090 <printf@plt>
    22d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    22d7:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    22db:	0f b6 c0             	movzbl %al,%eax
    22de:	89 c7                	mov    %eax,%edi
    22e0:	e8 2e f0 ff ff       	callq  1313 <_print_reg>
    22e5:	bf 0a 00 00 00       	mov    $0xa,%edi
    22ea:	e8 41 ed ff ff       	callq  1030 <putchar@plt>
    22ef:	eb 74                	jmp    2365 <print_arg+0xd0>
    22f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    22f5:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    22f9:	0f b7 c0             	movzwl %ax,%eax
    22fc:	48 63 d0             	movslq %eax,%rdx
    22ff:	48 89 d0             	mov    %rdx,%rax
    2302:	48 c1 e0 02          	shl    $0x2,%rax
    2306:	48 01 d0             	add    %rdx,%rax
    2309:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2310:	00 
    2311:	48 01 d0             	add    %rdx,%rax
    2314:	48 c1 e0 02          	shl    $0x2,%rax
    2318:	48 8d 15 c1 72 00 00 	lea    0x72c1(%rip),%rdx        # 95e0 <strs>
    231f:	48 01 d0             	add    %rdx,%rax
    2322:	48 89 c6             	mov    %rax,%rsi
    2325:	48 8d 3d fd 3d 00 00 	lea    0x3dfd(%rip),%rdi        # 6129 <_IO_stdin_used+0x129>
    232c:	b8 00 00 00 00       	mov    $0x0,%eax
    2331:	e8 5a ed ff ff       	callq  1090 <printf@plt>
    2336:	eb 2d                	jmp    2365 <print_arg+0xd0>
    2338:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    233c:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    2340:	0f b7 c0             	movzwl %ax,%eax
    2343:	89 c6                	mov    %eax,%esi
    2345:	48 8d 3d e9 3d 00 00 	lea    0x3de9(%rip),%rdi        # 6135 <_IO_stdin_used+0x135>
    234c:	b8 00 00 00 00       	mov    $0x0,%eax
    2351:	e8 3a ed ff ff       	callq  1090 <printf@plt>
    2356:	eb 0d                	jmp    2365 <print_arg+0xd0>
    2358:	48 8d 3d 1f 3d 00 00 	lea    0x3d1f(%rip),%rdi        # 607e <_IO_stdin_used+0x7e>
    235f:	e8 ec ec ff ff       	callq  1050 <puts@plt>
    2364:	90                   	nop
    2365:	90                   	nop
    2366:	c9                   	leaveq 
    2367:	c3                   	retq   

0000000000002368 <reloc>:
    2368:	55                   	push   %rbp
    2369:	48 89 e5             	mov    %rsp,%rbp
    236c:	48 83 ec 20          	sub    $0x20,%rsp
    2370:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2374:	89 f0                	mov    %esi,%eax
    2376:	66 89 45 e4          	mov    %ax,-0x1c(%rbp)
    237a:	89 d0                	mov    %edx,%eax
    237c:	88 45 e0             	mov    %al,-0x20(%rbp)
    237f:	48 8b 05 3a 6f 00 00 	mov    0x6f3a(%rip),%rax        # 92c0 <reloca_arena>
    2386:	48 85 c0             	test   %rax,%rax
    2389:	75 11                	jne    239c <reloc+0x34>
    238b:	bf 00 04 00 00       	mov    $0x400,%edi
    2390:	e8 ca f1 ff ff       	callq  155f <new_arena>
    2395:	48 89 05 24 6f 00 00 	mov    %rax,0x6f24(%rip)        # 92c0 <reloca_arena>
    239c:	48 8b 05 1d 6f 00 00 	mov    0x6f1d(%rip),%rax        # 92c0 <reloca_arena>
    23a3:	be 07 00 00 00       	mov    $0x7,%esi
    23a8:	48 89 c7             	mov    %rax,%rdi
    23ab:	e8 f4 f1 ff ff       	callq  15a4 <arena_alloc>
    23b0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    23b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    23b8:	0f b7 55 e4          	movzwl -0x1c(%rbp),%edx
    23bc:	66 89 50 02          	mov    %dx,0x2(%rax)
    23c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    23c4:	66 c7 40 04 00 00    	movw   $0x0,0x4(%rax)
    23ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    23ce:	0f b6 55 e0          	movzbl -0x20(%rbp),%edx
    23d2:	88 50 06             	mov    %dl,0x6(%rax)
    23d5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    23da:	75 1f                	jne    23fb <reloc+0x93>
    23dc:	48 8d 0d 17 42 00 00 	lea    0x4217(%rip),%rcx        # 65fa <__PRETTY_FUNCTION__.4558>
    23e3:	ba bb 01 00 00       	mov    $0x1bb,%edx
    23e8:	48 8d 35 c1 3c 00 00 	lea    0x3cc1(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    23ef:	48 8d 3d 4e 3d 00 00 	lea    0x3d4e(%rip),%rdi        # 6144 <_IO_stdin_used+0x144>
    23f6:	e8 b5 ec ff ff       	callq  10b0 <__assert_fail@plt>
    23fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    23ff:	0f b7 10             	movzwl (%rax),%edx
    2402:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2406:	66 89 10             	mov    %dx,(%rax)
    2409:	48 8b 05 c8 6e 00 00 	mov    0x6ec8(%rip),%rax        # 92d8 <reloca_arena_cnt>
    2410:	48 83 c0 01          	add    $0x1,%rax
    2414:	48 89 05 bd 6e 00 00 	mov    %rax,0x6ebd(%rip)        # 92d8 <reloca_arena_cnt>
    241b:	90                   	nop
    241c:	c9                   	leaveq 
    241d:	c3                   	retq   

000000000000241e <deref>:
    241e:	55                   	push   %rbp
    241f:	48 89 e5             	mov    %rsp,%rbp
    2422:	48 83 ec 10          	sub    $0x10,%rsp
    2426:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    242a:	89 f0                	mov    %esi,%eax
    242c:	66 89 45 f4          	mov    %ax,-0xc(%rbp)
    2430:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2434:	0f b6 00             	movzbl (%rax),%eax
    2437:	3c 04                	cmp    $0x4,%al
    2439:	75 3d                	jne    2478 <deref+0x5a>
    243b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    243f:	48 8b 40 08          	mov    0x8(%rax),%rax
    2443:	48 89 c6             	mov    %rax,%rsi
    2446:	48 8d 3d fb 3c 00 00 	lea    0x3cfb(%rip),%rdi        # 6148 <_IO_stdin_used+0x148>
    244d:	b8 00 00 00 00       	mov    $0x0,%eax
    2452:	e8 39 ec ff ff       	callq  1090 <printf@plt>
    2457:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    245b:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    245f:	0f b6 d0             	movzbl %al,%edx
    2462:	0f b7 4d f4          	movzwl -0xc(%rbp),%ecx
    2466:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    246a:	48 8b 40 08          	mov    0x8(%rax),%rax
    246e:	89 ce                	mov    %ecx,%esi
    2470:	48 89 c7             	mov    %rax,%rdi
    2473:	e8 f0 fe ff ff       	callq  2368 <reloc>
    2478:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    247c:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    2480:	0f b6 c0             	movzbl %al,%eax
    2483:	83 f8 01             	cmp    $0x1,%eax
    2486:	74 16                	je     249e <deref+0x80>
    2488:	83 f8 02             	cmp    $0x2,%eax
    248b:	74 21                	je     24ae <deref+0x90>
    248d:	85 c0                	test   %eax,%eax
    248f:	75 2b                	jne    24bc <deref+0x9e>
    2491:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2495:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    2499:	e9 92 00 00 00       	jmpq   2530 <deref+0x112>
    249e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    24a2:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    24a6:	0f b6 c0             	movzbl %al,%eax
    24a9:	e9 82 00 00 00       	jmpq   2530 <deref+0x112>
    24ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    24b2:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    24b6:	66 c1 e8 08          	shr    $0x8,%ax
    24ba:	eb 74                	jmp    2530 <deref+0x112>
    24bc:	48 8b 05 bd 6d 00 00 	mov    0x6dbd(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    24c3:	48 89 c7             	mov    %rax,%rdi
    24c6:	e8 85 ec ff ff       	callq  1150 <fflush@plt>
    24cb:	48 8b 05 ce 6d 00 00 	mov    0x6dce(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    24d2:	b9 0a 02 00 00       	mov    $0x20a,%ecx
    24d7:	48 8d 15 22 41 00 00 	lea    0x4122(%rip),%rdx        # 6600 <__func__.4567>
    24de:	48 8d 35 b3 3b 00 00 	lea    0x3bb3(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    24e5:	48 89 c7             	mov    %rax,%rdi
    24e8:	b8 00 00 00 00       	mov    $0x0,%eax
    24ed:	e8 1e ec ff ff       	callq  1110 <fprintf@plt>
    24f2:	48 8b 05 a7 6d 00 00 	mov    0x6da7(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    24f9:	48 89 c1             	mov    %rax,%rcx
    24fc:	ba 06 00 00 00       	mov    $0x6,%edx
    2501:	be 01 00 00 00       	mov    $0x1,%esi
    2506:	48 8d 3d 49 3c 00 00 	lea    0x3c49(%rip),%rdi        # 6156 <_IO_stdin_used+0x156>
    250d:	e8 8e ec ff ff       	callq  11a0 <fwrite@plt>
    2512:	48 8b 05 87 6d 00 00 	mov    0x6d87(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2519:	48 89 c6             	mov    %rax,%rsi
    251c:	bf 0a 00 00 00       	mov    $0xa,%edi
    2521:	e8 ba eb ff ff       	callq  10e0 <fputc@plt>
    2526:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    252b:	e8 60 ec ff ff       	callq  1190 <exit@plt>
    2530:	c9                   	leaveq 
    2531:	c3                   	retq   

0000000000002532 <as_print>:
    2532:	55                   	push   %rbp
    2533:	48 89 e5             	mov    %rsp,%rbp
    2536:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    253a:	90                   	nop
    253b:	5d                   	pop    %rbp
    253c:	c3                   	retq   

000000000000253d <advance>:
    253d:	55                   	push   %rbp
    253e:	48 89 e5             	mov    %rsp,%rbp
    2541:	48 83 ec 20          	sub    $0x20,%rsp
    2545:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2549:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    254d:	89 55 ec             	mov    %edx,-0x14(%rbp)
    2550:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2554:	8b 00                	mov    (%rax),%eax
    2556:	39 45 ec             	cmp    %eax,-0x14(%rbp)
    2559:	7e 1f                	jle    257a <advance+0x3d>
    255b:	48 8d 0d a6 40 00 00 	lea    0x40a6(%rip),%rcx        # 6608 <__PRETTY_FUNCTION__.4579>
    2562:	ba 20 02 00 00       	mov    $0x220,%edx
    2567:	48 8d 35 42 3b 00 00 	lea    0x3b42(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    256e:	48 8d 3d e8 3b 00 00 	lea    0x3be8(%rip),%rdi        # 615d <_IO_stdin_used+0x15d>
    2575:	e8 36 eb ff ff       	callq  10b0 <__assert_fail@plt>
    257a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    257e:	48 8b 10             	mov    (%rax),%rdx
    2581:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2584:	48 98                	cltq   
    2586:	48 01 c2             	add    %rax,%rdx
    2589:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    258d:	48 89 10             	mov    %rdx,(%rax)
    2590:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2594:	8b 00                	mov    (%rax),%eax
    2596:	2b 45 ec             	sub    -0x14(%rbp),%eax
    2599:	89 c2                	mov    %eax,%edx
    259b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    259f:	89 10                	mov    %edx,(%rax)
    25a1:	8b 45 ec             	mov    -0x14(%rbp),%eax
    25a4:	c9                   	leaveq 
    25a5:	c3                   	retq   

00000000000025a6 <getreg>:
    25a6:	55                   	push   %rbp
    25a7:	48 89 e5             	mov    %rsp,%rbp
    25aa:	48 83 ec 30          	sub    $0x30,%rsp
    25ae:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    25b2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    25b6:	89 55 dc             	mov    %edx,-0x24(%rbp)
    25b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    25c0:	eb 08                	jmp    25ca <getreg+0x24>
    25c2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    25c6:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
    25ca:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
    25ce:	74 2f                	je     25ff <getreg+0x59>
    25d0:	e8 db eb ff ff       	callq  11b0 <__ctype_b_loc@plt>
    25d5:	48 8b 00             	mov    (%rax),%rax
    25d8:	8b 55 fc             	mov    -0x4(%rbp),%edx
    25db:	48 63 ca             	movslq %edx,%rcx
    25de:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    25e2:	48 01 ca             	add    %rcx,%rdx
    25e5:	0f b6 12             	movzbl (%rdx),%edx
    25e8:	48 0f be d2          	movsbq %dl,%rdx
    25ec:	48 01 d2             	add    %rdx,%rdx
    25ef:	48 01 d0             	add    %rdx,%rax
    25f2:	0f b7 00             	movzwl (%rax),%eax
    25f5:	0f b7 c0             	movzwl %ax,%eax
    25f8:	83 e0 08             	and    $0x8,%eax
    25fb:	85 c0                	test   %eax,%eax
    25fd:	75 c3                	jne    25c2 <getreg+0x1c>
    25ff:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    2603:	0f 8e d2 01 00 00    	jle    27db <getreg+0x235>
    2609:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
    260d:	0f 8f c8 01 00 00    	jg     27db <getreg+0x235>
    2613:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2617:	0f b6 00             	movzbl (%rax),%eax
    261a:	3c 73                	cmp    $0x73,%al
    261c:	75 1e                	jne    263c <getreg+0x96>
    261e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2622:	48 83 c0 01          	add    $0x1,%rax
    2626:	0f b6 00             	movzbl (%rax),%eax
    2629:	3c 70                	cmp    $0x70,%al
    262b:	75 0f                	jne    263c <getreg+0x96>
    262d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2631:	66 c7 40 02 0d 00    	movw   $0xd,0x2(%rax)
    2637:	e9 ae 01 00 00       	jmpq   27ea <getreg+0x244>
    263c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2640:	0f b6 00             	movzbl (%rax),%eax
    2643:	3c 6c                	cmp    $0x6c,%al
    2645:	75 1e                	jne    2665 <getreg+0xbf>
    2647:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    264b:	48 83 c0 01          	add    $0x1,%rax
    264f:	0f b6 00             	movzbl (%rax),%eax
    2652:	3c 72                	cmp    $0x72,%al
    2654:	75 0f                	jne    2665 <getreg+0xbf>
    2656:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    265a:	66 c7 40 02 0e 00    	movw   $0xe,0x2(%rax)
    2660:	e9 85 01 00 00       	jmpq   27ea <getreg+0x244>
    2665:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2669:	0f b6 00             	movzbl (%rax),%eax
    266c:	3c 70                	cmp    $0x70,%al
    266e:	75 1e                	jne    268e <getreg+0xe8>
    2670:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2674:	48 83 c0 01          	add    $0x1,%rax
    2678:	0f b6 00             	movzbl (%rax),%eax
    267b:	3c 63                	cmp    $0x63,%al
    267d:	75 0f                	jne    268e <getreg+0xe8>
    267f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2683:	66 c7 40 02 0f 00    	movw   $0xf,0x2(%rax)
    2689:	e9 5c 01 00 00       	jmpq   27ea <getreg+0x244>
    268e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2692:	0f b6 00             	movzbl (%rax),%eax
    2695:	3c 72                	cmp    $0x72,%al
    2697:	0f 85 3e 01 00 00    	jne    27db <getreg+0x235>
    269d:	e8 0e eb ff ff       	callq  11b0 <__ctype_b_loc@plt>
    26a2:	48 8b 00             	mov    (%rax),%rax
    26a5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    26a9:	48 83 c2 01          	add    $0x1,%rdx
    26ad:	0f b6 12             	movzbl (%rdx),%edx
    26b0:	48 0f be d2          	movsbq %dl,%rdx
    26b4:	48 01 d2             	add    %rdx,%rdx
    26b7:	48 01 d0             	add    %rdx,%rax
    26ba:	0f b7 00             	movzwl (%rax),%eax
    26bd:	0f b7 c0             	movzwl %ax,%eax
    26c0:	25 00 08 00 00       	and    $0x800,%eax
    26c5:	85 c0                	test   %eax,%eax
    26c7:	0f 84 11 01 00 00    	je     27de <getreg+0x238>
    26cd:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
    26d1:	75 6a                	jne    273d <getreg+0x197>
    26d3:	e8 d8 ea ff ff       	callq  11b0 <__ctype_b_loc@plt>
    26d8:	48 8b 00             	mov    (%rax),%rax
    26db:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    26df:	48 83 c2 02          	add    $0x2,%rdx
    26e3:	0f b6 12             	movzbl (%rdx),%edx
    26e6:	48 0f be d2          	movsbq %dl,%rdx
    26ea:	48 01 d2             	add    %rdx,%rdx
    26ed:	48 01 d0             	add    %rdx,%rax
    26f0:	0f b7 00             	movzwl (%rax),%eax
    26f3:	0f b7 c0             	movzwl %ax,%eax
    26f6:	25 00 08 00 00       	and    $0x800,%eax
    26fb:	85 c0                	test   %eax,%eax
    26fd:	0f 84 de 00 00 00    	je     27e1 <getreg+0x23b>
    2703:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2707:	48 83 c0 01          	add    $0x1,%rax
    270b:	0f b6 00             	movzbl (%rax),%eax
    270e:	0f be c0             	movsbl %al,%eax
    2711:	83 e8 30             	sub    $0x30,%eax
    2714:	89 c2                	mov    %eax,%edx
    2716:	89 d0                	mov    %edx,%eax
    2718:	c1 e0 02             	shl    $0x2,%eax
    271b:	01 d0                	add    %edx,%eax
    271d:	01 c0                	add    %eax,%eax
    271f:	89 c2                	mov    %eax,%edx
    2721:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2725:	48 83 c0 02          	add    $0x2,%rax
    2729:	0f b6 00             	movzbl (%rax),%eax
    272c:	66 98                	cbtw   
    272e:	01 d0                	add    %edx,%eax
    2730:	8d 50 d0             	lea    -0x30(%rax),%edx
    2733:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2737:	66 89 50 02          	mov    %dx,0x2(%rax)
    273b:	eb 18                	jmp    2755 <getreg+0x1af>
    273d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2741:	48 83 c0 01          	add    $0x1,%rax
    2745:	0f b6 00             	movzbl (%rax),%eax
    2748:	66 98                	cbtw   
    274a:	8d 50 d0             	lea    -0x30(%rax),%edx
    274d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2751:	66 89 50 02          	mov    %dx,0x2(%rax)
    2755:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2759:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    275d:	66 83 f8 0f          	cmp    $0xf,%ax
    2761:	0f 86 82 00 00 00    	jbe    27e9 <getreg+0x243>
    2767:	48 8b 05 12 6b 00 00 	mov    0x6b12(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    276e:	48 89 c7             	mov    %rax,%rdi
    2771:	e8 da e9 ff ff       	callq  1150 <fflush@plt>
    2776:	48 8b 05 23 6b 00 00 	mov    0x6b23(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    277d:	b9 43 02 00 00       	mov    $0x243,%ecx
    2782:	48 8d 15 87 3e 00 00 	lea    0x3e87(%rip),%rdx        # 6610 <__func__.4591>
    2789:	48 8d 35 08 39 00 00 	lea    0x3908(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    2790:	48 89 c7             	mov    %rax,%rdi
    2793:	b8 00 00 00 00       	mov    $0x0,%eax
    2798:	e8 73 e9 ff ff       	callq  1110 <fprintf@plt>
    279d:	48 8b 05 fc 6a 00 00 	mov    0x6afc(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    27a4:	48 89 c1             	mov    %rax,%rcx
    27a7:	ba 17 00 00 00       	mov    $0x17,%edx
    27ac:	be 01 00 00 00       	mov    $0x1,%esi
    27b1:	48 8d 3d b1 39 00 00 	lea    0x39b1(%rip),%rdi        # 6169 <_IO_stdin_used+0x169>
    27b8:	e8 e3 e9 ff ff       	callq  11a0 <fwrite@plt>
    27bd:	48 8b 05 dc 6a 00 00 	mov    0x6adc(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    27c4:	48 89 c6             	mov    %rax,%rsi
    27c7:	bf 0a 00 00 00       	mov    $0xa,%edi
    27cc:	e8 0f e9 ff ff       	callq  10e0 <fputc@plt>
    27d1:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    27d6:	e8 b5 e9 ff ff       	callq  1190 <exit@plt>
    27db:	90                   	nop
    27dc:	eb 04                	jmp    27e2 <getreg+0x23c>
    27de:	90                   	nop
    27df:	eb 01                	jmp    27e2 <getreg+0x23c>
    27e1:	90                   	nop
    27e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    27e7:	eb 0b                	jmp    27f4 <getreg+0x24e>
    27e9:	90                   	nop
    27ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    27ee:	c6 00 01             	movb   $0x1,(%rax)
    27f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    27f4:	c9                   	leaveq 
    27f5:	c3                   	retq   

00000000000027f6 <skip_next_comma>:
    27f6:	55                   	push   %rbp
    27f7:	48 89 e5             	mov    %rsp,%rbp
    27fa:	48 83 ec 20          	sub    $0x20,%rsp
    27fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2802:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    2805:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2808:	89 45 fc             	mov    %eax,-0x4(%rbp)
    280b:	eb 09                	jmp    2816 <skip_next_comma+0x20>
    280d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    2812:	83 6d e4 01          	subl   $0x1,-0x1c(%rbp)
    2816:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    281a:	7e 28                	jle    2844 <skip_next_comma+0x4e>
    281c:	e8 8f e9 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    2821:	48 8b 10             	mov    (%rax),%rdx
    2824:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2828:	0f b6 00             	movzbl (%rax),%eax
    282b:	48 0f be c0          	movsbq %al,%rax
    282f:	48 01 c0             	add    %rax,%rax
    2832:	48 01 d0             	add    %rdx,%rax
    2835:	0f b7 00             	movzwl (%rax),%eax
    2838:	0f b7 c0             	movzwl %ax,%eax
    283b:	25 00 20 00 00       	and    $0x2000,%eax
    2840:	85 c0                	test   %eax,%eax
    2842:	75 c9                	jne    280d <skip_next_comma+0x17>
    2844:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    2848:	74 14                	je     285e <skip_next_comma+0x68>
    284a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    284e:	0f b6 00             	movzbl (%rax),%eax
    2851:	3c 2c                	cmp    $0x2c,%al
    2853:	75 09                	jne    285e <skip_next_comma+0x68>
    2855:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    285a:	83 6d e4 01          	subl   $0x1,-0x1c(%rbp)
    285e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2861:	2b 45 e4             	sub    -0x1c(%rbp),%eax
    2864:	c9                   	leaveq 
    2865:	c3                   	retq   

0000000000002866 <skip_space>:
    2866:	55                   	push   %rbp
    2867:	48 89 e5             	mov    %rsp,%rbp
    286a:	48 83 ec 20          	sub    $0x20,%rsp
    286e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2872:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    2875:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2878:	89 45 fc             	mov    %eax,-0x4(%rbp)
    287b:	eb 09                	jmp    2886 <skip_space+0x20>
    287d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    2882:	83 6d e4 01          	subl   $0x1,-0x1c(%rbp)
    2886:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    288a:	7e 28                	jle    28b4 <skip_space+0x4e>
    288c:	e8 1f e9 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    2891:	48 8b 10             	mov    (%rax),%rdx
    2894:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2898:	0f b6 00             	movzbl (%rax),%eax
    289b:	48 0f be c0          	movsbq %al,%rax
    289f:	48 01 c0             	add    %rax,%rax
    28a2:	48 01 d0             	add    %rdx,%rax
    28a5:	0f b7 00             	movzwl (%rax),%eax
    28a8:	0f b7 c0             	movzwl %ax,%eax
    28ab:	25 00 20 00 00       	and    $0x2000,%eax
    28b0:	85 c0                	test   %eax,%eax
    28b2:	75 c9                	jne    287d <skip_space+0x17>
    28b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
    28b7:	2b 45 e4             	sub    -0x1c(%rbp),%eax
    28ba:	c9                   	leaveq 
    28bb:	c3                   	retq   

00000000000028bc <skip_blank>:
    28bc:	55                   	push   %rbp
    28bd:	48 89 e5             	mov    %rsp,%rbp
    28c0:	48 83 ec 20          	sub    $0x20,%rsp
    28c4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    28c8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    28cb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    28ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
    28d1:	eb 09                	jmp    28dc <skip_blank+0x20>
    28d3:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    28d8:	83 6d e4 01          	subl   $0x1,-0x1c(%rbp)
    28dc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    28e0:	7e 26                	jle    2908 <skip_blank+0x4c>
    28e2:	e8 c9 e8 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    28e7:	48 8b 10             	mov    (%rax),%rdx
    28ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    28ee:	0f b6 00             	movzbl (%rax),%eax
    28f1:	48 0f be c0          	movsbq %al,%rax
    28f5:	48 01 c0             	add    %rax,%rax
    28f8:	48 01 d0             	add    %rdx,%rax
    28fb:	0f b7 00             	movzwl (%rax),%eax
    28fe:	0f b7 c0             	movzwl %ax,%eax
    2901:	83 e0 01             	and    $0x1,%eax
    2904:	85 c0                	test   %eax,%eax
    2906:	75 cb                	jne    28d3 <skip_blank+0x17>
    2908:	8b 45 fc             	mov    -0x4(%rbp),%eax
    290b:	2b 45 e4             	sub    -0x1c(%rbp),%eax
    290e:	c9                   	leaveq 
    290f:	c3                   	retq   

0000000000002910 <get_reglist>:
    2910:	55                   	push   %rbp
    2911:	48 89 e5             	mov    %rsp,%rbp
    2914:	48 83 ec 50          	sub    $0x50,%rsp
    2918:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    291c:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    2920:	89 55 bc             	mov    %edx,-0x44(%rbp)
    2923:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
    292a:	8b 45 bc             	mov    -0x44(%rbp),%eax
    292d:	89 45 f8             	mov    %eax,-0x8(%rbp)
    2930:	ba 78 02 00 00       	mov    $0x278,%edx
    2935:	48 8d 35 dc 3c 00 00 	lea    0x3cdc(%rip),%rsi        # 6618 <__func__.4623>
    293c:	48 8d 3d 3e 38 00 00 	lea    0x383e(%rip),%rdi        # 6181 <_IO_stdin_used+0x181>
    2943:	b8 00 00 00 00       	mov    $0x0,%eax
    2948:	e8 43 e7 ff ff       	callq  1090 <printf@plt>
    294d:	8b 45 bc             	mov    -0x44(%rbp),%eax
    2950:	83 f8 01             	cmp    $0x1,%eax
    2953:	7e 0b                	jle    2960 <get_reglist+0x50>
    2955:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2959:	0f b6 00             	movzbl (%rax),%eax
    295c:	3c 7b                	cmp    $0x7b,%al
    295e:	74 0a                	je     296a <get_reglist+0x5a>
    2960:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2965:	e9 b6 01 00 00       	jmpq   2b20 <get_reglist+0x210>
    296a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    296e:	48 83 c0 01          	add    $0x1,%rax
    2972:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2976:	8b 45 bc             	mov    -0x44(%rbp),%eax
    2979:	83 e8 01             	sub    $0x1,%eax
    297c:	89 45 bc             	mov    %eax,-0x44(%rbp)
    297f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2983:	c6 40 11 00          	movb   $0x0,0x11(%rax)
    2987:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    298b:	ba 28 00 00 00       	mov    $0x28,%edx
    2990:	be 00 00 00 00       	mov    $0x0,%esi
    2995:	48 89 c7             	mov    %rax,%rdi
    2998:	e8 23 e7 ff ff       	callq  10c0 <memset@plt>
    299d:	8b 55 bc             	mov    -0x44(%rbp),%edx
    29a0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    29a4:	89 d6                	mov    %edx,%esi
    29a6:	48 89 c7             	mov    %rax,%rdi
    29a9:	e8 b8 fe ff ff       	callq  2866 <skip_space>
    29ae:	89 c2                	mov    %eax,%edx
    29b0:	48 8d 4d bc          	lea    -0x44(%rbp),%rcx
    29b4:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    29b8:	48 89 ce             	mov    %rcx,%rsi
    29bb:	48 89 c7             	mov    %rax,%rdi
    29be:	e8 7a fb ff ff       	callq  253d <advance>
    29c3:	8b 55 bc             	mov    -0x44(%rbp),%edx
    29c6:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    29ca:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    29ce:	48 89 ce             	mov    %rcx,%rsi
    29d1:	48 89 c7             	mov    %rax,%rdi
    29d4:	e8 cd fb ff ff       	callq  25a6 <getreg>
    29d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
    29dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    29e0:	0f 8e 8d 00 00 00    	jle    2a73 <get_reglist+0x163>
    29e6:	0f b6 45 d0          	movzbl -0x30(%rbp),%eax
    29ea:	3c 01                	cmp    $0x1,%al
    29ec:	74 1f                	je     2a0d <get_reglist+0xfd>
    29ee:	48 8d 0d 33 3c 00 00 	lea    0x3c33(%rip),%rcx        # 6628 <__PRETTY_FUNCTION__.4625>
    29f5:	ba 87 02 00 00       	mov    $0x287,%edx
    29fa:	48 8d 35 af 36 00 00 	lea    0x36af(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    2a01:	48 8d 3d 80 37 00 00 	lea    0x3780(%rip),%rdi        # 6188 <_IO_stdin_used+0x188>
    2a08:	e8 a3 e6 ff ff       	callq  10b0 <__assert_fail@plt>
    2a0d:	8b 55 fc             	mov    -0x4(%rbp),%edx
    2a10:	48 8d 4d bc          	lea    -0x44(%rbp),%rcx
    2a14:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    2a18:	48 89 ce             	mov    %rcx,%rsi
    2a1b:	48 89 c7             	mov    %rax,%rdi
    2a1e:	e8 1a fb ff ff       	callq  253d <advance>
    2a23:	8b 55 bc             	mov    -0x44(%rbp),%edx
    2a26:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2a2a:	89 d6                	mov    %edx,%esi
    2a2c:	48 89 c7             	mov    %rax,%rdi
    2a2f:	e8 c2 fd ff ff       	callq  27f6 <skip_next_comma>
    2a34:	89 c2                	mov    %eax,%edx
    2a36:	48 8d 4d bc          	lea    -0x44(%rbp),%rcx
    2a3a:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    2a3e:	48 89 ce             	mov    %rcx,%rsi
    2a41:	48 89 c7             	mov    %rax,%rdi
    2a44:	e8 f4 fa ff ff       	callq  253d <advance>
    2a49:	0f b7 75 d2          	movzwl -0x2e(%rbp),%esi
    2a4d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2a51:	0f b6 40 11          	movzbl 0x11(%rax),%eax
    2a55:	8d 48 01             	lea    0x1(%rax),%ecx
    2a58:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    2a5c:	88 4a 11             	mov    %cl,0x11(%rdx)
    2a5f:	0f b6 c0             	movzbl %al,%eax
    2a62:	89 f1                	mov    %esi,%ecx
    2a64:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    2a68:	48 98                	cltq   
    2a6a:	88 4c 02 12          	mov    %cl,0x12(%rdx,%rax,1)
    2a6e:	e9 14 ff ff ff       	jmpq   2987 <get_reglist+0x77>
    2a73:	90                   	nop
    2a74:	8b 45 bc             	mov    -0x44(%rbp),%eax
    2a77:	85 c0                	test   %eax,%eax
    2a79:	74 0b                	je     2a86 <get_reglist+0x176>
    2a7b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2a7f:	0f b6 00             	movzbl (%rax),%eax
    2a82:	3c 7d                	cmp    $0x7d,%al
    2a84:	74 74                	je     2afa <get_reglist+0x1ea>
    2a86:	48 8b 05 f3 67 00 00 	mov    0x67f3(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    2a8d:	48 89 c7             	mov    %rax,%rdi
    2a90:	e8 bb e6 ff ff       	callq  1150 <fflush@plt>
    2a95:	48 8b 05 04 68 00 00 	mov    0x6804(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2a9c:	b9 90 02 00 00       	mov    $0x290,%ecx
    2aa1:	48 8d 15 70 3b 00 00 	lea    0x3b70(%rip),%rdx        # 6618 <__func__.4623>
    2aa8:	48 8d 35 e9 35 00 00 	lea    0x35e9(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    2aaf:	48 89 c7             	mov    %rax,%rdi
    2ab2:	b8 00 00 00 00       	mov    $0x0,%eax
    2ab7:	e8 54 e6 ff ff       	callq  1110 <fprintf@plt>
    2abc:	48 8b 05 dd 67 00 00 	mov    0x67dd(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2ac3:	48 89 c1             	mov    %rax,%rcx
    2ac6:	ba 1a 00 00 00       	mov    $0x1a,%edx
    2acb:	be 01 00 00 00       	mov    $0x1,%esi
    2ad0:	48 8d 3d c5 36 00 00 	lea    0x36c5(%rip),%rdi        # 619c <_IO_stdin_used+0x19c>
    2ad7:	e8 c4 e6 ff ff       	callq  11a0 <fwrite@plt>
    2adc:	48 8b 05 bd 67 00 00 	mov    0x67bd(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2ae3:	48 89 c6             	mov    %rax,%rsi
    2ae6:	bf 0a 00 00 00       	mov    $0xa,%edi
    2aeb:	e8 f0 e5 ff ff       	callq  10e0 <fputc@plt>
    2af0:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    2af5:	e8 96 e6 ff ff       	callq  1190 <exit@plt>
    2afa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2afe:	48 83 c0 01          	add    $0x1,%rax
    2b02:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2b06:	8b 45 bc             	mov    -0x44(%rbp),%eax
    2b09:	83 e8 01             	sub    $0x1,%eax
    2b0c:	89 45 bc             	mov    %eax,-0x44(%rbp)
    2b0f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2b13:	c6 00 07             	movb   $0x7,(%rax)
    2b16:	8b 45 bc             	mov    -0x44(%rbp),%eax
    2b19:	8b 55 f8             	mov    -0x8(%rbp),%edx
    2b1c:	29 c2                	sub    %eax,%edx
    2b1e:	89 d0                	mov    %edx,%eax
    2b20:	c9                   	leaveq 
    2b21:	c3                   	retq   

0000000000002b22 <get_string>:
    2b22:	55                   	push   %rbp
    2b23:	48 89 e5             	mov    %rsp,%rbp
    2b26:	48 83 ec 40          	sub    $0x40,%rsp
    2b2a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    2b2e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    2b32:	89 55 cc             	mov    %edx,-0x34(%rbp)
    2b35:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2b38:	89 45 ec             	mov    %eax,-0x14(%rbp)
    2b3b:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2b3f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    2b46:	00 
    2b47:	83 7d cc 01          	cmpl   $0x1,-0x34(%rbp)
    2b4b:	0f 8e dd 02 00 00    	jle    2e2e <get_string+0x30c>
    2b51:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2b55:	0f b6 00             	movzbl (%rax),%eax
    2b58:	3c 22                	cmp    $0x22,%al
    2b5a:	0f 85 ce 02 00 00    	jne    2e2e <get_string+0x30c>
    2b60:	80 4d ff 02          	orb    $0x2,-0x1(%rbp)
    2b64:	0f b7 05 67 67 00 00 	movzwl 0x6767(%rip),%eax        # 92d2 <stridx>
    2b6b:	8d 50 01             	lea    0x1(%rax),%edx
    2b6e:	66 89 15 5d 67 00 00 	mov    %dx,0x675d(%rip)        # 92d2 <stridx>
    2b75:	0f b7 c0             	movzwl %ax,%eax
    2b78:	48 63 d0             	movslq %eax,%rdx
    2b7b:	48 89 d0             	mov    %rdx,%rax
    2b7e:	48 c1 e0 02          	shl    $0x2,%rax
    2b82:	48 01 d0             	add    %rdx,%rax
    2b85:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2b8c:	00 
    2b8d:	48 01 d0             	add    %rdx,%rax
    2b90:	48 c1 e0 02          	shl    $0x2,%rax
    2b94:	48 8d 15 45 6a 00 00 	lea    0x6a45(%rip),%rdx        # 95e0 <strs>
    2b9b:	48 01 d0             	add    %rdx,%rax
    2b9e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    2ba2:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
    2ba7:	83 6d cc 01          	subl   $0x1,-0x34(%rbp)
    2bab:	e9 bb 01 00 00       	jmpq   2d6b <get_string+0x249>
    2bb0:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
    2bb4:	83 e0 01             	and    $0x1,%eax
    2bb7:	85 c0                	test   %eax,%eax
    2bb9:	0f 84 63 01 00 00    	je     2d22 <get_string+0x200>
    2bbf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2bc3:	0f b6 00             	movzbl (%rax),%eax
    2bc6:	0f be c0             	movsbl %al,%eax
    2bc9:	83 e8 22             	sub    $0x22,%eax
    2bcc:	83 f8 54             	cmp    $0x54,%eax
    2bcf:	0f 87 d3 00 00 00    	ja     2ca8 <get_string+0x186>
    2bd5:	89 c0                	mov    %eax,%eax
    2bd7:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2bde:	00 
    2bdf:	48 8d 05 fe 35 00 00 	lea    0x35fe(%rip),%rax        # 61e4 <_IO_stdin_used+0x1e4>
    2be6:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    2be9:	48 98                	cltq   
    2beb:	48 8d 15 f2 35 00 00 	lea    0x35f2(%rip),%rdx        # 61e4 <_IO_stdin_used+0x1e4>
    2bf2:	48 01 d0             	add    %rdx,%rax
    2bf5:	ff e0                	jmpq   *%rax
    2bf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2bfb:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2bff:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c03:	c6 00 07             	movb   $0x7,(%rax)
    2c06:	e9 11 01 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c0f:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c13:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c17:	c6 00 08             	movb   $0x8,(%rax)
    2c1a:	e9 fd 00 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c23:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c27:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c2b:	c6 00 09             	movb   $0x9,(%rax)
    2c2e:	e9 e9 00 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c33:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c37:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c3b:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c3f:	c6 00 0a             	movb   $0xa,(%rax)
    2c42:	e9 d5 00 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c47:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c4b:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c4f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c53:	c6 00 0b             	movb   $0xb,(%rax)
    2c56:	e9 c1 00 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c5b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c5f:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c63:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c67:	c6 00 0c             	movb   $0xc,(%rax)
    2c6a:	e9 ad 00 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c73:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c77:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c7b:	c6 00 0d             	movb   $0xd,(%rax)
    2c7e:	e9 99 00 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c87:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c8b:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2c8f:	c6 00 22             	movb   $0x22,(%rax)
    2c92:	e9 85 00 00 00       	jmpq   2d1c <get_string+0x1fa>
    2c97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2c9b:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2c9f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2ca3:	c6 00 5c             	movb   $0x5c,(%rax)
    2ca6:	eb 74                	jmp    2d1c <get_string+0x1fa>
    2ca8:	48 8b 05 d1 65 00 00 	mov    0x65d1(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    2caf:	48 89 c7             	mov    %rax,%rdi
    2cb2:	e8 99 e4 ff ff       	callq  1150 <fflush@plt>
    2cb7:	48 8b 05 e2 65 00 00 	mov    0x65e2(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2cbe:	b9 b6 02 00 00       	mov    $0x2b6,%ecx
    2cc3:	48 8d 15 6e 39 00 00 	lea    0x396e(%rip),%rdx        # 6638 <__func__.4651>
    2cca:	48 8d 35 c7 33 00 00 	lea    0x33c7(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    2cd1:	48 89 c7             	mov    %rax,%rdi
    2cd4:	b8 00 00 00 00       	mov    $0x0,%eax
    2cd9:	e8 32 e4 ff ff       	callq  1110 <fprintf@plt>
    2cde:	48 8b 05 bb 65 00 00 	mov    0x65bb(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2ce5:	48 89 c1             	mov    %rax,%rcx
    2ce8:	ba 18 00 00 00       	mov    $0x18,%edx
    2ced:	be 01 00 00 00       	mov    $0x1,%esi
    2cf2:	48 8d 3d be 34 00 00 	lea    0x34be(%rip),%rdi        # 61b7 <_IO_stdin_used+0x1b7>
    2cf9:	e8 a2 e4 ff ff       	callq  11a0 <fwrite@plt>
    2cfe:	48 8b 05 9b 65 00 00 	mov    0x659b(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2d05:	48 89 c6             	mov    %rax,%rsi
    2d08:	bf 0a 00 00 00       	mov    $0xa,%edi
    2d0d:	e8 ce e3 ff ff       	callq  10e0 <fputc@plt>
    2d12:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    2d17:	e8 74 e4 ff ff       	callq  1190 <exit@plt>
    2d1c:	80 65 ff fe          	andb   $0xfe,-0x1(%rbp)
    2d20:	eb 40                	jmp    2d62 <get_string+0x240>
    2d22:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2d26:	0f b6 00             	movzbl (%rax),%eax
    2d29:	3c 22                	cmp    $0x22,%al
    2d2b:	75 0f                	jne    2d3c <get_string+0x21a>
    2d2d:	80 4d ff 04          	orb    $0x4,-0x1(%rbp)
    2d31:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
    2d36:	83 6d cc 01          	subl   $0x1,-0x34(%rbp)
    2d3a:	eb 39                	jmp    2d75 <get_string+0x253>
    2d3c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2d40:	0f b6 00             	movzbl (%rax),%eax
    2d43:	3c 5c                	cmp    $0x5c,%al
    2d45:	75 06                	jne    2d4d <get_string+0x22b>
    2d47:	80 4d ff 01          	orb    $0x1,-0x1(%rbp)
    2d4b:	eb 15                	jmp    2d62 <get_string+0x240>
    2d4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2d51:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2d55:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2d59:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    2d5d:	0f b6 12             	movzbl (%rdx),%edx
    2d60:	88 10                	mov    %dl,(%rax)
    2d62:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
    2d67:	83 6d cc 01          	subl   $0x1,-0x34(%rbp)
    2d6b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    2d6f:	0f 85 3b fe ff ff    	jne    2bb0 <get_string+0x8e>
    2d75:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
    2d79:	83 e0 02             	and    $0x2,%eax
    2d7c:	85 c0                	test   %eax,%eax
    2d7e:	74 7f                	je     2dff <get_string+0x2dd>
    2d80:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
    2d84:	83 e0 04             	and    $0x4,%eax
    2d87:	85 c0                	test   %eax,%eax
    2d89:	75 7b                	jne    2e06 <get_string+0x2e4>
    2d8b:	48 8b 05 ee 64 00 00 	mov    0x64ee(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    2d92:	48 89 c7             	mov    %rax,%rdi
    2d95:	e8 b6 e3 ff ff       	callq  1150 <fflush@plt>
    2d9a:	48 8b 05 ff 64 00 00 	mov    0x64ff(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2da1:	b9 c9 02 00 00       	mov    $0x2c9,%ecx
    2da6:	48 8d 15 8b 38 00 00 	lea    0x388b(%rip),%rdx        # 6638 <__func__.4651>
    2dad:	48 8d 35 e4 32 00 00 	lea    0x32e4(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    2db4:	48 89 c7             	mov    %rax,%rdi
    2db7:	b8 00 00 00 00       	mov    $0x0,%eax
    2dbc:	e8 4f e3 ff ff       	callq  1110 <fprintf@plt>
    2dc1:	48 8b 05 d8 64 00 00 	mov    0x64d8(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2dc8:	48 89 c1             	mov    %rax,%rcx
    2dcb:	ba 13 00 00 00       	mov    $0x13,%edx
    2dd0:	be 01 00 00 00       	mov    $0x1,%esi
    2dd5:	48 8d 3d f4 33 00 00 	lea    0x33f4(%rip),%rdi        # 61d0 <_IO_stdin_used+0x1d0>
    2ddc:	e8 bf e3 ff ff       	callq  11a0 <fwrite@plt>
    2de1:	48 8b 05 b8 64 00 00 	mov    0x64b8(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2de8:	48 89 c6             	mov    %rax,%rsi
    2deb:	bf 0a 00 00 00       	mov    $0xa,%edi
    2df0:	e8 eb e2 ff ff       	callq  10e0 <fputc@plt>
    2df5:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    2dfa:	e8 91 e3 ff ff       	callq  1190 <exit@plt>
    2dff:	b8 00 00 00 00       	mov    $0x0,%eax
    2e04:	eb 2e                	jmp    2e34 <get_string+0x312>
    2e06:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2e0a:	c6 00 03             	movb   $0x3,(%rax)
    2e0d:	0f b7 05 be 64 00 00 	movzwl 0x64be(%rip),%eax        # 92d2 <stridx>
    2e14:	8d 50 ff             	lea    -0x1(%rax),%edx
    2e17:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2e1b:	66 89 50 02          	mov    %dx,0x2(%rax)
    2e1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2e23:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2e27:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2e2b:	c6 00 00             	movb   $0x0,(%rax)
    2e2e:	8b 45 ec             	mov    -0x14(%rbp),%eax
    2e31:	2b 45 cc             	sub    -0x34(%rbp),%eax
    2e34:	c9                   	leaveq 
    2e35:	c3                   	retq   

0000000000002e36 <get_id>:
    2e36:	55                   	push   %rbp
    2e37:	48 89 e5             	mov    %rsp,%rbp
    2e3a:	48 83 ec 20          	sub    $0x20,%rsp
    2e3e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2e42:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    2e45:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2e48:	89 45 fc             	mov    %eax,-0x4(%rbp)
    2e4b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    2e4f:	74 28                	je     2e79 <get_id+0x43>
    2e51:	e8 5a e3 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    2e56:	48 8b 10             	mov    (%rax),%rdx
    2e59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2e5d:	0f b6 00             	movzbl (%rax),%eax
    2e60:	48 0f be c0          	movsbq %al,%rax
    2e64:	48 01 c0             	add    %rax,%rax
    2e67:	48 01 d0             	add    %rdx,%rax
    2e6a:	0f b7 00             	movzwl (%rax),%eax
    2e6d:	0f b7 c0             	movzwl %ax,%eax
    2e70:	25 00 08 00 00       	and    $0x800,%eax
    2e75:	85 c0                	test   %eax,%eax
    2e77:	74 10                	je     2e89 <get_id+0x53>
    2e79:	b8 00 00 00 00       	mov    $0x0,%eax
    2e7e:	eb 79                	jmp    2ef9 <get_id+0xc3>
    2e80:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    2e85:	83 6d e4 01          	subl   $0x1,-0x1c(%rbp)
    2e89:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    2e8d:	74 64                	je     2ef3 <get_id+0xbd>
    2e8f:	e8 1c e3 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    2e94:	48 8b 10             	mov    (%rax),%rdx
    2e97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2e9b:	0f b6 00             	movzbl (%rax),%eax
    2e9e:	48 0f be c0          	movsbq %al,%rax
    2ea2:	48 01 c0             	add    %rax,%rax
    2ea5:	48 01 d0             	add    %rdx,%rax
    2ea8:	0f b7 00             	movzwl (%rax),%eax
    2eab:	0f b7 c0             	movzwl %ax,%eax
    2eae:	83 e0 08             	and    $0x8,%eax
    2eb1:	85 c0                	test   %eax,%eax
    2eb3:	75 cb                	jne    2e80 <get_id+0x4a>
    2eb5:	e8 f6 e2 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    2eba:	48 8b 10             	mov    (%rax),%rdx
    2ebd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2ec1:	0f b6 00             	movzbl (%rax),%eax
    2ec4:	48 0f be c0          	movsbq %al,%rax
    2ec8:	48 01 c0             	add    %rax,%rax
    2ecb:	48 01 d0             	add    %rdx,%rax
    2ece:	0f b7 00             	movzwl (%rax),%eax
    2ed1:	0f b7 c0             	movzwl %ax,%eax
    2ed4:	25 00 08 00 00       	and    $0x800,%eax
    2ed9:	85 c0                	test   %eax,%eax
    2edb:	75 a3                	jne    2e80 <get_id+0x4a>
    2edd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2ee1:	0f b6 00             	movzbl (%rax),%eax
    2ee4:	3c 5f                	cmp    $0x5f,%al
    2ee6:	74 98                	je     2e80 <get_id+0x4a>
    2ee8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2eec:	0f b6 00             	movzbl (%rax),%eax
    2eef:	3c 2e                	cmp    $0x2e,%al
    2ef1:	74 8d                	je     2e80 <get_id+0x4a>
    2ef3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2ef6:	2b 45 e4             	sub    -0x1c(%rbp),%eax
    2ef9:	c9                   	leaveq 
    2efa:	c3                   	retq   

0000000000002efb <get_label>:
    2efb:	55                   	push   %rbp
    2efc:	48 89 e5             	mov    %rsp,%rbp
    2eff:	48 83 ec 40          	sub    $0x40,%rsp
    2f03:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    2f07:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    2f0b:	89 55 cc             	mov    %edx,-0x34(%rbp)
    2f0e:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2f11:	89 45 f8             	mov    %eax,-0x8(%rbp)
    2f14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    2f1b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    2f1f:	75 0a                	jne    2f2b <get_label+0x30>
    2f21:	b8 00 00 00 00       	mov    $0x0,%eax
    2f26:	e9 71 01 00 00       	jmpq   309c <get_label+0x1a1>
    2f2b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2f2f:	0f b6 00             	movzbl (%rax),%eax
    2f32:	3c 40                	cmp    $0x40,%al
    2f34:	0f 85 87 00 00 00    	jne    2fc1 <get_label+0xc6>
    2f3a:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
    2f3f:	83 6d cc 01          	subl   $0x1,-0x34(%rbp)
    2f43:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    2f47:	75 74                	jne    2fbd <get_label+0xc2>
    2f49:	48 8b 05 30 63 00 00 	mov    0x6330(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    2f50:	48 89 c7             	mov    %rax,%rdi
    2f53:	e8 f8 e1 ff ff       	callq  1150 <fflush@plt>
    2f58:	48 8b 05 41 63 00 00 	mov    0x6341(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2f5f:	b9 25 03 00 00       	mov    $0x325,%ecx
    2f64:	48 8d 15 dd 36 00 00 	lea    0x36dd(%rip),%rdx        # 6648 <__func__.4675>
    2f6b:	48 8d 35 26 31 00 00 	lea    0x3126(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    2f72:	48 89 c7             	mov    %rax,%rdi
    2f75:	b8 00 00 00 00       	mov    $0x0,%eax
    2f7a:	e8 91 e1 ff ff       	callq  1110 <fprintf@plt>
    2f7f:	48 8b 05 1a 63 00 00 	mov    0x631a(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2f86:	48 89 c1             	mov    %rax,%rcx
    2f89:	ba 0f 00 00 00       	mov    $0xf,%edx
    2f8e:	be 01 00 00 00       	mov    $0x1,%esi
    2f93:	48 8d 3d 9e 33 00 00 	lea    0x339e(%rip),%rdi        # 6338 <_IO_stdin_used+0x338>
    2f9a:	e8 01 e2 ff ff       	callq  11a0 <fwrite@plt>
    2f9f:	48 8b 05 fa 62 00 00 	mov    0x62fa(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    2fa6:	48 89 c6             	mov    %rax,%rsi
    2fa9:	bf 0a 00 00 00       	mov    $0xa,%edi
    2fae:	e8 2d e1 ff ff       	callq  10e0 <fputc@plt>
    2fb3:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    2fb8:	e8 d3 e1 ff ff       	callq  1190 <exit@plt>
    2fbd:	83 4d fc 01          	orl    $0x1,-0x4(%rbp)
    2fc1:	e8 ea e1 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    2fc6:	48 8b 10             	mov    (%rax),%rdx
    2fc9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2fcd:	0f b6 00             	movzbl (%rax),%eax
    2fd0:	48 0f be c0          	movsbq %al,%rax
    2fd4:	48 01 c0             	add    %rax,%rax
    2fd7:	48 01 d0             	add    %rdx,%rax
    2fda:	0f b7 00             	movzwl (%rax),%eax
    2fdd:	0f b7 c0             	movzwl %ax,%eax
    2fe0:	25 00 08 00 00       	and    $0x800,%eax
    2fe5:	85 c0                	test   %eax,%eax
    2fe7:	74 0a                	je     2ff3 <get_label+0xf8>
    2fe9:	b8 00 00 00 00       	mov    $0x0,%eax
    2fee:	e9 a9 00 00 00       	jmpq   309c <get_label+0x1a1>
    2ff3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2ff7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    2ffb:	eb 09                	jmp    3006 <get_label+0x10b>
    2ffd:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
    3002:	83 6d cc 01          	subl   $0x1,-0x34(%rbp)
    3006:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    300a:	74 31                	je     303d <get_label+0x142>
    300c:	e8 9f e1 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    3011:	48 8b 10             	mov    (%rax),%rdx
    3014:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3018:	0f b6 00             	movzbl (%rax),%eax
    301b:	48 0f be c0          	movsbq %al,%rax
    301f:	48 01 c0             	add    %rax,%rax
    3022:	48 01 d0             	add    %rdx,%rax
    3025:	0f b7 00             	movzwl (%rax),%eax
    3028:	0f b7 c0             	movzwl %ax,%eax
    302b:	83 e0 08             	and    $0x8,%eax
    302e:	85 c0                	test   %eax,%eax
    3030:	75 cb                	jne    2ffd <get_label+0x102>
    3032:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3036:	0f b6 00             	movzbl (%rax),%eax
    3039:	3c 5f                	cmp    $0x5f,%al
    303b:	74 c0                	je     2ffd <get_label+0x102>
    303d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3041:	48 2b 45 f0          	sub    -0x10(%rbp),%rax
    3045:	89 45 ec             	mov    %eax,-0x14(%rbp)
    3048:	8b 45 ec             	mov    -0x14(%rbp),%eax
    304b:	0f b7 d0             	movzwl %ax,%edx
    304e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3052:	89 d6                	mov    %edx,%esi
    3054:	48 89 c7             	mov    %rax,%rdi
    3057:	e8 67 eb ff ff       	callq  1bc3 <sym_get>
    305c:	48 89 c2             	mov    %rax,%rdx
    305f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3063:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3067:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    306b:	48 8b 40 08          	mov    0x8(%rax),%rax
    306f:	c6 40 05 00          	movb   $0x0,0x5(%rax)
    3073:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3077:	c6 00 02             	movb   $0x2,(%rax)
    307a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    307d:	83 e0 01             	and    $0x1,%eax
    3080:	85 c0                	test   %eax,%eax
    3082:	74 07                	je     308b <get_label+0x190>
    3084:	ba 05 00 00 00       	mov    $0x5,%edx
    3089:	eb 05                	jmp    3090 <get_label+0x195>
    308b:	ba 04 00 00 00       	mov    $0x4,%edx
    3090:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3094:	88 10                	mov    %dl,(%rax)
    3096:	8b 45 f8             	mov    -0x8(%rbp),%eax
    3099:	2b 45 cc             	sub    -0x34(%rbp),%eax
    309c:	c9                   	leaveq 
    309d:	c3                   	retq   

000000000000309e <getarg>:
    309e:	55                   	push   %rbp
    309f:	48 89 e5             	mov    %rsp,%rbp
    30a2:	48 83 ec 40          	sub    $0x40,%rsp
    30a6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    30aa:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    30ae:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    30b2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    30b9:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    30c0:	00 
    30c1:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
    30c8:	00 
    30c9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    30cd:	8b 10                	mov    (%rax),%edx
    30cf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    30d3:	48 8b 00             	mov    (%rax),%rax
    30d6:	89 d6                	mov    %edx,%esi
    30d8:	48 89 c7             	mov    %rax,%rdi
    30db:	e8 86 f7 ff ff       	callq  2866 <skip_space>
    30e0:	89 c2                	mov    %eax,%edx
    30e2:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    30e6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    30ea:	48 89 ce             	mov    %rcx,%rsi
    30ed:	48 89 c7             	mov    %rax,%rdi
    30f0:	e8 48 f4 ff ff       	callq  253d <advance>
    30f5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    30f9:	8b 00                	mov    (%rax),%eax
    30fb:	85 c0                	test   %eax,%eax
    30fd:	74 1c                	je     311b <getarg+0x7d>
    30ff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3103:	48 8b 00             	mov    (%rax),%rax
    3106:	0f b6 00             	movzbl (%rax),%eax
    3109:	3c 0a                	cmp    $0xa,%al
    310b:	74 0e                	je     311b <getarg+0x7d>
    310d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3111:	48 8b 00             	mov    (%rax),%rax
    3114:	0f b6 00             	movzbl (%rax),%eax
    3117:	3c 23                	cmp    $0x23,%al
    3119:	75 0a                	jne    3125 <getarg+0x87>
    311b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3120:	e9 61 06 00 00       	jmpq   3786 <getarg+0x6e8>
    3125:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3129:	8b 10                	mov    (%rax),%edx
    312b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    312f:	48 8b 08             	mov    (%rax),%rcx
    3132:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3136:	48 89 ce             	mov    %rcx,%rsi
    3139:	48 89 c7             	mov    %rax,%rdi
    313c:	e8 e1 f9 ff ff       	callq  2b22 <get_string>
    3141:	89 45 ec             	mov    %eax,-0x14(%rbp)
    3144:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    3148:	74 1b                	je     3165 <getarg+0xc7>
    314a:	8b 55 ec             	mov    -0x14(%rbp),%edx
    314d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3151:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3155:	48 89 ce             	mov    %rcx,%rsi
    3158:	48 89 c7             	mov    %rax,%rdi
    315b:	e8 dd f3 ff ff       	callq  253d <advance>
    3160:	e9 f0 05 00 00       	jmpq   3755 <getarg+0x6b7>
    3165:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3169:	8b 00                	mov    (%rax),%eax
    316b:	83 f8 02             	cmp    $0x2,%eax
    316e:	7e 67                	jle    31d7 <getarg+0x139>
    3170:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3174:	48 8b 00             	mov    (%rax),%rax
    3177:	0f b6 00             	movzbl (%rax),%eax
    317a:	3c 27                	cmp    $0x27,%al
    317c:	75 59                	jne    31d7 <getarg+0x139>
    317e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3182:	48 8b 00             	mov    (%rax),%rax
    3185:	48 83 c0 02          	add    $0x2,%rax
    3189:	0f b6 00             	movzbl (%rax),%eax
    318c:	3c 27                	cmp    $0x27,%al
    318e:	75 47                	jne    31d7 <getarg+0x139>
    3190:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3194:	c6 00 02             	movb   $0x2,(%rax)
    3197:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    319b:	48 8b 00             	mov    (%rax),%rax
    319e:	48 83 c0 01          	add    $0x1,%rax
    31a2:	0f b6 00             	movzbl (%rax),%eax
    31a5:	66 0f be d0          	movsbw %al,%dx
    31a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    31ad:	66 89 50 02          	mov    %dx,0x2(%rax)
    31b1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    31b5:	48 8b 00             	mov    (%rax),%rax
    31b8:	48 8d 50 03          	lea    0x3(%rax),%rdx
    31bc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    31c0:	48 89 10             	mov    %rdx,(%rax)
    31c3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    31c7:	8b 00                	mov    (%rax),%eax
    31c9:	8d 50 fd             	lea    -0x3(%rax),%edx
    31cc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    31d0:	89 10                	mov    %edx,(%rax)
    31d2:	e9 7e 05 00 00       	jmpq   3755 <getarg+0x6b7>
    31d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    31db:	48 8b 00             	mov    (%rax),%rax
    31de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    31e2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    31e6:	8b 00                	mov    (%rax),%eax
    31e8:	89 45 ec             	mov    %eax,-0x14(%rbp)
    31eb:	eb 09                	jmp    31f6 <getarg+0x158>
    31ed:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    31f2:	83 6d ec 01          	subl   $0x1,-0x14(%rbp)
    31f6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    31fa:	74 26                	je     3222 <getarg+0x184>
    31fc:	e8 af df ff ff       	callq  11b0 <__ctype_b_loc@plt>
    3201:	48 8b 10             	mov    (%rax),%rdx
    3204:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3208:	0f b6 00             	movzbl (%rax),%eax
    320b:	48 0f be c0          	movsbq %al,%rax
    320f:	48 01 c0             	add    %rax,%rax
    3212:	48 01 d0             	add    %rdx,%rax
    3215:	0f b7 00             	movzwl (%rax),%eax
    3218:	0f b7 c0             	movzwl %ax,%eax
    321b:	83 e0 08             	and    $0x8,%eax
    321e:	85 c0                	test   %eax,%eax
    3220:	75 cb                	jne    31ed <getarg+0x14f>
    3222:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3226:	48 8b 00             	mov    (%rax),%rax
    3229:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    322d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3231:	8b 00                	mov    (%rax),%eax
    3233:	2b 45 ec             	sub    -0x14(%rbp),%eax
    3236:	89 45 ec             	mov    %eax,-0x14(%rbp)
    3239:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
    323d:	0f 8e de 01 00 00    	jle    3421 <getarg+0x383>
    3243:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
    3247:	0f 8f d4 01 00 00    	jg     3421 <getarg+0x383>
    324d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3251:	0f b6 00             	movzbl (%rax),%eax
    3254:	3c 73                	cmp    $0x73,%al
    3256:	75 22                	jne    327a <getarg+0x1dc>
    3258:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    325c:	48 83 c0 01          	add    $0x1,%rax
    3260:	0f b6 00             	movzbl (%rax),%eax
    3263:	3c 70                	cmp    $0x70,%al
    3265:	75 13                	jne    327a <getarg+0x1dc>
    3267:	83 4d fc 02          	orl    $0x2,-0x4(%rbp)
    326b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    326f:	66 c7 40 02 0d 00    	movw   $0xd,0x2(%rax)
    3275:	e9 a7 01 00 00       	jmpq   3421 <getarg+0x383>
    327a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    327e:	0f b6 00             	movzbl (%rax),%eax
    3281:	3c 6c                	cmp    $0x6c,%al
    3283:	75 22                	jne    32a7 <getarg+0x209>
    3285:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3289:	48 83 c0 01          	add    $0x1,%rax
    328d:	0f b6 00             	movzbl (%rax),%eax
    3290:	3c 72                	cmp    $0x72,%al
    3292:	75 13                	jne    32a7 <getarg+0x209>
    3294:	83 4d fc 02          	orl    $0x2,-0x4(%rbp)
    3298:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    329c:	66 c7 40 02 0e 00    	movw   $0xe,0x2(%rax)
    32a2:	e9 7a 01 00 00       	jmpq   3421 <getarg+0x383>
    32a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    32ab:	0f b6 00             	movzbl (%rax),%eax
    32ae:	3c 70                	cmp    $0x70,%al
    32b0:	75 22                	jne    32d4 <getarg+0x236>
    32b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    32b6:	48 83 c0 01          	add    $0x1,%rax
    32ba:	0f b6 00             	movzbl (%rax),%eax
    32bd:	3c 63                	cmp    $0x63,%al
    32bf:	75 13                	jne    32d4 <getarg+0x236>
    32c1:	83 4d fc 02          	orl    $0x2,-0x4(%rbp)
    32c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    32c9:	66 c7 40 02 0f 00    	movw   $0xf,0x2(%rax)
    32cf:	e9 4d 01 00 00       	jmpq   3421 <getarg+0x383>
    32d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    32d8:	0f b6 00             	movzbl (%rax),%eax
    32db:	3c 72                	cmp    $0x72,%al
    32dd:	0f 85 3e 01 00 00    	jne    3421 <getarg+0x383>
    32e3:	e8 c8 de ff ff       	callq  11b0 <__ctype_b_loc@plt>
    32e8:	48 8b 00             	mov    (%rax),%rax
    32eb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    32ef:	48 83 c2 01          	add    $0x1,%rdx
    32f3:	0f b6 12             	movzbl (%rdx),%edx
    32f6:	48 0f be d2          	movsbq %dl,%rdx
    32fa:	48 01 d2             	add    %rdx,%rdx
    32fd:	48 01 d0             	add    %rdx,%rax
    3300:	0f b7 00             	movzwl (%rax),%eax
    3303:	0f b7 c0             	movzwl %ax,%eax
    3306:	25 00 08 00 00       	and    $0x800,%eax
    330b:	85 c0                	test   %eax,%eax
    330d:	0f 84 4b 01 00 00    	je     345e <getarg+0x3c0>
    3313:	83 7d ec 03          	cmpl   $0x3,-0x14(%rbp)
    3317:	75 6a                	jne    3383 <getarg+0x2e5>
    3319:	e8 92 de ff ff       	callq  11b0 <__ctype_b_loc@plt>
    331e:	48 8b 00             	mov    (%rax),%rax
    3321:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    3325:	48 83 c2 02          	add    $0x2,%rdx
    3329:	0f b6 12             	movzbl (%rdx),%edx
    332c:	48 0f be d2          	movsbq %dl,%rdx
    3330:	48 01 d2             	add    %rdx,%rdx
    3333:	48 01 d0             	add    %rdx,%rax
    3336:	0f b7 00             	movzwl (%rax),%eax
    3339:	0f b7 c0             	movzwl %ax,%eax
    333c:	25 00 08 00 00       	and    $0x800,%eax
    3341:	85 c0                	test   %eax,%eax
    3343:	0f 84 18 01 00 00    	je     3461 <getarg+0x3c3>
    3349:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    334d:	48 83 c0 01          	add    $0x1,%rax
    3351:	0f b6 00             	movzbl (%rax),%eax
    3354:	0f be c0             	movsbl %al,%eax
    3357:	83 e8 30             	sub    $0x30,%eax
    335a:	89 c2                	mov    %eax,%edx
    335c:	89 d0                	mov    %edx,%eax
    335e:	c1 e0 02             	shl    $0x2,%eax
    3361:	01 d0                	add    %edx,%eax
    3363:	01 c0                	add    %eax,%eax
    3365:	89 c2                	mov    %eax,%edx
    3367:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    336b:	48 83 c0 02          	add    $0x2,%rax
    336f:	0f b6 00             	movzbl (%rax),%eax
    3372:	66 98                	cbtw   
    3374:	01 d0                	add    %edx,%eax
    3376:	8d 50 d0             	lea    -0x30(%rax),%edx
    3379:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    337d:	66 89 50 02          	mov    %dx,0x2(%rax)
    3381:	eb 18                	jmp    339b <getarg+0x2fd>
    3383:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3387:	48 83 c0 01          	add    $0x1,%rax
    338b:	0f b6 00             	movzbl (%rax),%eax
    338e:	66 98                	cbtw   
    3390:	8d 50 d0             	lea    -0x30(%rax),%edx
    3393:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3397:	66 89 50 02          	mov    %dx,0x2(%rax)
    339b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    339f:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    33a3:	66 83 f8 0f          	cmp    $0xf,%ax
    33a7:	76 74                	jbe    341d <getarg+0x37f>
    33a9:	48 8b 05 d0 5e 00 00 	mov    0x5ed0(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    33b0:	48 89 c7             	mov    %rax,%rdi
    33b3:	e8 98 dd ff ff       	callq  1150 <fflush@plt>
    33b8:	48 8b 05 e1 5e 00 00 	mov    0x5ee1(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    33bf:	b9 8c 03 00 00       	mov    $0x38c,%ecx
    33c4:	48 8d 15 87 32 00 00 	lea    0x3287(%rip),%rdx        # 6652 <__func__.4694>
    33cb:	48 8d 35 c6 2c 00 00 	lea    0x2cc6(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    33d2:	48 89 c7             	mov    %rax,%rdi
    33d5:	b8 00 00 00 00       	mov    $0x0,%eax
    33da:	e8 31 dd ff ff       	callq  1110 <fprintf@plt>
    33df:	48 8b 05 ba 5e 00 00 	mov    0x5eba(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    33e6:	48 89 c1             	mov    %rax,%rcx
    33e9:	ba 17 00 00 00       	mov    $0x17,%edx
    33ee:	be 01 00 00 00       	mov    $0x1,%esi
    33f3:	48 8d 3d 6f 2d 00 00 	lea    0x2d6f(%rip),%rdi        # 6169 <_IO_stdin_used+0x169>
    33fa:	e8 a1 dd ff ff       	callq  11a0 <fwrite@plt>
    33ff:	48 8b 05 9a 5e 00 00 	mov    0x5e9a(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    3406:	48 89 c6             	mov    %rax,%rsi
    3409:	bf 0a 00 00 00       	mov    $0xa,%edi
    340e:	e8 cd dc ff ff       	callq  10e0 <fputc@plt>
    3413:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    3418:	e8 73 dd ff ff       	callq  1190 <exit@plt>
    341d:	83 4d fc 02          	orl    $0x2,-0x4(%rbp)
    3421:	8b 45 fc             	mov    -0x4(%rbp),%eax
    3424:	83 e0 02             	and    $0x2,%eax
    3427:	85 c0                	test   %eax,%eax
    3429:	74 37                	je     3462 <getarg+0x3c4>
    342b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    342f:	8b 00                	mov    (%rax),%eax
    3431:	2b 45 ec             	sub    -0x14(%rbp),%eax
    3434:	89 c2                	mov    %eax,%edx
    3436:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    343a:	89 10                	mov    %edx,(%rax)
    343c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3440:	48 8b 10             	mov    (%rax),%rdx
    3443:	8b 45 ec             	mov    -0x14(%rbp),%eax
    3446:	48 98                	cltq   
    3448:	48 01 c2             	add    %rax,%rdx
    344b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    344f:	48 89 10             	mov    %rdx,(%rax)
    3452:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3456:	c6 00 01             	movb   $0x1,(%rax)
    3459:	e9 f7 02 00 00       	jmpq   3755 <getarg+0x6b7>
    345e:	90                   	nop
    345f:	eb 01                	jmp    3462 <getarg+0x3c4>
    3461:	90                   	nop
    3462:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3466:	8b 10                	mov    (%rax),%edx
    3468:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    346c:	48 8b 08             	mov    (%rax),%rcx
    346f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3473:	48 89 ce             	mov    %rcx,%rsi
    3476:	48 89 c7             	mov    %rax,%rdi
    3479:	e8 92 f4 ff ff       	callq  2910 <get_reglist>
    347e:	89 45 ec             	mov    %eax,-0x14(%rbp)
    3481:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    3485:	7e 1b                	jle    34a2 <getarg+0x404>
    3487:	8b 55 ec             	mov    -0x14(%rbp),%edx
    348a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    348e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3492:	48 89 ce             	mov    %rcx,%rsi
    3495:	48 89 c7             	mov    %rax,%rdi
    3498:	e8 a0 f0 ff ff       	callq  253d <advance>
    349d:	e9 b3 02 00 00       	jmpq   3755 <getarg+0x6b7>
    34a2:	e8 09 dd ff ff       	callq  11b0 <__ctype_b_loc@plt>
    34a7:	48 8b 10             	mov    (%rax),%rdx
    34aa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    34ae:	48 8b 00             	mov    (%rax),%rax
    34b1:	0f b6 00             	movzbl (%rax),%eax
    34b4:	48 0f be c0          	movsbq %al,%rax
    34b8:	48 01 c0             	add    %rax,%rax
    34bb:	48 01 d0             	add    %rdx,%rax
    34be:	0f b7 00             	movzwl (%rax),%eax
    34c1:	0f b7 c0             	movzwl %ax,%eax
    34c4:	25 00 08 00 00       	and    $0x800,%eax
    34c9:	85 c0                	test   %eax,%eax
    34cb:	0f 84 30 02 00 00    	je     3701 <getarg+0x663>
    34d1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    34d5:	48 8b 10             	mov    (%rax),%rdx
    34d8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    34dc:	8b 00                	mov    (%rax),%eax
    34de:	48 98                	cltq   
    34e0:	48 01 d0             	add    %rdx,%rax
    34e3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    34e7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    34eb:	8b 00                	mov    (%rax),%eax
    34ed:	83 f8 02             	cmp    $0x2,%eax
    34f0:	0f 8e 25 01 00 00    	jle    361b <getarg+0x57d>
    34f6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    34fa:	48 8b 00             	mov    (%rax),%rax
    34fd:	0f b6 00             	movzbl (%rax),%eax
    3500:	3c 30                	cmp    $0x30,%al
    3502:	0f 85 13 01 00 00    	jne    361b <getarg+0x57d>
    3508:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    350c:	48 8b 00             	mov    (%rax),%rax
    350f:	48 83 c0 01          	add    $0x1,%rax
    3513:	0f b6 00             	movzbl (%rax),%eax
    3516:	0f be c0             	movsbl %al,%eax
    3519:	83 f8 6f             	cmp    $0x6f,%eax
    351c:	74 36                	je     3554 <getarg+0x4b6>
    351e:	83 f8 78             	cmp    $0x78,%eax
    3521:	74 07                	je     352a <getarg+0x48c>
    3523:	83 f8 62             	cmp    $0x62,%eax
    3526:	74 56                	je     357e <getarg+0x4e0>
    3528:	eb 7b                	jmp    35a5 <getarg+0x507>
    352a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    352e:	48 8b 00             	mov    (%rax),%rax
    3531:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
    3535:	ba 10 00 00 00       	mov    $0x10,%edx
    353a:	48 89 ce             	mov    %rcx,%rsi
    353d:	48 89 c7             	mov    %rax,%rdi
    3540:	e8 db db ff ff       	callq  1120 <strtol@plt>
    3545:	89 c2                	mov    %eax,%edx
    3547:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    354b:	66 89 50 02          	mov    %dx,0x2(%rax)
    354f:	e9 c5 00 00 00       	jmpq   3619 <getarg+0x57b>
    3554:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3558:	48 8b 00             	mov    (%rax),%rax
    355b:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
    355f:	ba 08 00 00 00       	mov    $0x8,%edx
    3564:	48 89 ce             	mov    %rcx,%rsi
    3567:	48 89 c7             	mov    %rax,%rdi
    356a:	e8 b1 db ff ff       	callq  1120 <strtol@plt>
    356f:	89 c2                	mov    %eax,%edx
    3571:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3575:	66 89 50 02          	mov    %dx,0x2(%rax)
    3579:	e9 9b 00 00 00       	jmpq   3619 <getarg+0x57b>
    357e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3582:	48 8b 00             	mov    (%rax),%rax
    3585:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
    3589:	ba 02 00 00 00       	mov    $0x2,%edx
    358e:	48 89 ce             	mov    %rcx,%rsi
    3591:	48 89 c7             	mov    %rax,%rdi
    3594:	e8 87 db ff ff       	callq  1120 <strtol@plt>
    3599:	89 c2                	mov    %eax,%edx
    359b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    359f:	66 89 50 02          	mov    %dx,0x2(%rax)
    35a3:	eb 74                	jmp    3619 <getarg+0x57b>
    35a5:	48 8b 05 d4 5c 00 00 	mov    0x5cd4(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    35ac:	48 89 c7             	mov    %rax,%rdi
    35af:	e8 9c db ff ff       	callq  1150 <fflush@plt>
    35b4:	48 8b 05 e5 5c 00 00 	mov    0x5ce5(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    35bb:	b9 b3 03 00 00       	mov    $0x3b3,%ecx
    35c0:	48 8d 15 8b 30 00 00 	lea    0x308b(%rip),%rdx        # 6652 <__func__.4694>
    35c7:	48 8d 35 ca 2a 00 00 	lea    0x2aca(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    35ce:	48 89 c7             	mov    %rax,%rdi
    35d1:	b8 00 00 00 00       	mov    $0x0,%eax
    35d6:	e8 35 db ff ff       	callq  1110 <fprintf@plt>
    35db:	48 8b 05 be 5c 00 00 	mov    0x5cbe(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    35e2:	48 89 c1             	mov    %rax,%rcx
    35e5:	ba 0f 00 00 00       	mov    $0xf,%edx
    35ea:	be 01 00 00 00       	mov    $0x1,%esi
    35ef:	48 8d 3d 52 2d 00 00 	lea    0x2d52(%rip),%rdi        # 6348 <_IO_stdin_used+0x348>
    35f6:	e8 a5 db ff ff       	callq  11a0 <fwrite@plt>
    35fb:	48 8b 05 9e 5c 00 00 	mov    0x5c9e(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    3602:	48 89 c6             	mov    %rax,%rsi
    3605:	bf 0a 00 00 00       	mov    $0xa,%edi
    360a:	e8 d1 da ff ff       	callq  10e0 <fputc@plt>
    360f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    3614:	e8 77 db ff ff       	callq  1190 <exit@plt>
    3619:	eb 25                	jmp    3640 <getarg+0x5a2>
    361b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    361f:	48 8b 00             	mov    (%rax),%rax
    3622:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
    3626:	ba 0a 00 00 00       	mov    $0xa,%edx
    362b:	48 89 ce             	mov    %rcx,%rsi
    362e:	48 89 c7             	mov    %rax,%rdi
    3631:	e8 ea da ff ff       	callq  1120 <strtol@plt>
    3636:	89 c2                	mov    %eax,%edx
    3638:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    363c:	66 89 50 02          	mov    %dx,0x2(%rax)
    3640:	e8 fb d9 ff ff       	callq  1040 <__errno_location@plt>
    3645:	8b 00                	mov    (%rax),%eax
    3647:	85 c0                	test   %eax,%eax
    3649:	75 09                	jne    3654 <getarg+0x5b6>
    364b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    364f:	48 85 c0             	test   %rax,%rax
    3652:	75 74                	jne    36c8 <getarg+0x62a>
    3654:	48 8b 05 25 5c 00 00 	mov    0x5c25(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    365b:	48 89 c7             	mov    %rax,%rdi
    365e:	e8 ed da ff ff       	callq  1150 <fflush@plt>
    3663:	48 8b 05 36 5c 00 00 	mov    0x5c36(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    366a:	b9 b9 03 00 00       	mov    $0x3b9,%ecx
    366f:	48 8d 15 dc 2f 00 00 	lea    0x2fdc(%rip),%rdx        # 6652 <__func__.4694>
    3676:	48 8d 35 1b 2a 00 00 	lea    0x2a1b(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    367d:	48 89 c7             	mov    %rax,%rdi
    3680:	b8 00 00 00 00       	mov    $0x0,%eax
    3685:	e8 86 da ff ff       	callq  1110 <fprintf@plt>
    368a:	48 8b 05 0f 5c 00 00 	mov    0x5c0f(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    3691:	48 89 c1             	mov    %rax,%rcx
    3694:	ba 17 00 00 00       	mov    $0x17,%edx
    3699:	be 01 00 00 00       	mov    $0x1,%esi
    369e:	48 8d 3d 4a 2a 00 00 	lea    0x2a4a(%rip),%rdi        # 60ef <_IO_stdin_used+0xef>
    36a5:	e8 f6 da ff ff       	callq  11a0 <fwrite@plt>
    36aa:	48 8b 05 ef 5b 00 00 	mov    0x5bef(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    36b1:	48 89 c6             	mov    %rax,%rsi
    36b4:	bf 0a 00 00 00       	mov    $0xa,%edi
    36b9:	e8 22 da ff ff       	callq  10e0 <fputc@plt>
    36be:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    36c3:	e8 c8 da ff ff       	callq  1190 <exit@plt>
    36c8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    36cc:	8b 00                	mov    (%rax),%eax
    36ce:	89 c1                	mov    %eax,%ecx
    36d0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    36d4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    36d8:	48 8b 00             	mov    (%rax),%rax
    36db:	48 29 c2             	sub    %rax,%rdx
    36de:	48 89 d0             	mov    %rdx,%rax
    36e1:	29 c1                	sub    %eax,%ecx
    36e3:	89 c8                	mov    %ecx,%eax
    36e5:	89 c2                	mov    %eax,%edx
    36e7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    36eb:	89 10                	mov    %edx,(%rax)
    36ed:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    36f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    36f5:	48 89 10             	mov    %rdx,(%rax)
    36f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    36fc:	c6 00 02             	movb   $0x2,(%rax)
    36ff:	eb 54                	jmp    3755 <getarg+0x6b7>
    3701:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3705:	8b 10                	mov    (%rax),%edx
    3707:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    370b:	48 8b 08             	mov    (%rax),%rcx
    370e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3712:	48 89 ce             	mov    %rcx,%rsi
    3715:	48 89 c7             	mov    %rax,%rdi
    3718:	e8 de f7 ff ff       	callq  2efb <get_label>
    371d:	89 45 ec             	mov    %eax,-0x14(%rbp)
    3720:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    3724:	74 18                	je     373e <getarg+0x6a0>
    3726:	8b 55 ec             	mov    -0x14(%rbp),%edx
    3729:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    372d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3731:	48 89 ce             	mov    %rcx,%rsi
    3734:	48 89 c7             	mov    %rax,%rdi
    3737:	e8 01 ee ff ff       	callq  253d <advance>
    373c:	eb 17                	jmp    3755 <getarg+0x6b7>
    373e:	90                   	nop
    373f:	48 8b 05 3a 5b 00 00 	mov    0x5b3a(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    3746:	48 89 c7             	mov    %rax,%rdi
    3749:	e8 02 da ff ff       	callq  1150 <fflush@plt>
    374e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3753:	eb 31                	jmp    3786 <getarg+0x6e8>
    3755:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3759:	8b 10                	mov    (%rax),%edx
    375b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    375f:	48 8b 00             	mov    (%rax),%rax
    3762:	89 d6                	mov    %edx,%esi
    3764:	48 89 c7             	mov    %rax,%rdi
    3767:	e8 8a f0 ff ff       	callq  27f6 <skip_next_comma>
    376c:	89 c2                	mov    %eax,%edx
    376e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    3772:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3776:	48 89 ce             	mov    %rcx,%rsi
    3779:	48 89 c7             	mov    %rax,%rdi
    377c:	e8 bc ed ff ff       	callq  253d <advance>
    3781:	b8 00 00 00 00       	mov    $0x0,%eax
    3786:	c9                   	leaveq 
    3787:	c3                   	retq   

0000000000003788 <opcode>:
    3788:	55                   	push   %rbp
    3789:	48 89 e5             	mov    %rsp,%rbp
    378c:	48 83 ec 20          	sub    $0x20,%rsp
    3790:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3794:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    3797:	48 8d 05 62 59 00 00 	lea    0x5962(%rip),%rax        # 9100 <opcode_map>
    379e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    37a2:	eb 3f                	jmp    37e3 <opcode+0x5b>
    37a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    37a8:	0f b6 40 08          	movzbl 0x8(%rax),%eax
    37ac:	0f b6 c0             	movzbl %al,%eax
    37af:	39 45 e4             	cmp    %eax,-0x1c(%rbp)
    37b2:	75 26                	jne    37da <opcode+0x52>
    37b4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    37b7:	48 63 d0             	movslq %eax,%rdx
    37ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    37be:	48 8b 08             	mov    (%rax),%rcx
    37c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    37c5:	48 89 ce             	mov    %rcx,%rsi
    37c8:	48 89 c7             	mov    %rax,%rdi
    37cb:	e8 30 d9 ff ff       	callq  1100 <memcmp@plt>
    37d0:	85 c0                	test   %eax,%eax
    37d2:	75 09                	jne    37dd <opcode+0x55>
    37d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    37d8:	eb 1a                	jmp    37f4 <opcode+0x6c>
    37da:	90                   	nop
    37db:	eb 01                	jmp    37de <opcode+0x56>
    37dd:	90                   	nop
    37de:	48 83 45 f8 10       	addq   $0x10,-0x8(%rbp)
    37e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    37e7:	48 8b 00             	mov    (%rax),%rax
    37ea:	48 85 c0             	test   %rax,%rax
    37ed:	75 b5                	jne    37a4 <opcode+0x1c>
    37ef:	b8 00 00 00 00       	mov    $0x0,%eax
    37f4:	c9                   	leaveq 
    37f5:	c3                   	retq   

00000000000037f6 <emit_inst>:
    37f6:	55                   	push   %rbp
    37f7:	48 89 e5             	mov    %rsp,%rbp
    37fa:	48 83 ec 30          	sub    $0x30,%rsp
    37fe:	89 f8                	mov    %edi,%eax
    3800:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    3804:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    3808:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    380c:	88 45 ec             	mov    %al,-0x14(%rbp)
    380f:	48 8d 05 ea 58 00 00 	lea    0x58ea(%rip),%rax        # 9100 <opcode_map>
    3816:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    381a:	eb 2c                	jmp    3848 <emit_inst+0x52>
    381c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3820:	0f b6 40 0a          	movzbl 0xa(%rax),%eax
    3824:	38 45 ec             	cmp    %al,-0x14(%rbp)
    3827:	75 1a                	jne    3843 <emit_inst+0x4d>
    3829:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    382d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3831:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
    3835:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3839:	48 89 c7             	mov    %rax,%rdi
    383c:	e8 34 00 00 00       	callq  3875 <do_emit_inst>
    3841:	eb 30                	jmp    3873 <emit_inst+0x7d>
    3843:	48 83 45 f8 10       	addq   $0x10,-0x8(%rbp)
    3848:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    384c:	48 8b 00             	mov    (%rax),%rax
    384f:	48 85 c0             	test   %rax,%rax
    3852:	75 c8                	jne    381c <emit_inst+0x26>
    3854:	48 8d 0d 05 2e 00 00 	lea    0x2e05(%rip),%rcx        # 6660 <__PRETTY_FUNCTION__.4725>
    385b:	ba 02 04 00 00       	mov    $0x402,%edx
    3860:	48 8d 35 49 28 00 00 	lea    0x2849(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3867:	48 8d 3d ea 2a 00 00 	lea    0x2aea(%rip),%rdi        # 6358 <_IO_stdin_used+0x358>
    386e:	e8 3d d8 ff ff       	callq  10b0 <__assert_fail@plt>
    3873:	c9                   	leaveq 
    3874:	c3                   	retq   

0000000000003875 <do_emit_inst>:
    3875:	55                   	push   %rbp
    3876:	48 89 e5             	mov    %rsp,%rbp
    3879:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
    387d:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
    3881:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
    3885:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
    3889:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
    388d:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
    3894:	00 
    3895:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    389c:	00 
    389d:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
    38a4:	00 
    38a5:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    38ac:	00 
    38ad:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
    38b4:	00 
    38b5:	66 c7 45 ae 00 00    	movw   $0x0,-0x52(%rbp)
    38bb:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    38bf:	0f b6 40 0a          	movzbl 0xa(%rax),%eax
    38c3:	3c 09                	cmp    $0x9,%al
    38c5:	0f 87 1b 01 00 00    	ja     39e6 <do_emit_inst+0x171>
    38cb:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    38cf:	0f b6 40 0a          	movzbl 0xa(%rax),%eax
    38d3:	83 e0 0f             	and    $0xf,%eax
    38d6:	83 e0 0f             	and    $0xf,%eax
    38d9:	89 c2                	mov    %eax,%edx
    38db:	0f b6 45 ae          	movzbl -0x52(%rbp),%eax
    38df:	83 e0 f0             	and    $0xfffffff0,%eax
    38e2:	09 d0                	or     %edx,%eax
    38e4:	88 45 ae             	mov    %al,-0x52(%rbp)
    38e7:	48 83 7d 90 00       	cmpq   $0x0,-0x70(%rbp)
    38ec:	0f 84 e4 00 00 00    	je     39d6 <do_emit_inst+0x161>
    38f2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    38f6:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    38fa:	0f b6 c0             	movzbl %al,%eax
    38fd:	83 e0 01             	and    $0x1,%eax
    3900:	85 c0                	test   %eax,%eax
    3902:	0f 84 ce 00 00 00    	je     39d6 <do_emit_inst+0x161>
    3908:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    390c:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    3910:	83 e0 0f             	and    $0xf,%eax
    3913:	c1 e0 04             	shl    $0x4,%eax
    3916:	89 c2                	mov    %eax,%edx
    3918:	0f b6 45 ae          	movzbl -0x52(%rbp),%eax
    391c:	83 e0 0f             	and    $0xf,%eax
    391f:	09 d0                	or     %edx,%eax
    3921:	88 45 ae             	mov    %al,-0x52(%rbp)
    3924:	48 83 7d 88 00       	cmpq   $0x0,-0x78(%rbp)
    3929:	0f 84 a7 00 00 00    	je     39d6 <do_emit_inst+0x161>
    392f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    3933:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    3937:	0f b6 c0             	movzbl %al,%eax
    393a:	83 e0 02             	and    $0x2,%eax
    393d:	85 c0                	test   %eax,%eax
    393f:	74 65                	je     39a6 <do_emit_inst+0x131>
    3941:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3945:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    3949:	83 e0 0f             	and    $0xf,%eax
    394c:	83 e0 0f             	and    $0xf,%eax
    394f:	89 c2                	mov    %eax,%edx
    3951:	0f b6 45 af          	movzbl -0x51(%rbp),%eax
    3955:	83 e0 f0             	and    $0xfffffff0,%eax
    3958:	09 d0                	or     %edx,%eax
    395a:	88 45 af             	mov    %al,-0x51(%rbp)
    395d:	48 83 7d 80 00       	cmpq   $0x0,-0x80(%rbp)
    3962:	74 72                	je     39d6 <do_emit_inst+0x161>
    3964:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    3968:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    396c:	0f b6 c0             	movzbl %al,%eax
    396f:	83 e0 04             	and    $0x4,%eax
    3972:	85 c0                	test   %eax,%eax
    3974:	75 12                	jne    3988 <do_emit_inst+0x113>
    3976:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    397a:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    397e:	0f b6 c0             	movzbl %al,%eax
    3981:	83 e0 08             	and    $0x8,%eax
    3984:	85 c0                	test   %eax,%eax
    3986:	74 4e                	je     39d6 <do_emit_inst+0x161>
    3988:	48 8b 45 80          	mov    -0x80(%rbp),%rax
    398c:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    3990:	83 e0 0f             	and    $0xf,%eax
    3993:	c1 e0 04             	shl    $0x4,%eax
    3996:	89 c2                	mov    %eax,%edx
    3998:	0f b6 45 af          	movzbl -0x51(%rbp),%eax
    399c:	83 e0 0f             	and    $0xf,%eax
    399f:	09 d0                	or     %edx,%eax
    39a1:	88 45 af             	mov    %al,-0x51(%rbp)
    39a4:	eb 30                	jmp    39d6 <do_emit_inst+0x161>
    39a6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    39aa:	0f b6 40 09          	movzbl 0x9(%rax),%eax
    39ae:	0f b6 c0             	movzbl %al,%eax
    39b1:	83 e0 08             	and    $0x8,%eax
    39b4:	85 c0                	test   %eax,%eax
    39b6:	74 1e                	je     39d6 <do_emit_inst+0x161>
    39b8:	0f b7 05 11 59 00 00 	movzwl 0x5911(%rip),%eax        # 92d0 <offset>
    39bf:	83 c0 01             	add    $0x1,%eax
    39c2:	0f b7 d0             	movzwl %ax,%edx
    39c5:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    39c9:	89 d6                	mov    %edx,%esi
    39cb:	48 89 c7             	mov    %rax,%rdi
    39ce:	e8 4b ea ff ff       	callq  241e <deref>
    39d3:	88 45 af             	mov    %al,-0x51(%rbp)
    39d6:	0f b7 45 ae          	movzwl -0x52(%rbp),%eax
    39da:	89 c7                	mov    %eax,%edi
    39dc:	e8 6f e8 ff ff       	callq  2250 <emit>
    39e1:	e9 eb 07 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    39e6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    39ea:	0f b6 40 0a          	movzbl 0xa(%rax),%eax
    39ee:	0f b6 c0             	movzbl %al,%eax
    39f1:	83 e8 0b             	sub    $0xb,%eax
    39f4:	83 f8 0b             	cmp    $0xb,%eax
    39f7:	0f 87 5f 07 00 00    	ja     415c <do_emit_inst+0x8e7>
    39fd:	89 c0                	mov    %eax,%eax
    39ff:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    3a06:	00 
    3a07:	48 8d 05 06 2a 00 00 	lea    0x2a06(%rip),%rax        # 6414 <_IO_stdin_used+0x414>
    3a0e:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    3a11:	48 98                	cltq   
    3a13:	48 8d 15 fa 29 00 00 	lea    0x29fa(%rip),%rdx        # 6414 <_IO_stdin_used+0x414>
    3a1a:	48 01 d0             	add    %rdx,%rax
    3a1d:	ff e0                	jmpq   *%rax
    3a1f:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    3a23:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3a27:	48 8d 0d 32 59 00 00 	lea    0x5932(%rip),%rcx        # 9360 <rarg>
    3a2e:	48 89 c6             	mov    %rax,%rsi
    3a31:	bf 00 00 00 00       	mov    $0x0,%edi
    3a36:	e8 bb fd ff ff       	callq  37f6 <emit_inst>
    3a3b:	e9 91 07 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3a40:	48 83 7d 90 00       	cmpq   $0x0,-0x70(%rbp)
    3a45:	74 0b                	je     3a52 <do_emit_inst+0x1dd>
    3a47:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3a4b:	0f b6 00             	movzbl (%rax),%eax
    3a4e:	3c 01                	cmp    $0x1,%al
    3a50:	74 1f                	je     3a71 <do_emit_inst+0x1fc>
    3a52:	48 8d 0d 17 2c 00 00 	lea    0x2c17(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3a59:	ba 24 04 00 00       	mov    $0x424,%edx
    3a5e:	48 8d 35 4b 26 00 00 	lea    0x264b(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3a65:	48 8d 3d ee 28 00 00 	lea    0x28ee(%rip),%rdi        # 635a <_IO_stdin_used+0x35a>
    3a6c:	e8 3f d6 ff ff       	callq  10b0 <__assert_fail@plt>
    3a71:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3a75:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    3a79:	66 83 f8 0f          	cmp    $0xf,%ax
    3a7d:	75 74                	jne    3af3 <do_emit_inst+0x27e>
    3a7f:	48 8b 05 fa 57 00 00 	mov    0x57fa(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    3a86:	48 89 c7             	mov    %rax,%rdi
    3a89:	e8 c2 d6 ff ff       	callq  1150 <fflush@plt>
    3a8e:	48 8b 05 0b 58 00 00 	mov    0x580b(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    3a95:	b9 29 04 00 00       	mov    $0x429,%ecx
    3a9a:	48 8d 15 df 2b 00 00 	lea    0x2bdf(%rip),%rdx        # 6680 <__func__.4738>
    3aa1:	48 8d 35 f0 25 00 00 	lea    0x25f0(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    3aa8:	48 89 c7             	mov    %rax,%rdi
    3aab:	b8 00 00 00 00       	mov    $0x0,%eax
    3ab0:	e8 5b d6 ff ff       	callq  1110 <fprintf@plt>
    3ab5:	48 8b 05 e4 57 00 00 	mov    0x57e4(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    3abc:	48 89 c1             	mov    %rax,%rcx
    3abf:	ba 22 00 00 00       	mov    $0x22,%edx
    3ac4:	be 01 00 00 00       	mov    $0x1,%esi
    3ac9:	48 8d 3d a8 28 00 00 	lea    0x28a8(%rip),%rdi        # 6378 <_IO_stdin_used+0x378>
    3ad0:	e8 cb d6 ff ff       	callq  11a0 <fwrite@plt>
    3ad5:	48 8b 05 c4 57 00 00 	mov    0x57c4(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    3adc:	48 89 c6             	mov    %rax,%rsi
    3adf:	bf 0a 00 00 00       	mov    $0xa,%edi
    3ae4:	e8 f7 d5 ff ff       	callq  10e0 <fputc@plt>
    3ae9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    3aee:	e8 9d d6 ff ff       	callq  1190 <exit@plt>
    3af3:	c6 45 b0 02          	movb   $0x2,-0x50(%rbp)
    3af7:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3afb:	b9 00 00 00 00       	mov    $0x0,%ecx
    3b00:	ba 00 00 00 00       	mov    $0x0,%edx
    3b05:	48 89 c6             	mov    %rax,%rsi
    3b08:	bf 00 00 00 00       	mov    $0x0,%edi
    3b0d:	e8 e4 fc ff ff       	callq  37f6 <emit_inst>
    3b12:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3b16:	0f b6 00             	movzbl (%rax),%eax
    3b19:	3c 04                	cmp    $0x4,%al
    3b1b:	74 11                	je     3b2e <do_emit_inst+0x2b9>
    3b1d:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3b21:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    3b25:	66 85 c0             	test   %ax,%ax
    3b28:	0f 84 a2 06 00 00    	je     41d0 <do_emit_inst+0x95b>
    3b2e:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3b32:	0f b6 00             	movzbl (%rax),%eax
    3b35:	3c 04                	cmp    $0x4,%al
    3b37:	74 0e                	je     3b47 <do_emit_inst+0x2d2>
    3b39:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3b3d:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    3b41:	66 3d ff 00          	cmp    $0xff,%ax
    3b45:	76 41                	jbe    3b88 <do_emit_inst+0x313>
    3b47:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3b4b:	c6 40 10 02          	movb   $0x2,0x10(%rax)
    3b4f:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    3b53:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3b57:	b9 00 00 00 00       	mov    $0x0,%ecx
    3b5c:	48 89 c6             	mov    %rax,%rsi
    3b5f:	bf 04 00 00 00       	mov    $0x4,%edi
    3b64:	e8 8d fc ff ff       	callq  37f6 <emit_inst>
    3b69:	66 c7 45 b2 08 00    	movw   $0x8,-0x4e(%rbp)
    3b6f:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
    3b73:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3b77:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3b7b:	48 89 c6             	mov    %rax,%rsi
    3b7e:	bf 05 00 00 00       	mov    $0x5,%edi
    3b83:	e8 6e fc ff ff       	callq  37f6 <emit_inst>
    3b88:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3b8c:	c6 40 10 01          	movb   $0x1,0x10(%rax)
    3b90:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    3b94:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3b98:	b9 00 00 00 00       	mov    $0x0,%ecx
    3b9d:	48 89 c6             	mov    %rax,%rsi
    3ba0:	bf 04 00 00 00       	mov    $0x4,%edi
    3ba5:	e8 4c fc ff ff       	callq  37f6 <emit_inst>
    3baa:	e9 21 06 00 00       	jmpq   41d0 <do_emit_inst+0x95b>
    3baf:	48 83 7d 90 00       	cmpq   $0x0,-0x70(%rbp)
    3bb4:	74 0b                	je     3bc1 <do_emit_inst+0x34c>
    3bb6:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3bba:	0f b6 00             	movzbl (%rax),%eax
    3bbd:	3c 01                	cmp    $0x1,%al
    3bbf:	74 1f                	je     3be0 <do_emit_inst+0x36b>
    3bc1:	48 8d 0d a8 2a 00 00 	lea    0x2aa8(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3bc8:	ba 3a 04 00 00       	mov    $0x43a,%edx
    3bcd:	48 8d 35 dc 24 00 00 	lea    0x24dc(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3bd4:	48 8d 3d 7f 27 00 00 	lea    0x277f(%rip),%rdi        # 635a <_IO_stdin_used+0x35a>
    3bdb:	e8 d0 d4 ff ff       	callq  10b0 <__assert_fail@plt>
    3be0:	48 83 7d 88 00       	cmpq   $0x0,-0x78(%rbp)
    3be5:	74 0b                	je     3bf2 <do_emit_inst+0x37d>
    3be7:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3beb:	0f b6 00             	movzbl (%rax),%eax
    3bee:	3c 01                	cmp    $0x1,%al
    3bf0:	74 1f                	je     3c11 <do_emit_inst+0x39c>
    3bf2:	48 8d 0d 77 2a 00 00 	lea    0x2a77(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3bf9:	ba 3b 04 00 00       	mov    $0x43b,%edx
    3bfe:	48 8d 35 ab 24 00 00 	lea    0x24ab(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3c05:	48 8d 3d 8f 27 00 00 	lea    0x278f(%rip),%rdi        # 639b <_IO_stdin_used+0x39b>
    3c0c:	e8 9f d4 ff ff       	callq  10b0 <__assert_fail@plt>
    3c11:	48 83 7d 80 00       	cmpq   $0x0,-0x80(%rbp)
    3c16:	74 0b                	je     3c23 <do_emit_inst+0x3ae>
    3c18:	48 8b 45 80          	mov    -0x80(%rbp),%rax
    3c1c:	0f b6 00             	movzbl (%rax),%eax
    3c1f:	3c 01                	cmp    $0x1,%al
    3c21:	74 1f                	je     3c42 <do_emit_inst+0x3cd>
    3c23:	48 8d 0d 46 2a 00 00 	lea    0x2a46(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3c2a:	ba 3c 04 00 00       	mov    $0x43c,%edx
    3c2f:	48 8d 35 7a 24 00 00 	lea    0x247a(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3c36:	48 8d 3d 76 27 00 00 	lea    0x2776(%rip),%rdi        # 63b3 <_IO_stdin_used+0x3b3>
    3c3d:	e8 6e d4 ff ff       	callq  10b0 <__assert_fail@plt>
    3c42:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    3c46:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3c4a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3c4e:	48 89 c6             	mov    %rax,%rsi
    3c51:	bf 07 00 00 00       	mov    $0x7,%edi
    3c56:	e8 9b fb ff ff       	callq  37f6 <emit_inst>
    3c5b:	48 8b 4d 80          	mov    -0x80(%rbp),%rcx
    3c5f:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    3c63:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3c67:	48 89 c6             	mov    %rax,%rsi
    3c6a:	bf 00 00 00 00       	mov    $0x0,%edi
    3c6f:	e8 82 fb ff ff       	callq  37f6 <emit_inst>
    3c74:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    3c78:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3c7c:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3c80:	48 89 c6             	mov    %rax,%rsi
    3c83:	bf 07 00 00 00       	mov    $0x7,%edi
    3c88:	e8 69 fb ff ff       	callq  37f6 <emit_inst>
    3c8d:	e9 3f 05 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3c92:	48 83 7d 90 00       	cmpq   $0x0,-0x70(%rbp)
    3c97:	74 0b                	je     3ca4 <do_emit_inst+0x42f>
    3c99:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3c9d:	0f b6 00             	movzbl (%rax),%eax
    3ca0:	3c 01                	cmp    $0x1,%al
    3ca2:	74 1f                	je     3cc3 <do_emit_inst+0x44e>
    3ca4:	48 8d 0d c5 29 00 00 	lea    0x29c5(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3cab:	ba 43 04 00 00       	mov    $0x443,%edx
    3cb0:	48 8d 35 f9 23 00 00 	lea    0x23f9(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3cb7:	48 8d 3d 9c 26 00 00 	lea    0x269c(%rip),%rdi        # 635a <_IO_stdin_used+0x35a>
    3cbe:	e8 ed d3 ff ff       	callq  10b0 <__assert_fail@plt>
    3cc3:	48 83 7d 88 00       	cmpq   $0x0,-0x78(%rbp)
    3cc8:	74 0b                	je     3cd5 <do_emit_inst+0x460>
    3cca:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    3cce:	0f b6 00             	movzbl (%rax),%eax
    3cd1:	3c 02                	cmp    $0x2,%al
    3cd3:	74 1f                	je     3cf4 <do_emit_inst+0x47f>
    3cd5:	48 8d 0d 94 29 00 00 	lea    0x2994(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3cdc:	ba 44 04 00 00       	mov    $0x444,%edx
    3ce1:	48 8d 35 c8 23 00 00 	lea    0x23c8(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3ce8:	48 8d 3d dc 26 00 00 	lea    0x26dc(%rip),%rdi        # 63cb <_IO_stdin_used+0x3cb>
    3cef:	e8 bc d3 ff ff       	callq  10b0 <__assert_fail@plt>
    3cf4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    3cf8:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3cfc:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3d00:	48 89 c6             	mov    %rax,%rsi
    3d03:	bf 07 00 00 00       	mov    $0x7,%edi
    3d08:	e8 e9 fa ff ff       	callq  37f6 <emit_inst>
    3d0d:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    3d11:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3d15:	b9 00 00 00 00       	mov    $0x0,%ecx
    3d1a:	48 89 c6             	mov    %rax,%rsi
    3d1d:	bf 01 00 00 00       	mov    $0x1,%edi
    3d22:	e8 cf fa ff ff       	callq  37f6 <emit_inst>
    3d27:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    3d2b:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3d2f:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3d33:	48 89 c6             	mov    %rax,%rsi
    3d36:	bf 07 00 00 00       	mov    $0x7,%edi
    3d3b:	e8 b6 fa ff ff       	callq  37f6 <emit_inst>
    3d40:	e9 8c 04 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3d45:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3d49:	0f b6 00             	movzbl (%rax),%eax
    3d4c:	0f b6 c0             	movzbl %al,%eax
    3d4f:	83 f8 01             	cmp    $0x1,%eax
    3d52:	74 0a                	je     3d5e <do_emit_inst+0x4e9>
    3d54:	83 f8 07             	cmp    $0x7,%eax
    3d57:	74 4b                	je     3da4 <do_emit_inst+0x52f>
    3d59:	e9 99 00 00 00       	jmpq   3df7 <do_emit_inst+0x582>
    3d5e:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3d62:	b9 00 00 00 00       	mov    $0x0,%ecx
    3d67:	48 8d 15 fa 57 00 00 	lea    0x57fa(%rip),%rdx        # 9568 <rarg+0x208>
    3d6e:	48 89 c6             	mov    %rax,%rsi
    3d71:	bf 03 00 00 00       	mov    $0x3,%edi
    3d76:	e8 7b fa ff ff       	callq  37f6 <emit_inst>
    3d7b:	c6 45 b0 02          	movb   $0x2,-0x50(%rbp)
    3d7f:	66 c7 45 b2 02 00    	movw   $0x2,-0x4e(%rbp)
    3d85:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    3d89:	b9 00 00 00 00       	mov    $0x0,%ecx
    3d8e:	48 89 c2             	mov    %rax,%rdx
    3d91:	48 8d 35 d0 57 00 00 	lea    0x57d0(%rip),%rsi        # 9568 <rarg+0x208>
    3d98:	bf 01 00 00 00       	mov    $0x1,%edi
    3d9d:	e8 54 fa ff ff       	callq  37f6 <emit_inst>
    3da2:	eb 72                	jmp    3e16 <do_emit_inst+0x5a1>
    3da4:	c6 45 b0 01          	movb   $0x1,-0x50(%rbp)
    3da8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    3daf:	eb 34                	jmp    3de5 <do_emit_inst+0x570>
    3db1:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3db5:	8b 45 fc             	mov    -0x4(%rbp),%eax
    3db8:	48 98                	cltq   
    3dba:	0f b6 44 02 12       	movzbl 0x12(%rdx,%rax,1),%eax
    3dbf:	0f b6 c0             	movzbl %al,%eax
    3dc2:	66 89 45 b2          	mov    %ax,-0x4e(%rbp)
    3dc6:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    3dca:	b9 00 00 00 00       	mov    $0x0,%ecx
    3dcf:	ba 00 00 00 00       	mov    $0x0,%edx
    3dd4:	48 89 c6             	mov    %rax,%rsi
    3dd7:	bf 10 00 00 00       	mov    $0x10,%edi
    3ddc:	e8 15 fa ff ff       	callq  37f6 <emit_inst>
    3de1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    3de5:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3de9:	0f b6 40 11          	movzbl 0x11(%rax),%eax
    3ded:	0f b6 c0             	movzbl %al,%eax
    3df0:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    3df3:	7c bc                	jl     3db1 <do_emit_inst+0x53c>
    3df5:	eb 1f                	jmp    3e16 <do_emit_inst+0x5a1>
    3df7:	48 8d 0d 72 28 00 00 	lea    0x2872(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3dfe:	ba 59 04 00 00       	mov    $0x459,%edx
    3e03:	48 8d 35 a6 22 00 00 	lea    0x22a6(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3e0a:	48 8d 3d 47 25 00 00 	lea    0x2547(%rip),%rdi        # 6358 <_IO_stdin_used+0x358>
    3e11:	e8 9a d2 ff ff       	callq  10b0 <__assert_fail@plt>
    3e16:	e9 b6 03 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3e1b:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3e1f:	0f b6 00             	movzbl (%rax),%eax
    3e22:	0f b6 c0             	movzbl %al,%eax
    3e25:	83 f8 01             	cmp    $0x1,%eax
    3e28:	74 0a                	je     3e34 <do_emit_inst+0x5bf>
    3e2a:	83 f8 07             	cmp    $0x7,%eax
    3e2d:	74 4b                	je     3e7a <do_emit_inst+0x605>
    3e2f:	e9 99 00 00 00       	jmpq   3ecd <do_emit_inst+0x658>
    3e34:	c6 45 b0 02          	movb   $0x2,-0x50(%rbp)
    3e38:	66 c7 45 b2 02 00    	movw   $0x2,-0x4e(%rbp)
    3e3e:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    3e42:	b9 00 00 00 00       	mov    $0x0,%ecx
    3e47:	48 89 c2             	mov    %rax,%rdx
    3e4a:	48 8d 35 17 57 00 00 	lea    0x5717(%rip),%rsi        # 9568 <rarg+0x208>
    3e51:	bf 0c 00 00 00       	mov    $0xc,%edi
    3e56:	e8 9b f9 ff ff       	callq  37f6 <emit_inst>
    3e5b:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3e5f:	b9 00 00 00 00       	mov    $0x0,%ecx
    3e64:	48 8d 15 fd 56 00 00 	lea    0x56fd(%rip),%rdx        # 9568 <rarg+0x208>
    3e6b:	48 89 c6             	mov    %rax,%rsi
    3e6e:	bf 02 00 00 00       	mov    $0x2,%edi
    3e73:	e8 7e f9 ff ff       	callq  37f6 <emit_inst>
    3e78:	eb 72                	jmp    3eec <do_emit_inst+0x677>
    3e7a:	c6 45 b0 01          	movb   $0x1,-0x50(%rbp)
    3e7e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    3e85:	eb 34                	jmp    3ebb <do_emit_inst+0x646>
    3e87:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3e8b:	8b 45 f8             	mov    -0x8(%rbp),%eax
    3e8e:	48 98                	cltq   
    3e90:	0f b6 44 02 12       	movzbl 0x12(%rdx,%rax,1),%eax
    3e95:	0f b6 c0             	movzbl %al,%eax
    3e98:	66 89 45 b2          	mov    %ax,-0x4e(%rbp)
    3e9c:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    3ea0:	b9 00 00 00 00       	mov    $0x0,%ecx
    3ea5:	ba 00 00 00 00       	mov    $0x0,%edx
    3eaa:	48 89 c6             	mov    %rax,%rsi
    3ead:	bf 11 00 00 00       	mov    $0x11,%edi
    3eb2:	e8 3f f9 ff ff       	callq  37f6 <emit_inst>
    3eb7:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    3ebb:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3ebf:	0f b6 40 11          	movzbl 0x11(%rax),%eax
    3ec3:	0f b6 c0             	movzbl %al,%eax
    3ec6:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    3ec9:	7c bc                	jl     3e87 <do_emit_inst+0x612>
    3ecb:	eb 1f                	jmp    3eec <do_emit_inst+0x677>
    3ecd:	48 8d 0d 9c 27 00 00 	lea    0x279c(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    3ed4:	ba 6c 04 00 00       	mov    $0x46c,%edx
    3ed9:	48 8d 35 d0 21 00 00 	lea    0x21d0(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    3ee0:	48 8d 3d 71 24 00 00 	lea    0x2471(%rip),%rdi        # 6358 <_IO_stdin_used+0x358>
    3ee7:	e8 c4 d1 ff ff       	callq  10b0 <__assert_fail@plt>
    3eec:	e9 e0 02 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3ef1:	48 8b 4d 80          	mov    -0x80(%rbp),%rcx
    3ef5:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
    3ef9:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3efd:	48 89 c6             	mov    %rax,%rsi
    3f00:	bf 07 00 00 00       	mov    $0x7,%edi
    3f05:	e8 ec f8 ff ff       	callq  37f6 <emit_inst>
    3f0a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
    3f0e:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
    3f12:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3f16:	48 89 c6             	mov    %rax,%rsi
    3f19:	bf 07 00 00 00       	mov    $0x7,%edi
    3f1e:	e8 d3 f8 ff ff       	callq  37f6 <emit_inst>
    3f23:	e9 a9 02 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3f28:	48 8d 0d 31 54 00 00 	lea    0x5431(%rip),%rcx        # 9360 <rarg>
    3f2f:	48 8d 15 2a 54 00 00 	lea    0x542a(%rip),%rdx        # 9360 <rarg>
    3f36:	48 8d 35 23 54 00 00 	lea    0x5423(%rip),%rsi        # 9360 <rarg>
    3f3d:	bf 00 00 00 00       	mov    $0x0,%edi
    3f42:	e8 af f8 ff ff       	callq  37f6 <emit_inst>
    3f47:	e9 85 02 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3f4c:	48 8d 0d 0d 54 00 00 	lea    0x540d(%rip),%rcx        # 9360 <rarg>
    3f53:	48 8d 15 5e 56 00 00 	lea    0x565e(%rip),%rdx        # 95b8 <rarg+0x258>
    3f5a:	48 8d 35 2f 56 00 00 	lea    0x562f(%rip),%rsi        # 9590 <rarg+0x230>
    3f61:	bf 00 00 00 00       	mov    $0x0,%edi
    3f66:	e8 8b f8 ff ff       	callq  37f6 <emit_inst>
    3f6b:	c6 45 b0 02          	movb   $0x2,-0x50(%rbp)
    3f6f:	66 c7 45 b2 04 00    	movw   $0x4,-0x4e(%rbp)
    3f75:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    3f79:	b9 00 00 00 00       	mov    $0x0,%ecx
    3f7e:	48 89 c2             	mov    %rax,%rdx
    3f81:	48 8d 35 08 56 00 00 	lea    0x5608(%rip),%rsi        # 9590 <rarg+0x230>
    3f88:	bf 01 00 00 00       	mov    $0x1,%edi
    3f8d:	e8 64 f8 ff ff       	callq  37f6 <emit_inst>
    3f92:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3f96:	48 8d 0d c3 53 00 00 	lea    0x53c3(%rip),%rcx        # 9360 <rarg>
    3f9d:	48 89 c2             	mov    %rax,%rdx
    3fa0:	48 8d 35 11 56 00 00 	lea    0x5611(%rip),%rsi        # 95b8 <rarg+0x258>
    3fa7:	bf 00 00 00 00       	mov    $0x0,%edi
    3fac:	e8 45 f8 ff ff       	callq  37f6 <emit_inst>
    3fb1:	e9 1b 02 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    3fb6:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3fba:	0f b7 50 02          	movzwl 0x2(%rax),%edx
    3fbe:	0f b7 05 0b 53 00 00 	movzwl 0x530b(%rip),%eax        # 92d0 <offset>
    3fc5:	66 39 c2             	cmp    %ax,%dx
    3fc8:	73 74                	jae    403e <do_emit_inst+0x7c9>
    3fca:	48 8b 05 af 52 00 00 	mov    0x52af(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    3fd1:	48 89 c7             	mov    %rax,%rdi
    3fd4:	e8 77 d1 ff ff       	callq  1150 <fflush@plt>
    3fd9:	48 8b 05 c0 52 00 00 	mov    0x52c0(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    3fe0:	b9 7f 04 00 00       	mov    $0x47f,%ecx
    3fe5:	48 8d 15 94 26 00 00 	lea    0x2694(%rip),%rdx        # 6680 <__func__.4738>
    3fec:	48 8d 35 a5 20 00 00 	lea    0x20a5(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    3ff3:	48 89 c7             	mov    %rax,%rdi
    3ff6:	b8 00 00 00 00       	mov    $0x0,%eax
    3ffb:	e8 10 d1 ff ff       	callq  1110 <fprintf@plt>
    4000:	48 8b 05 99 52 00 00 	mov    0x5299(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4007:	48 89 c1             	mov    %rax,%rcx
    400a:	ba 11 00 00 00       	mov    $0x11,%edx
    400f:	be 01 00 00 00       	mov    $0x1,%esi
    4014:	48 8d 3d c8 23 00 00 	lea    0x23c8(%rip),%rdi        # 63e3 <_IO_stdin_used+0x3e3>
    401b:	e8 80 d1 ff ff       	callq  11a0 <fwrite@plt>
    4020:	48 8b 05 79 52 00 00 	mov    0x5279(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4027:	48 89 c6             	mov    %rax,%rsi
    402a:	bf 0a 00 00 00       	mov    $0xa,%edi
    402f:	e8 ac d0 ff ff       	callq  10e0 <fputc@plt>
    4034:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4039:	e8 52 d1 ff ff       	callq  1190 <exit@plt>
    403e:	66 c7 45 ae 00 00    	movw   $0x0,-0x52(%rbp)
    4044:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    4048:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    404c:	0f b7 d0             	movzwl %ax,%edx
    404f:	0f b7 05 7a 52 00 00 	movzwl 0x527a(%rip),%eax        # 92d0 <offset>
    4056:	0f b7 c0             	movzwl %ax,%eax
    4059:	29 c2                	sub    %eax,%edx
    405b:	89 d0                	mov    %edx,%eax
    405d:	89 c2                	mov    %eax,%edx
    405f:	c1 ea 1f             	shr    $0x1f,%edx
    4062:	01 d0                	add    %edx,%eax
    4064:	d1 f8                	sar    %eax
    4066:	48 63 d0             	movslq %eax,%rdx
    4069:	0f b7 45 ae          	movzwl -0x52(%rbp),%eax
    406d:	48 89 d6             	mov    %rdx,%rsi
    4070:	89 c7                	mov    %eax,%edi
    4072:	e8 01 e1 ff ff       	callq  2178 <emit_data2>
    4077:	e9 55 01 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    407c:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    4080:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    4084:	66 89 45 ae          	mov    %ax,-0x52(%rbp)
    4088:	0f b7 45 ae          	movzwl -0x52(%rbp),%eax
    408c:	89 c7                	mov    %eax,%edi
    408e:	e8 6b e1 ff ff       	callq  21fe <emit_data>
    4093:	e9 39 01 00 00       	jmpq   41d1 <do_emit_inst+0x95c>
    4098:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    409c:	0f b6 00             	movzbl (%rax),%eax
    409f:	3c 03                	cmp    $0x3,%al
    40a1:	74 1f                	je     40c2 <do_emit_inst+0x84d>
    40a3:	48 8d 0d c6 25 00 00 	lea    0x25c6(%rip),%rcx        # 6670 <__PRETTY_FUNCTION__.4737>
    40aa:	ba 88 04 00 00       	mov    $0x488,%edx
    40af:	48 8d 35 fa 1f 00 00 	lea    0x1ffa(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    40b6:	48 8d 3d 38 23 00 00 	lea    0x2338(%rip),%rdi        # 63f5 <_IO_stdin_used+0x3f5>
    40bd:	e8 ee cf ff ff       	callq  10b0 <__assert_fail@plt>
    40c2:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    40c6:	0f b7 40 02          	movzwl 0x2(%rax),%eax
    40ca:	0f b7 c0             	movzwl %ax,%eax
    40cd:	48 63 d0             	movslq %eax,%rdx
    40d0:	48 89 d0             	mov    %rdx,%rax
    40d3:	48 c1 e0 02          	shl    $0x2,%rax
    40d7:	48 01 d0             	add    %rdx,%rax
    40da:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    40e1:	00 
    40e2:	48 01 d0             	add    %rdx,%rax
    40e5:	48 c1 e0 02          	shl    $0x2,%rax
    40e9:	48 8d 15 f0 54 00 00 	lea    0x54f0(%rip),%rdx        # 95e0 <strs>
    40f0:	48 01 d0             	add    %rdx,%rax
    40f3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    40f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    40fb:	48 89 c7             	mov    %rax,%rdi
    40fe:	e8 6d cf ff ff       	callq  1070 <strlen@plt>
    4103:	83 c0 01             	add    $0x1,%eax
    4106:	66 89 45 e6          	mov    %ax,-0x1a(%rbp)
    410a:	0f b7 45 e6          	movzwl -0x1a(%rbp),%eax
    410e:	66 d1 e8             	shr    %ax
    4111:	83 c0 01             	add    $0x1,%eax
    4114:	66 89 45 e6          	mov    %ax,-0x1a(%rbp)
    4118:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    411f:	eb 30                	jmp    4151 <do_emit_inst+0x8dc>
    4121:	8b 45 f4             	mov    -0xc(%rbp),%eax
    4124:	48 98                	cltq   
    4126:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
    412a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    412e:	48 01 d0             	add    %rdx,%rax
    4131:	0f b7 00             	movzwl (%rax),%eax
    4134:	0f b7 c0             	movzwl %ax,%eax
    4137:	89 c7                	mov    %eax,%edi
    4139:	e8 42 cf ff ff       	callq  1080 <htons@plt>
    413e:	66 89 45 ae          	mov    %ax,-0x52(%rbp)
    4142:	0f b7 45 ae          	movzwl -0x52(%rbp),%eax
    4146:	89 c7                	mov    %eax,%edi
    4148:	e8 b1 e0 ff ff       	callq  21fe <emit_data>
    414d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    4151:	0f b7 45 e6          	movzwl -0x1a(%rbp),%eax
    4155:	39 45 f4             	cmp    %eax,-0xc(%rbp)
    4158:	7c c7                	jl     4121 <do_emit_inst+0x8ac>
    415a:	eb 75                	jmp    41d1 <do_emit_inst+0x95c>
    415c:	48 8b 05 1d 51 00 00 	mov    0x511d(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    4163:	48 89 c7             	mov    %rax,%rdi
    4166:	e8 e5 cf ff ff       	callq  1150 <fflush@plt>
    416b:	48 8b 05 2e 51 00 00 	mov    0x512e(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4172:	b9 93 04 00 00       	mov    $0x493,%ecx
    4177:	48 8d 15 02 25 00 00 	lea    0x2502(%rip),%rdx        # 6680 <__func__.4738>
    417e:	48 8d 35 13 1f 00 00 	lea    0x1f13(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    4185:	48 89 c7             	mov    %rax,%rdi
    4188:	b8 00 00 00 00       	mov    $0x0,%eax
    418d:	e8 7e cf ff ff       	callq  1110 <fprintf@plt>
    4192:	48 8b 05 07 51 00 00 	mov    0x5107(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4199:	48 89 c1             	mov    %rax,%rcx
    419c:	ba 0a 00 00 00       	mov    $0xa,%edx
    41a1:	be 01 00 00 00       	mov    $0x1,%esi
    41a6:	48 8d 3d 5b 22 00 00 	lea    0x225b(%rip),%rdi        # 6408 <_IO_stdin_used+0x408>
    41ad:	e8 ee cf ff ff       	callq  11a0 <fwrite@plt>
    41b2:	48 8b 05 e7 50 00 00 	mov    0x50e7(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    41b9:	48 89 c6             	mov    %rax,%rsi
    41bc:	bf 0a 00 00 00       	mov    $0xa,%edi
    41c1:	e8 1a cf ff ff       	callq  10e0 <fputc@plt>
    41c6:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    41cb:	e8 c0 cf ff ff       	callq  1190 <exit@plt>
    41d0:	90                   	nop
    41d1:	90                   	nop
    41d2:	c9                   	leaveq 
    41d3:	c3                   	retq   

00000000000041d4 <stupid_call>:
    41d4:	55                   	push   %rbp
    41d5:	48 89 e5             	mov    %rsp,%rbp
    41d8:	48 8d 3d 65 22 00 00 	lea    0x2265(%rip),%rdi        # 6444 <_IO_stdin_used+0x444>
    41df:	e8 6c ce ff ff       	callq  1050 <puts@plt>
    41e4:	90                   	nop
    41e5:	5d                   	pop    %rbp
    41e6:	c3                   	retq   

00000000000041e7 <parse_line3>:
    41e7:	55                   	push   %rbp
    41e8:	48 89 e5             	mov    %rsp,%rbp
    41eb:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
    41f2:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
    41f9:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
    41ff:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
    4206:	00 
    4207:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
    420e:	00 
    420f:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
    4216:	00 
    4217:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
    421e:	00 
    421f:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
    4226:	00 
    4227:	66 c7 45 be 00 00    	movw   $0x0,-0x42(%rbp)
    422d:	48 8d 95 10 ff ff ff 	lea    -0xf0(%rbp),%rdx
    4234:	b8 00 00 00 00       	mov    $0x0,%eax
    4239:	b9 15 00 00 00       	mov    $0x15,%ecx
    423e:	48 89 d7             	mov    %rdx,%rdi
    4241:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    4244:	48 8b b5 08 ff ff ff 	mov    -0xf8(%rbp),%rsi
    424b:	8b 95 04 ff ff ff    	mov    -0xfc(%rbp),%edx
    4251:	8b 05 9d 4e 00 00    	mov    0x4e9d(%rip),%eax        # 90f4 <lines>
    4257:	8d 48 01             	lea    0x1(%rax),%ecx
    425a:	89 0d 94 4e 00 00    	mov    %ecx,0x4e94(%rip)        # 90f4 <lines>
    4260:	49 89 f0             	mov    %rsi,%r8
    4263:	89 d1                	mov    %edx,%ecx
    4265:	89 c2                	mov    %eax,%edx
    4267:	48 8d 35 22 24 00 00 	lea    0x2422(%rip),%rsi        # 6690 <__func__.4785>
    426e:	48 8d 3d d0 21 00 00 	lea    0x21d0(%rip),%rdi        # 6445 <_IO_stdin_used+0x445>
    4275:	b8 00 00 00 00       	mov    $0x0,%eax
    427a:	e8 11 ce ff ff       	callq  1090 <printf@plt>
    427f:	8b 95 04 ff ff ff    	mov    -0xfc(%rbp),%edx
    4285:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    428c:	89 d6                	mov    %edx,%esi
    428e:	48 89 c7             	mov    %rax,%rdi
    4291:	e8 d0 e5 ff ff       	callq  2866 <skip_space>
    4296:	89 c2                	mov    %eax,%edx
    4298:	48 8d 8d 04 ff ff ff 	lea    -0xfc(%rbp),%rcx
    429f:	48 8d 85 08 ff ff ff 	lea    -0xf8(%rbp),%rax
    42a6:	48 89 ce             	mov    %rcx,%rsi
    42a9:	48 89 c7             	mov    %rax,%rdi
    42ac:	e8 8c e2 ff ff       	callq  253d <advance>
    42b1:	8b 85 04 ff ff ff    	mov    -0xfc(%rbp),%eax
    42b7:	85 c0                	test   %eax,%eax
    42b9:	0f 84 55 04 00 00    	je     4714 <parse_line3+0x52d>
    42bf:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    42c6:	0f b6 00             	movzbl (%rax),%eax
    42c9:	3c 23                	cmp    $0x23,%al
    42cb:	0f 84 46 04 00 00    	je     4717 <parse_line3+0x530>
    42d1:	8b 95 04 ff ff ff    	mov    -0xfc(%rbp),%edx
    42d7:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    42de:	89 d6                	mov    %edx,%esi
    42e0:	48 89 c7             	mov    %rax,%rdi
    42e3:	e8 4e eb ff ff       	callq  2e36 <get_id>
    42e8:	89 45 f8             	mov    %eax,-0x8(%rbp)
    42eb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    42ef:	0f 84 11 01 00 00    	je     4406 <parse_line3+0x21f>
    42f5:	8b 85 04 ff ff ff    	mov    -0xfc(%rbp),%eax
    42fb:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    42fe:	0f 8d 02 01 00 00    	jge    4406 <parse_line3+0x21f>
    4304:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
    430b:	8b 45 f8             	mov    -0x8(%rbp),%eax
    430e:	48 98                	cltq   
    4310:	48 01 d0             	add    %rdx,%rax
    4313:	0f b6 00             	movzbl (%rax),%eax
    4316:	3c 3a                	cmp    $0x3a,%al
    4318:	0f 85 e8 00 00 00    	jne    4406 <parse_line3+0x21f>
    431e:	b8 00 00 00 00       	mov    $0x0,%eax
    4323:	e8 ac fe ff ff       	callq  41d4 <stupid_call>
    4328:	8b 45 f8             	mov    -0x8(%rbp),%eax
    432b:	0f b7 d0             	movzwl %ax,%edx
    432e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    4335:	89 d6                	mov    %edx,%esi
    4337:	48 89 c7             	mov    %rax,%rdi
    433a:	e8 84 d8 ff ff       	callq  1bc3 <sym_get>
    433f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    4343:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    4347:	0f b6 40 05          	movzbl 0x5(%rax),%eax
    434b:	0f b6 c0             	movzbl %al,%eax
    434e:	83 e0 01             	and    $0x1,%eax
    4351:	85 c0                	test   %eax,%eax
    4353:	74 74                	je     43c9 <parse_line3+0x1e2>
    4355:	48 8b 05 24 4f 00 00 	mov    0x4f24(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    435c:	48 89 c7             	mov    %rax,%rdi
    435f:	e8 ec cd ff ff       	callq  1150 <fflush@plt>
    4364:	48 8b 05 35 4f 00 00 	mov    0x4f35(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    436b:	b9 c1 04 00 00       	mov    $0x4c1,%ecx
    4370:	48 8d 15 19 23 00 00 	lea    0x2319(%rip),%rdx        # 6690 <__func__.4785>
    4377:	48 8d 35 1a 1d 00 00 	lea    0x1d1a(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    437e:	48 89 c7             	mov    %rax,%rdi
    4381:	b8 00 00 00 00       	mov    $0x0,%eax
    4386:	e8 85 cd ff ff       	callq  1110 <fprintf@plt>
    438b:	48 8b 05 0e 4f 00 00 	mov    0x4f0e(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4392:	48 89 c1             	mov    %rax,%rcx
    4395:	ba 0f 00 00 00       	mov    $0xf,%edx
    439a:	be 01 00 00 00       	mov    $0x1,%esi
    439f:	48 8d 3d ab 20 00 00 	lea    0x20ab(%rip),%rdi        # 6451 <_IO_stdin_used+0x451>
    43a6:	e8 f5 cd ff ff       	callq  11a0 <fwrite@plt>
    43ab:	48 8b 05 ee 4e 00 00 	mov    0x4eee(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    43b2:	48 89 c6             	mov    %rax,%rsi
    43b5:	bf 0a 00 00 00       	mov    $0xa,%edi
    43ba:	e8 21 cd ff ff       	callq  10e0 <fputc@plt>
    43bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    43c4:	e8 c7 cd ff ff       	callq  1190 <exit@plt>
    43c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    43cd:	0f b6 40 05          	movzbl 0x5(%rax),%eax
    43d1:	83 c8 01             	or     $0x1,%eax
    43d4:	89 c2                	mov    %eax,%edx
    43d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    43da:	88 50 05             	mov    %dl,0x5(%rax)
    43dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
    43e0:	8d 50 01             	lea    0x1(%rax),%edx
    43e3:	48 8d 8d 04 ff ff ff 	lea    -0xfc(%rbp),%rcx
    43ea:	48 8d 85 08 ff ff ff 	lea    -0xf8(%rbp),%rax
    43f1:	48 89 ce             	mov    %rcx,%rsi
    43f4:	48 89 c7             	mov    %rax,%rdi
    43f7:	e8 41 e1 ff ff       	callq  253d <advance>
    43fc:	b8 00 00 00 00       	mov    $0x0,%eax
    4401:	e8 ce fd ff ff       	callq  41d4 <stupid_call>
    4406:	8b 95 04 ff ff ff    	mov    -0xfc(%rbp),%edx
    440c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    4413:	89 d6                	mov    %edx,%esi
    4415:	48 89 c7             	mov    %rax,%rdi
    4418:	e8 49 e4 ff ff       	callq  2866 <skip_space>
    441d:	89 c2                	mov    %eax,%edx
    441f:	48 8d 8d 04 ff ff ff 	lea    -0xfc(%rbp),%rcx
    4426:	48 8d 85 08 ff ff ff 	lea    -0xf8(%rbp),%rax
    442d:	48 89 ce             	mov    %rcx,%rsi
    4430:	48 89 c7             	mov    %rax,%rdi
    4433:	e8 05 e1 ff ff       	callq  253d <advance>
    4438:	8b 95 04 ff ff ff    	mov    -0xfc(%rbp),%edx
    443e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    4445:	89 d6                	mov    %edx,%esi
    4447:	48 89 c7             	mov    %rax,%rdi
    444a:	e8 e7 e9 ff ff       	callq  2e36 <get_id>
    444f:	89 45 f8             	mov    %eax,-0x8(%rbp)
    4452:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    4456:	0f 84 f6 01 00 00    	je     4652 <parse_line3+0x46b>
    445c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    4463:	8b 55 f8             	mov    -0x8(%rbp),%edx
    4466:	89 d6                	mov    %edx,%esi
    4468:	48 89 c7             	mov    %rax,%rdi
    446b:	e8 18 f3 ff ff       	callq  3788 <opcode>
    4470:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    4474:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    4479:	75 74                	jne    44ef <parse_line3+0x308>
    447b:	48 8b 05 fe 4d 00 00 	mov    0x4dfe(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    4482:	48 89 c7             	mov    %rax,%rdi
    4485:	e8 c6 cc ff ff       	callq  1150 <fflush@plt>
    448a:	48 8b 05 0f 4e 00 00 	mov    0x4e0f(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4491:	b9 d1 04 00 00       	mov    $0x4d1,%ecx
    4496:	48 8d 15 f3 21 00 00 	lea    0x21f3(%rip),%rdx        # 6690 <__func__.4785>
    449d:	48 8d 35 f4 1b 00 00 	lea    0x1bf4(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    44a4:	48 89 c7             	mov    %rax,%rdi
    44a7:	b8 00 00 00 00       	mov    $0x0,%eax
    44ac:	e8 5f cc ff ff       	callq  1110 <fprintf@plt>
    44b1:	48 8b 05 e8 4d 00 00 	mov    0x4de8(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    44b8:	48 89 c1             	mov    %rax,%rcx
    44bb:	ba 0e 00 00 00       	mov    $0xe,%edx
    44c0:	be 01 00 00 00       	mov    $0x1,%esi
    44c5:	48 8d 3d 95 1f 00 00 	lea    0x1f95(%rip),%rdi        # 6461 <_IO_stdin_used+0x461>
    44cc:	e8 cf cc ff ff       	callq  11a0 <fwrite@plt>
    44d1:	48 8b 05 c8 4d 00 00 	mov    0x4dc8(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    44d8:	48 89 c6             	mov    %rax,%rsi
    44db:	bf 0a 00 00 00       	mov    $0xa,%edi
    44e0:	e8 fb cb ff ff       	callq  10e0 <fputc@plt>
    44e5:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    44ea:	e8 a1 cc ff ff       	callq  1190 <exit@plt>
    44ef:	8b 55 f8             	mov    -0x8(%rbp),%edx
    44f2:	48 8d 8d 04 ff ff ff 	lea    -0xfc(%rbp),%rcx
    44f9:	48 8d 85 08 ff ff ff 	lea    -0xf8(%rbp),%rax
    4500:	48 89 ce             	mov    %rcx,%rsi
    4503:	48 89 c7             	mov    %rax,%rdi
    4506:	e8 32 e0 ff ff       	callq  253d <advance>
    450b:	8b 95 04 ff ff ff    	mov    -0xfc(%rbp),%edx
    4511:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    4518:	89 d6                	mov    %edx,%esi
    451a:	48 89 c7             	mov    %rax,%rdi
    451d:	e8 44 e3 ff ff       	callq  2866 <skip_space>
    4522:	89 c2                	mov    %eax,%edx
    4524:	48 8d 8d 04 ff ff ff 	lea    -0xfc(%rbp),%rcx
    452b:	48 8d 85 08 ff ff ff 	lea    -0xf8(%rbp),%rax
    4532:	48 89 ce             	mov    %rcx,%rsi
    4535:	48 89 c7             	mov    %rax,%rdi
    4538:	e8 00 e0 ff ff       	callq  253d <advance>
    453d:	89 45 f8             	mov    %eax,-0x8(%rbp)
    4540:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
    4544:	75 74                	jne    45ba <parse_line3+0x3d3>
    4546:	48 8b 05 33 4d 00 00 	mov    0x4d33(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    454d:	48 89 c7             	mov    %rax,%rdi
    4550:	e8 fb cb ff ff       	callq  1150 <fflush@plt>
    4555:	48 8b 05 44 4d 00 00 	mov    0x4d44(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    455c:	b9 d7 04 00 00       	mov    $0x4d7,%ecx
    4561:	48 8d 15 28 21 00 00 	lea    0x2128(%rip),%rdx        # 6690 <__func__.4785>
    4568:	48 8d 35 29 1b 00 00 	lea    0x1b29(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    456f:	48 89 c7             	mov    %rax,%rdi
    4572:	b8 00 00 00 00       	mov    $0x0,%eax
    4577:	e8 94 cb ff ff       	callq  1110 <fprintf@plt>
    457c:	48 8b 05 1d 4d 00 00 	mov    0x4d1d(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4583:	48 89 c1             	mov    %rax,%rcx
    4586:	ba 1a 00 00 00       	mov    $0x1a,%edx
    458b:	be 01 00 00 00       	mov    $0x1,%esi
    4590:	48 8d 3d d9 1e 00 00 	lea    0x1ed9(%rip),%rdi        # 6470 <_IO_stdin_used+0x470>
    4597:	e8 04 cc ff ff       	callq  11a0 <fwrite@plt>
    459c:	48 8b 05 fd 4c 00 00 	mov    0x4cfd(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    45a3:	48 89 c6             	mov    %rax,%rsi
    45a6:	bf 0a 00 00 00       	mov    $0xa,%edi
    45ab:	e8 30 cb ff ff       	callq  10e0 <fputc@plt>
    45b0:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    45b5:	e8 d6 cb ff ff       	callq  1190 <exit@plt>
    45ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    45c1:	eb 43                	jmp    4606 <parse_line3+0x41f>
    45c3:	48 8d 8d 10 ff ff ff 	lea    -0xf0(%rbp),%rcx
    45ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
    45cd:	48 63 d0             	movslq %eax,%rdx
    45d0:	48 89 d0             	mov    %rdx,%rax
    45d3:	48 c1 e0 02          	shl    $0x2,%rax
    45d7:	48 01 d0             	add    %rdx,%rax
    45da:	48 c1 e0 03          	shl    $0x3,%rax
    45de:	48 01 c8             	add    %rcx,%rax
    45e1:	48 8d 48 08          	lea    0x8(%rax),%rcx
    45e5:	48 8d 95 04 ff ff ff 	lea    -0xfc(%rbp),%rdx
    45ec:	48 8d 85 08 ff ff ff 	lea    -0xf8(%rbp),%rax
    45f3:	48 89 c6             	mov    %rax,%rsi
    45f6:	48 89 cf             	mov    %rcx,%rdi
    45f9:	e8 a0 ea ff ff       	callq  309e <getarg>
    45fe:	85 c0                	test   %eax,%eax
    4600:	75 0c                	jne    460e <parse_line3+0x427>
    4602:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    4606:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
    460a:	7e b7                	jle    45c3 <parse_line3+0x3dc>
    460c:	eb 01                	jmp    460f <parse_line3+0x428>
    460e:	90                   	nop
    460f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4613:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
    461a:	48 8d 85 10 ff ff ff 	lea    -0xf0(%rbp),%rax
    4621:	48 8d 50 08          	lea    0x8(%rax),%rdx
    4625:	48 83 c2 50          	add    $0x50,%rdx
    4629:	48 8d 85 10 ff ff ff 	lea    -0xf0(%rbp),%rax
    4630:	48 83 c0 08          	add    $0x8,%rax
    4634:	48 83 c0 28          	add    $0x28,%rax
    4638:	48 8d 8d 10 ff ff ff 	lea    -0xf0(%rbp),%rcx
    463f:	48 8d 71 08          	lea    0x8(%rcx),%rsi
    4643:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    4647:	48 89 d1             	mov    %rdx,%rcx
    464a:	48 89 c2             	mov    %rax,%rdx
    464d:	e8 23 f2 ff ff       	callq  3875 <do_emit_inst>
    4652:	8b 95 04 ff ff ff    	mov    -0xfc(%rbp),%edx
    4658:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    465f:	89 d6                	mov    %edx,%esi
    4661:	48 89 c7             	mov    %rax,%rdi
    4664:	e8 fd e1 ff ff       	callq  2866 <skip_space>
    4669:	89 c2                	mov    %eax,%edx
    466b:	48 8d 8d 04 ff ff ff 	lea    -0xfc(%rbp),%rcx
    4672:	48 8d 85 08 ff ff ff 	lea    -0xf8(%rbp),%rax
    4679:	48 89 ce             	mov    %rcx,%rsi
    467c:	48 89 c7             	mov    %rax,%rdi
    467f:	e8 b9 de ff ff       	callq  253d <advance>
    4684:	8b 85 04 ff ff ff    	mov    -0xfc(%rbp),%eax
    468a:	85 c0                	test   %eax,%eax
    468c:	0f 84 89 00 00 00    	je     471b <parse_line3+0x534>
    4692:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
    4699:	0f b6 00             	movzbl (%rax),%eax
    469c:	3c 23                	cmp    $0x23,%al
    469e:	74 7a                	je     471a <parse_line3+0x533>
    46a0:	48 8b 05 d9 4b 00 00 	mov    0x4bd9(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    46a7:	48 89 c7             	mov    %rax,%rdi
    46aa:	e8 a1 ca ff ff       	callq  1150 <fflush@plt>
    46af:	48 8b 05 ea 4b 00 00 	mov    0x4bea(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    46b6:	b9 e9 04 00 00       	mov    $0x4e9,%ecx
    46bb:	48 8d 15 ce 1f 00 00 	lea    0x1fce(%rip),%rdx        # 6690 <__func__.4785>
    46c2:	48 8d 35 cf 19 00 00 	lea    0x19cf(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    46c9:	48 89 c7             	mov    %rax,%rdi
    46cc:	b8 00 00 00 00       	mov    $0x0,%eax
    46d1:	e8 3a ca ff ff       	callq  1110 <fprintf@plt>
    46d6:	48 8b 05 c3 4b 00 00 	mov    0x4bc3(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    46dd:	48 89 c1             	mov    %rax,%rcx
    46e0:	ba 12 00 00 00       	mov    $0x12,%edx
    46e5:	be 01 00 00 00       	mov    $0x1,%esi
    46ea:	48 8d 3d 9a 1d 00 00 	lea    0x1d9a(%rip),%rdi        # 648b <_IO_stdin_used+0x48b>
    46f1:	e8 aa ca ff ff       	callq  11a0 <fwrite@plt>
    46f6:	48 8b 05 a3 4b 00 00 	mov    0x4ba3(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    46fd:	48 89 c6             	mov    %rax,%rsi
    4700:	bf 0a 00 00 00       	mov    $0xa,%edi
    4705:	e8 d6 c9 ff ff       	callq  10e0 <fputc@plt>
    470a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    470f:	e8 7c ca ff ff       	callq  1190 <exit@plt>
    4714:	90                   	nop
    4715:	eb 04                	jmp    471b <parse_line3+0x534>
    4717:	90                   	nop
    4718:	eb 01                	jmp    471b <parse_line3+0x534>
    471a:	90                   	nop
    471b:	c9                   	leaveq 
    471c:	c3                   	retq   

000000000000471d <parse_line2>:
    471d:	55                   	push   %rbp
    471e:	48 89 e5             	mov    %rsp,%rbp
    4721:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
    4728:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
    472f:	89 b5 f4 fe ff ff    	mov    %esi,-0x10c(%rbp)
    4735:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%rbp)
    473b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
    4742:	b8 00 00 00 00       	mov    $0x0,%eax
    4747:	b9 15 00 00 00       	mov    $0x15,%ecx
    474c:	48 89 d7             	mov    %rdx,%rdi
    474f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    4752:	eb 21                	jmp    4775 <parse_line2+0x58>
    4754:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
    475b:	48 83 c0 01          	add    $0x1,%rax
    475f:	48 89 85 f8 fe ff ff 	mov    %rax,-0x108(%rbp)
    4766:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
    476c:	83 e8 01             	sub    $0x1,%eax
    476f:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%rbp)
    4775:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
    477b:	85 c0                	test   %eax,%eax
    477d:	7e 2b                	jle    47aa <parse_line2+0x8d>
    477f:	e8 2c ca ff ff       	callq  11b0 <__ctype_b_loc@plt>
    4784:	48 8b 10             	mov    (%rax),%rdx
    4787:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
    478e:	0f b6 00             	movzbl (%rax),%eax
    4791:	48 0f be c0          	movsbq %al,%rax
    4795:	48 01 c0             	add    %rax,%rax
    4798:	48 01 d0             	add    %rdx,%rax
    479b:	0f b7 00             	movzwl (%rax),%eax
    479e:	0f b7 c0             	movzwl %ax,%eax
    47a1:	25 00 20 00 00       	and    $0x2000,%eax
    47a6:	85 c0                	test   %eax,%eax
    47a8:	75 aa                	jne    4754 <parse_line2+0x37>
    47aa:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
    47b0:	85 c0                	test   %eax,%eax
    47b2:	0f 84 64 02 00 00    	je     4a1c <parse_line2+0x2ff>
    47b8:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
    47bf:	0f b6 00             	movzbl (%rax),%eax
    47c2:	3c 23                	cmp    $0x23,%al
    47c4:	0f 84 52 02 00 00    	je     4a1c <parse_line2+0x2ff>
    47ca:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
    47d1:	8b 95 f4 fe ff ff    	mov    -0x10c(%rbp),%edx
    47d7:	8d 4a ff             	lea    -0x1(%rdx),%ecx
    47da:	48 89 c2             	mov    %rax,%rdx
    47dd:	89 ce                	mov    %ecx,%esi
    47df:	48 8d 3d b8 1c 00 00 	lea    0x1cb8(%rip),%rdi        # 649e <_IO_stdin_used+0x49e>
    47e6:	b8 00 00 00 00       	mov    $0x0,%eax
    47eb:	e8 a0 c8 ff ff       	callq  1090 <printf@plt>
    47f0:	48 c7 85 00 ff ff ff 	movq   $0x0,-0x100(%rbp)
    47f7:	00 00 00 00 
    47fb:	48 c7 85 08 ff ff ff 	movq   $0x0,-0xf8(%rbp)
    4802:	00 00 00 00 
    4806:	48 c7 85 10 ff ff ff 	movq   $0x0,-0xf0(%rbp)
    480d:	00 00 00 00 
    4811:	48 c7 85 18 ff ff ff 	movq   $0x0,-0xe8(%rbp)
    4818:	00 00 00 00 
    481c:	48 c7 85 20 ff ff ff 	movq   $0x0,-0xe0(%rbp)
    4823:	00 00 00 00 
    4827:	8b 95 f4 fe ff ff    	mov    -0x10c(%rbp),%edx
    482d:	48 8b 8d f8 fe ff ff 	mov    -0x108(%rbp),%rcx
    4834:	48 8d 85 00 ff ff ff 	lea    -0x100(%rbp),%rax
    483b:	48 89 ce             	mov    %rcx,%rsi
    483e:	48 89 c7             	mov    %rax,%rdi
    4841:	e8 b5 e6 ff ff       	callq  2efb <get_label>
    4846:	89 45 f0             	mov    %eax,-0x10(%rbp)
    4849:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
    484d:	74 26                	je     4875 <parse_line2+0x158>
    484f:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
    4855:	39 45 f0             	cmp    %eax,-0x10(%rbp)
    4858:	7d 1b                	jge    4875 <parse_line2+0x158>
    485a:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
    4861:	8b 45 f0             	mov    -0x10(%rbp),%eax
    4864:	48 98                	cltq   
    4866:	48 01 d0             	add    %rdx,%rax
    4869:	0f b6 00             	movzbl (%rax),%eax
    486c:	3c 3a                	cmp    $0x3a,%al
    486e:	75 05                	jne    4875 <parse_line2+0x158>
    4870:	e9 dd fe ff ff       	jmpq   4752 <parse_line2+0x35>
    4875:	48 8d 8d f4 fe ff ff 	lea    -0x10c(%rbp),%rcx
    487c:	48 8d 85 f8 fe ff ff 	lea    -0x108(%rbp),%rax
    4883:	ba 00 00 00 00       	mov    $0x0,%edx
    4888:	48 89 ce             	mov    %rcx,%rsi
    488b:	48 89 c7             	mov    %rax,%rdi
    488e:	e8 91 d4 ff ff       	callq  1d24 <gettok>
    4893:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    4897:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
    489e:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
    48a2:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    48a5:	48 8d 05 54 48 00 00 	lea    0x4854(%rip),%rax        # 9100 <opcode_map>
    48ac:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    48b0:	e9 e3 00 00 00       	jmpq   4998 <parse_line2+0x27b>
    48b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    48b9:	0f b6 40 08          	movzbl 0x8(%rax),%eax
    48bd:	0f b6 c0             	movzbl %al,%eax
    48c0:	39 45 e4             	cmp    %eax,-0x1c(%rbp)
    48c3:	0f 85 c6 00 00 00    	jne    498f <parse_line2+0x272>
    48c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    48cd:	0f b6 40 08          	movzbl 0x8(%rax),%eax
    48d1:	0f b6 d0             	movzbl %al,%edx
    48d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    48d8:	48 8b 08             	mov    (%rax),%rcx
    48db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    48df:	48 89 ce             	mov    %rcx,%rsi
    48e2:	48 89 c7             	mov    %rax,%rdi
    48e5:	e8 16 c8 ff ff       	callq  1100 <memcmp@plt>
    48ea:	85 c0                	test   %eax,%eax
    48ec:	0f 85 a0 00 00 00    	jne    4992 <parse_line2+0x275>
    48f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    48f9:	eb 43                	jmp    493e <parse_line2+0x221>
    48fb:	48 8d 8d 30 ff ff ff 	lea    -0xd0(%rbp),%rcx
    4902:	8b 45 f4             	mov    -0xc(%rbp),%eax
    4905:	48 63 d0             	movslq %eax,%rdx
    4908:	48 89 d0             	mov    %rdx,%rax
    490b:	48 c1 e0 02          	shl    $0x2,%rax
    490f:	48 01 d0             	add    %rdx,%rax
    4912:	48 c1 e0 03          	shl    $0x3,%rax
    4916:	48 01 c8             	add    %rcx,%rax
    4919:	48 8d 48 08          	lea    0x8(%rax),%rcx
    491d:	48 8d 95 f4 fe ff ff 	lea    -0x10c(%rbp),%rdx
    4924:	48 8d 85 f8 fe ff ff 	lea    -0x108(%rbp),%rax
    492b:	48 89 c6             	mov    %rax,%rsi
    492e:	48 89 cf             	mov    %rcx,%rdi
    4931:	e8 68 e7 ff ff       	callq  309e <getarg>
    4936:	85 c0                	test   %eax,%eax
    4938:	75 0c                	jne    4946 <parse_line2+0x229>
    493a:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    493e:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
    4942:	7e b7                	jle    48fb <parse_line2+0x1de>
    4944:	eb 01                	jmp    4947 <parse_line2+0x22a>
    4946:	90                   	nop
    4947:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    494b:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
    4952:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    4959:	48 8d 50 08          	lea    0x8(%rax),%rdx
    495d:	48 83 c2 50          	add    $0x50,%rdx
    4961:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    4968:	48 83 c0 08          	add    $0x8,%rax
    496c:	48 83 c0 28          	add    $0x28,%rax
    4970:	48 8d 8d 30 ff ff ff 	lea    -0xd0(%rbp),%rcx
    4977:	48 8d 71 08          	lea    0x8(%rcx),%rsi
    497b:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    497f:	48 89 d1             	mov    %rdx,%rcx
    4982:	48 89 c2             	mov    %rax,%rdx
    4985:	e8 eb ee ff ff       	callq  3875 <do_emit_inst>
    498a:	e9 8e 00 00 00       	jmpq   4a1d <parse_line2+0x300>
    498f:	90                   	nop
    4990:	eb 01                	jmp    4993 <parse_line2+0x276>
    4992:	90                   	nop
    4993:	48 83 45 f8 10       	addq   $0x10,-0x8(%rbp)
    4998:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    499c:	48 8b 00             	mov    (%rax),%rax
    499f:	48 85 c0             	test   %rax,%rax
    49a2:	0f 85 0d ff ff ff    	jne    48b5 <parse_line2+0x198>
    49a8:	48 8b 05 d1 48 00 00 	mov    0x48d1(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    49af:	48 89 c7             	mov    %rax,%rdi
    49b2:	e8 99 c7 ff ff       	callq  1150 <fflush@plt>
    49b7:	48 8b 05 e2 48 00 00 	mov    0x48e2(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    49be:	b9 a2 05 00 00       	mov    $0x5a2,%ecx
    49c3:	48 8d 15 d6 1c 00 00 	lea    0x1cd6(%rip),%rdx        # 66a0 <__func__.4817>
    49ca:	48 8d 35 c7 16 00 00 	lea    0x16c7(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    49d1:	48 89 c7             	mov    %rax,%rdi
    49d4:	b8 00 00 00 00       	mov    $0x0,%eax
    49d9:	e8 32 c7 ff ff       	callq  1110 <fprintf@plt>
    49de:	48 8b 05 bb 48 00 00 	mov    0x48bb(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    49e5:	48 89 c1             	mov    %rax,%rcx
    49e8:	ba 0e 00 00 00       	mov    $0xe,%edx
    49ed:	be 01 00 00 00       	mov    $0x1,%esi
    49f2:	48 8d 3d 68 1a 00 00 	lea    0x1a68(%rip),%rdi        # 6461 <_IO_stdin_used+0x461>
    49f9:	e8 a2 c7 ff ff       	callq  11a0 <fwrite@plt>
    49fe:	48 8b 05 9b 48 00 00 	mov    0x489b(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4a05:	48 89 c6             	mov    %rax,%rsi
    4a08:	bf 0a 00 00 00       	mov    $0xa,%edi
    4a0d:	e8 ce c6 ff ff       	callq  10e0 <fputc@plt>
    4a12:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4a17:	e8 74 c7 ff ff       	callq  1190 <exit@plt>
    4a1c:	90                   	nop
    4a1d:	90                   	nop
    4a1e:	c9                   	leaveq 
    4a1f:	c3                   	retq   

0000000000004a20 <main>:
    4a20:	55                   	push   %rbp
    4a21:	48 89 e5             	mov    %rsp,%rbp
    4a24:	53                   	push   %rbx
    4a25:	48 83 ec 58          	sub    $0x58,%rsp
    4a29:	89 7d ac             	mov    %edi,-0x54(%rbp)
    4a2c:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
    4a30:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    4a37:	e9 18 01 00 00       	jmpq   4b54 <main+0x134>
    4a3c:	83 7d d4 6f          	cmpl   $0x6f,-0x2c(%rbp)
    4a40:	0f 85 9a 00 00 00    	jne    4ae0 <main+0xc0>
    4a46:	48 8b 05 3b 48 00 00 	mov    0x483b(%rip),%rax        # 9288 <optarg@@GLIBC_2.2.5>
    4a4d:	be 41 02 00 00       	mov    $0x241,%esi
    4a52:	48 89 c7             	mov    %rax,%rdi
    4a55:	b8 00 00 00 00       	mov    $0x0,%eax
    4a5a:	e8 11 c7 ff ff       	callq  1170 <open@plt>
    4a5f:	89 45 ec             	mov    %eax,-0x14(%rbp)
    4a62:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    4a66:	0f 89 e8 00 00 00    	jns    4b54 <main+0x134>
    4a6c:	48 8b 05 0d 48 00 00 	mov    0x480d(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    4a73:	48 89 c7             	mov    %rax,%rdi
    4a76:	e8 d5 c6 ff ff       	callq  1150 <fflush@plt>
    4a7b:	48 8b 05 1e 48 00 00 	mov    0x481e(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4a82:	b9 b1 05 00 00       	mov    $0x5b1,%ecx
    4a87:	48 8d 15 1e 1c 00 00 	lea    0x1c1e(%rip),%rdx        # 66ac <__func__.4825>
    4a8e:	48 8d 35 03 16 00 00 	lea    0x1603(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    4a95:	48 89 c7             	mov    %rax,%rdi
    4a98:	b8 00 00 00 00       	mov    $0x0,%eax
    4a9d:	e8 6e c6 ff ff       	callq  1110 <fprintf@plt>
    4aa2:	48 8b 05 f7 47 00 00 	mov    0x47f7(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4aa9:	48 89 c1             	mov    %rax,%rcx
    4aac:	ba 1e 00 00 00       	mov    $0x1e,%edx
    4ab1:	be 01 00 00 00       	mov    $0x1,%esi
    4ab6:	48 8d 3d f3 19 00 00 	lea    0x19f3(%rip),%rdi        # 64b0 <_IO_stdin_used+0x4b0>
    4abd:	e8 de c6 ff ff       	callq  11a0 <fwrite@plt>
    4ac2:	48 8b 05 d7 47 00 00 	mov    0x47d7(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4ac9:	48 89 c6             	mov    %rax,%rsi
    4acc:	bf 0a 00 00 00       	mov    $0xa,%edi
    4ad1:	e8 0a c6 ff ff       	callq  10e0 <fputc@plt>
    4ad6:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4adb:	e8 b0 c6 ff ff       	callq  1190 <exit@plt>
    4ae0:	48 8b 05 99 47 00 00 	mov    0x4799(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    4ae7:	48 89 c7             	mov    %rax,%rdi
    4aea:	e8 61 c6 ff ff       	callq  1150 <fflush@plt>
    4aef:	48 8b 05 aa 47 00 00 	mov    0x47aa(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4af6:	b9 b4 05 00 00       	mov    $0x5b4,%ecx
    4afb:	48 8d 15 aa 1b 00 00 	lea    0x1baa(%rip),%rdx        # 66ac <__func__.4825>
    4b02:	48 8d 35 8f 15 00 00 	lea    0x158f(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    4b09:	48 89 c7             	mov    %rax,%rdi
    4b0c:	b8 00 00 00 00       	mov    $0x0,%eax
    4b11:	e8 fa c5 ff ff       	callq  1110 <fprintf@plt>
    4b16:	48 8b 05 83 47 00 00 	mov    0x4783(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4b1d:	48 89 c1             	mov    %rax,%rcx
    4b20:	ba 0e 00 00 00       	mov    $0xe,%edx
    4b25:	be 01 00 00 00       	mov    $0x1,%esi
    4b2a:	48 8d 3d 9e 19 00 00 	lea    0x199e(%rip),%rdi        # 64cf <_IO_stdin_used+0x4cf>
    4b31:	e8 6a c6 ff ff       	callq  11a0 <fwrite@plt>
    4b36:	48 8b 05 63 47 00 00 	mov    0x4763(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4b3d:	48 89 c6             	mov    %rax,%rsi
    4b40:	bf 0a 00 00 00       	mov    $0xa,%edi
    4b45:	e8 96 c5 ff ff       	callq  10e0 <fputc@plt>
    4b4a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4b4f:	e8 3c c6 ff ff       	callq  1190 <exit@plt>
    4b54:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    4b58:	8b 45 ac             	mov    -0x54(%rbp),%eax
    4b5b:	48 8d 15 7c 19 00 00 	lea    0x197c(%rip),%rdx        # 64de <_IO_stdin_used+0x4de>
    4b62:	48 89 ce             	mov    %rcx,%rsi
    4b65:	89 c7                	mov    %eax,%edi
    4b67:	e8 14 c6 ff ff       	callq  1180 <getopt@plt>
    4b6c:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    4b6f:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%rbp)
    4b73:	0f 85 c3 fe ff ff    	jne    4a3c <main+0x1c>
    4b79:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    4b7d:	79 74                	jns    4bf3 <main+0x1d3>
    4b7f:	48 8b 05 fa 46 00 00 	mov    0x46fa(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    4b86:	48 89 c7             	mov    %rax,%rdi
    4b89:	e8 c2 c5 ff ff       	callq  1150 <fflush@plt>
    4b8e:	48 8b 05 0b 47 00 00 	mov    0x470b(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4b95:	b9 b9 05 00 00       	mov    $0x5b9,%ecx
    4b9a:	48 8d 15 0b 1b 00 00 	lea    0x1b0b(%rip),%rdx        # 66ac <__func__.4825>
    4ba1:	48 8d 35 f0 14 00 00 	lea    0x14f0(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    4ba8:	48 89 c7             	mov    %rax,%rdi
    4bab:	b8 00 00 00 00       	mov    $0x0,%eax
    4bb0:	e8 5b c5 ff ff       	callq  1110 <fprintf@plt>
    4bb5:	48 8b 05 e4 46 00 00 	mov    0x46e4(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4bbc:	48 89 c1             	mov    %rax,%rcx
    4bbf:	ba 0e 00 00 00       	mov    $0xe,%edx
    4bc4:	be 01 00 00 00       	mov    $0x1,%esi
    4bc9:	48 8d 3d 11 19 00 00 	lea    0x1911(%rip),%rdi        # 64e1 <_IO_stdin_used+0x4e1>
    4bd0:	e8 cb c5 ff ff       	callq  11a0 <fwrite@plt>
    4bd5:	48 8b 05 c4 46 00 00 	mov    0x46c4(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4bdc:	48 89 c6             	mov    %rax,%rsi
    4bdf:	bf 0a 00 00 00       	mov    $0xa,%edi
    4be4:	e8 f7 c4 ff ff       	callq  10e0 <fputc@plt>
    4be9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4bee:	e8 9d c5 ff ff       	callq  1190 <exit@plt>
    4bf3:	be 02 00 00 00       	mov    $0x2,%esi
    4bf8:	48 8d 3d f1 18 00 00 	lea    0x18f1(%rip),%rdi        # 64f0 <_IO_stdin_used+0x4f0>
    4bff:	b8 00 00 00 00       	mov    $0x0,%eax
    4c04:	e8 87 c4 ff ff       	callq  1090 <printf@plt>
    4c09:	bf 00 04 00 00       	mov    $0x400,%edi
    4c0e:	e8 4c c9 ff ff       	callq  155f <new_arena>
    4c13:	48 89 05 ae 46 00 00 	mov    %rax,0x46ae(%rip)        # 92c8 <inst_arena>
    4c1a:	48 8d 05 e8 18 00 00 	lea    0x18e8(%rip),%rax        # 6509 <_IO_stdin_used+0x509>
    4c21:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    4c25:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    4c29:	be 00 00 00 00       	mov    $0x0,%esi
    4c2e:	48 89 c7             	mov    %rax,%rdi
    4c31:	b8 00 00 00 00       	mov    $0x0,%eax
    4c36:	e8 35 c5 ff ff       	callq  1170 <open@plt>
    4c3b:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    4c3e:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
    4c42:	79 2a                	jns    4c6e <main+0x24e>
    4c44:	48 8b 05 55 46 00 00 	mov    0x4655(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4c4b:	48 89 c1             	mov    %rax,%rcx
    4c4e:	ba 05 00 00 00       	mov    $0x5,%edx
    4c53:	be 01 00 00 00       	mov    $0x1,%esi
    4c58:	48 8d 3d b1 18 00 00 	lea    0x18b1(%rip),%rdi        # 6510 <_IO_stdin_used+0x510>
    4c5f:	e8 3c c5 ff ff       	callq  11a0 <fwrite@plt>
    4c64:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c69:	e9 d8 04 00 00       	jmpq   5146 <main+0x726>
    4c6e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    4c75:	eb 4d                	jmp    4cc4 <main+0x2a4>
    4c77:	8b 45 e8             	mov    -0x18(%rbp),%eax
    4c7a:	48 63 d0             	movslq %eax,%rdx
    4c7d:	48 89 d0             	mov    %rdx,%rax
    4c80:	48 c1 e0 02          	shl    $0x2,%rax
    4c84:	48 01 d0             	add    %rdx,%rax
    4c87:	48 c1 e0 03          	shl    $0x3,%rax
    4c8b:	48 89 c2             	mov    %rax,%rdx
    4c8e:	48 8d 05 cb 46 00 00 	lea    0x46cb(%rip),%rax        # 9360 <rarg>
    4c95:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
    4c99:	8b 45 e8             	mov    -0x18(%rbp),%eax
    4c9c:	89 c1                	mov    %eax,%ecx
    4c9e:	8b 45 e8             	mov    -0x18(%rbp),%eax
    4ca1:	48 63 d0             	movslq %eax,%rdx
    4ca4:	48 89 d0             	mov    %rdx,%rax
    4ca7:	48 c1 e0 02          	shl    $0x2,%rax
    4cab:	48 01 d0             	add    %rdx,%rax
    4cae:	48 c1 e0 03          	shl    $0x3,%rax
    4cb2:	48 89 c2             	mov    %rax,%rdx
    4cb5:	48 8d 05 a6 46 00 00 	lea    0x46a6(%rip),%rax        # 9362 <rarg+0x2>
    4cbc:	66 89 0c 02          	mov    %cx,(%rdx,%rax,1)
    4cc0:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    4cc4:	83 7d e8 0f          	cmpl   $0xf,-0x18(%rbp)
    4cc8:	7e ad                	jle    4c77 <main+0x257>
    4cca:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    4cd1:	e9 04 02 00 00       	jmpq   4eda <main+0x4ba>
    4cd6:	48 8d 05 03 46 00 00 	lea    0x4603(%rip),%rax        # 92e0 <filebuf>
    4cdd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    4ce1:	e9 c1 00 00 00       	jmpq   4da7 <main+0x387>
    4ce6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4ce9:	48 98                	cltq   
    4ceb:	48 8d 15 ee 45 00 00 	lea    0x45ee(%rip),%rdx        # 92e0 <filebuf>
    4cf2:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
    4cf6:	3c 0a                	cmp    $0xa,%al
    4cf8:	0f 84 b7 00 00 00    	je     4db5 <main+0x395>
    4cfe:	e8 ad c4 ff ff       	callq  11b0 <__ctype_b_loc@plt>
    4d03:	48 8b 10             	mov    (%rax),%rdx
    4d06:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4d09:	48 98                	cltq   
    4d0b:	48 8d 0d ce 45 00 00 	lea    0x45ce(%rip),%rcx        # 92e0 <filebuf>
    4d12:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
    4d16:	48 0f be c0          	movsbq %al,%rax
    4d1a:	48 01 c0             	add    %rax,%rax
    4d1d:	48 01 d0             	add    %rdx,%rax
    4d20:	0f b7 00             	movzwl (%rax),%eax
    4d23:	0f b7 c0             	movzwl %ax,%eax
    4d26:	25 00 40 00 00       	and    $0x4000,%eax
    4d2b:	85 c0                	test   %eax,%eax
    4d2d:	75 74                	jne    4da3 <main+0x383>
    4d2f:	48 8b 05 4a 45 00 00 	mov    0x454a(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    4d36:	48 89 c7             	mov    %rax,%rdi
    4d39:	e8 12 c4 ff ff       	callq  1150 <fflush@plt>
    4d3e:	48 8b 05 5b 45 00 00 	mov    0x455b(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4d45:	b9 e8 05 00 00       	mov    $0x5e8,%ecx
    4d4a:	48 8d 15 5b 19 00 00 	lea    0x195b(%rip),%rdx        # 66ac <__func__.4825>
    4d51:	48 8d 35 40 13 00 00 	lea    0x1340(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    4d58:	48 89 c7             	mov    %rax,%rdi
    4d5b:	b8 00 00 00 00       	mov    $0x0,%eax
    4d60:	e8 ab c3 ff ff       	callq  1110 <fprintf@plt>
    4d65:	48 8b 05 34 45 00 00 	mov    0x4534(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4d6c:	48 89 c1             	mov    %rax,%rcx
    4d6f:	ba 16 00 00 00       	mov    $0x16,%edx
    4d74:	be 01 00 00 00       	mov    $0x1,%esi
    4d79:	48 8d 3d 96 17 00 00 	lea    0x1796(%rip),%rdi        # 6516 <_IO_stdin_used+0x516>
    4d80:	e8 1b c4 ff ff       	callq  11a0 <fwrite@plt>
    4d85:	48 8b 05 14 45 00 00 	mov    0x4514(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4d8c:	48 89 c6             	mov    %rax,%rsi
    4d8f:	bf 0a 00 00 00       	mov    $0xa,%edi
    4d94:	e8 47 c3 ff ff       	callq  10e0 <fputc@plt>
    4d99:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4d9e:	e8 ed c3 ff ff       	callq  1190 <exit@plt>
    4da3:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
    4da7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4daa:	3b 45 c0             	cmp    -0x40(%rbp),%eax
    4dad:	0f 8c 33 ff ff ff    	jl     4ce6 <main+0x2c6>
    4db3:	eb 01                	jmp    4db6 <main+0x396>
    4db5:	90                   	nop
    4db6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4db9:	3b 45 c0             	cmp    -0x40(%rbp),%eax
    4dbc:	7d 72                	jge    4e30 <main+0x410>
    4dbe:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4dc1:	48 98                	cltq   
    4dc3:	48 8d 15 16 45 00 00 	lea    0x4516(%rip),%rdx        # 92e0 <filebuf>
    4dca:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
    4dce:	3c 0a                	cmp    $0xa,%al
    4dd0:	74 1f                	je     4df1 <main+0x3d1>
    4dd2:	48 8d 0d d8 18 00 00 	lea    0x18d8(%rip),%rcx        # 66b1 <__PRETTY_FUNCTION__.4843>
    4dd9:	ba ec 05 00 00       	mov    $0x5ec,%edx
    4dde:	48 8d 35 cb 12 00 00 	lea    0x12cb(%rip),%rsi        # 60b0 <_IO_stdin_used+0xb0>
    4de5:	48 8d 3d 41 17 00 00 	lea    0x1741(%rip),%rdi        # 652d <_IO_stdin_used+0x52d>
    4dec:	e8 bf c2 ff ff       	callq  10b0 <__assert_fail@plt>
    4df1:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
    4df5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4df8:	48 8d 0d e1 44 00 00 	lea    0x44e1(%rip),%rcx        # 92e0 <filebuf>
    4dff:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4e03:	48 29 ca             	sub    %rcx,%rdx
    4e06:	29 d0                	sub    %edx,%eax
    4e08:	89 c2                	mov    %eax,%edx
    4e0a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4e0e:	89 d6                	mov    %edx,%esi
    4e10:	48 89 c7             	mov    %rax,%rdi
    4e13:	e8 cf f3 ff ff       	callq  41e7 <parse_line3>
    4e18:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4e1b:	48 98                	cltq   
    4e1d:	48 8d 15 bc 44 00 00 	lea    0x44bc(%rip),%rdx        # 92e0 <filebuf>
    4e24:	48 01 d0             	add    %rdx,%rax
    4e27:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    4e2b:	e9 77 ff ff ff       	jmpq   4da7 <main+0x387>
    4e30:	8b 45 c0             	mov    -0x40(%rbp),%eax
    4e33:	48 8d 0d a6 44 00 00 	lea    0x44a6(%rip),%rcx        # 92e0 <filebuf>
    4e3a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4e3e:	48 29 ca             	sub    %rcx,%rdx
    4e41:	29 d0                	sub    %edx,%eax
    4e43:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    4e46:	83 7d e4 40          	cmpl   $0x40,-0x1c(%rbp)
    4e4a:	7e 74                	jle    4ec0 <main+0x4a0>
    4e4c:	48 8b 05 2d 44 00 00 	mov    0x442d(%rip),%rax        # 9280 <stdout@@GLIBC_2.2.5>
    4e53:	48 89 c7             	mov    %rax,%rdi
    4e56:	e8 f5 c2 ff ff       	callq  1150 <fflush@plt>
    4e5b:	48 8b 05 3e 44 00 00 	mov    0x443e(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4e62:	b9 f6 05 00 00       	mov    $0x5f6,%ecx
    4e67:	48 8d 15 3e 18 00 00 	lea    0x183e(%rip),%rdx        # 66ac <__func__.4825>
    4e6e:	48 8d 35 23 12 00 00 	lea    0x1223(%rip),%rsi        # 6098 <_IO_stdin_used+0x98>
    4e75:	48 89 c7             	mov    %rax,%rdi
    4e78:	b8 00 00 00 00       	mov    $0x0,%eax
    4e7d:	e8 8e c2 ff ff       	callq  1110 <fprintf@plt>
    4e82:	48 8b 05 17 44 00 00 	mov    0x4417(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4e89:	48 89 c1             	mov    %rax,%rcx
    4e8c:	ba 0f 00 00 00       	mov    $0xf,%edx
    4e91:	be 01 00 00 00       	mov    $0x1,%esi
    4e96:	48 8d 3d a3 16 00 00 	lea    0x16a3(%rip),%rdi        # 6540 <_IO_stdin_used+0x540>
    4e9d:	e8 fe c2 ff ff       	callq  11a0 <fwrite@plt>
    4ea2:	48 8b 05 f7 43 00 00 	mov    0x43f7(%rip),%rax        # 92a0 <stderr@@GLIBC_2.2.5>
    4ea9:	48 89 c6             	mov    %rax,%rsi
    4eac:	bf 0a 00 00 00       	mov    $0xa,%edi
    4eb1:	e8 2a c2 ff ff       	callq  10e0 <fputc@plt>
    4eb6:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4ebb:	e8 d0 c2 ff ff       	callq  1190 <exit@plt>
    4ec0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4ec3:	48 63 d0             	movslq %eax,%rdx
    4ec6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4eca:	48 89 c6             	mov    %rax,%rsi
    4ecd:	48 8d 3d 0c 44 00 00 	lea    0x440c(%rip),%rdi        # 92e0 <filebuf>
    4ed4:	e8 87 c2 ff ff       	callq  1160 <memmove@plt>
    4ed9:	90                   	nop
    4eda:	b8 80 00 00 00       	mov    $0x80,%eax
    4edf:	2b 45 e4             	sub    -0x1c(%rbp),%eax
    4ee2:	48 63 d0             	movslq %eax,%rdx
    4ee5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4ee8:	48 98                	cltq   
    4eea:	48 8d 0d ef 43 00 00 	lea    0x43ef(%rip),%rcx        # 92e0 <filebuf>
    4ef1:	48 01 c1             	add    %rax,%rcx
    4ef4:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    4ef7:	48 89 ce             	mov    %rcx,%rsi
    4efa:	89 c7                	mov    %eax,%edi
    4efc:	e8 ef c1 ff ff       	callq  10f0 <read@plt>
    4f01:	89 c2                	mov    %eax,%edx
    4f03:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    4f06:	01 d0                	add    %edx,%eax
    4f08:	89 45 c0             	mov    %eax,-0x40(%rbp)
    4f0b:	83 7d c0 00          	cmpl   $0x0,-0x40(%rbp)
    4f0f:	0f 85 c1 fd ff ff    	jne    4cd6 <main+0x2b6>
    4f15:	48 c7 45 b7 00 00 00 	movq   $0x0,-0x49(%rbp)
    4f1c:	00 
    4f1d:	c6 45 bf 00          	movb   $0x0,-0x41(%rbp)
    4f21:	c6 45 b7 7f          	movb   $0x7f,-0x49(%rbp)
    4f25:	c6 45 b8 54          	movb   $0x54,-0x48(%rbp)
    4f29:	c6 45 b9 52          	movb   $0x52,-0x47(%rbp)
    4f2d:	c6 45 ba 4c          	movb   $0x4c,-0x46(%rbp)
    4f31:	c6 45 bb 01          	movb   $0x1,-0x45(%rbp)
    4f35:	c6 45 bc 01          	movb   $0x1,-0x44(%rbp)
    4f39:	48 8d 4d b7          	lea    -0x49(%rbp),%rcx
    4f3d:	8b 45 ec             	mov    -0x14(%rbp),%eax
    4f40:	ba 09 00 00 00       	mov    $0x9,%edx
    4f45:	48 89 ce             	mov    %rcx,%rsi
    4f48:	89 c7                	mov    %eax,%edi
    4f4a:	e8 11 c1 ff ff       	callq  1060 <write@plt>
    4f4f:	66 c7 45 b4 00 00    	movw   $0x0,-0x4c(%rbp)
    4f55:	c6 45 b6 00          	movb   $0x0,-0x4a(%rbp)
    4f59:	c6 45 b4 02          	movb   $0x2,-0x4c(%rbp)
    4f5d:	48 8b 05 54 43 00 00 	mov    0x4354(%rip),%rax        # 92b8 <symtab_arena>
    4f64:	48 89 c7             	mov    %rax,%rdi
    4f67:	e8 fb c7 ff ff       	callq  1767 <arena_size>
    4f6c:	83 c0 03             	add    $0x3,%eax
    4f6f:	66 89 45 b5          	mov    %ax,-0x4b(%rbp)
    4f73:	0f b7 45 b5          	movzwl -0x4b(%rbp),%eax
    4f77:	0f b7 d8             	movzwl %ax,%ebx
    4f7a:	8b 45 ec             	mov    -0x14(%rbp),%eax
    4f7d:	ba 01 00 00 00       	mov    $0x1,%edx
    4f82:	be 00 00 00 00       	mov    $0x0,%esi
    4f87:	89 c7                	mov    %eax,%edi
    4f89:	e8 12 c1 ff ff       	callq  10a0 <lseek@plt>
    4f8e:	89 da                	mov    %ebx,%edx
    4f90:	48 89 c6             	mov    %rax,%rsi
    4f93:	48 8d 3d b6 15 00 00 	lea    0x15b6(%rip),%rdi        # 6550 <_IO_stdin_used+0x550>
    4f9a:	b8 00 00 00 00       	mov    $0x0,%eax
    4f9f:	e8 ec c0 ff ff       	callq  1090 <printf@plt>
    4fa4:	48 8d 4d b4          	lea    -0x4c(%rbp),%rcx
    4fa8:	8b 45 ec             	mov    -0x14(%rbp),%eax
    4fab:	ba 03 00 00 00       	mov    $0x3,%edx
    4fb0:	48 89 ce             	mov    %rcx,%rsi
    4fb3:	89 c7                	mov    %eax,%edi
    4fb5:	e8 a6 c0 ff ff       	callq  1060 <write@plt>
    4fba:	48 8b 05 f7 42 00 00 	mov    0x42f7(%rip),%rax        # 92b8 <symtab_arena>
    4fc1:	8b 55 ec             	mov    -0x14(%rbp),%edx
    4fc4:	89 d6                	mov    %edx,%esi
    4fc6:	48 89 c7             	mov    %rax,%rdi
    4fc9:	e8 cb c6 ff ff       	callq  1699 <arena_write>
    4fce:	c6 45 b4 01          	movb   $0x1,-0x4c(%rbp)
    4fd2:	48 8b 05 d7 42 00 00 	mov    0x42d7(%rip),%rax        # 92b0 <strtab_arena>
    4fd9:	48 89 c7             	mov    %rax,%rdi
    4fdc:	e8 86 c7 ff ff       	callq  1767 <arena_size>
    4fe1:	83 c0 03             	add    $0x3,%eax
    4fe4:	66 89 45 b5          	mov    %ax,-0x4b(%rbp)
    4fe8:	0f b7 45 b5          	movzwl -0x4b(%rbp),%eax
    4fec:	0f b7 d8             	movzwl %ax,%ebx
    4fef:	8b 45 ec             	mov    -0x14(%rbp),%eax
    4ff2:	ba 01 00 00 00       	mov    $0x1,%edx
    4ff7:	be 00 00 00 00       	mov    $0x0,%esi
    4ffc:	89 c7                	mov    %eax,%edi
    4ffe:	e8 9d c0 ff ff       	callq  10a0 <lseek@plt>
    5003:	89 da                	mov    %ebx,%edx
    5005:	48 89 c6             	mov    %rax,%rsi
    5008:	48 8d 3d 51 15 00 00 	lea    0x1551(%rip),%rdi        # 6560 <_IO_stdin_used+0x560>
    500f:	b8 00 00 00 00       	mov    $0x0,%eax
    5014:	e8 77 c0 ff ff       	callq  1090 <printf@plt>
    5019:	48 8d 4d b4          	lea    -0x4c(%rbp),%rcx
    501d:	8b 45 ec             	mov    -0x14(%rbp),%eax
    5020:	ba 03 00 00 00       	mov    $0x3,%edx
    5025:	48 89 ce             	mov    %rcx,%rsi
    5028:	89 c7                	mov    %eax,%edi
    502a:	e8 31 c0 ff ff       	callq  1060 <write@plt>
    502f:	48 8b 05 7a 42 00 00 	mov    0x427a(%rip),%rax        # 92b0 <strtab_arena>
    5036:	8b 55 ec             	mov    -0x14(%rbp),%edx
    5039:	89 d6                	mov    %edx,%esi
    503b:	48 89 c7             	mov    %rax,%rdi
    503e:	e8 56 c6 ff ff       	callq  1699 <arena_write>
    5043:	c6 45 b4 03          	movb   $0x3,-0x4c(%rbp)
    5047:	48 8b 05 72 42 00 00 	mov    0x4272(%rip),%rax        # 92c0 <reloca_arena>
    504e:	48 89 c7             	mov    %rax,%rdi
    5051:	e8 11 c7 ff ff       	callq  1767 <arena_size>
    5056:	83 c0 03             	add    $0x3,%eax
    5059:	66 89 45 b5          	mov    %ax,-0x4b(%rbp)
    505d:	0f b7 45 b5          	movzwl -0x4b(%rbp),%eax
    5061:	0f b7 d8             	movzwl %ax,%ebx
    5064:	8b 45 ec             	mov    -0x14(%rbp),%eax
    5067:	ba 01 00 00 00       	mov    $0x1,%edx
    506c:	be 00 00 00 00       	mov    $0x0,%esi
    5071:	89 c7                	mov    %eax,%edi
    5073:	e8 28 c0 ff ff       	callq  10a0 <lseek@plt>
    5078:	89 da                	mov    %ebx,%edx
    507a:	48 89 c6             	mov    %rax,%rsi
    507d:	48 8d 3d ec 14 00 00 	lea    0x14ec(%rip),%rdi        # 6570 <_IO_stdin_used+0x570>
    5084:	b8 00 00 00 00       	mov    $0x0,%eax
    5089:	e8 02 c0 ff ff       	callq  1090 <printf@plt>
    508e:	48 8d 4d b4          	lea    -0x4c(%rbp),%rcx
    5092:	8b 45 ec             	mov    -0x14(%rbp),%eax
    5095:	ba 03 00 00 00       	mov    $0x3,%edx
    509a:	48 89 ce             	mov    %rcx,%rsi
    509d:	89 c7                	mov    %eax,%edi
    509f:	e8 bc bf ff ff       	callq  1060 <write@plt>
    50a4:	48 8b 05 15 42 00 00 	mov    0x4215(%rip),%rax        # 92c0 <reloca_arena>
    50ab:	8b 55 ec             	mov    -0x14(%rbp),%edx
    50ae:	89 d6                	mov    %edx,%esi
    50b0:	48 89 c7             	mov    %rax,%rdi
    50b3:	e8 e1 c5 ff ff       	callq  1699 <arena_write>
    50b8:	c6 45 b4 00          	movb   $0x0,-0x4c(%rbp)
    50bc:	48 8b 05 05 42 00 00 	mov    0x4205(%rip),%rax        # 92c8 <inst_arena>
    50c3:	48 89 c7             	mov    %rax,%rdi
    50c6:	e8 9c c6 ff ff       	callq  1767 <arena_size>
    50cb:	83 c0 03             	add    $0x3,%eax
    50ce:	66 89 45 b5          	mov    %ax,-0x4b(%rbp)
    50d2:	0f b7 45 b5          	movzwl -0x4b(%rbp),%eax
    50d6:	0f b7 d8             	movzwl %ax,%ebx
    50d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
    50dc:	ba 01 00 00 00       	mov    $0x1,%edx
    50e1:	be 00 00 00 00       	mov    $0x0,%esi
    50e6:	89 c7                	mov    %eax,%edi
    50e8:	e8 b3 bf ff ff       	callq  10a0 <lseek@plt>
    50ed:	89 da                	mov    %ebx,%edx
    50ef:	48 89 c6             	mov    %rax,%rsi
    50f2:	48 8d 3d 86 14 00 00 	lea    0x1486(%rip),%rdi        # 657f <_IO_stdin_used+0x57f>
    50f9:	b8 00 00 00 00       	mov    $0x0,%eax
    50fe:	e8 8d bf ff ff       	callq  1090 <printf@plt>
    5103:	48 8d 4d b4          	lea    -0x4c(%rbp),%rcx
    5107:	8b 45 ec             	mov    -0x14(%rbp),%eax
    510a:	ba 03 00 00 00       	mov    $0x3,%edx
    510f:	48 89 ce             	mov    %rcx,%rsi
    5112:	89 c7                	mov    %eax,%edi
    5114:	e8 47 bf ff ff       	callq  1060 <write@plt>
    5119:	48 8b 05 a8 41 00 00 	mov    0x41a8(%rip),%rax        # 92c8 <inst_arena>
    5120:	8b 55 ec             	mov    -0x14(%rbp),%edx
    5123:	89 d6                	mov    %edx,%esi
    5125:	48 89 c7             	mov    %rax,%rdi
    5128:	e8 6c c5 ff ff       	callq  1699 <arena_write>
    512d:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    5130:	89 c7                	mov    %eax,%edi
    5132:	e8 99 bf ff ff       	callq  10d0 <close@plt>
    5137:	8b 45 ec             	mov    -0x14(%rbp),%eax
    513a:	89 c7                	mov    %eax,%edi
    513c:	e8 8f bf ff ff       	callq  10d0 <close@plt>
    5141:	b8 00 00 00 00       	mov    $0x0,%eax
    5146:	48 83 c4 58          	add    $0x58,%rsp
    514a:	5b                   	pop    %rbx
    514b:	5d                   	pop    %rbp
    514c:	c3                   	retq   
    514d:	0f 1f 00             	nopl   (%rax)

0000000000005150 <__libc_csu_init>:
    5150:	41 57                	push   %r15
    5152:	49 89 d7             	mov    %rdx,%r15
    5155:	41 56                	push   %r14
    5157:	49 89 f6             	mov    %rsi,%r14
    515a:	41 55                	push   %r13
    515c:	41 89 fd             	mov    %edi,%r13d
    515f:	41 54                	push   %r12
    5161:	4c 8d 25 80 3c 00 00 	lea    0x3c80(%rip),%r12        # 8de8 <__frame_dummy_init_array_entry>
    5168:	55                   	push   %rbp
    5169:	48 8d 2d 80 3c 00 00 	lea    0x3c80(%rip),%rbp        # 8df0 <__init_array_end>
    5170:	53                   	push   %rbx
    5171:	4c 29 e5             	sub    %r12,%rbp
    5174:	48 83 ec 08          	sub    $0x8,%rsp
    5178:	e8 83 be ff ff       	callq  1000 <_init>
    517d:	48 c1 fd 03          	sar    $0x3,%rbp
    5181:	74 1b                	je     519e <__libc_csu_init+0x4e>
    5183:	31 db                	xor    %ebx,%ebx
    5185:	0f 1f 00             	nopl   (%rax)
    5188:	4c 89 fa             	mov    %r15,%rdx
    518b:	4c 89 f6             	mov    %r14,%rsi
    518e:	44 89 ef             	mov    %r13d,%edi
    5191:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    5195:	48 83 c3 01          	add    $0x1,%rbx
    5199:	48 39 dd             	cmp    %rbx,%rbp
    519c:	75 ea                	jne    5188 <__libc_csu_init+0x38>
    519e:	48 83 c4 08          	add    $0x8,%rsp
    51a2:	5b                   	pop    %rbx
    51a3:	5d                   	pop    %rbp
    51a4:	41 5c                	pop    %r12
    51a6:	41 5d                	pop    %r13
    51a8:	41 5e                	pop    %r14
    51aa:	41 5f                	pop    %r15
    51ac:	c3                   	retq   
    51ad:	0f 1f 00             	nopl   (%rax)

00000000000051b0 <__libc_csu_fini>:
    51b0:	c3                   	retq   

Disassembly of section .fini:

00000000000051b4 <_fini>:
    51b4:	48 83 ec 08          	sub    $0x8,%rsp
    51b8:	48 83 c4 08          	add    $0x8,%rsp
    51bc:	c3                   	retq   
