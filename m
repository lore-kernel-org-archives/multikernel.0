Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CCA19E96D
	for <multikernel@lists.linux.dev>; Mon, 22 Sep 2025 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551381; cv=none; b=kdLD1jkrvl8S19ljK9AlhVByElJm9Mt/QvXaD/+7+F3Oq2CcbcrRKIgHpKgzwn6xJEK9k4PGdKGRhCZ5zu75FraDuUdZSB+9PXGVuNTwpxMr4RON5SU0c0fIC8rQ6vbFNhjksZEtBnLK39Z5EVCq5jGbhwJNyUO0s30+jU7xpUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551381; c=relaxed/simple;
	bh=QsZFotQgKDOlLBKfwgaGZq0NXWyvU7kZDwZsaqECxxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pudfXm3y2acxL5Kck3ydrqu0dcBIgcBTGWnGb/rVkD4MBgqV+LfaOzNo8b5x5BSoUmz9V2S23mHB+k+oyewh9Yzuh9elfUvHQN1YQuNeSWfskoH3+FdH+mMwYuBVw6GGgknX1BEHuOi3uFgkgzEH/jcjO4jppu2JC6SURox+MTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=sksiOMge; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="sksiOMge"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso2110543e87.1
        for <multikernel@lists.linux.dev>; Mon, 22 Sep 2025 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1758551377; x=1759156177; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=sksiOMgerB82MDhlSg12lFIhrjHezP3pBtef7PM/kOb0xfeX5mSf0fgYDQMzEkTnvx
         HS+awejM0E7mQNsxQC8g8u4OQhzXytyqvudYtwCggHYRvoR7IGIEduo1OloykMGEWSPD
         BRCieMlXvB1DGPaet+iyBuyJdR80NRsMzWgXRskHAQVMyu5/hI+EI9JiNH2kYeYexTsi
         Bl9hWp28pTOc9ZeYCX6fhfKJB59TfupvpMbNOfdt/00l7b7Rk3ntHYRxvRS58t+oGe5x
         VVdXZOA3557odT+4c6sVooncxg70GCh45N8t/DDSTZUFK6sa8UyZU5EaFxVVdJ1G3/sk
         bjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551377; x=1759156177;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=XFRCi07nhPTaVxbevMmM8kQS/8hmRK+jCC0W0H+xfKQ1vsPKwQFS4OoDgDQ6ZqPV0j
         j2Is0Z88D4RdWZYyrxp216Hc3/2Vqvb1QE+7Z7fY4T5HGhwtQZ0KjXRKeRynDha71+LR
         YkiuiGcA3noOAbYOxu+Ewkr6AyZi2h0NWunnH97yPHCRA2OOxQnPfcPx553ArRzg+Obn
         agwmqwb6tNzIA0bWHsdeEPBRTvcNnoKAT7CwfxhbgZDkKwOST1g9Zt8EbGttsGpYXqbf
         FaI8DxZOt+92b0N77KM7HoUAF6lYNLtQEMJgkG0GsqzgRMyytFZYROYCPvEs0SftAQuE
         iMxA==
X-Gm-Message-State: AOJu0YwjN9D5pTk63uqCDqyQAzRjjvYTkPYpVQJ0+sPMZtQqJ4sx9JZe
	mEuio6ViuqsPiHIPYv0bmFDJh3oWHvHpJK2hx4scxw6K40+3fAgoBaFbz4wi291eAELmiYJspkK
	x9cJxVqdmU5Bj0hC1Uz/tGA/SqDXniQHtJ2ERQWWPREZwngawQZWJ3ck=
X-Gm-Gg: ASbGnct1KvJVd8rfpTXh9RtlXW937ifcTPddynw8sjmFKyXGyAMIpik+vkrclkZEYru
	QT4oQF+KqGNC2PRFjezwSs39qrUyBQDFizzy0itnMYcoMHUZz3VqX/shPuyHb6gePs89A6/v7sU
	Qk/GAV9QL6ybA9Rwqv9fyrlI8VmlMtpVBVT8Blu9TAblh2Qc88NznvLYia2BUPNesYehKkirjKn
	BA9RO+H7oPw4XHv9mvRWCnM20PX/iKMR4znWYEN
X-Google-Smtp-Source: AGHT+IEuU+eELm+h4v3u9TWFNvrJ8FaDVql9nBWBVe8Fwhv/8eeflYdYf2eeWAflwyKmYjI5yZMBSug8qZEA9Anyh4I=
X-Received: by 2002:a2e:bc03:0:b0:333:b6b1:a151 with SMTP id
 38308e7fff4ca-364165100c9mr47113161fa.7.1758551376670; Mon, 22 Sep 2025
 07:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Mon, 22 Sep 2025 09:29:26 -0500
X-Gm-Features: AS18NWD6hp9dqZkMFUnRBs2MwrrNRR-fhPCGvvsT9c2bK79xBNFUHKDgr-6Q71E
Message-ID: <CAH=dH9-z7yFYkAQfEO_dMsfgLiPHkstA1vb3aDbuyCJZuh4mug@mail.gmail.com>
Subject: Test Mail
To: multikernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
