Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85751226541
	for <multikernel@lists.linux.dev>; Sun, 19 Oct 2025 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760854619; cv=none; b=stLh7GN7piSJs1MuSKYK98wJAQTF4hHyQEfsbrfNBZnbMZ+jdxCjHWuMVAeZwRJuAIybzyTJCwg/OkIfs/yKBR0lR3uV9CGcrZ3zd/wfB14oV5MzUYs7Birj6gteqRzpBYFANI8hiQN+fp/DpIWg65YzB/tkVHeznKOl11vkFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760854619; c=relaxed/simple;
	bh=lhrblwAj2S8u50W6se7xH46F0vsfn85WIorx/b5ZeLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b6x6bt6CnpOmWLJ5ydJsJotbkeWCt1FY27nJbRYIPv7JS8YexHCzCgSqFGbbJNQiSLZR/kTQ0gsv0jFvv4U6YaqM5+5GYSser0ryYZ76zK5tvfK95gBJa/qQ91Rs1voP5FX8PzrWQxm/anzjKSQfrVWkLNZJBKUbE2E8/UEur+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azk4+fil; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azk4+fil"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so41311865ad.0
        for <multikernel@lists.linux.dev>; Sat, 18 Oct 2025 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854617; x=1761459417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex4M6nG0U6c9sFi4kmswWQOXivj8cIJW5ADLbJTHFZo=;
        b=azk4+filmUL0xjJZtwl3pO0M5Blmb1IdarJvhlOjegC2HMHcsVz9n+m3tMyJAjgJNl
         U6y54eFv5iAcI0xM26s6+WJnL1MCU3S2thEBQalN+ILUKGM0qcgliMIgnXepQ1MXPlW5
         Ax6VvBpBBBbMYmpp5HODn4xINoO0o8px0FGJiTG/xd6+ZE6JP+iyDMhRcwb9a/YeINxD
         I0uvzXQo1ufPsgeWtPT9KYbMlD6VYSCXBZpPNMNoe/iXIDkngb8TWWDqMgOLi76ys9ge
         2yIF9uBfejnYNhuoYihbdzKmejgk2U9xOJCUnsj5aM1KXddzLwDvyd6LYKIn5M3xrM3F
         bZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854617; x=1761459417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex4M6nG0U6c9sFi4kmswWQOXivj8cIJW5ADLbJTHFZo=;
        b=RXEqbbStcsz5ANClBEJk6jpYBPBAWAIHeelby+nCf59REwkJvs9NVuLASsdl6jmWsr
         zZMt3sCg9yNqiPxXeOJdPKY2j5mVEaPxsclgqKHqa9mMZTvUDfB60tZeEes9ecmYdX12
         fScOLFoiDVlWAXzkrzQPc2hNbQQf8forVh2449G3Nb5IMKtA5YDzCVAAJZR1JrES+HWu
         YC1tx3y23Z476Tye+U1GgbiY/fSVJA0/Sfv4EKx74PJkvdhuF0eOUIVXhCGyJGtfOFHw
         0LuHIQVYi1Msad5x6CoOgQTCYXtBCAcJ4RbqH/knpoXYURMlHqigZtZu0YWGojbNqCl7
         bORw==
X-Forwarded-Encrypted: i=1; AJvYcCWkbda4EqJkQYpo3UnlK2mAh8uCd0BASgmmgewi0co4DY/+2eKdk0clBKNM8PqguZbm1JCmY6VJwnY1MA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4UYV0duwS5JLpNWfScTYhZMy4fXGmTVqweF5QIH4QmKlAyKuN
	6RfuVnoe2CA1A5VSi5ycvrNHvXz5f9cB3pIH2b0kVG1dLfTeqCvDyL1W
X-Gm-Gg: ASbGncvKx/ZkKH3I+19ArQUprJ1z/Nsp+iQ5RxPeU95wq5AtStM+Iy/Qn0Y8q0bmXg5
	GIQdYhhKLixUwwEZ6s79ibrgiSKIN5gsq7YRBHVzTCtYh087y89osk4hYlhG9D4AvEMCsfdR3R9
	2UbO7APASAQ1MVdVtdbCw0abi289u1I+Hc+5+nqQBzGb2+Z6vbskmOcKWtKXhknC9oiNKAflDDl
	NEMN56lERnocG3bt9AEl+ldZxARvEXdgsbjDML7VbFmj0t/FWVSshchNSZbQS4oPpGfCOUyRIT4
	BaCytPml8srYBgnKrLx7s9mKYMDctCWNibtI2ZmrHpC/rPZo0fGwE4epeQy6gc3LS6RJ+/GgUvI
	5XBCpcX4UKAr9+Dgk3OVZTDRUTExU8KPWdNQ2AxWINeAeVXbgVVkep3sn7HBM8SF+g57dNfbgKq
	Xp2w+e
X-Google-Smtp-Source: AGHT+IEdPOvrEIcU1/OzXiLpdHh1uco8zhVpvekF8s3i7IZl2imw6bwzc3Kl4EuPcI0uzTvVtI4atA==
X-Received: by 2002:a17:902:d508:b0:28a:2e51:9272 with SMTP id d9443c01a7336-290cbc3f200mr124673875ad.48.1760854616812;
        Sat, 18 Oct 2025 23:16:56 -0700 (PDT)
Received: from pop-os.. ([2601:647:6881:9060:bc87:d8fe:3e55:7ffb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm4332032a12.38.2025.10.18.23.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 23:16:56 -0700 (PDT)
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
Subject: [RFC Patch v2 04/16] x86: Introduce MULTIKERNEL_VECTOR for inter-kernel communication
Date: Sat, 18 Oct 2025 23:16:18 -0700
Message-Id: <20251019061631.2235405-5-xiyou.wangcong@gmail.com>
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

This patch adds a dedicated IPI vector (0xea) for multikernel
communication, enabling different kernel instances running on
separate CPUs to send interrupts to each other.

The implementation includes:

- MULTIKERNEL_VECTOR definition at interrupt vector 0xea
- IDT entry declaration and registration for sysvec_multikernel
- Interrupt handler sysvec_multikernel() with proper APIC EOI
  and IRQ statistics tracking
- Placeholder generic_multikernel_interrupt() function for
  extensible multikernel interrupt handling

This vector provides the foundational interrupt mechanism required
for implementing inter-kernel communication protocols in multikernel
environments, where heterogeneous kernel instances coordinate while
maintaining CPU-level isolation.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 arch/x86/include/asm/idtentry.h    | 3 +++
 arch/x86/include/asm/irq_vectors.h | 1 +
 arch/x86/kernel/idt.c              | 3 +++
 arch/x86/kernel/smp.c              | 8 ++++++++
 4 files changed, 15 insertions(+)

diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
index abd637e54e94..d2c3f1ca481a 100644
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -703,6 +703,9 @@ DECLARE_IDTENTRY(RESCHEDULE_VECTOR,			sysvec_reschedule_ipi);
 DECLARE_IDTENTRY_SYSVEC(REBOOT_VECTOR,			sysvec_reboot);
 DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_SINGLE_VECTOR,	sysvec_call_function_single);
 DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_VECTOR,		sysvec_call_function);
+# ifdef CONFIG_MULTIKERNEL
+DECLARE_IDTENTRY_SYSVEC(MULTIKERNEL_VECTOR,			sysvec_multikernel);
+# endif
 #else
 # define fred_sysvec_reschedule_ipi			NULL
 # define fred_sysvec_reboot				NULL
diff --git a/arch/x86/include/asm/irq_vectors.h b/arch/x86/include/asm/irq_vectors.h
index 47051871b436..478e2e2d188a 100644
--- a/arch/x86/include/asm/irq_vectors.h
+++ b/arch/x86/include/asm/irq_vectors.h
@@ -102,6 +102,7 @@
  * the host kernel.
  */
 #define POSTED_MSI_NOTIFICATION_VECTOR	0xeb
+#define MULTIKERNEL_VECTOR		0xea
 
 #define NR_VECTORS			 256
 
diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index f445bec516a0..5e6d03bb18b5 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -135,6 +135,9 @@ static const __initconst struct idt_data apic_idts[] = {
 	INTG(RESCHEDULE_VECTOR,			asm_sysvec_reschedule_ipi),
 	INTG(CALL_FUNCTION_VECTOR,		asm_sysvec_call_function),
 	INTG(CALL_FUNCTION_SINGLE_VECTOR,	asm_sysvec_call_function_single),
+#ifdef CONFIG_MULTIKERNEL
+	INTG(MULTIKERNEL_VECTOR,		asm_sysvec_multikernel),
+#endif
 	INTG(REBOOT_VECTOR,			asm_sysvec_reboot),
 #endif
 
diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
index b014e6d229f9..59658fcd9037 100644
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -272,6 +272,14 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_call_function_single)
 	trace_call_function_single_exit(CALL_FUNCTION_SINGLE_VECTOR);
 }
 
+#ifdef CONFIG_MULTIKERNEL
+DEFINE_IDTENTRY_SYSVEC(sysvec_multikernel)
+{
+	apic_eoi();
+	inc_irq_stat(irq_call_count);
+}
+#endif /* CONFIG_MULTIKERNEL */
+
 static int __init nonmi_ipi_setup(char *str)
 {
 	smp_no_nmi_ipi = true;
-- 
2.34.1

