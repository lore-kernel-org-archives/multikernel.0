Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9442AA3
	for <multikernel@lists.linux.dev>; Wed, 24 Sep 2025 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758735043; cv=none; b=s15hP4Xdfnz7Y9Y/ntsWlKD+qaW4DcItZs6s3xNLBonHPAYZD0VLf/bMTvKvbWN+oe9wXB9vvVg1z6THJmEmi+RJ8KW1Qz2xxnoeJ4shEwPZbySrTKqLhJldl4IRm5NheikdCAOkfFL34yFw7KS0Tqs0jforZ7o38IPEHBs/vuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758735043; c=relaxed/simple;
	bh=5k4yjC+BSG1p1WXbj5tLbzcQV6kbIE3+SfAB1tB9E6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7tegggMM3Hb0RVblKLD/5jlP73KMgkFuMdUpXRJS6CmEXdsrQLrynT3EtEgGKwK+ZMbBaGNVaWrnktUlq/Wwto5NXXYAuHW29uAPz760xlCXr68a6EYyO7iP+oHBSQT2hL/yUs50eH3Mr91srWyO7hF59fzeBVU3rzGecSa5Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwpU7gqv; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwpU7gqv"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso74268e0c.1
        for <multikernel@lists.linux.dev>; Wed, 24 Sep 2025 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758735040; x=1759339840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k4yjC+BSG1p1WXbj5tLbzcQV6kbIE3+SfAB1tB9E6M=;
        b=bwpU7gqvX4bNBlKi7i58QbRryPAAs2fEsHUdaPOuGFzdYVCpTQlaoGYoARIAKzsleF
         dQ2e1/p1QS/D5+CXCMYbO/XudES7DqIOl7tqKgSrIiKua3udOBzB5R196tHAnW6exULZ
         omLHc4YqDiMJL1r4o1TdKTTuizjRAErxXdJxGW6vLY+zxpaLz7OrI/1/OPVmvynoWts1
         n1lQfjUMNL/OH9DRBEBMSWSCzH0hsHqt/qW5W53GoWtBnBew14o7FIfLbKjoLsItGt5L
         VpMqutzLKDo2LvbXFq/k0Rk2gnkvDUVqz3pr7ATdVFu8drdzSVCUNofbz8BQbr0Qdrf4
         4kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758735040; x=1759339840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k4yjC+BSG1p1WXbj5tLbzcQV6kbIE3+SfAB1tB9E6M=;
        b=uRlVyq2jeMPY+lViIL82ZLcHFyX6TRZW1k2+jqzIr+An8CSTQq+/N7gLtaHFB/8vlb
         /kuZoLidI85nRPObyY7uUFBMA9gKNMXvqY6U1GGWmJZOHMjfo+i6nT/EPahsQuUZoZKU
         lGDy57pYXi3z0n8LpcqvbpP1HeQfBBjhL4yBFPNTPUHi9VtIvoNtKkzBItfX7mofpneD
         KOGpZ3CLt/Bqwq5XDTkks8jZEBIODPDIxCyi6TVNfFsJSKjfV2L0YOjRO3H6rNmsNCYK
         8I28ZMWTYGUqJfP6ZF06852FGOczGsxAsVFl4qheLi5Tu5MFBQX1ir5Jh+vssYGatxbB
         kVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHS3Lpdj50opCYwsDuhS37Zm+2g4/EcRYKsL4bHocATBxyClnO6pOjcM9ownZGhJBbLqquA/uH0vxbLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgyV6Uq/FSubbVkiLymH7SHxny/1R1bmyhGIAab5Kqu32SR5DY
	31cdBGxb4CcGb+yF9f6HY/+8nsyTnaXFcGNaqtTK2yWDW2GrYpPd5k+/UWU0hNlDiZdHZtLUFsg
	zrFKtQTyY6IFJCi21hz+U5v183cvW5CU=
X-Gm-Gg: ASbGncsnloL9MpU2F5qyP9r4vmwWaO0mpA+n8b1bgF5vvlA4Lu9XPbo+uOcHULZPrrh
	sOecd+PG1XeUB0/0GSZ3vPMuXgdDvZ+C6/JCtIZMbECMM6EvSHYyZ0MroEHVwlFr8B9GJdLheyq
	P1ZMg6Q4RD5XPKFvXJS3rhHXWJZtCuqqirEgad+M8qhD3tw3OJueq0GIahwYjHfI+8Sv955IO1h
	Q44lSulDkffakNTe1RWUStpQoh4iCeCt5AmEwo=
X-Google-Smtp-Source: AGHT+IHRUpk+l43lUEkfSvsxG/gFSXsSmy0Yb679EkTBjMcSGGxPm5euPRNwbWLb6UIPoPzyECrG67GnQN0NLXcRGYk=
X-Received: by 2002:a05:6122:a02:b0:54a:71f6:d570 with SMTP id
 71dfb90a1353d-54bea048358mr462955e0c.0.1758735040012; Wed, 24 Sep 2025
 10:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com>
 <20250921014721.7323-1-hdanton@sina.com> <CAM_iQpXMjFs4LmpRVNqxeBnFp4KxEfgi9cB_Jwuy7VgOSqTfsQ@mail.gmail.com>
 <20250924011237.7568-1-hdanton@sina.com>
In-Reply-To: <20250924011237.7568-1-hdanton@sina.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Wed, 24 Sep 2025 10:30:28 -0700
X-Gm-Features: AS18NWC4qMXjcqYtqwcv8qlLfwmYuF4gi5abMG-3xTy48-aZuz-HQ3CPl9ywuBM
Message-ID: <CAM_iQpUwm0wOQx3Epo-5MmkfwZmLsehx6HmABNwzqpRNiPjTmQ@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Hillf Danton <hdanton@sina.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 6:12=E2=80=AFPM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Mon, 22 Sep 2025 14:55:41 -0700 Cong Wang wrote:
> > On Sat, Sep 20, 2025 at 6:47=E2=80=AFPM Hillf Danton <hdanton@sina.com>=
 wrote:
> > > On Thu, 18 Sep 2025 15:25:59 -0700 Cong Wang wrote:
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
> > > > - Better resource utilization than traditional VM (KVM, Xen etc.)
> > > > - Potential zero-down kernel update with KHO (Kernel Hand Over)
> > > >
> > > Could you illustrate a couple of use cases to help understand your id=
ea?
> >
> > Sure, below are a few use cases on my mind:
> >
> > 1) With sufficient hardware resources: each kernel gets isolated resour=
ces
> > with real bare metal performance. This applies to all VM/container use =
cases
> > today, just with pure better performance: no virtualization, no noisy n=
eighbor.
> >
> > More importantly, they can co-exist. In theory, you can run a multierne=
l with
> > a VM inside and with a container inside the VM.
> >
> If the 6.17 eevdf perfs better than the 6.15 one could, their co-exist wa=
stes
> bare metal cpu cycles.

I think we should never eliminate the ability of not using multikernel, use=
rs
should have a choice. Apologize if I didn't make this clear.

And even if you only want one kernel, you might still want to use
zero-downtime upgrade via multikernel. ;-)

>
> > 2) Active-backup kernel for mission-critical tasks: after the primary k=
ernel
> > crashes, a backup kernel in parallel immediately takes over without int=
errupting
> > the user-space task.
> >
> > Dual-kernel systems are very common for automotives today.
> >
> If 6.17 is more stable than 6.14, running the latter sounds like square s=
kull
> in the product environment.

I don't think anyone here wants to take your freedom of doing so.
You also have a choice of not using multikernel or kexec, or even
CONFIG_KEXEC=3Dn. :)

On the other hand, let's also respect the fact that many automotives
today use dual-kernel systems (one for interaction, one for autonomous
driving).

>
> > 3) Getting rid of the OS to reduce the attack surface. We could pack ev=
erything
> > properly in an initramfs and run it directly without bothering a full
> > OS. This is similar to what unikernels or macro VM's do today.
> >
> Duno

Same, choice is always on the table, it must be.

>
> > 4) Machine learning in the kernel. Machine learning is too specific to
> > workloads, for instance, mixing real-time scheduling and non-RT can be =
challenging for
> > ML to tune the CPU scheduler, which is an essential multi-goal learning=
.
> >
> No room for CUDA in kernel I think in 2025.

Maybe yes. LAKE is framework for using GPU-accelerated ML
in the kernel:
https://utns.cs.utexas.edu/assets/papers/lake_camera_ready.pdf

If you are interested in this area, there are tons of papers existing.

>
> > 5) Per-application specialized kernel: For example, running a RT kernel
> > and non-RT kernel in parallel. Memory footprint can also be reduced by
> > reducing the 5-level paging tables when necessary.
>
> If RT makes your product earn more money in fewer weeks, why is eevdf
> another option, given RT means no schedule at the first place?

I wish there is a one-single perfect solution for everyone, unfortunately
the reality seems to be the opposite.

Regards,
Cong Wang
