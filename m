Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D333C2D
	for <multikernel@lists.linux.dev>; Tue, 27 Jan 2026 00:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769472183; cv=pass; b=uvyNlhs8FalE4u7m8j3nrRfw1I3xksQIdjBNYzkCwJXk8pNRds40idg2aNtQ6e9NML7wPXrNj+coxiGF1EsJRY5/llps46lwWkYABHvSa+tHZMFSwrAySDQ5Fzm1YDLZaYtMwAywX91FhfK3UlxE5nMGCrqntIAj2UIiQnWUX4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769472183; c=relaxed/simple;
	bh=B7FILprzdIVa5cNTWasw+0btZERZW9imHJueiJLeXUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPocZJ6lAXyW/qTq0bGPa82fdu/s66rfzchfC3tY6GeDqieALG5g3+bR2IZXTAtnfd3cyQavoE6/cL191eOYnE1AbPyRrTo+W8OYkgR1ZNmXrnj+0At09G9fxofMuOn1XCDv7W/gGIZhYfqrMRgeXfcSLvwTuhOx5ogsU/nV1N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io; spf=pass smtp.mailfrom=multikernel.io; dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b=QnSRoqre; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b="QnSRoqre"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-658034ce0e3so8521557a12.3
        for <multikernel@lists.linux.dev>; Mon, 26 Jan 2026 16:03:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769472180; cv=none;
        d=google.com; s=arc-20240605;
        b=Iz/6El14kdroSN8ZAEsZLSpD9IYviFp2Cs85kzShwWoQBi1l3oYqB5y9fJhEX4+eg0
         zVyrsbTgppTdJuvejPore6+9iUmOhBjNdWPn6mJDG7ppKkcbAwZX0PXmVTQimJKPUaJl
         PEXPDfWL66bsU/2ArEd7occYOyY37qSunuJ21goOPLXWbgIlbQgVeO5X2c8qjUx956OD
         HQlNzt0jyhLzOd4i+wokNAUYU1wo6xArplA8KXVPzlcX+7gDJeDqDwsUDTzlXgxtVmuF
         woHLh+OrZPXDWb6IolOqQvFS+HH9fNjkb9o3STAtADwUlRY37LlPSRKTlJHKww+K2ZuI
         0J5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8XNhWr+8q+8rN33Bt0joMF058uip+nBi0GOrAnxuPc=;
        fh=5xwk27yduismPf1WXOr2UNrmPGgH75U6VBvLQVSLUNk=;
        b=aqahMgUy/z3QdSVf5WKQjVJ9F8gKbyEQ5q8B4AXUz4PXB1rzMuT2zRL3aGIrXSsfBX
         I7xdjjFKnZeanmCsKvwlFDGAsh6Ie0C8fmzNMV07KLjEtX2fQEJlYvw635dqAuNfWqRj
         xpmLzB3qextDeEB2PS5Xz8Z1ppU/ArvBrv3my0/A1OoHeNAzdpY48tr+YQizS4DRdyab
         fWivTbaEYuDMgyEOcuJm155MCrrYE6Wnx+mxT2tRio7/Gw7CSENSQBJSl4msrQkC3PHt
         5yURBsZKgwWTKCGfLXvSaU/akiB5xpT2FbzPAscZGbrKy/CWlssZbYnqF68Lmgecfcle
         o4Yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20230601.gappssmtp.com; s=20230601; t=1769472180; x=1770076980; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8XNhWr+8q+8rN33Bt0joMF058uip+nBi0GOrAnxuPc=;
        b=QnSRoqreOYlyZMeIE7ACaBj299GhwXnXyrsr0XIX7qNuErmsmqoWgTj+10gAOlyfSr
         3zACDpf33YS2JzElBEOC4lOTwAb6AVWrit6sEOXPFJURGD/QDudVd5O2jPPjntHFHlZR
         T9Gnc0o6mv77HUbc+ZBO2A5tD0yGZ10foXone5fvIvgBfv4VXhiTfSLsT/uhViBMuKt3
         LbCBfzaH+fUAqRm8JoqA7h0myesvi/SgYsvyZbnrUHwouGkp+vLs8tNfdJJmtu6Q/S8X
         EI6ORIf3n7QNrK2chyh1368j91/CZB1hCDNd02wy3Fs059f3i+Svv57aG2TkDsIzhVkb
         1nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769472180; x=1770076980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8XNhWr+8q+8rN33Bt0joMF058uip+nBi0GOrAnxuPc=;
        b=PrRgTzi2AfCo1pE72ZQzK6S01vfujHpq03XKqCKs8PCcqgZFPg1TaETeqf6peq8RZn
         iOpwUuJyx3S28z8TUPo8l+u3GRSNzGTWmvBl3LVaTN8KGSRRIosTYTXUcipJlA6BmW/s
         rpNi67Qe9zS5jMjyEElxQNV8iqNt4AY3h6mvR7ulThnCuFcH6mBQrJMEcIsgLzKtiFt+
         FZYO9TVvkRHwtk4kXgccJkLllgEpTZyU2PAyMGcqBgTXCvGtOl2xmUJmKZjj6I02R16y
         iUEAokdehGG4ZT+tHlx4zbWdr1Uuq2PVcbxrBtRDC5DUFW+8+60dZGhaR8GQL/QHYLFs
         9dkw==
X-Forwarded-Encrypted: i=1; AJvYcCUs/0h4rCXNSJN0wXoCMzv9LXKKmKzTz23SWzOzzfD64uaq0qcBPpla8nwBz0aDkHNRTSw8FOtGRU3Q4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLj1qX1Y66gGySiYplrnkVtTeQQkfDtvLn+0vZf59Gs7KIGw+5
	azckZhmTsQQGglPzG2sDGkkqFBwM+WivROxvmp5J65Qh1wz7CZmO8N1p2QOF4lyf43A4qYlfacG
	vzW2NBqRMNDgS8Qr+PdyMYKxV50+d2qt9gXDyUjqAsA==
X-Gm-Gg: AZuq6aLhCV7GEuj9VTHSocx3M+T17yYnqwbLZPvV3444Uj4Ji3HVn7rG8WabN9SVe9F
	DPoRMYVw85hz40hp26NHF/VJkpXKwFNerSu+t+jroDuKb7K02xBIV4zKvfUNprosIXQpb5ZWTgh
	rTLGXS1lSjMWG9vdi8QjFobmkZEjQvdr0F4Icl9zxx1w+l0NmKIUEbxGG0wHFxsvdx2QrvEXRB8
	PtFXAaN0zgTMj/AulBYj9MPCSXxu1+AqIkc50OM0BfvaQM5QTMXOTQbFow8ORUBqlK7vGhiuaPI
	ZsaB+Br+bh/VAqG9SCVrKK5WNPSGrdnb4FLRg1J+PUrWGM3MOcnOGfj4GGKM7KWZvVeOuwQ=
X-Received: by 2002:a05:6402:1474:b0:658:11c3:421e with SMTP id
 4fb4d7f45d1cf-6587068c482mr3951394a12.12.1769472179696; Mon, 26 Jan 2026
 16:02:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGHCLaREA4xzP7CkJrpqu4C=PKw_3GppOUPWZKn0Fxom_3Z9Qw@mail.gmail.com>
 <55e3d9f6-50d2-48c0-b7e3-fb1c144cf3e8@linux.alibaba.com> <CAGHCLaQbr2Q1KwEJhsZGuaFV=m6WEkxsgurg30+pjSQ4dHQ_1Q@mail.gmail.com>
 <aXe9nhAsK2lzOoxY@casper.infradead.org> <CAGHCLaSe8g+BQ5OtRv0_Ft3o-G0gR4oVSOW0DtdsQJdwuJsDCA@mail.gmail.com>
 <aXfRUlu61nrIqCZS@casper.infradead.org>
In-Reply-To: <aXfRUlu61nrIqCZS@casper.infradead.org>
From: Cong Wang <cwang@multikernel.io>
Date: Mon, 26 Jan 2026 16:02:48 -0800
X-Gm-Features: AZwV_QgTGkVlFwt14eO-hIDhuWs096CQL1Rqh16YT-ktWjQKBhx-RkrjRU6Xp5s
Message-ID: <CAGHCLaSA9SnM+rtURV=U=hJ4kxpqUim6t7SgvxMNnAed0XaHMg@mail.gmail.com>
Subject: Re: [ANNOUNCE] DAXFS: A zero-copy, dmabuf-friendly filesystem for
 shared memory
To: Matthew Wilcox <willy@infradead.org>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 12:40=E2=80=AFPM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, Jan 26, 2026 at 11:48:20AM -0800, Cong Wang wrote:
> > Specifically for this scenario, struct inode is not compatible. This
> > could rule out a lot of existing filesystems, except read-only ones.
>
> I don't think you understand that there's a difference between *on disk*
> inode and *in core* inode.  Compare and contrast struct ext2_inode and
> struct inode.
>
> > Now back to EROFS, it is still based on a block device, which
> > itself can't be shared among different kernels. ramdax is actually
> > a perfect example here, its label_area can't be shared among
> > different kernels.
> >
> > Let's take one step back: even if we really could share a device
> > with multiple kernels, it still could not share the memory footprint,
> > with DAX + EROFS, we would still get:
> > 1) Each kernel creates its own DAX mappings
> > 2) And faults pages independently
> >
> > There is no cross-kernel page sharing accounting.
> >
> > I hope this makes sense.
>
> No, it doesn't.  I'm not suggesting that you use erofs unchanged, I'm
> suggesting that you modify erofs to support your needs.

I just tried:
https://github.com/multikernel/linux/commit/a6dc3351e78fc2028e4ca0ea02e781c=
a0bfefea3

Unfortunately, the multi-kernel derivation is still there and probably
hard to eliminate without re-architecturing EROFS, here is why:

  DAXFS Inode (line 202-216):

  struct daxfs_base_inode {
      __le32 ino;
      __le32 mode;
      ...
      __le64 size;
      __le64 data_offset;    /* =E2=86=90 INTRINSIC: stored directly in ino=
de
*/
      ...
  };

 DAXFS Read Path:
  // Pseudocode - what DAXFS does
  void *data =3D base + inode->data_offset + file_offset;
  copy_to_iter(data, len, to);
  // DONE. No metadata parsing, no derivation.

 EROFS Read Path:
  // What EROFS does (even in memory mode)
  struct erofs_map_blocks map =3D { .m_la =3D pos };
  erofs_map_blocks(inode, &map);  // =E2=86=90 DERIVES physical address
      // Inside erofs_map_blocks():
      //   - Check inode layout type (compact? extended?
chunk-indexed?)
      //   - For chunk-indexed: walk chunk table
      //   - For plain: compute from inode
      //   - Handle inline data, holes, compression...
  src =3D base + map.m_pa;

Please let me know if I miss anything here.

Also, the speculative branching support is also harder for EROFS,
please see my updated README here:
https://github.com/multikernel/daxfs/blob/main/README.md
(Skip to the Branching section.)

Thanks.
Cong Wang
