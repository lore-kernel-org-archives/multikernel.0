Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431F12E7BA9
	for <multikernel@lists.linux.dev>; Wed, 24 Sep 2025 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758713924; cv=none; b=fqv9vEwojYQbsN8+YAGyi8QjeSSC/10mLho5fZOcVddU7v7w62SzApvffzBkjb7h22LKulD8C2iDGtDs3JQuLr91eqXN2nXuJxkoX+YVm8NzPkQOnhr0fNLnFCjsTQnECPFjJs+6yW+ot3FZYXLcLJ3CDVVo+lyBcFKwGZdMGkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758713924; c=relaxed/simple;
	bh=J3v5IQ691nfacZ0K5sXI9VNSI1lEh/iGp6qiQq7RHIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTPi6M/lxCg/bpKD4gA12k9nvnE91Xe7zs6DLqFc74i4Hzs5x7UbkvTgVyQWGeLbBBiMOssbx8/2xGoAIlDSvUWQGyt0oP20mmtETtxU0qqBuxPDJGFOcUEHeuxfCggP9MtEmEuY8j9RRKa1iNIzVfMXCmM16uUDBCCFzWD4Jiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pl7stuKD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pl7stuKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758713918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+nr7Ue+Q8mDfosTulm3J5UwQG5E9B4yAzAZ8LnR/jDs=;
	b=Pl7stuKDQ1QJYa7p82DVVBLGNBT7LJ0C6SNA+EBCtADNAMHrA8+Jm8qq+Hy180pH+JzcHU
	CPnrMmpPF0bZvbF0Ab9cXz/SmvUjJWJHUAq4bGGJX8hsr08NL0lJJUcy819316GvnHlwKL
	F9BgVNzEt3MvgAXk/GQvkihjmHZaTbA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-MKQ-wG51PM2A5dCFfKT7hQ-1; Wed, 24 Sep 2025 07:38:37 -0400
X-MC-Unique: MKQ-wG51PM2A5dCFfKT7hQ-1
X-Mimecast-MFC-AGG-ID: MKQ-wG51PM2A5dCFfKT7hQ_1758713914
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4612d068c47so46899345e9.3
        for <multikernel@lists.linux.dev>; Wed, 24 Sep 2025 04:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758713914; x=1759318714;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nr7Ue+Q8mDfosTulm3J5UwQG5E9B4yAzAZ8LnR/jDs=;
        b=B9dHQ+3AUpkLqN8c7iveW4EZjrT9CiJKpxUQtdxH4O51L/G5q+VHLSyb9GoTml5yNp
         AAcK3ec4nzFyEPVV/HydMpq5ROj+0M8RbBElgKKXhNTFV0PM3E84378G/dgTsVAnfP6+
         oKbAOLVaf27uPla4oU1nFB78JIWJ3KWTFnrzgI0I2DNdrddNqQfac5+DyoOv6hXF+U1f
         yGCUIpPDTGhGazc+jN9eZJ+0X0lv1b3Nyr28GBEldqnj8BkYkrpt0wpeM4nvtF/rzRf2
         puHsToW9sYgnpHI465AZX5Qk5CTXN2p4SbKHI4hb47KvSaw7NGhTcTTKlQespUqWgIZE
         7heg==
X-Forwarded-Encrypted: i=1; AJvYcCVnwOpCe+PujwRNTOWMB8DAcRqpWrVJm0M5zTVtITEfsHONNcfGOuus3VpcbB/dqYZxrwFqYig2uSYsRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoFi6MZ1HU//Ai/YpzW40ZSoCsYnpOHYAOxLY+Ae8B3+5NjQsw
	HpeZuQZMW6zREPgGv4h3CHunA0yfMll2Zzi/98y2YioLeHUN894m8s96phqsvmV52P6wKF8r5Ri
	OwNbG2mMNQ7Qn/LwzlIOYTuJ0XoYQmOyuyaqNt3JGD06g3CO0k+jMzsFzRINFdsXd
X-Gm-Gg: ASbGncs3DiuLtbBO1lHzbLRN4FUu5RR2DP8/J5AUfqx+ifx4tUnfVvcsmbVJwoUQqyY
	Q1LlwClyo8LT5zF1ZL4qkpqj930EoVDjs+30TsvGf46aQLNLbNk56694LqOBwTi6+V+9XsBP3wb
	DAXMH2uwShus/yNC4p5mLP8PTz6+f+38Y49Hc/Kvh0v/AX1oZFjsM4apwmltnM+DazfuDo6sJ1h
	rJJ9zTfqrhoFDjQjpEwbnQ1XlOLOj1imLO7NdzkRwNoIQHT99Qh58xLSlrzIP5IYIujM3lIliq6
	rE8i0VbdPNa3fGoWTt9xOm+vrJtlQWc05W93BfD5kGVBnau11f6clWfTudbEbk0uyQXbMTX7fDh
	pLvtgfzJv+LrFjAFzPcJgE9pYgCa2Gy/wP48Sj7B5VsGUE0ajKMZ2D8cYDeU+I4AqTA==
X-Received: by 2002:a05:600c:1f8e:b0:45b:9a3b:34aa with SMTP id 5b1f17b1804b1-46e1d98dfefmr81427495e9.16.1758713914079;
        Wed, 24 Sep 2025 04:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDyoQr1XMCzLogNb5hrirQ5E/He80PBLPI4tToWKtH2OlAXQ+KTAg/KFfVKjMR/pGFLjp+xw==
X-Received: by 2002:a05:600c:1f8e:b0:45b:9a3b:34aa with SMTP id 5b1f17b1804b1-46e1d98dfefmr81427215e9.16.1758713913699;
        Wed, 24 Sep 2025 04:38:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f14:2400:afc:9797:137c:a25b? (p200300d82f1424000afc9797137ca25b.dip0.t-ipconnect.de. [2003:d8:2f14:2400:afc:9797:137c:a25b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2aadf5c9sm28867015e9.19.2025.09.24.04.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 04:38:33 -0700 (PDT)
Message-ID: <3b1a1b17-9a93-47c6-99a1-43639cd05cbf@redhat.com>
Date: Wed, 24 Sep 2025 13:38:31 +0200
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC Patch 0/7] kernel: Introduce multikernel architecture
 support
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Cong Wang <xiyou.wangcong@gmail.com>
Cc: linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
 Cong Wang <cwang@multikernel.io>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <bhe@redhat.com>, Alexander Graf <graf@amazon.com>,
 Mike Rapoport <rppt@kernel.org>, Changyuan Lyu <changyuanl@google.com>,
 kexec@lists.infradead.org, linux-mm@kvack.org, multikernel@lists.linux.dev
References: <20250918222607.186488-1-xiyou.wangcong@gmail.com>
 <20250919212650.GA275426@fedora>
 <CAM_iQpXnHr7WC6VN3WB-+=CZGF5pyfo9y9D4MCc_Wwgp29hBrw@mail.gmail.com>
 <20250922142831.GA351870@fedora>
 <CAM_iQpWO71vSV_0qXiUYeKYZMYF0xWNz8MrUVRkqKwDEtQvKqA@mail.gmail.com>
 <20250923170545.GA509965@fedora>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250923170545.GA509965@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gn2BE-RSXiu31PuRJCpFBuH5WeVv_2IwbgpE_rqOKno_1758713914
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> Two more points:
>>
>> 1) Security lockdown. Security lockdown transforms multikernel from
>> "0-day means total compromise" to "0-day means single workload
>> compromise with rapid recovery." This is still a significant improvement
>> over containers where a single kernel 0-day compromises everything
>> simultaneously.
> 
> I don't follow. My understanding is that multikernel currently does not
> prevent spawned kernels from affecting each other, so a kernel 0-day in
> multikernel still compromises everything?

I would assume that if there is no enforced isolation by the hardware 
(e.g., virtualization, including partitioning hypervisors like 
jailhouse, pkvm etc) nothing would stop a kernel A to access memory 
assigned to kernel B.

And of course, memory is just one of the resources that would not be 
properly isolated.

Not sure if encrypting memory per kernel would really allow to not let 
other kernels still damage such kernels.

Also, what stops a kernel to just reboot the whole machine? Happy to 
learn how that will be handled such that there is proper isolation.

-- 
Cheers

David / dhildenb

