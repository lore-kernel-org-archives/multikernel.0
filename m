Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32411B0420
	for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759003623; cv=none; b=hcBR28lUX/8sahvwr78nmFzJQ5AKwtzWluizRAo75dM7WAcjyyjYhPMNyHVZI+alN3r2JMEBlaM+tbHM6XjL1jaMt+3dtDu/u4DKlx1SrPZsGwRzxOTUdL8EthH4A3lmJmszsueyklR1L5WK7PHVfNidHAhW16YyZQh6li5wiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759003623; c=relaxed/simple;
	bh=HL8OHm/tOdgmn/uUV1BO+N8G/bzT1Rw1z+XhcpcLJZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMfuq3LeRwD3fwtzfGWBxdrKhkSOjSWWlR1fzELSyMRM0WQ9ypCsLeEPktGUZDrBqDFXBcbTmRhT7jEQYXkGPqNmsdXo99YmTdlFRPRl92ccOul/zpnD2aMCBnubk+yFx+CoXWxGJy9SRW01hKZSgpNNS0LsLb30TYpA2CrvMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECU/Sz2Q; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECU/Sz2Q"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-59d576379b9so1623279137.1
        for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759003621; x=1759608421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HL8OHm/tOdgmn/uUV1BO+N8G/bzT1Rw1z+XhcpcLJZU=;
        b=ECU/Sz2QEW8Uip+nXe9RnEoPjjuZTGLDfcqqxOgowXmtL2UyR6105dCBthzLkV1ciE
         YUNw5wdkRi+OODSDbSB2b8FsQzKxWcV2jb31cqsAEVmrF4Uw8gTT8SKRE+i1G7HSZI+a
         2kqJV/sADzaoWYlMey+wbTCQtQUlrZzBIJa2EeJjZy1MOo7cKsoRJgVhtLzfhSGA7zlA
         CSTNAGkc4pzyO7g+0qBYcCeQVILaqt/Cl9bdslSaQVDFy8LpYd1BCuKwdVwF6aUS4Pgg
         WIYmTEA3J1Ksi3zI2t2wdj0wboRJgAv7XgdwkOH9xDzsEN9gmozixFA5Hl34K075s82Y
         /X/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759003621; x=1759608421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HL8OHm/tOdgmn/uUV1BO+N8G/bzT1Rw1z+XhcpcLJZU=;
        b=Evnx32LrjFcPT9Q6Tmq6BfYnQI6Qn9h4PMQtFxXh39NFQW97m0EoLb1rCXQWcPgLIg
         OT+M0zkqlBH1ovg8Nio5+KsOaSNbMexm5ljIV/7pjES/RjU7tO1dUNcVkcM27hTACU9r
         2e9Ygka8ED6pUWlgTvGewvRaCSHRip+Q3rtgnNTodf5yoRDdh/M5zh2e5/1cL7txRo3G
         6KYlYHi0L5CnnZX5QpSyWZqEKloXI5WSSw2YARBk0XMxnnJOSZT7k+7/Dw3bNY05M6pY
         jAK6ipA9u/znQAZsClwEtj67AIBzHd37mNFpet1bnX36OqpzBewQhCSqpqte3jIL7Y4L
         LdAg==
X-Forwarded-Encrypted: i=1; AJvYcCXVfdgq6SO5nZoggb4dbwRpKf03NLBlqfrWbGKjTCh/8X8wGkicC+z9KxwxtIrAy5AR0R2GBbtdv4LPhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTp1LPgx/wHa2wdE67DiWNjz/Z7o1Y9sAqS1S3HWbPtAxfivwG
	ygHWW8ZhflBWcJxh810BPFiEA28KQXBw/Rka006xnZyItRqTTyY2+IQcpkA6c+sTYxksmzVqwZ/
	n0QXG7bmalXFAR0d+YL9Hr+FyUS0l6m6qGemt
X-Gm-Gg: ASbGnctemG0CZRer/hvDgfKfpLoWuznzVFHvlr58aM5v2lk48FUhg59jqpK7MfeVDuB
	ksagZ8qSBoW0aXNIQsXQrl+0uf0lFAzo7PE0qCev9gl4D14ksm5sBnlLTPeM5yRjyGlsw4GZ5Tz
	jPQLlvvHytp1gwv+8p6ROF679g2w4igKr3VXIwv3ItnwjJcMffWWDzxzLdmRIbeslGwG+umDoMp
	GdEiR0uTIqHezOvVIk8fMFV62X/XmW9IoqhJdQsXMBcDZta7EM=
X-Google-Smtp-Source: AGHT+IFavD4z1GGoEGlY5lI3JUX612+I+UAMojZazeqkDP6BSDuGvbpnL+RUoY1IBixIMQhPSpIruVr/5IWa60JA5b4=
X-Received: by 2002:a05:6102:304c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-5acce758205mr4579967137.23.1759003620680; Sat, 27 Sep 2025
 13:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com> <BC25CE95-75A1-48E7-86E7-4E5E933761B8@flygoat.com>
In-Reply-To: <BC25CE95-75A1-48E7-86E7-4E5E933761B8@flygoat.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 27 Sep 2025 13:06:49 -0700
X-Gm-Features: AS18NWBOT7tF0SL4tkvmWuhGCT6OBGfRbzY0O05dFjAR0c0T2kS4_McGk5cJnbk
Message-ID: <CAM_iQpWB1Jq88qDd+z7j+y1fEBRtV86LVHneLemHdvq28g5Dag@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com, 
	Cong Wang <cwang@multikernel.io>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Changyuan Lyu <changyuanl@google.com>, kexec@lists.infradead.org, linux-mm@kvack.org, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiaxun,

On Thu, Sep 25, 2025 at 8:48=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> > 2025=E5=B9=B49=E6=9C=8819=E6=97=A5 06:25=EF=BC=8CCong Wang <xiyou.wangc=
ong@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > This patch series introduces multikernel architecture support, enabling
> > multiple independent kernel instances to coexist and communicate on a
> > single physical machine. Each kernel instance can run on dedicated CPU
> > cores while sharing the underlying hardware resources.
>
> Hi Cong,
>
> Sorry for chime in here, and thanks for brining replicated-kernel back to=
 the life.

I have to clarify: in my design, kernel is not replicated. It is the opposi=
te,
I intend to have diversified kernels for highly customization for each
application.

>
> I have some experience on original Popcorn Linux [1] [2], which seems to =
be the
> root of most code in this series, please see my comments below.
>
> >
> > The multikernel architecture provides several key benefits:
> > - Improved fault isolation between different workloads
> > - Enhanced security through kernel-level separation
>
> I=E2=80=99d agree with Stefen=E2=80=99s comments [3], an "isolation=E2=80=
=9D solution is critical for adaptation
> of multikernel OS, given that multi-tenant system is almost everywhere.
>
> Also allowing other kernel to inject IPI without any restriction can impo=
se DOS attack
> risk.

This is true. Like I mentioned, this is also a good opportunity to invite
hardware (CPU) vendors to catch up with software, for example, they
could provide hardware-filtering for IPI via MSR.

If we look at how virtualization evolves, it is the hardware follows softwa=
re.
VMCS comes after Xen or KVM, VPDA comes after virtio.

>
> > - Better resource utilization than traditional VM (KVM, Xen etc.)
> > - Potential zero-down kernel update with KHO (Kernel Hand Over)
> >
> > Architecture Overview:
> > The implementation leverages kexec infrastructure to load and manage
> > multiple kernel images, with each kernel instance assigned to specific
> > CPU cores. Inter-kernel communication is facilitated through a dedicate=
d
> > IPI framework that allows kernels to coordinate and share information
> > when necessary.
> >
> > Key Components:
> > 1. Enhanced kexec subsystem with dynamic kimage tracking
> > 2. Generic IPI communication framework for inter-kernel messaging
>
> I actually have concerns over inter-kernel communication. The origin Popc=
orn
> IPI protocol, which seems to be inherited here, was designed as a prototy=
pe,
> without much consideration on the ecosystem. It would be nice if we can r=
eused
> existing infra design for inter kernel communication.

Popcorn does the opposite: it still stays with a single image which is
essentially against isolation. In fact, I also read its latest paper this y=
ear,
I don't see any essential change on this big direction:
https://www.ssrg.ece.vt.edu/papers/asplos25.pdf

This is why fundamentally Popcorn is not suitable for isolation. Please
don't get me wrong: I am not questioning its usefulness, it is just simply
two opposite directions. I wish people best luck on the heterogeneous
ISA design, and I hope major CPU vendors will catch up with you too. :)

>
> I would suggest look into OpenAMP [4] and remoteproc subsystem in kernel.=
 They
> already have mature solutions on communication between different kernels =
over coherent
> memory and mailboxes (rpmsg [5] co). They also defined ELF extensions to =
pass side band
> information for other kernel images.

Thanks for the pointers. Jim Huang also shared his idea on remoteproc
at LinuxCon this year. After evaluations, I found remoteproc may not be
as good as IPI. Remoteproc is designed for heterogeneous systems with
different architectures, adding unnecessary abstraction layers.

>
> Linaro folks are also working on a new VirtIO transport called virtio-msg=
 [6], [7], which is designed
> with Linux-Linux hardware partitioning scenario in mind.

I think there is still a fundamental difference between static partitioning=
.
and elastic resource allocation.

Static partitioning can be achieved as a default case of dynamic allocation
when resources remain unchanged, but the reverse is not possible.

Hope this makes sense to you.

Regards,
Cong Wang
