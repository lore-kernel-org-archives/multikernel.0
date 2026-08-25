Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB13D9DBF
	for <multikernel@lists.linux.dev>; Tue, 25 Aug 2026 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689033; cv=none; b=sfa0heRO5fTPBrSY9/DaLD9KlrfuLAL6I5iGYonCda5w9q24yQ9nuTrXbtni1ZZizp1NdOyWq6kKLyS+cqYYFJ8ciHleu5TWVZdtSwsZcLhZ71Zs4hMfXbd7sEvIrMstclg4r/Kg6U9R3Y4fstDBmKn8GR0fXErWPpBecVI6Dso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689033; c=relaxed/simple;
	bh=HsXKyk0Es9rEKG9JY1oBKwVFqUo8285ZukmYVKH7H3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mwj0fFn5iKNXuD5Pieco96GbCg5CeyYvjH+uWPcvHj7W/Y8ZhBVkfUWoJJ2hxOjnlQ0QuJwC8cylEyNwE8rP9krIaRSb++xn4TwCBjqtRg8/VO52+mp21/eHdzrtu+yCVq0FavdZro806FKPV78/j/bPQM+c+AXBCWFYLRZlnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io; spf=pass smtp.mailfrom=multikernel.io; dkim=pass (2048-bit key) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.b=Mn6xMMSH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.b="Mn6xMMSH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so124857a12.2
        for <multikernel@lists.linux.dev>; Tue, 25 Aug 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20251104.gappssmtp.com; s=20251104; t=1787689031; x=1788293831; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Q9vufxWvZTk0UV0DHbKHR5GwmueL5T97YpWlk1ZKBc=;
        b=Mn6xMMSHGVPW9X74rMJE00lR59DCuriZllmagS4RRoXgh1ryW/hkAHZ17ETOrdXGa3
         qJaN5SmqmvkUL9OX9t8a6SMBw4Plbq/aVeZ37fi8LBd2f2csRgEQEEPK4oX/ayejlscg
         cgDqQT4QIr5Q6FdkEW0u6tsEOXyVZ2Mz2KGs3SmfgB/sL0fQRqbwg/H3ooF83XWrh3Ib
         dkbjtPtokbe+wz2rT0b0dlE9W+SvPJUcbdDazpO4u9OjoA+Lnt7Hns+cWzrQ1bEUcD2L
         sV+FNTXoJt+PiUZmaMBh4BLeSbWpC6/TtaQXew61m6E+947bacUyi8j5Hg26SVBp43hU
         CHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787689031; x=1788293831;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Q9vufxWvZTk0UV0DHbKHR5GwmueL5T97YpWlk1ZKBc=;
        b=fOnbxm7oFV3dElwytBb8JUfvOrlDJeuIRtu+3ZjSaBikqsS6LIQ0VbcRv6JfXzRZGy
         TeIXcxVYQWIrfcTrh55Cp5iEK8wQM6MZz7TwGd52K6gfxAtwcqMab2kUjBQtkr3K2k1e
         yvG+wBwyiMJuv3DaehBAFg5y5lgCDMmX0gnc+WiKBTXF2f/tiJYG8zyhggW4fc+Aaduo
         jm9x94h3UlCpd/PcT+msZFNLB1EkXtmSEWBREWkQ6bwdAhktGzZYzcmtEYMH43NRajEW
         eANdTjOemPCNqvWjNhXeozL5cer1rvCsrovknvrRpWLufs79tFcSTDYIUzvj/n9XnVOa
         KIug==
X-Gm-Message-State: AFuF++nYYcpBFdzAr98vy/KsnpOrOP/qd+JGPbebg0mLNgpanB4ysBzU
	8GF00VTOkr/ONiEroG4l2oOeiPDVgdIClqRWw0T/ZZ6yveCNvVbL4+DsD0Ezbs/5d77RZiBtfhB
	sc3QN
X-Gm-Gg: AR+sD12qxBOtdp8MKdNCTO+9wK++tvIOIdnp+g8uoBK42d7aqbKJczlO0D4B5UWT9Q1
	fjwmrIdtebFFdEMIhKd6enAVB4YQb5HdlZooItRSgxHJMVyJAkLNXveJaoqLQmD4yHeIoHVirmj
	ORnCF6KUAEuleGkNaeuVWO78Kpz+l0Nfa8kTsKuRn4tIdEFmsgUeLI9Ln3ayhzFsEdrCbO25kM9
	sUrx094WreVdvAYI7gtEOxK9+dRh8Hi53y9VUIYpf2sG1InGvzq5LOvJy5sCnqJXwX2bQmRPBrP
	CFIqijTujOkqGGg440ljlzm7TdjiS8cP+4S93sNsoS6ZZLoZ7BRhboGzSsDGoV16SXwnL9mqRSS
	f+XypAEgA2s+ej6JkLsYMQ3BL+jpK6g8us6FGOzOtvRCN8aDjtShyvSbwO3Gz6PwxcTbKEafK3O
	5eyJO/P3pD/d7E67cCzYghsBaOKDgFObz1dVGtmpO6p3rY5xXzgDxN3+iyFzY2TO48Ee27IvRbw
	o5ig6XAmzT3w1NLWgM=
X-Received: by 2002:a05:6a21:140a:b0:3cd:7bb1:1183 with SMTP id adf61e73a8af0-3cf84649492mr1904258637.18.1787689030987;
        Tue, 25 Aug 2026 13:17:10 -0700 (PDT)
Received: from localhost ([50.191.166.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d8bc3d2sm1485465eec.21.2026.08.25.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 13:17:10 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:17:08 -0700
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: multikernel@lists.linux.dev
Subject: [ANNOUNCE] mklinux v7.0-mk2
Message-ID: <ao34RJ7aZ2BLd67S@pop-os.localdomain>
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I am happy to announce mklinux v7.0-mk2, the first public release of
the multikernel Linux tree.

  git: https://github.com/multikernel/linux
  tag: v7.0-mk2

What is mklinux?
================

mklinux lets one machine run several independent Linux kernels at the
same time on bare metal, without a hypervisor. A host kernel owns a pool
of CPUs, memory and PCI devices, carves that pool into instances, and
boots a spawn kernel into each instance through kexec_file_load(). Every
spawn kernel runs natively on its own CPUs, its own physical memory and
its own devices. Nothing is emulated and nothing is trapped; the only
thing shared is what you choose to share.

Instances are declared with a device tree written to
/sys/fs/multikernel/, and device tree overlays move memory, CPUs and
devices between the pool and running instances without a reboot. An
instance can be shut down, its resources reclaimed, and respawned with
a different kernel.

Compared with virtual machines, there is no VM exit path, no second
level of page tables and no device model. Compared with containers,
instances do not share a kernel, so a lock, a panic or an exploit in one
kernel cannot reach another.

The tree is based on v7.0. With CONFIG_MULTIKERNEL=n it builds and
behaves exactly like v7.0.

Performance
===========

Two things matter here: a spawn kernel should pay nothing over bare
metal, and splitting a machine into several kernels should let workloads
scale past the walls a single kernel hits. Both were measured on a
dual-socket Xeon Gold 5418Y (Sapphire Rapids, 2x24 cores, SMT off).

No virtualization tax
---------------------

lmbench on a 2-core, 1 GB spawn kernel against a 2-vCPU, 1 GB KVM guest
with EPT, unrestricted guest and APICv, vCPUs pinned to idle cores:

  Benchmark                   Multikernel   KVM guest   Ratio
  Null syscall                   0.070 us    0.099 us   1.42x
  read()                         0.099 us    0.124 us   1.26x
  write()                        0.082 us    0.114 us   1.39x
  Signal handler install         0.123 us    0.159 us   1.29x
  Signal handler catch           0.770 us    0.881 us   1.14x
  Context switch (2 procs)        1.37 us     3.42 us   2.50x
  Pipe latency                    3.24 us     7.06 us   2.18x
  AF_UNIX stream latency          4.81 us     7.48 us   1.55x
  fork + exit                      115 us      123 us   1.07x

Memory latency and bandwidth are at parity (lat_mem_rd 32.1 ns vs
31.2 ns at 128 MB; ~20.9 GB/s sequential read on both), which is
expected: EPT with huge pages has made nested translation essentially
free. What a guest cannot avoid is the exit on every kernel entry and
on every wakeup of an idle vCPU, which is where the 2.5x context switch
and 2.2x pipe latency gap comes from. KVM can close most of that gap
with idle=poll or mwait passthrough, at the cost of a vCPU that looks
100% busy to the host and 12 to 19 W of extra power. A spawn kernel
gets the low latency and still puts its cores into C1 to C6 when idle.

  https://multikernel.io/2026/08/16/multikernel-vs-kvm-lmbench/

Scaling past the single-kernel wall
-----------------------------------

will-it-scale, processes mode, 24 tasks on one socket: one kernel
driving 24 cores versus two spawn kernels driving 12 cores each.

  Test          1 kernel      2 kernels     Ratio
  unlink1        300K/s        780K/s       2.60x
  rename1        792K/s       1.69M/s       2.14x
  stat2         9.42M/s       19.8M/s       2.10x
  open3         3.42M/s       7.41M/s       2.17x
  open1         9.6M/s        19.3M/s       2.02x
  pread4        ~5.2M/s      ~10.1M/s       1.94x
  mmap1         9.9M/s        12.2M/s       1.23x
  tcp_conn1     1.81M/s       2.10M/s       1.16x
  getppid1     268.2M/s      267.1M/s       1.00x  (control)
  futex4       135.5M/s      134.9M/s       1.00x  (control)
  poll2         26.7M/s       26.5M/s       0.99x  (control)

The controls show there is no multikernel overhead on the syscall path
at all. The wins come from locks that a single kernel cannot shard:
the directory i_rwsem, s_vfs_rename_mutex, a shared dentry refcount, a
folio refcount in the page cache. On one kernel, unlink1 peaks at 2
tasks and then goes backwards; at 48 tasks it delivers 40% of what one
task manages alone. Splitting the same tasks across network namespaces
on one kernel gives exactly nothing (tcp_conn2 matches tcp_conn1 at
every task count), because the wall sits below the namespace boundary.

Aligning kernels with sockets makes the effect larger: with 12 cores
per socket, one kernel spanning both sockets versus one kernel per
socket gives unlink1 231K/s vs 939K/s (4.07x) and open1 9.06M/s vs
20.1M/s (2.22x).

For fairness, the caveats are in the post as well: open1's win is
mostly AppArmor label sharing and drops to 1.00x with the LSM off
(unlink1 keeps 2.24x); mmap1 needed 8 GB instances to keep
vm_committed_as batching out of the way; and workloads that share one
address space across all cores (threads mode) cannot be split and gain
nothing.

  https://multikernel.io/2026/08/17/multikernel-will-it-scale/

Stability on x86_64
===================

x86_64 is the supported architecture for this release and the reason
it is the first one announced. Instances have been spawned, shut down,
reconfigured and respawned in long soak loops on the machines above,
with KASLR and 5-level paging, including spawn kernels that panic; a
crash in one kernel does not reach the others, and every CPU an
instance was given is confirmed parked back on the host before it is
reused. The benchmark numbers above were collected on this exact
release with unmodified workloads inside the spawn kernels.

The architecture interface is split out so other ports can follow, but
no other architecture is supported yet.

Getting started
===============

Check https://multikernel.io/getting-started.html


Feedback, bug reports and testing on other hardware are very welcome.
The tree will keep tracking upstream releases, and pieces that stand on
their own will be posted for upstream review separately.

Thanks,
Cong Wang
