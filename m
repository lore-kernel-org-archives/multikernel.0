Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7319A288
	for <multikernel@lists.linux.dev>; Mon, 22 Sep 2025 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758580893; cv=none; b=V4+Yfp7a0Fd/EGVgB1g7e57s/nr6dD0z0bb0hYOXF5Lt84fHow2sA/zv4dMUeSqKZOAHWGHLFRGcUFO7qSKldQ4QB9yiyuM2pylJB7X0UsLRslMuwEveHWAACMeRNYi0qs6ZZyxOQrKqngeHpvC0jJXn5KbjJlxEo34IqtpAtxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758580893; c=relaxed/simple;
	bh=0yh6sVdAT113ztDhuPxo1MqnAkuhIHDy1HJdIr+aZPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8/DaUPS6Bv8tUSiRqDAFtIAptLjVc+qbKgUYcK2jltZdX79tQ7LoxNBSKiClVIVkk9Afa1TqJzmQa3gGZq/mhKvgc3tUjMLKMVMiXKYqiqF3II8Cxr6gFE++P4aCtGV4JNQaE+UkdjW9Tu9OgWDcombwPM2l4sHPEvJnrMV9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHDBDUkB; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHDBDUkB"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bc6f33513so416710e0c.2
        for <multikernel@lists.linux.dev>; Mon, 22 Sep 2025 15:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758580890; x=1759185690; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yh6sVdAT113ztDhuPxo1MqnAkuhIHDy1HJdIr+aZPU=;
        b=FHDBDUkB5js6ZJpW3Hru7jTaL8ziNsLmn8S5OrLLHGmxpAk3Ocup7ptk7kMt/eLJeg
         gFt9H4iuq7yLt5etAnTlfvkr/NjJreDHS2eb06a+G0DtpYeYslXwaTRm95VfbgKKaLnf
         1XZvx1iE+kS762IrkCnx9M8NQSrUj2vGEpC36mLIc4H6RipU5pdiueV/KZXukgUf+6uH
         Wm0fQYC+39TANhQNSoEBv4Uqvy0mRfuoDGgwzNCvsRVn4vVPWebzMTRcZ5FllIAF7rs8
         4AulIeRq+b2Y2JPiYgT2VeMYi/d7BynA64FvU7YW+kGw10YtL611xxOsic0+vMCcenbY
         z1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758580890; x=1759185690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yh6sVdAT113ztDhuPxo1MqnAkuhIHDy1HJdIr+aZPU=;
        b=psFHgCSEkh07FVGe8jveYAS2dZM9iIYZCuN58ia4cQYoYV5svPxOcxqyjTYZzYN+Bm
         WMEHa8978+jnk7qyfa3XgEMSOCrcVvAj9tHVk7CxVSjuGFkja87Td4MnBq26H7+5JTy7
         akj/bcs6vmMyTIlKdYOL74eG9OBMU559AmoHJEYfs4xeqRqLxhwy4UMLGVzFepg9n5gM
         wLJ0vdRx/rGN0zPK0QIIL56giDG17hOAqR7OOreAEnNptCHRtS1l7zkoFOHff2vyQeWq
         QLPTE5vL6uE6pfjflhpBVxg2423ZKeGYPu4OoVQMJHEeuhHUXZbMr3D7DSRhnA1NeGbH
         Zazw==
X-Forwarded-Encrypted: i=1; AJvYcCUZPFn/xzXs2dvp8VrscMGlg7neT2v8QtpteogyWBCNkBr/z5u7WN+KVaaNimCdbckUC8PNjfxjBkIEFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGED57SlFQ8iAMwMx0DUA1vrw9qill5vsfHQBYAyCVyTHqXT3n
	R/YzHyH4siZRYghbzeWQT+7d5r61EHF22MdIXZ72Yu3TIn4xs/L3bUBL6csrG/N84j+EJb89KAV
	IydE5WkkPPcVA5uP8HBD8f6KUbTte2QE=
X-Gm-Gg: ASbGncu+S75Ab4NZ04Lgay/8NWw76NCJXl1v83/28ZI3IrsbMdbHgdt1GFJOu3+tZ/6
	YBQ6wfoY1xBei7SjcKuxzaZ5CAnHeOPU2nEBtwfCuLD5lupi+JaD6gt7UmJB/eHMiT52he1dlaT
	Qbhl0ZVoDQnOH2KCvVaD9pRXSIKaK5krPBmxJ6PAIzXzkgKnm5iyL49vXfteXD2EXUeEwFrjxnf
	/eg+AG9Z+N4MGHW0iuAPATs83ickjd+F9N5PgM=
X-Google-Smtp-Source: AGHT+IHFB6pkceMUZ77NeXmuYnJm1V8ontKaUDy90T/NYBaMVOfoW99El5NLWv56d5b2UvDdU+jygkw5mvczc9Xzk18=
X-Received: by 2002:a05:6102:4492:b0:4c3:6393:83f4 with SMTP id
 ada2fe7eead31-5a57d8d7f2bmr255887137.2.1758580890508; Mon, 22 Sep 2025
 15:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com>
 <20250919212650.GA275426@fedora> <CAM_iQpXnHr7WC6VN3WB-+=CZGF5pyfo9y9D4MCc_Wwgp29hBrw@mail.gmail.com>
 <20250922142831.GA351870@fedora>
In-Reply-To: <20250922142831.GA351870@fedora>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 22 Sep 2025 15:41:18 -0700
X-Gm-Features: AS18NWB9iArZm8gNoiOyRm5CUi70i_coc1Ea1AEenDW54lVyHBPMys3KfUjFGeg
Message-ID: <CAM_iQpWO71vSV_0qXiUYeKYZMYF0xWNz8MrUVRkqKwDEtQvKqA@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com, 
	Cong Wang <cwang@multikernel.io>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Changyuan Lyu <changyuanl@google.com>, kexec@lists.infradead.org, linux-mm@kvack.org, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 7:28=E2=80=AFAM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> On Sat, Sep 20, 2025 at 02:40:18PM -0700, Cong Wang wrote:
> > On Fri, Sep 19, 2025 at 2:27=E2=80=AFPM Stefan Hajnoczi <stefanha@redha=
t.com> wrote:
> > >
> > > On Thu, Sep 18, 2025 at 03:25:59PM -0700, Cong Wang wrote:
> > > > This patch series introduces multikernel architecture support, enab=
ling
> > > > multiple independent kernel instances to coexist and communicate on=
 a
> > > > single physical machine. Each kernel instance can run on dedicated =
CPU
> > > > cores while sharing the underlying hardware resources.
> > > >
> > > > The multikernel architecture provides several key benefits:
> > > > - Improved fault isolation between different workloads
> > > > - Enhanced security through kernel-level separation
> > >
> > > What level of isolation does this patch series provide? What stops
> > > kernel A from accessing kernel B's memory pages, sending interrupts t=
o
> > > its CPUs, etc?
> >
> > It is kernel-enforced isolation, therefore, the trust model here is sti=
ll
> > based on kernel. Hence, a malicious kernel would be able to disrupt,
> > as you described. With memory encryption and IPI filtering, I think
> > that is solvable.
>
> I think solving this is key to the architecture, at least if fault
> isolation and security are goals. A cooperative architecture where
> nothing prevents kernels from interfering with each other simply doesn't
> offer fault isolation or security.

Kernel and kernel modules can be signed today, kexec also supports
kernel signing via kexec_file_load(). It migrates at least untrusted
kernels, although kernels can be still exploited via 0-day.

>
> On CPU architectures that offer additional privilege modes it may be
> possible to run a supervisor on every CPU to restrict access to
> resources in the spawned kernel. Kernels would need to be modified to
> call into the supervisor instead of accessing certain resources
> directly.
>
> IOMMU and interrupt remapping control would need to be performed by the
> supervisor to prevent spawned kernels from affecting each other.

That's right, security vs performance. A lot of times we have to balance
between these two. This is why Kata Container today runs a container
inside a VM.

This largely depends on what users could compromise, there is no single
right answer here.

For example, in a fully-controlled private cloud, security exploits are
probably not even a concern. Sacrificing performance for a non-concern
is not reasonable.

>
> This seems to be the price of fault isolation and security. It ends up
> looking similar to a hypervisor, but maybe it wouldn't need to use
> virtualization extensions, depending on the capabilities of the CPU
> architecture.

Two more points:

1) Security lockdown. Security lockdown transforms multikernel from
"0-day means total compromise" to "0-day means single workload
compromise with rapid recovery." This is still a significant improvement
over containers where a single kernel 0-day compromises everything
simultaneously.

2) Rapid kernel updates: A more practical way to eliminate 0-day
exploits is to update kernel more frequently, today the major blocker
is the downtime required by kernel reboot, which is what multikernel
aims to resolve.

I hope this helps.

Regards,
Cong Wang
