;
;Linux pc 4.15.0-29-generic #31-Ubuntu SMP Tue Jul 17 15:39:52 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
;
;/usr/include/x86_64-linux-gnu/asm/unistd_64.h
;


sys_read equ 0
sys_write equ 1
sys_open equ 2
sys_close equ 3
sys_stat equ 4
sys_fstat equ 5
sys_lstat equ 6
sys_poll equ 7
sys_lseek equ 8
sys_mmap equ 9
sys_mprotect equ 10
sys_munmap equ 11
sys_brk equ 12
sys_rt_sigaction equ 13
sys_rt_sigprocmask equ 14
sys_rt_sigreturn equ 15
sys_ioctl equ 16
sys_pread64 equ 17
sys_pwrite64 equ 18
sys_readv equ 19
sys_writev equ 20
sys_access equ 21
sys_pipe equ 22
sys_select equ 23
sys_sched_yield equ 24
sys_mremap equ 25
sys_msync equ 26
sys_mincore equ 27
sys_madvise equ 28
sys_shmget equ 29
sys_shmat equ 30
sys_shmctl equ 31
sys_dup equ 32
sys_dup2 equ 33
sys_pause equ 34
sys_nanosleep equ 35
sys_getitimer equ 36
sys_alarm equ 37
sys_setitimer equ 38
sys_getpid equ 39
sys_sendfile equ 40
sys_socket equ 41
sys_connect equ 42
sys_accept equ 43
sys_sendto equ 44
sys_recvfrom equ 45
sys_sendmsg equ 46
sys_recvmsg equ 47
sys_shutdown equ 48
sys_bind equ 49
sys_listen equ 50
sys_getsockname equ 51
sys_getpeername equ 52
sys_socketpair equ 53
sys_setsockopt equ 54
sys_getsockopt equ 55
sys_clone equ 56
sys_fork equ 57
sys_vfork equ 58
sys_execve equ 59
sys_exit equ 60
sys_wait4 equ 61
sys_kill equ 62
sys_uname equ 63
sys_semget equ 64
sys_semop equ 65
sys_semctl equ 66
sys_shmdt equ 67
sys_msgget equ 68
sys_msgsnd equ 69
sys_msgrcv equ 70
sys_msgctl equ 71
sys_fcntl equ 72
sys_flock equ 73
sys_fsync equ 74
sys_fdatasync equ 75
sys_truncate equ 76
sys_ftruncate equ 77
sys_getdents equ 78
sys_getcwd equ 79
sys_chdir equ 80
sys_fchdir equ 81
sys_rename equ 82
sys_mkdir equ 83
sys_rmdir equ 84
sys_creat equ 85
sys_link equ 86
sys_unlink equ 87
sys_symlink equ 88
sys_readlink equ 89
sys_chmod equ 90
sys_fchmod equ 91
sys_chown equ 92
sys_fchown equ 93
sys_lchown equ 94
sys_umask equ 95
sys_gettimeofday equ 96
sys_getrlimit equ 97
sys_getrusage equ 98
sys_sysinfo equ 99
sys_times equ 100
sys_ptrace equ 101
sys_getuid equ 102
sys_syslog equ 103
sys_getgid equ 104
sys_setuid equ 105
sys_setgid equ 106
sys_geteuid equ 107
sys_getegid equ 108
sys_setpgid equ 109
sys_getppid equ 110
sys_getpgrp equ 111
sys_setsid equ 112
sys_setreuid equ 113
sys_setregid equ 114
sys_getgroups equ 115
sys_setgroups equ 116
sys_setresuid equ 117
sys_getresuid equ 118
sys_setresgid equ 119
sys_getresgid equ 120
sys_getpgid equ 121
sys_setfsuid equ 122
sys_setfsgid equ 123
sys_getsid equ 124
sys_capget equ 125
sys_capset equ 126
sys_rt_sigpending equ 127
sys_rt_sigtimedwait equ 128
sys_rt_sigqueueinfo equ 129
sys_rt_sigsuspend equ 130
sys_sigaltstack equ 131
sys_utime equ 132
sys_mknod equ 133
sys_uselib equ 134
sys_personality equ 135
sys_ustat equ 136
sys_statfs equ 137
sys_fstatfs equ 138
sys_sysfs equ 139
sys_getpriority equ 140
sys_setpriority equ 141
sys_sched_setparam equ 142
sys_sched_getparam equ 143
sys_sched_setscheduler equ 144
sys_sched_getscheduler equ 145
sys_sched_get_priority_max equ 146
sys_sched_get_priority_min equ 147
sys_sched_rr_get_interval equ 148
sys_mlock equ 149
sys_munlock equ 150
sys_mlockall equ 151
sys_munlockall equ 152
sys_vhangup equ 153
sys_modify_ldt equ 154
sys_pivot_root equ 155
sys__sysctl equ 156
sys_prctl equ 157
sys_arch_prctl equ 158
sys_adjtimex equ 159
sys_setrlimit equ 160
sys_chroot equ 161
sys_sync equ 162
sys_acct equ 163
sys_settimeofday equ 164
sys_mount equ 165
sys_umount2 equ 166
sys_swapon equ 167
sys_swapoff equ 168
sys_reboot equ 169
sys_sethostname equ 170
sys_setdomainname equ 171
sys_iopl equ 172
sys_ioperm equ 173
sys_create_module equ 174
sys_init_module equ 175
sys_delete_module equ 176
sys_get_kernel_syms equ 177
sys_query_module equ 178
sys_quotactl equ 179
sys_nfsservctl equ 180
sys_getpmsg equ 181
sys_putpmsg equ 182
sys_afs_syscall equ 183
sys_tuxcall equ 184
sys_security equ 185
sys_gettid equ 186
sys_readahead equ 187
sys_setxattr equ 188
sys_lsetxattr equ 189
sys_fsetxattr equ 190
sys_getxattr equ 191
sys_lgetxattr equ 192
sys_fgetxattr equ 193
sys_listxattr equ 194
sys_llistxattr equ 195
sys_flistxattr equ 196
sys_removexattr equ 197
sys_lremovexattr equ 198
sys_fremovexattr equ 199
sys_tkill equ 200
sys_time equ 201
sys_futex equ 202
sys_sched_setaffinity equ 203
sys_sched_getaffinity equ 204
sys_set_thread_area equ 205
sys_io_setup equ 206
sys_io_destroy equ 207
sys_io_getevents equ 208
sys_io_submit equ 209
sys_io_cancel equ 210
sys_get_thread_area equ 211
sys_lookup_dcookie equ 212
sys_epoll_create equ 213
sys_epoll_ctl_old equ 214
sys_epoll_wait_old equ 215
sys_remap_file_pages equ 216
sys_getdents64 equ 217
sys_set_tid_address equ 218
sys_restart_syscall equ 219
sys_semtimedop equ 220
sys_fadvise64 equ 221
sys_timer_create equ 222
sys_timer_settime equ 223
sys_timer_gettime equ 224
sys_timer_getoverrun equ 225
sys_timer_delete equ 226
sys_clock_settime equ 227
sys_clock_gettime equ 228
sys_clock_getres equ 229
sys_clock_nanosleep equ 230
sys_exit_group equ 231
sys_epoll_wait equ 232
sys_epoll_ctl equ 233
sys_tgkill equ 234
sys_utimes equ 235
sys_vserver equ 236
sys_mbind equ 237
sys_set_mempolicy equ 238
sys_get_mempolicy equ 239
sys_mq_open equ 240
sys_mq_unlink equ 241
sys_mq_timedsend equ 242
sys_mq_timedreceive equ 243
sys_mq_notify equ 244
sys_mq_getsetattr equ 245
sys_kexec_load equ 246
sys_waitid equ 247
sys_add_key equ 248
sys_request_key equ 249
sys_keyctl equ 250
sys_ioprio_set equ 251
sys_ioprio_get equ 252
sys_inotify_init equ 253
sys_inotify_add_watch equ 254
sys_inotify_rm_watch equ 255
sys_migrate_pages equ 256
sys_openat equ 257
sys_mkdirat equ 258
sys_mknodat equ 259
sys_fchownat equ 260
sys_futimesat equ 261
sys_newfstatat equ 262
sys_unlinkat equ 263
sys_renameat equ 264
sys_linkat equ 265
sys_symlinkat equ 266
sys_readlinkat equ 267
sys_fchmodat equ 268
sys_faccessat equ 269
sys_pselect6 equ 270
sys_ppoll equ 271
sys_unshare equ 272
sys_set_robust_list equ 273
sys_get_robust_list equ 274
sys_splice equ 275
sys_tee equ 276
sys_sync_file_range equ 277
sys_vmsplice equ 278
sys_move_pages equ 279
sys_utimensat equ 280
sys_epoll_pwait equ 281
sys_signalfd equ 282
sys_timerfd_create equ 283
sys_eventfd equ 284
sys_fallocate equ 285
sys_timerfd_settime equ 286
sys_timerfd_gettime equ 287
sys_accept4 equ 288
sys_signalfd4 equ 289
sys_eventfd2 equ 290
sys_epoll_create1 equ 291
sys_dup3 equ 292
sys_pipe2 equ 293
sys_inotify_init1 equ 294
sys_preadv equ 295
sys_pwritev equ 296
sys_rt_tgsigqueueinfo equ 297
sys_perf_event_open equ 298
sys_recvmmsg equ 299
sys_fanotify_init equ 300
sys_fanotify_mark equ 301
sys_prlimit64 equ 302
sys_name_to_handle_at equ 303
sys_open_by_handle_at equ 304
sys_clock_adjtime equ 305
sys_syncfs equ 306
sys_sendmmsg equ 307
sys_setns equ 308
sys_getcpu equ 309
sys_process_vm_readv equ 310
sys_process_vm_writev equ 311
sys_kcmp equ 312
sys_finit_module equ 313
sys_sched_setattr equ 314
sys_sched_getattr equ 315
sys_renameat2 equ 316
sys_seccomp equ 317
sys_getrandom equ 318
sys_memfd_create equ 319
sys_kexec_file_load equ 320
sys_bpf equ 321
sys_execveat equ 322
sys_userfaultfd equ 323
sys_membarrier equ 324
sys_mlock2 equ 325
sys_copy_file_range equ 326
sys_preadv2 equ 327
sys_pwritev2 equ 328
sys_pkey_mprotect equ 329
sys_pkey_alloc equ 330
sys_pkey_free equ 331
sys_statx equ 332
