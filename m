Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D718024
	for <multikernel@lists.linux.dev>; Thu,  2 Oct 2025 04:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759378639; cv=none; b=o4OWLIOp9FBvBSXXddH6+ahMrviVNH3RTErLQcyA7eHetaYSRa+xlcRDpMY8L2TJdvYcix2eo42dDKVNwS8jMp31z/zg2T8YjTnU/bE0d99Dp5CSh8N31MxymCshLqRyrR58KuU2POwlVc+2TVFo66U8AJSeUhXBcwrej6uPkdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759378639; c=relaxed/simple;
	bh=ctQddUgZm+88vHmtPzUekOskf2BJsO+AnrtcChvOlmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8ymwOMDmXKvw+Bdf+O2b+XX90/vidG+ZSlcKKp4cTv0LorhM/PQlzykWAYELSqQq59Z/dgHakairHD3CvCoLopPchdUM1QRF+XPu4R4YUZ+rzKB+DNawEMm/IjRp22xQubw5Kt4CV6esvEus6/ZP+PiNfaXst2xmPNu71OHT8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H58tRiNQ; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H58tRiNQ"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5a265e0ec25so506537137.1
        for <multikernel@lists.linux.dev>; Wed, 01 Oct 2025 21:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759378634; x=1759983434; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctQddUgZm+88vHmtPzUekOskf2BJsO+AnrtcChvOlmA=;
        b=H58tRiNQZtWTt5vtqmgeRAZ1AmIqrT2cnasHEufVxrjMzo2R9GXnTB9uKTaB4NIzT6
         rg3H1KnC8opHukDj4f3eXBCG5iOFkZfA1Qg7UcfsxOgfGmsVqUC8oE+K8hkgUm7vjkiz
         luNhHAH+sL9uTqxsFiS9J3Cmpq35ZqSxrIpDDaoh5f09cqGVcNtbmkgbGx6yWdmF6sGL
         6GnN9/VicoUkF4vOIzaUB4vmfYN7/rJdPVSYohr7RW+bLCch4Vyj9SZ2H7WT2/Nh+GCz
         nwdxge62ufhN2GijBPhWuGctNWZY8MVtjOVCo8vAGNZBnprRHmXQP0DSA6Yr7RrOHsJt
         FNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759378634; x=1759983434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctQddUgZm+88vHmtPzUekOskf2BJsO+AnrtcChvOlmA=;
        b=a05lUJgxf/T1926QitZi/KjjQJA9qIVV2pVxmQm/QAyIC6NO5GwLvbmkroZ/9rSvJX
         oeALqAu3+QHK7ipssXPRCMo+fAeZ816P/w6MxaHQ2PP1HKUqFKNrn3EcJ5CWslx3Uilf
         rRZ1k8x5uxprZjx2vndSS5lcsjJIeIC25K5GHaIFBFGLEUWV+8oSlEF3xENJvgEy32Rt
         t1RgLR4Kx56UJG7RcspTNlXLcZKi4OlrH1JdWlE2uwM4KuAMQtPun3/AMb1WGiJoXH04
         z5kzTQxHPBXzX78yQmvlB3UrNkiiLMUIHsqnHJgiLfL7l/GMcDfTS+Md0VJM4YLDtCE+
         JWIw==
X-Forwarded-Encrypted: i=1; AJvYcCUMVnWRTUrQlfC7ipDU9L6uV0bFEBWZkLDdvYJ7QhH/bdm3gZidJfXOGAq8sJb1xBS3yKFeNf3Wr6Isug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPIxr+OyeirYP4eFU7lV2LXTVTfANXIDG7emPZI7QfPyiVgk/a
	mboGJPiO9ZEAnJ/FpL5CgETeYHAX9vZ2EqIlHwWMTq8Xs9t/L7mQz/oNyjI30rNqheHFD+YGTjX
	P5bYfG9u2LHuwH6JbGyG62bbfKlsjxdk=
X-Gm-Gg: ASbGnct/rPwDR0rfy2zA+Bx328IqAfKSQppPxYewXJ7QY70jYVzLG4IwIPTu9Idvrag
	LWi0/m+bpshn7xhGj4ahR76ignCRnXH4lPimiAZr3DEt4tYPxMmnl6uI90m4O1WgMKhMgzMgGih
	ZRbZsh9u/tmVe68Z5W00jkSsuZEns5xg9RSNHznEtds2Wwa//rVwrKOP5REo5EK2WjwrEsSBmXP
	DOxkxJXC+frAqeasCm2upF3ApY1rkRyTqUbswK74x7qyYCrtojOkm6uHzNNGZkPofLHv7eD7R8=
X-Google-Smtp-Source: AGHT+IHtvWQt8jonztmIlXZVLrosCzlBFZCwfKRU9/rXACxnEYGw3JcofNOIt435bpI1Zm7zqg5PCoJh2gMscknY7Rc=
X-Received: by 2002:a05:6102:41a1:b0:59d:b0f7:664c with SMTP id
 ada2fe7eead31-5d3fe7043d6mr3036274137.35.1759378634290; Wed, 01 Oct 2025
 21:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919212650.GA275426@fedora> <CAM_iQpXnHr7WC6VN3WB-+=CZGF5pyfo9y9D4MCc_Wwgp29hBrw@mail.gmail.com>
 <20250922142831.GA351870@fedora> <CAM_iQpWO71vSV_0qXiUYeKYZMYF0xWNz8MrUVRkqKwDEtQvKqA@mail.gmail.com>
 <20250923170545.GA509965@fedora> <3b1a1b17-9a93-47c6-99a1-43639cd05cbf@redhat.com>
 <20250924125101.GA562097@fedora> <CAM_iQpWRZ-vihMEa=k-j9EYN9itUeZLhZ14AoCvZ9mturFxAyw@mail.gmail.com>
 <20250924190316.GA8709@fedora> <CAM_iQpXnvyZWrv4W45SBTDV-tCXU4Fz1=S8z_0s5en+U29vSZQ@mail.gmail.com>
 <20250929151149.GB81824@fedora>
In-Reply-To: <20250929151149.GB81824@fedora>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 1 Oct 2025 21:17:02 -0700
X-Gm-Features: AS18NWBSFERQychThKDKhC7xP4aDfnWKA8U5c5GLpDIk74WF-1WcxMsDvgDcjOU
Message-ID: <CAM_iQpVRruWNnMtP2BKfQJrHnA_B+ea84GbO_C2rF6cuJcj5_Q@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, 
	pasha.tatashin@soleen.com, Cong Wang <cwang@multikernel.io>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, Changyuan Lyu <changyuanl@google.com>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, multikernel@lists.linux.dev, 
	jasowang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 8:12=E2=80=AFAM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
>
> On Sat, Sep 27, 2025 at 12:42:23PM -0700, Cong Wang wrote:
> > On Wed, Sep 24, 2025 at 12:03=E2=80=AFPM Stefan Hajnoczi <stefanha@redh=
at.com> wrote:
> > >
> > > Thanks, that gives a nice overview!
> > >
> > > I/O Resource Allocation part will be interesting. Restructuring exist=
ing
> > > device drivers to allow spawned kernels to use specific hardware queu=
es
> > > could be a lot of work and very device-specific. I guess a small set =
of
> > > devices can be supported initially and then it can grow over time.
> >
> > My idea is to leverage existing technologies like XDP, which
> > offers huge benefits here:
> >
> > 1) It is based on shared memory (although it is virtual)
> >
> > 2) Its API's are user-space API's, which is even stronger for
> > kernel-to-kernel sharing, this possibly avoids re-inventing
> > another protocol.
> >
> > 3) It provides eBPF.
> >
> > 4) The spawned kernel does not require any hardware knowledge,
> > just pure XDP-ringbuffer-based software logic.
> >
> > But it also has limitations:
> >
> > 1) xdp_md is too specific for networking, extending it to storage
> > could be very challenging. But we could introduce a SDP for
> > storage to just mimic XDP.
> >
> > 2) Regardless, we need a doorbell anyway. IPI is handy, but
> > I hope we could have an even lighter one. Or more ideally,
> > redirecting the hardware queue IRQ into each target CPU.
>
> I see. I was thinking that spawned kernels would talk directly to the
> hardware. Your idea of using a software interface is less invasive but
> has an overhead similar to paravirtualized devices.

When we have sufficient hardware resources or prefer to use
SR IOV, the multikernel could indeed access hardware directly.
Queues are an alternative choice for elasticity.

>
> A software approach that supports a wider range of devices is
> virtio_vdpa (drivers/vdpa/). The current virtio_vdpa implementation
> assumes that the device is located in the same kernel. A
> kernel-to-kernel bridge would be needed so that the spawned kernel
> forwards the vDPA operations to the other kernel. The other kernel
> provides the virtio-net, virtio-blk, etc device functionality by passing
> requests to a netdev, blkdev, etc.

I think that is the major blocker. VDPA looks more complex than
queue-based solutions (including Soft Functions provided by mlx),
from my naive understanding, but I will take a deep look at VDPA.

>
> There are in-kernel simulator devices for virtio-net and virtio-blk in
> drivers/vdpa/vdpa_sim/ which can be used as a starting point. These
> devices are just for testing and would need to be fleshed out to become
> useful for real workloads.
>
> I have CCed Jason Wang, who maintains vDPA, in case you want to discuss
> it more.

Appreciate it.

Regards,
Cong Wang
