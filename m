Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB2824C076
	for <multikernel@lists.linux.dev>; Mon, 26 Jan 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456914; cv=pass; b=g7MNFGZe1eOaulNt0GNDsOxgDy0cgTX5a6DQ4ktUnnMr7wZ+NCp4x2uTlFgIl51ypjnOF3j+hACz/AO9eR9b8s/WTEY+Yv6Nsi9JKlJjUqJTw98VOd0fx7nlQgpFEzyJKa3H3PCyGMsvdFNRpDn0H5hnZmfzKdhwu41JCsTdir0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456914; c=relaxed/simple;
	bh=M0vL2ZzFElYN6fOE5Yf8DQGBpKROrbD26vPQIPjtk+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OX4JehIs725MhgSX7RgbtHLjJMIS4ZAziy8X32Vj2SXGbeKRpSJfPJy9MI6DdBv8Ut8zLlMoOQUgpwbm+JLIXytknMH1BPj8tquLp6X23vowPq+quL0PPSFRMeJs4xsT9PFCuugyZmOp3YKcabPFvySL8H6YzhwjWfcNfhuC3x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io; spf=pass smtp.mailfrom=multikernel.io; dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b=eOjEEcha; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b="eOjEEcha"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so8864051a12.2
        for <multikernel@lists.linux.dev>; Mon, 26 Jan 2026 11:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769456911; cv=none;
        d=google.com; s=arc-20240605;
        b=iOOKc+mUq+P0AQWL1dOQKTGUHUwWO11joHGpCuPVP0o0IHuCG5h5JlVC+btNPHjftR
         OOz44nsP5qtnOtpy4HEpbwQtwF0MvBeasT1N7uyJJ+XQOQVQUv7pNlTPaqBihLx49B4y
         DyshHqT+htEml6jHzjoKvMUFGNERSqLImzOVIAQnx10Da6l1vGGAic2clwdknEHU0L2r
         XC4YHzHoK/ZuJCXN3V5gWE2cBEuNBTyC3DSLjdTxhSagxDPlNZs710Sl2t4tUyhml11O
         wLC6in6003jftfTprq/ARBm93W1XXF02H2ZAC8ifskwpvV+eF04bBERHj2hFJNm4WQR/
         mWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GFgoCBvKFkdr7eVG3rBCsN0lSRo0YjSiOLD4Sxa1neo=;
        fh=a9aUUGVNnIP2noJ11Pkthg78jV3u6vkTtpKvyIUoA0Q=;
        b=L1uIobfr4ykDULkd/x9BGtpicMo+UAIU5ooCy+6mbt+2hv2bfL8t8ZpTy8M+ZDWCYh
         nlbbDD9Plw3XzrFzoRSl0n3KRyqLiLwvxAp9X+M5oAyM5HLYkm8kpjuuqC0zCK2C7Zor
         dH65z7XycDdK7ucouHFobf0jHUTfR3YEZY+1NuP3ldHSNhsKL4kUBtyNg+7bhwOH3R82
         4XL4CtnpJ9XabgC2zEiYB3STF4N9//+BE0Ea7MyvDprvBLXEmZHGvNXhO/2gHu7CWgp9
         ouc/P1T4Jx4nhv/qrh+sXlgvvw7eGJdg6rD9nXTBDzkLOutisaUxhzpFc4inocxtYlic
         59rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20230601.gappssmtp.com; s=20230601; t=1769456911; x=1770061711; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFgoCBvKFkdr7eVG3rBCsN0lSRo0YjSiOLD4Sxa1neo=;
        b=eOjEEchaI13L0feN9CQX17tXV69l3dhns3UTEkt221JbDcB429uLdVV0vb2R8aGGVK
         Cm70FjRX22hlqLfg6aMJVSLwdO6NnTlVSb1Z6gK+bwZMrLSlgkAbEvunJZUMRy36Ua2P
         y5mLsxKHGeVZmib2VSpyW0V3rR6z5cEipD209PQB8uJv75BynqWimcNOJIsmQGT2y7jd
         WX1G6c2++rDxrSVqGMqz8iYxaC9XmwggyaceD5/pbL4zXh0ibyXyYAery62EqmceJIlt
         waoN+BuD1KdC729hIKa4R8tqQ69loAgGE/W4HbmSZuIc7JxxQKn50dqUn0gTxhPVw5yX
         gAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769456911; x=1770061711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GFgoCBvKFkdr7eVG3rBCsN0lSRo0YjSiOLD4Sxa1neo=;
        b=J9ZU7iYKJSVyCirP77ZHV+wCsh552A6+T0uipV8/EuC1jC8vdrW35IIkO1SujXCmgH
         vjroF1jvR2j4GY4mfckqenW6wBup6UGSv/+BcOJpySKOS+bC++1fnmQGUB0xGYRJFilR
         B/uT/JgZpKAAUtmeM2kOlBLyJoZEtnYlD9XqkEg/arqHCPL+KNWla8KVFrrCQ6G0MV+Y
         O799FschbQCK2UE0p9AYA4pH0U75I+ZWmxf0fIOXmk3A/lfUbqIsEYxKD1t5/3TQLBXn
         oh1HSChTm54W5L1PjuyLHcZmYX3CiVFvBJZRF0WF6apcBU1I/R9YyYPeKkPKjAuc7Kw2
         dk9w==
X-Forwarded-Encrypted: i=1; AJvYcCXyjZRiz7LEGlV4L4dBcpJYlgtz8OWHjoiKUzoUesxiAjRDFEvprBzI5yV+JL3B9ilCPHHNpxmtpHoBwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6ahynv3Bzg/Mw5Pvhgzb3pmqWTDf7WzWoteKqctWZjgXtonvH
	Rw8wZ8pqTxiw/13An/yZ1CQgQByia3SLnS5z5XqAUPchf5CpdPtxO3vrtdivbyU7femQVEnXa8a
	pZYbUQkxSYkuD+d4gNO+2vIPkQnCjW9I2DDGWC/o+8w==
X-Gm-Gg: AZuq6aJp375/swzWHJpw/M2/avTiJkb0hDRXY7F3v2TuxQvVcLuNLWNYNjxJZ6zWSBO
	FAEWb7Xt8veLBObpxQjOH+2+BqGM80h0cRLOH0rVBO5zDXtYHYr7RfeVBr5oYGiXpoC7tYYIpwu
	Tpy+DK2s8VuHvmE5Hl2lxGxAv0kukxScGSNLU4GVA+TFrxSLc+UxMZxI2zbETWbLU1ZZn8y1YaY
	LnrIrhal/i8vUcf5N0FApOjCgdJ4bSESyYIZVQYSE2REGqrmLr6fI4ncIRiWSsC0hxWJDc3aJ91
	EYqQ003ysfukVied2guoNwLNR0MX+dWCC4VtY+zKbg69Lk00aWCIO2Oxkz/0
X-Received: by 2002:a05:6402:380c:b0:655:a20a:a258 with SMTP id
 4fb4d7f45d1cf-6587069c213mr3379894a12.10.1769456911259; Mon, 26 Jan 2026
 11:48:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGHCLaREA4xzP7CkJrpqu4C=PKw_3GppOUPWZKn0Fxom_3Z9Qw@mail.gmail.com>
 <55e3d9f6-50d2-48c0-b7e3-fb1c144cf3e8@linux.alibaba.com> <CAGHCLaQbr2Q1KwEJhsZGuaFV=m6WEkxsgurg30+pjSQ4dHQ_1Q@mail.gmail.com>
 <aXe9nhAsK2lzOoxY@casper.infradead.org>
In-Reply-To: <aXe9nhAsK2lzOoxY@casper.infradead.org>
From: Cong Wang <cwang@multikernel.io>
Date: Mon, 26 Jan 2026 11:48:20 -0800
X-Gm-Features: AZwV_QiTFQvgZsMW4jmuzkfZnX6F402IWFg5QjEYp6fKcsiy_1Fuc0600LDz-zM
Message-ID: <CAGHCLaSe8g+BQ5OtRv0_Ft3o-G0gR4oVSOW0DtdsQJdwuJsDCA@mail.gmail.com>
Subject: Re: [ANNOUNCE] DAXFS: A zero-copy, dmabuf-friendly filesystem for
 shared memory
To: Matthew Wilcox <willy@infradead.org>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, 
	multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 11:16=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, Jan 26, 2026 at 09:38:23AM -0800, Cong Wang wrote:
> > If you are interested in adding multikernel support to EROFS, here is
> > the codebase you could start with:
> > https://github.com/multikernel/linux. PR is always welcome.
>
> I think the onus is rather the other way around.  Adding a new filesystem
> to Linux has a high bar to clear because it becomes a maintenance burden
> to the rest of us.  Convince us that what you're doing here *can't*
> be done better by modifying erofs.
>
> Before I saw the email from Gao Xiang, I was also going to suggest that
> using erofs would be a better idea than supporting your own filesystem.
> Writing a new filesystem is a lot of fun.  Supporting a new filesystem
> and making it production-quality is a whole lot of pain.  It's much
> better if you can leverage other people's work.  That's why DAX is a
> support layer for filesystems rather than its own filesystem.

Great question.

The core reason is multikernel assumes little to none compatibility.

Specifically for this scenario, struct inode is not compatible. This
could rule out a lot of existing filesystems, except read-only ones.

Now back to EROFS, it is still based on a block device, which
itself can't be shared among different kernels. ramdax is actually
a perfect example here, its label_area can't be shared among
different kernels.

Let's take one step back: even if we really could share a device
with multiple kernels, it still could not share the memory footprint,
with DAX + EROFS, we would still get:
1) Each kernel creates its own DAX mappings
2) And faults pages independently

There is no cross-kernel page sharing accounting.

I hope this makes sense.

Regards,
Cong
