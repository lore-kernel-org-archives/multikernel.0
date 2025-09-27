Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B013C244EA1
	for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759005818; cv=none; b=YjsP2V+9H9DEpS7+xv1cEHMGZ+o2xh7X5tOlatim06IxJ9Mkv8LT/vj85tWGbXXp38dbZXTPA5Nmc6odcxPMHq7UC55OxgBFOX4MYh2UO/Hvtq95+fqz5adv3lAkgUWbk17kdXRcNjK7HOx9sAV1PhNFpGsnWygjCDJsvZwTMV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759005818; c=relaxed/simple;
	bh=UvNClLKNNn9rK6Vik019kICWDMo2uNNhdQgjV8A+LJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiidY5q4nZ0cQnrltDy5eNNAHP8HggvIHcnyeCaKdx2raj3Q54EH09ETisrmoJGfhacq1eRfSI6Wuu/yggifQ6+O46M622LB0y2DhYPaO35AxKdioN5BZNpINy0THjjjgtV17NhiFlT/C8fOHzsqAIMaak2I2re1mhHCRMcNEkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MReEdOGS; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MReEdOGS"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-580144a31b0so1696754137.0
        for <multikernel@lists.linux.dev>; Sat, 27 Sep 2025 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759005815; x=1759610615; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvNClLKNNn9rK6Vik019kICWDMo2uNNhdQgjV8A+LJY=;
        b=MReEdOGSEmtRbZ3aHbmbbNzLLbYtBi88o0P2U3btbMuUMC+k/0pAVJ2GAr0fyrppwq
         qajASEg4bbgPG5DnOrwJqEemNN7c2CexcvwFF4ZfeZ6DqhZB8UxXMovlsTETIGVzULur
         vJvhWNEK3Mltyl8/IXdKYUxlOemYGsBXr5Fm8NZNyKQAVx+245ITtrVDTqhfbcouETiw
         m/egRvIOqtPvKYvmQNz/ya+2WcfNzFvX/SZtMeTBnHwBfEziRC2o2iSfDAGxkdKkUCex
         NzEpmMFrLHAGkkXwhqpY8xgcb2Ui0KrwLAmprQa0shFsaWm+4/toxEBnAS0rFJmAex3f
         lAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759005815; x=1759610615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvNClLKNNn9rK6Vik019kICWDMo2uNNhdQgjV8A+LJY=;
        b=txjsccE5Qvx4D/ANeVRGRUcxWYwiFi00w4tH15F5r6qCl/Fj7m8luaFnDWS8XsMPEk
         4+ViPeA+vjSLMx9SXiTGSUoVMXXlM9P+/xtevLZexmWW0twFHQMbQDkk8y90mMbOuDqg
         9wnm3nybHYv3uhNW+RBTQlD1wlqqrEwPzCXfvN625Ereto4AFztHYC3Ict+Hij/oTvU/
         Vx0JCeXChUaUlOlYoA800eNppPKbFT3Dho7N6jOhSUnQTQLgZpEfoinfBgD8Kue3Q2e0
         XsYncoAjz1hNLjqoduPT/oCgqNcBU3eAxSgIfQLiVk6E8B4Ly5sKb/reymfcs4f8wq52
         h4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXj9AyCY2MxvL5ptus0IeF2WR4WHAIDcc+DgTXIdovbR2FFV6VnSjCM4GmffP2C/866Jp22odD6VMPEBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9WrdTAiINhLCNU5mKf0oG0fTgrAz6Tke8sEuM9h6VfIRzqzYY
	8ZdgZX0hsZH44+Lwlt1MEJYnaEQlGU39Un1d81+9pE9+Cp7YRdaZ2oqfaj3ZDcWb9I9sl2XjXe5
	X9GGxmVpXcVbMaT6XapaXb+PcVe8l12o=
X-Gm-Gg: ASbGncuNP2DhFAPB3yAQ/qZnc3ztewGq3yVxWLZLzC/ztgUTI7nLXcx9Pw0gGGfsUBm
	FEULRp+xf7j91BJ5aIeXfIMmXv81msUV2UR7nC+x/VogXtiAVf3BcS0Qd1qT1tVhdfYPHV/NR6F
	yf6x8h/JcHwOHiPm/gskyrMMAzdChR8pjOL9JdswTzkJDMdH2hUf5TUCuQD+L5YUY5JVlvyC0dr
	DH/CpaJpXp47tyOxhU0UubZjLEFZv0ALeAwfSJT
X-Google-Smtp-Source: AGHT+IGYQ8cZXq6p06Ik0TDBdufn7B3v54OBWxKvQ9AFYTgNeyye8BPJ3qw2CKkk7AUAcaDd0Kb3KEG7ImktB5zLhBw=
X-Received: by 2002:a05:6102:2924:b0:52d:1b06:5e34 with SMTP id
 ada2fe7eead31-5b2826795b7mr3196814137.10.1759005815440; Sat, 27 Sep 2025
 13:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com>
 <78127855-104f-46e2-e5d2-52c622243b08@gentwo.org> <CAM_iQpU2QucTR7+6TwE9yKb+QZg5u_=r9O_tMfsn7Ss7kJbd9A@mail.gmail.com>
 <aNZh3uDdORZ5mfSD@kernel.org>
In-Reply-To: <aNZh3uDdORZ5mfSD@kernel.org>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 27 Sep 2025 13:43:23 -0700
X-Gm-Features: AS18NWBZ4NYpS8oIgxtkL6K4jFZHcC-C1DNvJN4aikZTVbjqp7kQjMuXYe8nY8M
Message-ID: <CAM_iQpWXFQwtayT7Zv7iJd7zQZ=rX_P1ZK2P11-6ohRhLpg7Xw@mail.gmail.com>
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture support
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com, 
	Cong Wang <cwang@multikernel.io>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Changyuan Lyu <changyuanl@google.com>, kexec@lists.infradead.org, linux-mm@kvack.org, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 2:50=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Wed, Sep 24, 2025 at 11:39:44AM -0700, Cong Wang wrote:
> > On Wed, Sep 24, 2025 at 10:51=E2=80=AFAM Christoph Lameter (Ampere)
> > <cl@gentwo.org> wrote:
> > > AFAICT various contemporary Android deployments do the multiple kerne=
l
> > > approach in one way or another already for security purposes and for
> > > specialized controllers. However, the multi kernel approaches are oft=
en
> > > depending on specialized and dedicated hardware. It may be difficult =
to
> > > support with a generic approach developed here.
> >
> > You are right, the multikernel concept is indeed pretty old, the Barrel=
Fish
> > OS was invented in around 2009. Jailhouse was released 12 years ago.
> > There are tons of papers in this area too.
>
> Jailhouse is quite nice actually. Perhaps you should pick that up
> instead, and start refining and improving it? I'd be interested to test
> refined jailhouse patches. It's also easy build test images having the
> feature both with BuildRoot and Yocto.

Static partitioning is not a bad choice, except it is less flexible. We can=
't
get dynamic resource allocation with just static partitioning, but we can
easily get static partitioning with dynamic allocation, in fact, it should =
be
the default case.

In my own opinion, the reason why containers today are more popular
than VM's is not just performance, it is elasticity too. Static partitionin=
g
is essentially against elasticity.

More fundamentally, it is based on VMCS, which essentially requires
a hypervisor:
https://github.com/siemens/jailhouse/blob/master/hypervisor/control.c

>
> It would take me like half'ish day to create build target for it.
>
> > Dual-kernel systems, whether using virtualization or firmware, are inde=
ed
> > common at least for automotives today. This is a solid justification of=
 its
> > usefulness and real-world practice.
>
> OK so neither virtualization nor firmware are well defined here.
> Firmware e.g. can mean anything fro pre-bootloader to full operating
> system depending on context or who you ask.
>
> It's also pretty hard to project why VMs are bad for cars, and
> despite lacking experience with building operating systems for
> cars, I'd like to believe that the hardware enforcement that VT-x
> and VT-d type of technologies bring is actually great for cars.
>
> It's like every other infosec con where someone is hacking a car,
> and I seen even people who've participated to hackatons by car
> manufacturers. That industry is improving gradually and the
> challenge would be to create hard evidence that this brings
> better isolation than VM based solutions..

In case it is still not clear: No one wants to stop you from using a
VM. In fact, at least in theory, you could use a VM inside a multikernel.
Just like today we can still run a container in a VM (Kata Container).

Your choice is always on the table.

I hope this helps.

Regards,
Cong Wang
