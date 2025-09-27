Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A0319C560
	for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759005582; cv=none; b=b9TZ5VjukqoYcaGOT+UBid33/WxTAM5rS/mXp30eOxW1vRRBcg27WenVnUWolHkNxVRa0g8zz60mQYjbeEtYPCmRQSLujQc9G8pLkraVpoUjMU1zQ1EbKR+FWKUq0SnspLd4GrqproZyiP0gPWn4LTFUDDHZ2V7igs64KlTauDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759005582; c=relaxed/simple;
	bh=Nqm2a1slgwRpzw6giHb6m2YLEyBBuzMrjpXPrRVXwQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwoiXY7/suoQgvzr24/2yGzuXzkxYU9rQDuLNl20o+knbwxPwZkCIFFjMR1TOe2gt5pzxLQ+ZToiur6w2QPBuv3O7FQ5pH1W0IxPApywLbrHnaSy6AgGw5Oa8xCwEH3WZ2PwylLT6XH1gOXr4lP6UTzW4Vyv4e0ggD1iWW0GgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WUCVzoDX; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WUCVzoDX"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4e0302e2b69so2538861cf.0
        for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759005580; x=1759610380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nqm2a1slgwRpzw6giHb6m2YLEyBBuzMrjpXPrRVXwQ0=;
        b=WUCVzoDXfzkNAHzQO5pA+KirDAnbUCib8FdqRaYfE+vUrAngp5NrtRCfgUJIlenWi+
         6res+8iGU52XhACBquxGH/yIoWXIp6YXLkTOFwAg01dFb1RlBo0tnyX2X86uPbyKNVpH
         wuEjhAkaWj+8CplE1vrcqzgKCXLU67P5jbYFOV00CeIT+HF5GQA/fMkkWUk9PO1EiWnG
         /u/VP3S3YzIReAxKzPAUj4Oy1NyCzksYtrDrLGtIgNPHbL2T1gCcmikdhLBGBhgiJtL8
         FtFSk6dZSwe1t+EAjh5UYKT/7FeG69NeI/9rwzHfPHr8VekKeQMaeIhA0i+F86IE4eyp
         USdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759005580; x=1759610380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nqm2a1slgwRpzw6giHb6m2YLEyBBuzMrjpXPrRVXwQ0=;
        b=L1GZ2eXrO4jQzfJEz+a6kW2EUPI/gRTiP+105DmkN8FkuP8ECcJR6wijWgDYAhxqm7
         0fB7/eGNyzGd1g1ZP0mzdPVD4k3plaigoLFJpMBwCFx5fp71C6C/d9ytSTWITh5cCk/m
         JVZgkAyPKGrlDnmQNL+VJKEazYdGvCSHIkvAXUKr+4IWVAY4YnmWCYdkYdreVGsxG6lv
         uM722ZII7eHdE7eAVXn+D8Y+BqF6f7P3dCLz+3KUyT9Y8KMoxRFC8jn8P642bUHMT6BB
         YZjcECydhn4u/ohKnS5AC0div1LhO69lBvJYPwdN42Z6etGJiGTXKskbQaqAbNKHtf8C
         j7LA==
X-Forwarded-Encrypted: i=1; AJvYcCUj4lGHCi5xVqGtd4fXcLdfup35VOBFdYbeBc08CnkpPH1/R7ocOvPgFiZ0Hto7yGajeyC1q3wb1DtgdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Z0u//O+sxaNy7rAZDeyOk5F9PdlVYMCaBmvBVgqOU5wSPL2G
	1jo09wvWZd0WLRfFmF5+TD9Nw69fT02udKPWP8gC1Ce/RWylnm+HLSamXHbALWKeiYX9GjGQBOD
	eMuNJSQ4xgk4GD89JARnAT9W+oG9TTeUizlxsghJlUg==
X-Gm-Gg: ASbGncsOz3eYGpQfy8OglTHPFiuB85CgbXRMN0F3LsOXYdWw7Wl4xSShTfPuy/1dwzb
	Yn+FICzcGcTNmGtg9KRuMN5lukG8f7e1i4IreIMR0D92wDvJ7Wx23Rg5dIWNnGYX3w8Jafjxq42
	HYos34LJOvhFGZfOwRaDPVzL9iwm4I3ViTN802p7KbXgWVY/7rXJSl85sDZOxG/igES8WFsIJri
	jkUMHbEzwbHMIwcR6eAKHMuhw==
X-Google-Smtp-Source: AGHT+IGBzy4xKVonjD75U3bFZeJHdh+aNj3HgTEf2iQJ6Ivdld2/QWu42FO96m5+KzxRvbcmbaVonTr0xtmksT79s30=
X-Received: by 2002:a05:622a:4cc9:b0:4cb:102c:56b2 with SMTP id
 d75a77b69052e-4da41e113ecmr158400271cf.0.1759005579868; Sat, 27 Sep 2025
 13:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com>
 <aNZWTB_AbK1qtacy@kernel.org> <CAM_iQpWBHWscTbuUm54G3tvqf-EQhSYaFJqEJD4M73doeH=TKQ@mail.gmail.com>
In-Reply-To: <CAM_iQpWBHWscTbuUm54G3tvqf-EQhSYaFJqEJD4M73doeH=TKQ@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 27 Sep 2025 16:39:02 -0400
X-Gm-Features: AS18NWAcl8Gu_k5gDYsA34u-oRSTQGnYnzR7vJJapQMSC9amp96YmIxuBqedkv8
Message-ID: <CA+CK2bCFBOVQnwvRePHRkDqdh5rA+QYrkhqvf=ZiHu=yicShAw@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org, 
	Cong Wang <cwang@multikernel.io>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Changyuan Lyu <changyuanl@google.com>, kexec@lists.infradead.org, linux-mm@kvack.org, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 4:27=E2=80=AFPM Cong Wang <xiyou.wangcong@gmail.com=
> wrote:
>
> On Fri, Sep 26, 2025 at 2:01=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.or=
g> wrote:
> >
> > On Thu, Sep 18, 2025 at 03:25:59PM -0700, Cong Wang wrote:
> > > This patch series introduces multikernel architecture support, enabli=
ng
> > > multiple independent kernel instances to coexist and communicate on a
> > > single physical machine. Each kernel instance can run on dedicated CP=
U
> > > cores while sharing the underlying hardware resources.
> > >
> > > The multikernel architecture provides several key benefits:
> > > - Improved fault isolation between different workloads
> > > - Enhanced security through kernel-level separation
> > > - Better resource utilization than traditional VM (KVM, Xen etc.)
> > > - Potential zero-down kernel update with KHO (Kernel Hand Over)
> >
> > This list is like asking AI to list benefits, or like the whole cover
> > letter has that type of feel.
>
> Sorry for giving you that feeling. Please let me know how I can
> improve it for you.
>
> >
> > I'd probably work on benchmarks and other types of tests that can
> > deliver comparative figures, and show data that addresses workloads
> > with KVM, namespaces/cgroups and this, reflecting these qualities.
>
> Sure, I think performance comes after usability, not vice versa.
>
>
> >
> > E.g. consider "Enhanced security through kernel-level separation".
> > It's a pre-existing feature probably since dawn of time. Any new layer
> > makes obviously more complex version "kernel-level separation". You'd
> > had to prove that this even more complex version is more secure than
> > pre-existing science.
>
> Apologize for this. Do you mind explaining why this is more complex
> than the KVM/Qemu/vhost/virtio/VDPA stack?
>
> >
> > kexec and its various corner cases and how this patch set addresses
> > them is the part where I'm most lost.
>
> Sorry for that. I will post Youtube videos to explain kexec in detail,
> please follow our Youtube channel if you are interested. (I don't
> want to post a link here in case people think I am promoting my
> own interest, please email me privately.)
>
> >
> > If I look at one of multikernel distros (I don't know any other
> > tbh) that I know it's really VT-d and that type of hardware
> > enforcement that make Qubes shine:
> >
> > https://www.qubes-os.org/
> >
> > That said, I did not look how/if this is using CPU virtualization
> > features as part of the solution, so correct me if I'm wrong.
>
> Qubes OS is based on Xen:
> https://en.wikipedia.org/wiki/Qubes_OS
>
> >
> > I'm not entirely sure whether this is aimed to be alternative to
> > namespaces/cgroups or vms but more in the direction of Solaris Zones
> > would be imho better alternative at least for containers because
> > it saves the overhead of an extra kernel. There's also a patch set
> > for this:
> >
> > https://lwn.net/Articles/780364/?ref=3Dalian.info
>
> Solaris Zones also share a single kernel. Or maybe I guess
> you meant Kernel Zones? Isn't it a justification for our multikernel
> approach for Linux? :-)

Solaris kernel zones use sun4v hypervisor to protect isolation. There
is no such thing on x86 and arm.

Pasha
