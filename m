Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5619049B
	for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 20:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759004839; cv=none; b=eoOPIIi6AxjrIH+m/j7ZfSYkkG+C6ZNYccdrZHfCU6jpzROCA+b+gPczIf4BVFrm2jKZDH9Jwyb9NUfTOnM3PYBHF9FiIMSrCCdxMswhiwhbnGMPmgTvju14ivgjv4hw8ZEhgVds4mSJBbwUpPcY8Blv7gynq91Ey1YUf4wx2pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759004839; c=relaxed/simple;
	bh=9iKX971Yzh+vTHTZnyNwti+PFyVkjEP/KuLLQvtNxsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBvKGlO+qtSkavluxtJTK2wR0BqY3H6LWR7GeAg8ygfKNKru+R3DXsPUaVGq27/JqHlyiDyqCoxbzVDRrAFgX+7Hy8DbDJHqAb7jCBlBiCU22c8BuzKP1ne11diOQQ+0rCIGzlXw2K/TF8T7m+0eLkUMiLKUjbKlpHKNy5JnP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7Ae2U5E; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7Ae2U5E"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54a80b26f88so1421382e0c.0
        for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 13:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759004836; x=1759609636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iKX971Yzh+vTHTZnyNwti+PFyVkjEP/KuLLQvtNxsU=;
        b=Z7Ae2U5EL3Nemz0Ha0PKL+vYbM8Hh+aXCsywyj0cFeG/i025zDu4SUFIDLXY27mC/C
         bkMS5mXA7L2VqBno/iPhPR/vTIxiE3wCvYfY0DL2R25snzgQhfwFOnPoQqQ9Ssc+8Fbm
         8w5dXrUKhsaHWfn2f26uzWzD7e72OGmcjcrj8fag5QQImwjLq3s6n12r+HfnPK8H5zXz
         Xdwb1IEKTeLDJ0+k3wD5gidLIXl7Ud4idCOOnbKJGJBn6nLw27sBqb+kiguKacCtiIQw
         aJ5kMgH0g1EuBm59lR70CeCSRlBKD2+SZKKLkMJ3J6P/IAdEENtGHLrR9+5Ag+niITJI
         3gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759004836; x=1759609636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iKX971Yzh+vTHTZnyNwti+PFyVkjEP/KuLLQvtNxsU=;
        b=naa1lYjYOdx0ijz3a6i8uRmJ18jRCghlT3gMQ49wjwL6O7WNJ0H7NKjZRV5wFmCfmU
         GO4yF5uK5tEzxUKGJlx2muEpaTUR50+wwF+bp7svUHFg5XmQcUnyD3t8NGQDibQta6kS
         ZzslG4gO23gXxjD+v2obuu2GyxFgPKt42L4kBETMvEHLcPGBBQ7kOcZ6ajOpj+5rtVvZ
         L6dT/r9FgaO4rcp40zbSbTVHqKJxQZCnUN0EaFa1DsAldfFWSQneQopcV/QDcn+PRxty
         0IPwzXZSZnfTdEKe/r72ELbejv45QNDM/dx9MoiFUE2uu9BiNOZaDzJw4NiNQVbLNRx9
         dqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHPq56LiyjtNLY0MpN8ZxEmfrFseTXWd/FCVAFSyYEVDH9GESItoP04xbmMGOnV6Trh71LA0eSAEZZ8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGqFhiCBpt3XWecCY375z6x0grm2T1yi8bD2s1N94MqxOCPnTx
	RiZIMYpL43fcY5FYGqS0vqOEp506A0Jnpw/Ed2YbIQXWtfXJ6ZJX3+OvJ5wj8z67uvOunZ5rFJc
	eRhu2Iap78GytrElS+GLidMWkElblLlg=
X-Gm-Gg: ASbGnctqeCnHnJrcpiBaiTf5Wz+oUNQKnPixOx+iKPo0gckIeXjjZ0RAm7oGvYynH2f
	2RZAi8VJlqwb9UF7Wcq03cUCKbnZB2o/Hes5OwS+1p5F2gS1DQK7G5iDfZYIhqotZvDw156MLvt
	NzcJEZqru8Ymn2wwVTbLjqTKsqFX6xoPRuEuyz81AUu/yiX64h0k6Bf4th47Uw+CxBCk09OdY7a
	KdLeOruNGifSRoWQN+XKmQklN3PnNwR3W4GBV27
X-Google-Smtp-Source: AGHT+IFl7dzGGOpBRgseA/NydkGTFZOWYjWGRoA+aFytHMvygeb0WWmRJxaS+K8TrsIzykl6wViA3ZMadBOP3gnRlPQ=
X-Received: by 2002:a05:6122:202a:b0:54a:a782:47c5 with SMTP id
 71dfb90a1353d-54bea37dc27mr4953333e0c.15.1759004836452; Sat, 27 Sep 2025
 13:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com> <aNZWTB_AbK1qtacy@kernel.org>
In-Reply-To: <aNZWTB_AbK1qtacy@kernel.org>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 27 Sep 2025 13:27:04 -0700
X-Gm-Features: AS18NWAh5kZoQgB4hGz8PTAEfvsQyei1Zk5nXGW3DAd6TlCiQepkU5cVpkemP2Q
Message-ID: <CAM_iQpWBHWscTbuUm54G3tvqf-EQhSYaFJqEJD4M73doeH=TKQ@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com, 
	Cong Wang <cwang@multikernel.io>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Changyuan Lyu <changyuanl@google.com>, kexec@lists.infradead.org, linux-mm@kvack.org, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 2:01=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Thu, Sep 18, 2025 at 03:25:59PM -0700, Cong Wang wrote:
> > This patch series introduces multikernel architecture support, enabling
> > multiple independent kernel instances to coexist and communicate on a
> > single physical machine. Each kernel instance can run on dedicated CPU
> > cores while sharing the underlying hardware resources.
> >
> > The multikernel architecture provides several key benefits:
> > - Improved fault isolation between different workloads
> > - Enhanced security through kernel-level separation
> > - Better resource utilization than traditional VM (KVM, Xen etc.)
> > - Potential zero-down kernel update with KHO (Kernel Hand Over)
>
> This list is like asking AI to list benefits, or like the whole cover
> letter has that type of feel.

Sorry for giving you that feeling. Please let me know how I can
improve it for you.

>
> I'd probably work on benchmarks and other types of tests that can
> deliver comparative figures, and show data that addresses workloads
> with KVM, namespaces/cgroups and this, reflecting these qualities.

Sure, I think performance comes after usability, not vice versa.


>
> E.g. consider "Enhanced security through kernel-level separation".
> It's a pre-existing feature probably since dawn of time. Any new layer
> makes obviously more complex version "kernel-level separation". You'd
> had to prove that this even more complex version is more secure than
> pre-existing science.

Apologize for this. Do you mind explaining why this is more complex
than the KVM/Qemu/vhost/virtio/VDPA stack?

>
> kexec and its various corner cases and how this patch set addresses
> them is the part where I'm most lost.

Sorry for that. I will post Youtube videos to explain kexec in detail,
please follow our Youtube channel if you are interested. (I don't
want to post a link here in case people think I am promoting my
own interest, please email me privately.)

>
> If I look at one of multikernel distros (I don't know any other
> tbh) that I know it's really VT-d and that type of hardware
> enforcement that make Qubes shine:
>
> https://www.qubes-os.org/
>
> That said, I did not look how/if this is using CPU virtualization
> features as part of the solution, so correct me if I'm wrong.

Qubes OS is based on Xen:
https://en.wikipedia.org/wiki/Qubes_OS

>
> I'm not entirely sure whether this is aimed to be alternative to
> namespaces/cgroups or vms but more in the direction of Solaris Zones
> would be imho better alternative at least for containers because
> it saves the overhead of an extra kernel. There's also a patch set
> for this:
>
> https://lwn.net/Articles/780364/?ref=3Dalian.info

Solaris Zones also share a single kernel. Or maybe I guess
you meant Kernel Zones? Isn't it a justification for our multikernel
approach for Linux? :-)

BTW, it is less flexible since it completely isolates kernels
without inter-kernel communication. With our design, you can
still choose not to use inter-kernel IPI's, which turns dynamic
into static.

>
> VM barrier combined with IOMMU is pretty strong and hardware
> enforced, and with polished configuration it can be fairly
> performant (e.g. via page cache bypass and stuff like that)
> so really the overhead that this is fighting against is
> context switch overhead.
>
> In security I don't believe this has any realistic chances to
> win over VMs and IOMMU...

I appreciate you sharing your opinions. I hope my information
helps.

Regards,
Cong Wang
