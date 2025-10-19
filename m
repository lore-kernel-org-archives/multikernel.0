Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8A22A4FE
	for <multikernel@lists.linux.dev>; Sun, 19 Oct 2025 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760854621; cv=none; b=iFQ7YP7Y3DOc5JwFX+B+IIS/3g/jeRF2NtZlbSATyXbobmc4whW3tGv/eFGkHlDS3KKNUPARnwESd1q+Z41nyL31F1HC5sRzcmGwk0zwggulACe6cvyupvj4jcKDaPBGuoXNwet62I0LqS2/d2w76h0jmvVrVhHLKmWNNZeCxuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760854621; c=relaxed/simple;
	bh=8gSY4OPB3fIJfme7Dcjc1WhgAIFyf2Ln/I5OAXl3i+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CgvjFh4MMV/OBUlkOZ78lcU7uadlrymw2RjtzEwcaDhZXV8EddBhsK9r1Lnxr/NiofpJ40amAx8yF1Rtu0Royar/5sNVvoAOywd4i/RY/rHGR8j3XkuLdavGuRzUx/mb9R/uFJ2wzmeSA3cafgzzYFmrfsZjh8iLmaT0RDlUI6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQDPYCKQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQDPYCKQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-290d4d421f6so20238115ad.2
        for <multikernel@lists.linux.dev>; Sat, 18 Oct 2025 23:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854619; x=1761459419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvmrmv3hPe2oQTJQT8OKmJhhNCe47YQRwxqYt3ifUEE=;
        b=KQDPYCKQo5Xt42CGDW6aLEP0cI2a68YLyGfgL+0CTlJdKJ83pTHIWq35j5fZAhsiNy
         FTgScg1lCEUvq9EB9CNIIgRowmzTH7qrrJNTmz8zvJrha+lejMfiETziCFsK+s4h/D5T
         mbShCE7kqtc5fjwLuhWQ9jpbs7wN09SIyM/9UTjlUNi/PwXxjIE+IisLiS2iySOCUnxt
         WcoZWJC4lYl4Va5lQkyTv9U4e4Gqf+5P/D87/488YNVH1ca/KSeVx+cj1V1iAHPhIA+B
         qGCcqrnsZqxqwTdjEdK6KgjlEYX6+n5qaW9qyn/8VtKIFaJVfWX7yIfRwgxN+3D8MsyF
         kq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854619; x=1761459419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvmrmv3hPe2oQTJQT8OKmJhhNCe47YQRwxqYt3ifUEE=;
        b=IiNuLGf7awcIFuWibfuwvJGWSDXGwLtDZArzYBaNpp588uAPIofcXizpmnjPCCaHvM
         bQmomlmFjZ0O9brOtyVsh0KXLoh7VKnSe7CrUT10ug2y+Ci15tFA7By7Fu5pkK82jkrv
         AzW9AHqCfnh+P57cTA7GDWUbaw7wsbcRbI6OGizb3tKHhYUUQ5bCKxE4XU6K/e1pl9Q9
         p9lRFhspH1Z1JSQpOIolCDXEDgKd/0WNWdnpYnrS1AghJxk+y27c0YkwTPoAAramiiEz
         iGHqnJRfwIwCjgr7cp83PMWDfrmOmDm+YjxzQEU0W0MzeU61MLAwXRJXns7DUAfilP4R
         swIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtlZ1ZiGuoLOFSwGtMeigZYK1O3poAYt11YiGY5G1e/E8TFGZ49SOYZ/IaULIObJBmQLXG2NzoCONFmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv+YlnovX+d2xZikjx2D114lUkfEPaD7blhLw0U0YGdHNKay35
	khUGvSigd0UTEir2EYASnNXkfB+NkpQGSGPxulIvLqQS7Lx0Heor61zw
X-Gm-Gg: ASbGncu5LaxqrhlDWTX6cnVchZwdwIg7ZYK4bRFGVsuQAYCB1kmq8lhhgiRX0J/xEIA
	jYOeSjpO2oEJIl+6kWRUwq9NDIAPi/+ym8hKZspyZBdWAN9DuWWYD10wKi5rE28krR/5FuyoRLO
	es9Na31x0WCAPEPHLPEGqzCFAAgmgE8CXGSK7F8AUeAhLdAGK4mx+U/IS+o9eHyWJRMRBTqsiBh
	CQouzo+I/aZeBjlKNEZwe8kQa8L+Ejk7xFseEN/20S0G5iCMrzY5MtAQ5BM74Kg/cWYKvz/JSNy
	qSGgF6az3wUVOHVi1jwFN6SMCGwFqjOF/Bs9lnlMo4GoV3Gj1eqH2uAEWqx1i7SKjExpV2Y3gbV
	vOekPvlKsaoqu6+HhG89MPbN5+5rHoYUjwmk93x1Tiq53jSyFHU7VS0z7yv5y5pWsAdyvm9g5yq
	EIKS+tun3Xt7Y4HOI=
X-Google-Smtp-Source: AGHT+IGr/O8zk+3lAXEyhTOS21GeRIQ7WsMW/dXKVowLJ0bFIrZpOFcNFSeyeDuMLrkyPKnaIvg3BA==
X-Received: by 2002:a17:903:298c:b0:27e:eabd:4b41 with SMTP id d9443c01a7336-290c9c89eabmr108602405ad.7.1760854618954;
        Sat, 18 Oct 2025 23:16:58 -0700 (PDT)
Received: from pop-os.. ([2601:647:6881:9060:bc87:d8fe:3e55:7ffb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm4332032a12.38.2025.10.18.23.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 23:16:58 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: jiri@resnulli.us,
	stefanha@redhat.com,
	multikernel@lists.linux.dev,
	pasha.tatashin@soleen.com,
	Cong Wang <cwang@multikernel.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org
Subject: [RFC Patch v2 05/16] x86: Introduce arch_cpu_physical_id() to obtain physical CPU ID
Date: Sat, 18 Oct 2025 23:16:19 -0700
Message-Id: <20251019061631.2235405-6-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251019061631.2235405-1-xiyou.wangcong@gmail.com>
References: <20251019061631.2235405-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

The tranditional smp_processor_id() is a software-defined CPU ID which
is only unique within the same kernel. With Multikernel architecture, we
run multiple Linux kernels on different CPU's, hence the host kernel
needs a globally unique CPU ID to manage the CPU's. The physical CPU ID
is perfect for this case.

This API will be used to globally distinguish CPU's among different
multikernels.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 arch/x86/include/asm/smp.h | 6 ++++++
 arch/x86/kernel/smp.c      | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 1a59fd0de759..378be65ceafa 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -40,6 +40,7 @@ struct smp_ops {
 
 	void (*send_call_func_ipi)(const struct cpumask *mask);
 	void (*send_call_func_single_ipi)(int cpu);
+	int (*cpu_physical_id)(int cpu);
 };
 
 /* Globals due to paravirt */
@@ -100,6 +101,11 @@ static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 	smp_ops.send_call_func_ipi(mask);
 }
 
+static inline int arch_cpu_physical_id(int cpu)
+{
+	return smp_ops.cpu_physical_id(cpu);
+}
+
 void cpu_disable_common(void);
 void native_smp_prepare_boot_cpu(void);
 void smp_prepare_cpus_common(void);
diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
index 59658fcd9037..e2eba09da7fc 100644
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -288,6 +288,11 @@ static int __init nonmi_ipi_setup(char *str)
 
 __setup("nonmi_ipi", nonmi_ipi_setup);
 
+static int native_cpu_physical_id(int cpu)
+{
+	return cpu_physical_id(cpu);
+}
+
 struct smp_ops smp_ops = {
 	.smp_prepare_boot_cpu	= native_smp_prepare_boot_cpu,
 	.smp_prepare_cpus	= native_smp_prepare_cpus,
@@ -305,6 +310,7 @@ struct smp_ops smp_ops = {
 
 	.send_call_func_ipi	= native_send_call_func_ipi,
 	.send_call_func_single_ipi = native_send_call_func_single_ipi,
+	.cpu_physical_id	= native_cpu_physical_id,
 };
 EXPORT_SYMBOL_GPL(smp_ops);
 
-- 
2.34.1

