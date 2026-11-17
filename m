Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955567;
	b=pf2DLmZyjR8Km/TsWj2r1Hs29hOblkM1B9ZNe+kmtGuyO+cRsfSkwyi6wKv0QGx6BffW
	 V4u/Ka5KgW9bvYLQaZDKaQYq6OcXql9USLWmPiYMpr4Ctq4NPrOe7FHZI5MEnHDxo+6IM
	 alsUCC607PD0R7UObHH69XVVIrCJztbKEGGo2ROL5snfXdgopFdOoD94pz38SnHxJ1IS3
	 YbaMmL3Fd49jKCGAdZ0ZXWHUhuJARsCs1T7g/jbnXE+rwi53e8An1m3OdWxhznqUQNrGt
	 uHisDGTxDGP/98V67xeR/JS5Dcd6eupkbj37oxOXJ5ugIGb97/azQor0QnebIy4xXFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
	b=O5AfDUuw+O7kXDVtUp11bGdfQFG9n51Q/f7KocNLoMXsuUzZh9ESQuJb/4retE/HhTjO
	 NdwA0FJndvPnu+QB7vWaMPRapmiEy5Q86b6nPzlAbfUdJtg9c4qcquQABwTZPgrhBiVEc
	 jZZJH8BWm8QTiXpAtN3SJ2E4KkTLBTNBcp81TyqRHqe/nBCy8iKlMXOsBFNlMSEOKJWGo
	 16Ke3Idhw3LORSTjTfTawnKeTnT609Ht0KKSwDtmSUI0oKKtjgLhQB+x02jkYJOunqnQm
	 eb6/4y4j7ECC4huFApjP8OvPElzSpPkpGR86Zs7XlI9K7HF5zorysaLPRUpr94Kwxqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZyNnY7+z;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55913606A31C
	for <multikernel@lists.linux.dev>; Tue, 17 Nov 2026 22:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55913606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZyNnY7+z
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so138093b3a.0
        for <multikernel@lists.linux.dev>; Tue, 17 Nov 2026 14:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1794955566; x=1795560366; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
        b=ZyNnY7+zxpLbPTfq5+J6JayLu3i4Znr2FrIIWj6mMjXnTHPd3DDNcXLrsZ/A0RoPaE
         WjyMYhe+79u4WjSIVfd/b5/Pwtyr6PGOrdVjhkP+3VuWxNp+4J04if8HwLG+eTkq0lgV
         0vMcJ6EAwOQZE2vwwaY6wx4QkQ+KPrpr4A43DFDYncY6y8OEsnDBSnDEnZCx4InL2xPw
         LVp8b4qB91wTRxAyHUln6PCIxOnbX26Z+3qkoPNz+tm5NCv06wCFaas3rU26HvSQ54In
         sXsEEBKtoocmjTpDGhYi9Hwz1M/33REE7ongo5IvuOzvEJCWPLXfh+XoxoWL4JbJFCN8
         u4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955566; x=1795560366;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
        b=c7UZUpUk+mXHALcST+gzdmVxJvgVIWEFQKT3bjBtTWeaESVkg/3Vd+7WuuZXTSfJlS
         v28Gqlweqb3AxAUl0cAzjly6r1/iCnjcc6GueG1qwij4HfQ8pnEHqCnik4pQSiY5viKB
         DsaccwBaAilO9owbHj13QcnOU/qFBAbcTnCDUFbYg9Yd/07oHkmsuxJaWNeF68qIMaYn
         S5+T0e5HnT1iiL+qvH5raUcbg+VHjSnVQZcdtmlZRUJkWjzMHnXghp5QzPRh6W8ewEAY
         s4gMqMYgwvT+6oLFO7EQ0kztrhtC34sh/webGLa8i3MtQ8gFIqWRsJrEl31rLja9VbiC
         n1cw==
X-Gm-Message-State: APuU4Z/8VY2N8URo7sWmw3ZMA3ppcbXu6OEEbm0pt1ZcYTZ5vE/Ks+W2
	1kHnsVnp4TsUTCkqn5lGSTWIa60YD8iIC8JDMJKbkd1zKEsGlFSr40JeviKF/jM89co=
X-Gm-Gg: AYBFou2FK/68WsZ8qCFnWbB5xY6UWLJPDUVNSX/sqMwq/G+1OJ4zw6gz6ONSy7/frfa
	UzOGaFHS+FtWrc4it5AaJInS22wns68gLXEfiQN+sLJIzVCaiBKS6yp/6/fSgzocokW4jMYt6En
	DfgdeYjzFGk3+58uCc61hN7jDLpMyJmVv27Gmvja68i/utQnJrzLZzqBBv1dXu88Ah2qhIja7Jq
	KdJooAYSAkEbFqDLmPPyGUtgQEntoauJeW8rmDFAl/mfExA7nmnQ3fRzqAHY9jcHU4aVk1efmtf
	ePIB5iZDiloCOXY561J3/1/oDHccjCu8mFPNxXbvpWeVyiz8UbZUNfU83t+6ALR+CHAc3R06k7A
	d5RBFNSH2nVxy4PDH4eFeaRdI3/7fYtMmYgdaJEf2yueGw9Uvj/2BojknxzBU7Rj87Tfg/fkq+p
	hSBslUEJ3z8/XoZ87ralqQAEhYj10xnRTv6V/kgXMjp27e2LMBey31nernnaKE6vO/89w/MR3ul
	r5LPGAHL2+hRN8P2U48O4uMD6+DqEGL1AFBdBr/3cBCsCJQdO1oNuHHzNTW5I/rB31Tjn9YP4La
	CWknlFATWf0L+rjAhyo3in5HcOh9I33qU5ZkTSbjS6u0em+Rv5wClaaKtDz4730=
X-Received: by 2002:a05:6a20:3d19:b0:3fb:5183:5e27 with SMTP id adf61e73a8af0-3fe86bdb958mr889308637.9.1794955566341;
        Tue, 17 Nov 2026 14:46:06 -0800 (PST)
Received: from localhost ([2601:647:4084:777d:a912:5690:58ab:9eb1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c7b3105sm119772a12.30.2026.11.17.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:46:05 -0800 (PST)
Date: Tue, 17 Nov 2026 14:46:04 -0800
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: multikernel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [ANNOUNCE] mklinux v7.0-mk5: multikernel Linux, now on arm64
Message-ID: <avzZLLKSZIlqAjag@pop-os.localdomain>
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

mklinux v7.0-mk5 is out. mklinux is an out-of-tree branch of Linux that
lets one machine run several Linux kernels side by side without a
hypervisor. A host kernel sets aside a pool of CPUs, memory and PCI
devices, loads another kernel into it with kexec_file_load() and starts
it on those CPUs. Each kernel then runs natively on its own share of the
machine. The kernels talk over shared-memory rings and IPIs, which carry
a console, AF_VSOCK and PCI config space access, and a kernel can take
the whole machine over from its host, which is what kernel upgrade and
crash recovery are built on.

This release is 114 patches on top of v7.0-mk4, and the tree is 330
patches on top of v7.0.

What is new
===========

arm64
  Multikernel now runs on arm64 as well as x86_64. CPUs are started,
  confirmed off and released through PSCI. An Image is loaded with
  kexec_file_load() and boots from a device tree the host builds for
  it. A spawned kernel is a tenant of the GICv3: it leaves the
  distributor and LPI setup to the host and initialises only the
  redistributors and CPU interfaces of its own CPUs. It gets PCI
  devices only, with MSIs routed through whichever host ITS serves the
  device. A kernel is forced down through SDEI event 0 where firmware
  has it, which reaches a CPU that has every exception masked, and
  with the stop IPI otherwise. arm64 memory hot-remove learned to
  split or refuse a partial removal of a linear map leaf and to free
  the page tables and vmemmap it empties.

Device leases and DMA confinement
  A PCI function lent to another kernel is held on the host by a stub
  driver, as vfio-pci and xen-pciback do, and everything the host sets
  up for it hangs off one lease. Its DMA is confined through the IOMMU
  to the memory of the kernel that drives it, on arm64 (SMMUv3) and on
  x86 (VT-d), and follows that kernel's memory as it grows and
  shrinks. The function is reset while still confined when the lease
  ends.

VT-d
  The host leaves alone the units another kernel drives, lends each
  spawned kernel a block of interrupt remapping entries and checks
  every entry written into it. A kernel that took the machine over can
  claim the units of its fenced host without turning translation off.

Chained takeover
  A kernel that took over from its host becomes instance 0, can online
  the memory it adopts as kernel memory, and can arm and hand over to
  a successor of its own, any number of times. On x86 parked CPUs no
  longer wait on slots owned by one kernel: there is one park table
  for the machine with a cell per CPU, so any kernel can find and wake
  a parked CPU, as PSCI allows on arm64.

Messaging
  Each parent/child pair has its own rings, so a kernel that dies in
  the middle of a send can only wedge its own link.

Console
  A spawned kernel can be handed the host's screen as a
  simple-framebuffer, for machines reached only through a BMC's remote
  KVM.

ABI change
==========

The multikernel flag and the instance id moved to the upper half of the
kexec_file_load() flags, as KEXEC_FILE_MULTIKERNEL (0x80000000) and
KEXEC_FILE_MK_ID_MASK (0x7fff0000). The old values collided with
KEXEC_FILE_NO_CMA and KEXEC_FILE_FORCE_DTB. A loader built against
v7.0-mk4 or earlier has to be rebuilt; kerf 0.5.0, the user-space tool,
uses the new layout.

Getting it
==========

  git:      https://github.com/multikernel/linux.git, tag v7.0-mk5
  release:  https://github.com/multikernel/linux/releases/tag/v7.0-mk5
  kerf:     https://github.com/multikernel/kerf/releases/tag/v0.5.0
  docs:     Documentation/multikernel/ in the tree

The release page has the full change list and deb and rpm packages for
x86_64 and arm64, built with the Ubuntu 26.04 generic config plus
CONFIG_MULTIKERNEL=y.

Known limitations
=================

- An arm64 instance gets PCI devices only, no platform devices, since
  every SPI goes through the one GIC distributor, which stays with the
  host.
- An arm64 spawn has to boot with pseudo-NMIs
  (irqchip.gicv3_pseudo_nmi=1) so that the host can stop it when SDEI
  is not available.
- The prebuilt packages have no debug info, hence no BTF, and are not
  Secure Boot signed.

Testing, bug reports and review are all welcome, on the list or in the
issue tracker at https://github.com/multikernel/linux/issues.

Thanks,
Cong
