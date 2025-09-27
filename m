Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C119F43A
	for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759002158; cv=none; b=ZxHNs9wMM6zXNhucYsRlxjIQDd7INGyNVCLWOsnhmPANmC5V+XSz0LyMIJL+qzX7bEJeLZizmgJw+HRJjwQwmqkp20xy4kvxz15hjUVx4Vk+iJtiMZUcAmYcPJfD/lkCDQIJ7pz6XfJoDBckjkkDdtYeE9llk16xXJW4MwAUm9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759002158; c=relaxed/simple;
	bh=6xQ9bzFk69iukmKUY25ufCAqjrKMzVtKfHbiTqiaUsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mop3VaZSn0Pj4DQ7AdTCFwwcF90ANV12D5/rZwcb57Dblt/9JlPpakLsH/8vnKGKN5OOo0rBSSxjVXWonklJ93ry8qdnb8ynv1SiN+v1UhYU+isN1RwIo2353X5n3mN1DOtIQWIt3Xy1p6zmNXGesrCcPlZspv1BM3jz/fvygqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCvJmpyK; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCvJmpyK"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-59dff155dc6so2036925137.3
        for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759002155; x=1759606955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xQ9bzFk69iukmKUY25ufCAqjrKMzVtKfHbiTqiaUsA=;
        b=WCvJmpyKnS7Jch66bHsPEcgEvoqlNnbSEGM7jmbLZGvuL3GbJ25OdLKAFRZ+9h+TVe
         hJEeADyO35cJwWCeDb4HDZ5OKU1F915WD32luontMr++/M3MMFtBLxiY0J7vDJTQ3HwB
         Jq+DsDIqkbExoFVYjVpUTUvVKS50iEbtPk7YMq6klWnC0BYMRGcu0b7GJdvAvC+IerKm
         k2G58RUefXRu6wWGDkJZeKTdEt5oH6U/ciAIU6xS98f4rNUlrhRRAec3e0TAWJFk0+JE
         OfkgPNEqQfZqdjXJjGKvCOX4ZOt/Ch0FZotbWnnML7piPXOardWLwhGbTKrHvZFpXO9c
         mvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759002155; x=1759606955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xQ9bzFk69iukmKUY25ufCAqjrKMzVtKfHbiTqiaUsA=;
        b=uhSbN6j382YJb6s/nPX+OCV4qfj/jcRJVFMAioEX/bVgpzDxALVDPwV/GfYxVuySdy
         jAEjckg/bVTMa21Fbr2Nqlv5HkLzXLDdvDFq1Hfno/bTkV0Qzfcdojspv9cN+/tOcY/x
         lp/DvpbJuursGkNSjEQGW6cYMxC/3/MQ1Ra6hRYxrJoU0P+27YPuBfQut0mFGcOeXkCO
         Cd7jR3+bELUMHHQLKNuUvatiGHCSBoJcXXL40dSptUAE17HbWl8X7aEE6JItbnogsv+U
         yuCXolMQqqTs3J2rb6/hQdRzU0521veVu35/9YfENjHrpAruZkWswGljlwfHFRlxTu+b
         iMQg==
X-Forwarded-Encrypted: i=1; AJvYcCW5zvr0lV7gJCNb/32MbqlGEc0vhSNMfK8OQ6D/Y5UxKkfIezmVyvkSBNh7kSFl6JhvAEFktFPgL7sQxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVG5nYMGndySCgu2vhiAvb8vqCE8FDglCnNxcTUCGLIb8LFRVI
	ZTlO76FQ+UIRZXIW6WhnComLWcNnUC+AaEbz19FrQ7fMUgmGEBOZItsSWVoBiAmoe7WCWEdkkmK
	+ga/XznqgeuW+hK+SC+WalRAs5iZFmXA=
X-Gm-Gg: ASbGncus7dZ9efOAVgNekgWdWPZOzJzu4eHvV7MwCPqBEj8vayZxvytRoqtv256XMY4
	Lpqek9ahaq9T6sGkWpBL3HagsODhyBSWiWQF+87HJpUWO2rQ2eFJbq6v+ucd5eOuYmQf0IUjbyR
	mBSvLsStoR6kTR2xIDqk0BLLLXsrups5RIt5O1dVwRkdnKHmlRp2vJAV1nVe4SvyjXi0I/tcBId
	+61MyXGFtIAr+S6oVdYbzU7AC0ps5iY79dMXNZQAXnBTbzOyJY=
X-Google-Smtp-Source: AGHT+IGglDo1/gdOcNhsuSzZl7FEO053NNm+ZSGFGErw4ULSPn8POBz7Kmhwj8faLx+8S9aP6qgFUy5HNQzHFDYGmS0=
X-Received: by 2002:a05:6102:6499:10b0:5b9:c38a:c4f9 with SMTP id
 ada2fe7eead31-5b9c3a94dcbmr1525519137.31.1759002155340; Sat, 27 Sep 2025
 12:42:35 -0700 (PDT)
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
 <20250924125101.GA562097@fedora> <CAM_iQpWRZ-vihMEa=k-j9EYN9itUeZLhZ14AoCvZ9mturFxAyw@mail.gmail.com>
 <20250924190316.GA8709@fedora>
In-Reply-To: <20250924190316.GA8709@fedora>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 27 Sep 2025 12:42:23 -0700
X-Gm-Features: AS18NWCeP2cGzDoATwSVHNUS5qX7kDmrKwGEMa7Qt3ofJhYYTiaA4U-AxyJEbYo
Message-ID: <CAM_iQpXnvyZWrv4W45SBTDV-tCXU4Fz1=S8z_0s5en+U29vSZQ@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, 
	pasha.tatashin@soleen.com, Cong Wang <cwang@multikernel.io>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, Changyuan Lyu <changyuanl@google.com>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 12:03=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.c=
om> wrote:
>
> Thanks, that gives a nice overview!
>
> I/O Resource Allocation part will be interesting. Restructuring existing
> device drivers to allow spawned kernels to use specific hardware queues
> could be a lot of work and very device-specific. I guess a small set of
> devices can be supported initially and then it can grow over time.

My idea is to leverage existing technologies like XDP, which
offers huge benefits here:

1) It is based on shared memory (although it is virtual)

2) Its API's are user-space API's, which is even stronger for
kernel-to-kernel sharing, this possibly avoids re-inventing
another protocol.

3) It provides eBPF.

4) The spawned kernel does not require any hardware knowledge,
just pure XDP-ringbuffer-based software logic.

But it also has limitations:

1) xdp_md is too specific for networking, extending it to storage
could be very challenging. But we could introduce a SDP for
storage to just mimic XDP.

2) Regardless, we need a doorbell anyway. IPI is handy, but
I hope we could have an even lighter one. Or more ideally,
redirecting the hardware queue IRQ into each target CPU.

>
> This also reminds me of VFIO/mdev devices, which would be another
> solution to the same problem, but equally device-specific and also a lot
> of work to implement the devices that spawned kernels see.

Right.

I prototyped VFIO on my side with AI, but failed with its complex PCI
interface. And the spawn kernel still requires hardware knowledge
to interpret PCI BAR etc..

Regards,
Cong Wang
