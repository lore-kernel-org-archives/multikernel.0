Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63209302CB5
	for <multikernel@lists.linux.dev>; Wed, 24 Sep 2025 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738499; cv=none; b=LK3kHkTig09/Fo5FLNtXtjAdh5uYsCGykYVpBKprppNBbdFWfcGN/QDTECdc+i0yM/AxVLqGFt+U/ADJ1QrPVWd/mBBFnfr8TGEg/iwbJS7ycM6p1gZrqvc43is4saPQPm8zNvfFvF5anFuFIyoz4gg5AYAFmYBhllF6HEEMHwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738499; c=relaxed/simple;
	bh=IC9nKcdgtD6FCnJ0khO3nQPUu6U/Swo2cDFZgdHuKJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uL2RdurojAFwvkyo0Ic+RCan9wFCB90RK+PZxe4fK7ZiH72SP3CUyceuEEv1g5ERZX3+fQl1UK7BUxmYGLSrumZb2qUCsyMj6buQTGSSskzZOqw0kKof/YahLhON1GnL3yJutEt7SC3wtkLgWRcwird1G5evqooFEO7N8NsbJPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edZrwQO3; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edZrwQO3"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5a218470faaso138943137.2
        for <multikernel@lists.linux.dev>; Wed, 24 Sep 2025 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738496; x=1759343296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC9nKcdgtD6FCnJ0khO3nQPUu6U/Swo2cDFZgdHuKJk=;
        b=edZrwQO3SC+0Zj+F54CN8s9b2zKUW35EwIo5c/jIQQWMFUmxG7XloRtmfl/D7szNXC
         tanL6xr/8DME6udTIND4okdkk8R4VqRV+De8c9li7cHr2t6iqOV4a2MUyGJ5gB661Vlw
         Cu9IcyT4SRMYNOI78HudgGSJEXg0MPbO4/ZoL38HRhH7g6u0R2hpQ8L1RF+nGAriq4bv
         hmhNsAlbkwH+hLyY3k02raX/En+QE487mBEzgS/9MmWlM0HUTZTbESwl0vr1qq4ZXBHT
         JEsdBBGmOIY2Bp98mhTmZ+a7cB+OwLXOyaIRB14qoPnYoRo1FK/s10s/P+zZ2H+Mr79o
         9MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738496; x=1759343296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IC9nKcdgtD6FCnJ0khO3nQPUu6U/Swo2cDFZgdHuKJk=;
        b=O+ZtVzW1MiKKVAEpQwqqdmUHDBmaPtikU+qsXQRw3MWMTsjRQW7hJ+ebHTndOnlcqK
         AFhLgR6vZ2WouGk+zrEAGco/EGe4UyIJjo4JIGmMm+NkShyovlduu+qcB3glKLAoOk64
         lsXRp49iEepfRGye6WfquRKHS4Ap4lqZU5vM6fEm+NKd5tRE67HZWlGsszf9/xQCbMEg
         ggqrXcKw0QDri3dydT19wVrnRBEOyQuN8LLnyhaXVPboZCyir9rNgtHzvM+Fwjhgy4bW
         ENWYF/htiVqbMMkRCXlDqrNr1aEspGTRdfshhXiSguw04qNmVuBwhzbzKJRrpExS6Z5m
         DWew==
X-Forwarded-Encrypted: i=1; AJvYcCUQupSNaEgh28iQi6R8jK6N9pEX9nuqzc7njZgAoKv8aR3Yfhr1RGu+UT5XJzKWREEfgR0uTMd4yQXCdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkFpH3tLzUl88uXw6er33rNgFBJWm7FxlkEp8YdPm6qfb1EDNn
	uRBti/mBAjj6oZz2vXLjHv+u/komxPuX0jK5O67bI46e9NYWbwIgDFGHLouI9IkZhwhd7qMo9hb
	a/LNZIMmFYixwV/ZFzt5yLocrI2ZgwFU=
X-Gm-Gg: ASbGnctqZQNU6m+quKUvpFlChBaNo3ZD5WAnAPTxjEfSgPZHk3Whg0D8zvmR2U7kKcF
	s9APk4/bXXwckXaZmamILlCkjt1eVozUfsaxPPM5bu+DHFl5DWuQUQKA9B12CRFK9ZcLoviR/XH
	tiQg2UBQEVyDEqRiRjIGpNoSb/scT7fvSb80UC/OKKGV/J7CXxrKeXkm54tbbi44VeJPUz/rRnr
	JGsddv7PnHiJKjXJgCD7jIG/cIH9h28ytImZr0=
X-Google-Smtp-Source: AGHT+IGnZ5YD7V4USsci1qW3abSoXkq9k+Mc//5cJJhmJJIWBD1IuJEsonv3BX4urHjIQD5e13xNPYxJy+BdDvyWIxM=
X-Received: by 2002:a05:6102:d90:b0:4fd:53e0:b522 with SMTP id
 ada2fe7eead31-5acd4639abbmr429762137.19.1758738496130; Wed, 24 Sep 2025
 11:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com>
 <20250919212650.GA275426@fedora> <CAM_iQpXnHr7WC6VN3WB-+=CZGF5pyfo9y9D4MCc_Wwgp29hBrw@mail.gmail.com>
 <20250922142831.GA351870@fedora> <CAM_iQpWO71vSV_0qXiUYeKYZMYF0xWNz8MrUVRkqKwDEtQvKqA@mail.gmail.com>
 <20250923170545.GA509965@fedora> <3b1a1b17-9a93-47c6-99a1-43639cd05cbf@redhat.com>
 <20250924125101.GA562097@fedora>
In-Reply-To: <20250924125101.GA562097@fedora>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 24 Sep 2025 11:28:04 -0700
X-Gm-Features: AS18NWCuwrysu1oqk43xTve6hldZaAK8cQhNTzJSaIvDKFt0icQ4DA4v7i2Wf-M
Message-ID: <CAM_iQpWRZ-vihMEa=k-j9EYN9itUeZLhZ14AoCvZ9mturFxAyw@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, 
	pasha.tatashin@soleen.com, Cong Wang <cwang@multikernel.io>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, Changyuan Lyu <changyuanl@google.com>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 5:51=E2=80=AFAM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> On Wed, Sep 24, 2025 at 01:38:31PM +0200, David Hildenbrand wrote:
> > > >
> > > > Two more points:
> > > >
> > > > 1) Security lockdown. Security lockdown transforms multikernel from
> > > > "0-day means total compromise" to "0-day means single workload
> > > > compromise with rapid recovery." This is still a significant improv=
ement
> > > > over containers where a single kernel 0-day compromises everything
> > > > simultaneously.
> > >
> > > I don't follow. My understanding is that multikernel currently does n=
ot
> > > prevent spawned kernels from affecting each other, so a kernel 0-day =
in
> > > multikernel still compromises everything?
> >
> > I would assume that if there is no enforced isolation by the hardware (=
e.g.,
> > virtualization, including partitioning hypervisors like jailhouse, pkvm=
 etc)
> > nothing would stop a kernel A to access memory assigned to kernel B.
> >
> > And of course, memory is just one of the resources that would not be
> > properly isolated.
> >
> > Not sure if encrypting memory per kernel would really allow to not let =
other
> > kernels still damage such kernels.
> >
> > Also, what stops a kernel to just reboot the whole machine? Happy to le=
arn
> > how that will be handled such that there is proper isolation.
>
> The reason I've been asking about the fault isolation and security
> statements in the cover letter is because it's unclear:
> 1. What is implemented today in multikernel.
> 2. What is on the roadmap for multikernel.
> 3. What is out of scope for multikernel.
>
> Cong: Can you clarify this? If the answer is that fault isolation and
> security are out of scope, then this discussion can be skipped.

It is my pleasure. The email is too narrow, therefore I wrote a
complete document for you:
https://docs.google.com/document/d/1yneO6O6C_z0Lh3A2QyT8XsH7ZrQ7-naGQT-rpdj=
Wa_g/edit?usp=3Dsharing

I hope it answers all of the above questions and provides a clear
big picture. If not, please let me know.

(If you need edit permission for the above document, please just
request, I will approve.)

Regards,
Cong Wang
