Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD4A2EE5FC
	for <multikernel@lists.linux.dev>; Mon, 22 Sep 2025 21:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758578156; cv=none; b=eT6f0ZIOh0FIRmvqbRBQPXwc5NgtLFrpCjMuQ7aNVsInJVp4yZfNN9S1/zTPXXBKu/cQw7IfQY9ih9ywqp2nPu80izX5D01Mz2uAOTVnuc0hV7KLgFuOVZ49X7bRb1ousLVR6YEPhvfJ2czCV2XyYNfLa5dRgSLmOHl+hLDHcH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758578156; c=relaxed/simple;
	bh=kTHCUySsAgP6wxXlzXUMsb5ERn8ZmdP+HwnZhOMU5OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBLC47wXYQmMSE9n1hwDcvGgEYqEiN+aQVnIBnu4FgSUspcf0PhXJdiLiP2Rxo/mQd91V7xOEchz3XpSLzvjOG/qvW1z6G14Ek51y/GjxGfEcUHS6vA363pWBMOKUhUvIu6YbCb9eUBq8DWbNUrT44bt3ba8WCmfliiXkRxutow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isDm7ahF; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isDm7ahF"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8cda57802f3so1294839241.0
        for <multikernel@lists.linux.dev>; Mon, 22 Sep 2025 14:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758578153; x=1759182953; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTHCUySsAgP6wxXlzXUMsb5ERn8ZmdP+HwnZhOMU5OA=;
        b=isDm7ahFC1XguOed4FNJq2EECKXGez1/sc0ph8Uo9vYb7rR5B+pomItiIi/D3YHpHu
         jv0/nlUPJg9dAOKL3mSGywjp70xoAP8hk3VClv5apVRuypq7ajC1W9QVnpyKTd3iuZQ+
         MtUTN2NmK0keD41tOCp0u+27ThRaMBY7eWZ2URmm1FKFnPlp8ZlGB7co23NX17PyKPUo
         VNFw8A5+Pt2usbw3pKEJi9Wb7nUIHvHNcuYMlUUiZHF/P92vAD3r4TbamqxwYOOkU/sA
         8C/xbfGA4PWm9qGfgiHE2LfuMyb/JQwMmytTXnTE+zZwfe3X/iRqHTxWbpHcdpcm2URF
         od6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758578153; x=1759182953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTHCUySsAgP6wxXlzXUMsb5ERn8ZmdP+HwnZhOMU5OA=;
        b=u3bdTuYPeXP4plwTJW4SLVrlp+WZYD17X/tkCBUP8Kh7icnzIY6Q+ULZA717bXgf/c
         LFFe7betuTTt+lqYdk9l6VDWTIgYxICDXys5dCb6mvbMHlnwGQeu/p0C5NzPf3PJiQrc
         /Mz4AymlORM+cJIaQ13khIElB7jcAuYnMFDowPhp0xQbexkyF9xAHQWMmIo3zAGsFF0T
         z8bY21VCuE4kLIptHVFi3vkVviQ+NQAHsGY1/097shCzusESV1vVxDPKBiBcLyGQBKYp
         HJqizBZJsAyCDpuwykXam1HgRwOXZOViG2aqRzlCfRIm9IHlTEouaq4100dSNAzD7+Ep
         jc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq3tUID8BY5vv/+0At9razX0/r5uAz0S3zo5ZJOhyV+exvdTKc9RKJGWEoEuYR0UlDXD8IDFdyc61F4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOr9Uy5lO5LFYWgFIz5g7GlsitUSi5HRsmuEC0u7QHQrznWWRl
	XeGMMjn10MwoT3dTG86dMgkfXyhosRUXY5UWhnkIr67KlIb7MhBXL11WHJfayahm8uw0XxCsL3f
	iHC03ZewgVV7unWio1Gmhjr+CjPj2lvE=
X-Gm-Gg: ASbGncums5y8LeR/jJij63oWq1S9Gi8slFmP92IJ3896IT7M4zDV3lTuWeAvsVbbbpO
	S07Utdz8hMEzVr6gMLSTfx+Yr9I5sRo7SJZ05d0KOsygwv+hmWmnBEiPB7DKp90qKlRfNBEpRFf
	55VABGlw+RrqqYqm3V8TJTJHDzdoyRJbpj0M4gs1LENtpUBPquPiirVpvoVvGIC58xJVUCwY8If
	V9hI/AKxzcls8a/BisdcOck7QE/x4mBz9viR7A=
X-Google-Smtp-Source: AGHT+IHOz+8/11z3CO49ka5L80yW5m+VRpGco9UMZ1EjvSRe6ZYReFt5lxYnV62pJwrR5DLMt1AZon5pYHmXn3KDwhk=
X-Received: by 2002:a05:6102:f98:b0:521:ec86:77d3 with SMTP id
 ada2fe7eead31-5a582330312mr174933137.21.1758578153087; Mon, 22 Sep 2025
 14:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com> <20250921014721.7323-1-hdanton@sina.com>
In-Reply-To: <20250921014721.7323-1-hdanton@sina.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 22 Sep 2025 14:55:41 -0700
X-Gm-Features: AS18NWDwXZgd8togHkyR5VuYzyj7hcNQKVG0Sjq-VJyhnlscuDpAe5Af9RYNnFo
Message-ID: <CAM_iQpXMjFs4LmpRVNqxeBnFp4KxEfgi9cB_Jwuy7VgOSqTfsQ@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Hillf Danton <hdanton@sina.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 6:47=E2=80=AFPM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Thu, 18 Sep 2025 15:25:59 -0700 Cong Wang wrote:
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
> >
> Could you illustrate a couple of use cases to help understand your idea?

Sure, below are a few use cases on my mind:

1) With sufficient hardware resources: each kernel gets isolated resources
with real bare metal performance. This applies to all VM/container use case=
s
today, just with pure better performance: no virtualization, no noisy neigh=
bor.

More importantly, they can co-exist. In theory, you can run a multiernel wi=
th
a VM inside and with a container inside the VM.

2) Active-backup kernel for mission-critical tasks: after the primary kerne=
l
crashes, a backup kernel in parallel immediately takes over without interru=
pting
the user-space task.

Dual-kernel systems are very common for automotives today.

3) Getting rid of the OS to reduce the attack surface. We could pack everyt=
hing
properly in an initramfs and run it directly without bothering a full
OS. This is
similar to what unikernels or macro VM's do today.

4) Machine learning in the kernel. Machine learning is too specific to
workloads,
for instance, mixing real-time scheduling and non-RT can be challenging for
ML to tune the CPU scheduler, which is an essential multi-goal learning.

5) Per-application specialized kernel: For example, running a RT kernel
and non-RT kernel in parallel. Memory footprint can also be reduced by
reducing the 5-level paging tables when necessary.

I hope this helps.

Regards,
Cong
