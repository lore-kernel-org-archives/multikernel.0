Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057508;
	b=Ev62yQUw50x+NqJR917Z1ZZFcNtON3ndboaixqwUip7gSVU5o4zQxwsJhxQz4aFiRJw4
	 QoTTLCuKCfowZNUFMAp06+igJX176qO4XUNMmqMz6rSrmidAhN15qiDszxPsUaqDkOycU
	 unDiHLuA0egy+g+9RM7eG8q6LQeKijqCcDaJ4tEoJi4TxS6z3333QNjcs6+nH8w7clIb8
	 n66np+0ogESPHQQPEJ2SzCg7+c8hWep7K/zjiWUMbwn5p/6/SBtFN/F/WK5tQ4uefA75O
	 tGXZDnzkeXZzX74/p2Lw9bWHsK9FAs8R17wRr+fNQyaZfHlx1mh14STEEKgqgqQ39IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=1kNsOBjiPepCZlQXn6dnkeUyVbnTvzLZsjEF/ZOxFpA=;
	b=dVHEbvXHC920IT96aUkLN8MmbgyKKOIlxTAFEqoru4RZR8u3L8TQAnOgTGoaKmDrsi3j
	 VkgNY4helNi7XO805rclTdgrt5dkxV5qREC16g/TW0MCufQylCNaEhxon8tF4D4t2UhkZ
	 z4iyfAdO1TJl/Awp97Ox0mYiiB7/iORpmzToa4I4MYGB3B2L/Cteoer9FK7ooncCPRd1A
	 wWg74cjywxs7mhmRZftHSZO+9vlooeqfgmtMFDCTVmuZULA5hJsP2kJ+is7CHBI57xt0m
	 FCP9tK296BHEF0MgUTr0BnxH8ckbBOIR+NqZ185XovOQWDrBa+PUrrI7VpS3MQC8WHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qb7O6W4w;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA72606A31B
	for <multikernel@lists.linux.dev>; Mon, 26 Oct 2026 23:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA72606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qb7O6W4w
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1849996a91.0
        for <multikernel@lists.linux.dev>; Mon, 26 Oct 2026 16:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20251104.gappssmtp.com; s=20251104; t=1793057507; x=1793662307; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kNsOBjiPepCZlQXn6dnkeUyVbnTvzLZsjEF/ZOxFpA=;
        b=qb7O6W4wY+eagXp3lEoAryxlmr3nNk31xdgNYLMI4vxnXpGTVwU6gWXfAtnjiokmZA
         IPhhLMqeQhFFUxHpuO5us2XCGQCHqp7P8CYf5SowZVuvZJAST8BtwpldWuoUMe6bxbeS
         9z2dK0q98jp4JhUlGckRqS9yowJY3/GIldQOtDgsr9+9AaKEpgbi35VlUQPX5mELveda
         dXXmxLPhqwomLmmRi1JebDRuG+Q4gpoMZHz/iJX20tN3J7lBF30sRrjt8tgcSTPOhvvr
         QjxQl1o+LLDljFpTR6tm/NzQX+eAQfPqJWCLe/AEJ1sS0P9OstFhtPnOjD32EpZ82ybb
         yDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057507; x=1793662307;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kNsOBjiPepCZlQXn6dnkeUyVbnTvzLZsjEF/ZOxFpA=;
        b=K2WaRzLRA61QJhcLbg09jH71Y8gmeezqPlKh6lVarCN7FgvJcsJ6LrNPDkw+K07NST
         EloGaKEXjLeb7qhpYh9wGJPLgg9Hfh4ey0ts4oP2m60QLEtez3mmw1pRhwNHNUtV0CaU
         frfhDLoJOhRSpeNmOZ+Nc9m56vHjS197xLekOwtkt1RjynxqvJ0LvkN2iC7DHL674ZMt
         tDkdFWRKTuRI6UV41hw19C0LQhkjLiURLdPXCZ9t54nrOjie4PfSV6sieA0rB0uNuEhs
         sMy5B6/po/qpmvyLH/foidEJQtzjt92x28G9cNuwFsFV1rsVqA9BvpJRJMgWVL6FD9l7
         ej/g==
X-Gm-Message-State: AFq9FYJmuoyi1/SMVNjp/zUkE2ugBiqIj70Ywii1FSqzrU9bsWNfZkOx
	T4DJTvtk2e6iBcC9lFc/EX3DvsxYgdKVWelCvNohQjnOz0pznUmTYoMnJM4Mtpt8snM=
X-Gm-Gg: AYBFou1BIx7b6hy/SnKN6CojIJawcqBExdVuxoUCE28TlFH3KbuwqeSun5neUTYjzed
	p0HDNNaZ26mO0uSd1gSB9y6YfPkRogIvVLeosck+xZw/sUJUQfX9pXquDo0qoKhBMGnIrAgeK1p
	U1cIbLWFdxVKaKh1TR6WCGfkyTz1HLf66Tn3MCA2xDWAaKvxJyq4ENvaFSc1k7HgNB9SRtQ6K41
	zJMAxNWsVeYpI8K2n9nlE5oBUjH2KqlmICtNur7bcpiuQhawOP+j4ks41/XWExj0Tf6bb5CKLJA
	8QXeRdr4BeemqCoeV7W8t+to6GFaOABB7hLDYIhecsb5RmkmAYnD8dBjDsQotQg7cG/JZYIqvtn
	HgvVsCR7lytBw766RKigsqfNSMCHyBjzOV3SPs1p0xbTbGImGGsC9MrROQvdJz/ZPPSxPu9scCE
	KwvyWjLZ8yOczognTOP1LKDL9fUYJ7pnEDKhZceoREqxppDIwsds43L9xTeyYjW5P+zxxrYEvrN
	k2t1SAE6KrQQqSibVjRkvWzrIgR+8RYGotVOsq3xQPCI4avSRE//KLZaREUSz6kcWVUVPeTjWS/
	PrqCvgPyttlL
X-Received: by 2002:a17:90a:d2c6:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3adeabde84emr7276945a91.34.1793057506638;
        Mon, 26 Oct 2026 16:31:46 -0700 (PDT)
Received: from localhost ([2601:647:4084:777d:f4e4:ea6:4ca0:ca08])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40455eb5sm1154323a91.12.2026.10.26.16.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:31:46 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:31:45 -0700
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: multikernel@lists.linux.dev
Subject: [ANNOUNCE] mklinux v7.0-mk4 and kerf 0.4.0
Message-ID: <at_i4aR2Jd6GcHhZ@pop-os.localdomain>
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Post: <mailto:multikernel@lists.linux.dev>
List-Help: <mailto:multikernel+help@lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:multikernel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

mklinux v7.0-mk4 is out. mklinux is the tree carrying the multikernel
work: several Linux kernels running side by side on one machine, each
owning its own CPUs, memory and devices, with no hypervisor underneath.
A host kernel spawns the others through kexec_file_load() and they talk
over shared-memory message rings and IPIs.

This release is 41 patches on top of v7.0-mk3.

Git:

  https://github.com/multikernel/linux.git  tag v7.0-mk4

Release page, with x86_64 .deb and .rpm packages built from the tag:

  https://github.com/multikernel/linux/releases/tag/v7.0-mk4

Use it together with kerf 0.4.0, the user-space tool that creates and
manages instances, released alongside it:

  https://github.com/multikernel/kerf/releases/tag/v0.4.0

PCI config space: a spawn no longer generates config cycles itself. The
kernel that lent its functions answers for their config space over the
message ring, the way xen-pciback answers pcifront, and filters writes
so an instance can neither move a BAR nor enable SR-IOV. The ring gains
synchronous requests that wait for their answer with interrupts off, so
the accessors work under the PCI core's lock. Each bus holding a device
of an instance is described as a root bus of its own, so the spawn never
enumerates the host's bridges. A running spawn can take a function it
did not boot with, a lone function of a slot (00:1f.2 without 00:1f.0)
is found, functions without MSI-X are lent, and a function taken back
from an instance is reset, or has bus mastering cleared, before it is
handed out again.

Takeover: a backup is told about every PCI bus of its host. Once the
fence confirms the host parked, config space switches to each bus's ECAM
window, filtered to the spawn's own functions, and a spawn can adopt a
function of its fenced host. A CPU that panicked with the NMI watchdog
running is now parked by a force halt instead of perf claiming the NMI.

Memory: pool memory is hot-removed from the host's direct map, so a
stray host write can no longer reach a spawn, and instance memory is no
longer claimed as host System RAM. Memory hotplug can remove and add
back parts of memory blocks in subsections, so pool chunks and instance
memory moves need only be multiples of 4M on x86 rather than whole
blocks; the granule is published in the device tree. A partly removed 1G
direct mapping is split first. Each instance region is exactly one chunk
of its instance pool, fixing a genalloc BUG and leaked memory on resize,
and a memory-add claims the range the kernel actually adds.

kexec: multikernel images load only through kexec_file_load(), are
published only once loaded, and fix error-path leaks, double frees and a
stale -EBUSY. The manifest page and IPI ring live in the instance. ELF
vmlinux spawn kernels can carry an appended signature, so KEXEC_SIG and
lockdown work. Starting an instance moved out of kexec into the instance
code.

x86: spawns get no host RSDP, keep ACPI off against acpi=force, reserve
no RAM buffers past their E820 regions, and never use IPI shorthands,
which had broadcast host IPIs into spawns and the other way round.

Fixes: the host doorbell is rung on the host's real boot CPU rather than
physical CPU 0, released mk_transport vsock sockets are unhashed (exec
failed after 512 runs), the spawn console starts with standard terminal
modes, and a device-add binds only where the bus would.

The binary packages are a convenience for trying the tree. They use an
Ubuntu-based config with CONFIG_MULTIKERNEL=y, modules are signed with a
per-build key, and the kernel is not Secure Boot signed.

Feedback, testing reports and review are very welcome.

Thanks,
Cong
