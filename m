Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7634D4E2
	for <multikernel@lists.linux.dev>; Mon, 26 Jan 2026 17:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449119; cv=pass; b=W2lmg3ldytdV5ThAZfv2U5LxhqW5Nq+LCJqwG8KrSsc6JpepoF/9PJuPIBud7I70cH12wOSRo+pWtfRdvHxz2pKO4u13v81/78SaxvmSTnJnDW102j46zDEf5tiWbbrl1Mhp4Df9g/edvzKUvx+MoHoQuCdz88EOiDMrD42WcSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449119; c=relaxed/simple;
	bh=uJJ/Ym9eCKvD/y1t4Fjhl4NlIw9gQ9YMBTKX/JXOyUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=td0m+JOeotFFWOqEo1R8iqrpYghfTelzukb0i8du83hx6PW+L9rZSoYObFYlDLlsrI9NioTgm5FvUPnVyBqB2sCT1qzZwuvszOL1DLpS9BBVs1tpx8oEbdJjt1gEUwExTtm0bdLhaT8pr2mLFMkN4ogNb1WTn/kpUPqrH8LJt1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io; spf=pass smtp.mailfrom=multikernel.io; dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b=As/mxvm8; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b="As/mxvm8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so9056308a12.3
        for <multikernel@lists.linux.dev>; Mon, 26 Jan 2026 09:38:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769449116; cv=none;
        d=google.com; s=arc-20240605;
        b=MW8HDi6bq30Tz78TotnCbUdia5kXUNdmgz1xrWU+dUQWaLFOp3fbURQgKgdqz+3SOF
         hKQwZu+bW99PjNEZdoQYrYsNgfiFsCdq5Q+Qt2g0wHbn75AsC8gaEeoPhGrnEd2cFuK8
         map22aaZM5iZ2RrnCv1RgLZluIb4oZUYoPCWNypMUqzF9A2CZKeBsm89RYe59+yBHJ5O
         SopdevNp+nIfvvp6oodq2Vmx3Mh1ThoLeRqYS5WIp/V3a9Jeik6okmMnypnWmMOfK03S
         lJvcYjSES9KHc0ezAAZvaHLoo2eSaiK6PkpU9A8MFv4+KgymEN3J8EIQf5hSctxOQc+C
         OqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJJ/Ym9eCKvD/y1t4Fjhl4NlIw9gQ9YMBTKX/JXOyUs=;
        fh=js+pnffHjvHWdjRFXlYSS+7SIQ9119Y+sPBNgBbhSyE=;
        b=Um68I+vtgGPPixpsTqqTI+UpxwDjBYfUpSeGz2kp4YstGmAlwit0K0DNram2KA0cpg
         UWU2qh5OzXbAt42m2QSx4jbmYOTopYdtP4FeJzQY2ENDLsDrdyXhwZ1SxsCRBEvJ1wxV
         pF9OrEe92/6mIY31Fhcv4zEQEJCnw40rDcoTXf0xnLDE2qmd6DM6gPWdjP1vT772p7bB
         6dlRIZ7eohRBesB653gFmbYPxDEd1hffb3Y99+pwEAbd1R1QWciSk6i4EFocqoG7jIrG
         RtxaYL2FkAnuMRqRpRvJqRDDlGinsvuBB9IUNvw6Hbuzh5cZiTzdykZBiSLDKtVE0B4g
         UNkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20230601.gappssmtp.com; s=20230601; t=1769449116; x=1770053916; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJJ/Ym9eCKvD/y1t4Fjhl4NlIw9gQ9YMBTKX/JXOyUs=;
        b=As/mxvm8BhRnQMQW3LHWB39aqrDxmhmdj19ImWwhAeDMh6VE+fkYomikQqWPUiceAc
         pbn1wgC0GlsDckQvK+2fRSDTgEHWkj0T5U7CYEiKb7ZWc2lP5KohWlAGOuwy78FSz37G
         G+bVKRawvjmEv++1E+tlDzxM97T0Qqr2BeLbh/AfYfOMD1jdVgEAyB5CSxbUvky8MliV
         ERzZuzOFTjirrOCk8B1aGmsXwaYf3Nq7epiYYTmK8soEarGRQAcbJ229Z5jqWmcW24Cl
         Nn8H69TUpsieCFMast+yQ0MBClApAfMty7U0wXr+1Oir3qaX0FupK493aZFdwAOJmt6R
         M0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449116; x=1770053916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uJJ/Ym9eCKvD/y1t4Fjhl4NlIw9gQ9YMBTKX/JXOyUs=;
        b=VLp14bCQudbk9CnLH747NVENBUf1zdSEh5oVe4qAoOGSRqeMPxJNjg+oYyxBS5NJHk
         xhoy1Fez6kylG9JRx1F8B4LG4iocRuOnEjYwI8Qf0VZ3yCZY8liY/8b/815N0EOkAJrO
         +er9SOG23ia4opz/Jv2aEuWvUU1UrossWiCSQixtIDaqnC7gtPh25pIV8E6aG0l1iKR0
         JaiYzwzDO+EQCZB0aCxXlHRGV7jL7OYwTtHI8TWWwJwDJlSwWnlF84Acc+zAHKOqM8md
         /zwBmU04jfdj+PRzM8n4Vn9Y0qCwaXuAjt/BpA5Y4ruRQfR28Qfse8mJtAs/9VAx30S2
         klUg==
X-Forwarded-Encrypted: i=1; AJvYcCUbaHCcAggT0crS9BKj8VdRZIpDikigTwMCv80OElBKS5AFbfP4t4cYt4Qkm34hIjpMVvx6v+2xFlvAOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3r8OZ+JkJmgD3/VeOsc2W0AEDoaZwdf0LGzx0C4/v1bxEaXVR
	4jVKzxmYGlRXqdp/HDA0fW1/Cv2N44Ycb3romqunLTUpu5WfAlHB+QFcS0GTPAfyNL+pgWCj+/u
	tdYa244ZFDqGeFl0pmQfAffyGRSgcW645buJ/rgdUKw==
X-Gm-Gg: AZuq6aLKrB7W4KP6TV0VsnryMJPXR6vjbao6+MVxGH2heZjNFElo7W/9jg8rCY0iIe+
	e+bgPKR39CG8dgJBjK05CxzJPOCZPXeJvml//48Sno5izkVHXJHJU5t4O4YNybD0SXn95pc/u1e
	E353CqoISPRpGlVl4nZsOnyhf9DNyc34hRNb79cmsSAfr8AvEzhnsG2FjUx4OZcdGdbL82vBh6k
	7kDWJSUG9q/4zFkK16zztd/I7mHQF+4kLGCMQrpDJ9Nntg5tZsRyTncXeUKrxjyYlQ0A5AAoPS5
	UWi6bZC5SwmXQzgOpzyV1mfd3SRKFGaZE2cS6SX7fCKMq5xzpdNCkokgZ2BvCCCs+i80yP0=
X-Received: by 2002:a05:6402:1d52:b0:64d:2920:ef29 with SMTP id
 4fb4d7f45d1cf-6587068c28emr3719386a12.2.1769449115464; Mon, 26 Jan 2026
 09:38:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGHCLaREA4xzP7CkJrpqu4C=PKw_3GppOUPWZKn0Fxom_3Z9Qw@mail.gmail.com>
 <55e3d9f6-50d2-48c0-b7e3-fb1c144cf3e8@linux.alibaba.com>
In-Reply-To: <55e3d9f6-50d2-48c0-b7e3-fb1c144cf3e8@linux.alibaba.com>
From: Cong Wang <cwang@multikernel.io>
Date: Mon, 26 Jan 2026 09:38:23 -0800
X-Gm-Features: AZwV_QhpVEKU-S5SmNvwbMciDELXM0ojc9983ZSSAnvoDVGnZMOTDLWTBpv_HG0
Message-ID: <CAGHCLaQbr2Q1KwEJhsZGuaFV=m6WEkxsgurg30+pjSQ4dHQ_1Q@mail.gmail.com>
Subject: Re: [ANNOUNCE] DAXFS: A zero-copy, dmabuf-friendly filesystem for
 shared memory
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cong Wang <xiyou.wangcong@gmail.com>, multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiang,

On Sun, Jan 25, 2026 at 8:04=E2=80=AFPM Gao Xiang <hsiangkao@linux.alibaba.=
com> wrote:
>
> Hi Cong,
>
> On 2026/1/25 01:10, Cong Wang wrote:
> > Hello,
> >
> > I would like to introduce DAXFS, a simple read-only filesystem
> > designed to operate directly on shared physical memory via the DAX
> > (Direct Access).
> >
> > Unlike ramfs or tmpfs, which operate within the kernel=E2=80=99s page c=
ache
> > and result in fragmented, per-instance memory allocation, DAXFS
> > provides a mechanism for zero-copy reads from contiguous memory
> > regions. It bypasses the traditional block I/O stack, buffer heads,
> > and page cache entirely.
> >
> > Key Features
> > - Zero-Copy Efficiency: File reads resolve to direct memory loads,
> > eliminating page cache duplication and CPU-driven copies.
> > - True Physical Sharing: By mapping a contiguous physical address or a
> > dma-buf, multiple kernel instances or containers can share the same
> > physical pages.
> > - Hardware Integration: Supports mounting memory exported by GPUs,
> > FPGAs, or CXL devices via the dma-buf API.
> > - Simplicity: Uses a self-contained, read-only image format with no
> > runtime allocation or complex device management.
> >
> > Primary Use Cases
> > - Multikernel Environments: Sharing a common Docker image across
> > independent kernel instances via shared memory.
> > - CXL Memory Pooling: Accessing read-only data across multiple hosts
> > without network I/O.
> > - Container Rootfs Sharing: Using a single DAXFS base image for
> > multiple containers (via OverlayFS) to save physical RAM.
> > - Accelerator Data: Zero-copy access to model weights or lookup tables
> > stored in device memory.
>
> Actually, EROFS DAX is already used for this way for various users,
> including all the usage above.
>
> Could you explain why EROFS doesn't suit for your use cases?

EROFS does not support direct physical memory operations. As you
mentioned, it relies on other layers like ramdax to function in these
scenarios.

I have looked into ramdax, and it does not seem suitable for
multikernel use case. Specifically, the ending 128K is shared across
multiple kernels, which would cause significant issues. For reference:

87 dimm->label_area =3D memremap(start + size - LABEL_AREA_SIZE,
88 LABEL_AREA_SIZE, MEMREMAP_WB);
...
154 static int ramdax_set_config_data(struct nvdimm *nvdimm, int buf_len,
155 struct nd_cmd_set_config_hdr *cmd)
156 {
157 struct ramdax_dimm *dimm =3D nvdimm_provider_data(nvdimm);
158
159 if (sizeof(*cmd) > buf_len)
160 return -EINVAL;
161 if (struct_size(cmd, in_buf, cmd->in_length) > buf_len)
162 return -EINVAL;
163 if (size_add(cmd->in_offset, cmd->in_length) > LABEL_AREA_SIZE)
164 return -EINVAL;
165
166 memcpy(dimm->label_area + cmd->in_offset, cmd->in_buf, cmd->in_length);
167
168 return 0;
169 }

Not to mention other cases like GPU/SmartNIC etc..

If you are interested in adding multikernel support to EROFS, here is
the codebase you could start with:
https://github.com/multikernel/linux. PR is always welcome.

Thanks,
Cong Wang
