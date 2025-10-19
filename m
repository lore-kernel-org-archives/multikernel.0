Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A3323B615
	for <multikernel@lists.linux.dev>; Sun, 19 Oct 2025 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760854638; cv=none; b=Iz57CGQIGIu3cJIH10Je8hNuW+o1/hPOK5Sy4+WJostjUwHQOB14qGPulVaT008naXzxzh1j/wNt3QWkSxjpQHthzMVgXLAGz5kfhyZhAmyUzGVlgQeHfmov1Hjq2eGWPbyn5T5IlKIlmNdLU7tw7qD18/+R0rUGbPU9jKxKYKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760854638; c=relaxed/simple;
	bh=zrBAJvFiT+CeBdAVAetTAzQV89CoIe6iukqirjunEs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BkiZ13IppUoNGcn3CxpwqzwBovVyfEgDxWAj8uC7ijj38QHo6vIEzspVU+5VbY2Egf9AtTssPXW3MGnjof7yoHH0ed7Blfo3WcRfezsgF2NCFrlriWbKFguZ9EeLGNZ0Pvb6HthV3n3ntLAhpgO0D4gxG2R6w2s942zQdlxHEmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUaoa+2o; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUaoa+2o"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-789fb76b466so2839479b3a.0
        for <multikernel@lists.linux.dev>; Sat, 18 Oct 2025 23:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854635; x=1761459435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIzBYAq5cauMEng/8nrVC1spI8sxNqVcm1FTDbL64Gs=;
        b=RUaoa+2orZHjg2sYwk2yIivcKFXzAdIjtSVT0y5UUwN6RSjNuVFl3gnzDPT+DRQLJW
         nTKn2HS+3l7TTZHpQWM9IxqgqgGFetcR21Vbsvwqp6YQZ4pGSPYHWHEj0tQ6ENfB4g1b
         dkRpH1F48aNxse9Hb7YrFFzZIhRrpbVaWTgoKqeiPPGVrQXgq+4fTIMZAvOVcmjRFBMo
         zAdBheK38d1Ojzvz1m26vYZ/DbZq/csC0tp/m55ZjEDcwviu62mlDd1T8YG5xKch+S8g
         jhBkdPZeWJPpX1a8rxZ+GBWa/OmJqPQazaiU/gcIA8R2LZMjSW6Y+9ZNZKwsEq+03mAH
         ZcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854635; x=1761459435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIzBYAq5cauMEng/8nrVC1spI8sxNqVcm1FTDbL64Gs=;
        b=SoF/isrsWYhBfGmMpYBJka5MAo6hnNjuZKXe1mXqOUxs/1rTcd3Q+sOQFcgSegbAlC
         7s85aZ8v3YBBV72YTPkNa1eUlxbR6spe9ChO2ULS70ktPEsOcmd/ta7kyF98IcePwdkt
         pNnNGPwoabhbNf5HoDAcBW4djgPvNUeoNemqcCP6EQhFovRAqvcHbBT6Xe6K5DJn9T+g
         dHYvr8yzUls24gHPTaxSJ1s9Ervcq3/kIwiCOTWOCNo93lIO7SElnnlzP202o24kJKeE
         UnqiAyoD9u0mGfGQNVWpbEGhrOuyR6/x1jbAbNR6d4GLM1DhoAGi3neKV1z4fbx+YXQl
         P3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEzn9UWLAoThfdfrNJcMTnsf0luLDba2/eg3SlDM7VcVF3prqe+AxkyeRd0Wg7DWoK6+OO3E6SzFgJ8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmXgatrVgo5xXQYrjbdBLor4fAI9HLh43afoqmHH3AX8ViKE0u
	LFIScyuIQZmvpqo+C8GWQ6DEBDzsxpXj56q59aPk+N3+tBmX8+LhmJ4l
X-Gm-Gg: ASbGnctwvCj9UmZ/Af1oMt89IJW4Smp6cVM4dKs3vFHLL8UUDbcxG+crWVLJqSizMXK
	KqcteywOqY/z7bFbno+WbbRTp/MqHoQC1TUEScRUNWbeacRx/nGuLaEXZYdHhMhdz+CUDG9rTgM
	kbxHWfWBIiWPyHbQqOmI6YC6f7KZoxUSbwYSVr+eUlUFqRzr7mgLMlboCs65komqoVaqfNCm1hS
	PP4iDKEYqhdKeF8CWgP475+FOSthIDq7ewR8w2Au4WdSzy3FIDVlWGSpMusxiIE0SQEs9RlGd8i
	YEBaQrkPgvEnN4ID9ZW9k1dV/bbmehUygzabjcAWBp1b07t+SHackmXyHCtG5bg37XFPILjm21S
	F/WcxCotV6rwjzUNODXFFLXKO4jQtG8DwJDDhGJNvVQ2i6y6F8MjjZ0L/7qm+lP43sP/AeUG83a
	5vjsVP
X-Google-Smtp-Source: AGHT+IHfF4hU8/QtsMDLLQvEjqsCa8w0BBb+2CNnqIZAGSLrLtnMeBv6KtywAED8Fp+17ZtBPczCAA==
X-Received: by 2002:a05:6a20:7355:b0:32d:b925:4a8 with SMTP id adf61e73a8af0-334a851519cmr11699864637.3.1760854635123;
        Sat, 18 Oct 2025 23:17:15 -0700 (PDT)
Received: from pop-os.. ([2601:647:6881:9060:bc87:d8fe:3e55:7ffb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm4332032a12.38.2025.10.18.23.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 23:17:14 -0700 (PDT)
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
Subject: [RFC Patch v2 12/16] multikernel: Introduce per-instance memory allocation interface
Date: Sat, 18 Oct 2025 23:16:26 -0700
Message-Id: <20251019061631.2235405-13-xiyou.wangcong@gmail.com>
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

Add virtual memory allocation interface for multikernel instances,
providing convenient high-level functions for memory management within
instance-specific memory pools with automatic virtual address mapping.

This commit introduces:

* Instance-based memory allocation functions (mk_instance_alloc() and
  mk_instance_free()) that provide virtual memory allocation from
  instance-specific memory pools with configurable alignment support
  and automatic physical-to-virtual address mapping using memremap().

* Kimage-based memory allocation wrappers (mk_kimage_alloc() and
  mk_kimage_free()) that provide convenient access to instance memory
  pools through kimage structures, commonly used in kexec code paths
  for multikernel operations.

* Automatic memory mapping infrastructure that uses memremap() with
  MEMREMAP_WB caching policy to provide write-back cached virtual
  addresses for allocated physical memory from instance pools.

* Proper error handling and cleanup with automatic rollback of
  physical allocations when virtual mapping fails, preventing memory
  leaks in error conditions.

The allocation functions complement the existing physical memory pool
management by providing a higher-level interface suitable for kernel
code that requires virtual addresses, such as buffer management, data
structure allocation, and inter-kernel communication buffers.

This interface enables multikernel subsystems to allocate kernel images,
initramfs etc., maintaining proper resource isolation between multikernel
instances.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 include/linux/multikernel.h |  6 +++
 kernel/multikernel/core.c   | 98 +++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/include/linux/multikernel.h b/include/linux/multikernel.h
index c65d39a66b84..79611923649e 100644
--- a/include/linux/multikernel.h
+++ b/include/linux/multikernel.h
@@ -280,6 +280,12 @@ int mk_instance_reserve_resources(struct mk_instance *instance,
  */
 void mk_instance_free_memory(struct mk_instance *instance);
 
+void *mk_instance_alloc(struct mk_instance *instance, size_t size, size_t align);
+void mk_instance_free(struct mk_instance *instance, void *virt_addr, size_t size);
+
+void *mk_kimage_alloc(struct kimage *image, size_t size, size_t align);
+void mk_kimage_free(struct kimage *image, void *virt_addr, size_t size);
+
 /**
  * String conversion helpers
  */
diff --git a/kernel/multikernel/core.c b/kernel/multikernel/core.c
index 52bf8e38206a..ee7a21327ea5 100644
--- a/kernel/multikernel/core.c
+++ b/kernel/multikernel/core.c
@@ -7,7 +7,10 @@
 #include <linux/init.h>
 #include <linux/cpumask.h>
 #include <linux/cpu.h>
+#include <linux/io.h>
+#include <linux/kexec.h>
 #include <linux/multikernel.h>
+#include <asm/page.h>
 #include "internal.h"
 
 /**
@@ -403,6 +406,101 @@ int mk_instance_reserve_resources(struct mk_instance *instance,
 	return 0;
 }
 
+/**
+ * Per-instance memory pool management
+ */
+
+/**
+ * mk_instance_alloc() - Allocate memory from instance pool
+ * @instance: Instance to allocate from
+ * @size: Size to allocate
+ * @align: Alignment requirement (must be power of 2)
+ *
+ * Returns virtual address of allocated memory, or NULL on failure.
+ */
+void *mk_instance_alloc(struct mk_instance *instance, size_t size, size_t align)
+{
+	phys_addr_t phys_addr;
+	void *virt_addr;
+
+	if (!instance || !instance->instance_pool) {
+		pr_debug("mk_instance_alloc: instance %p has no pool\n", instance);
+		return NULL;
+	}
+
+	/* Allocate from instance pool with alignment */
+	phys_addr = multikernel_instance_alloc(instance->instance_pool, size, align);
+	if (!phys_addr) {
+		pr_debug("Failed to allocate %zu bytes from instance pool (align=0x%zx)\n", size, align);
+		return NULL;
+	}
+
+	/* Map to virtual address space */
+	virt_addr = memremap(phys_addr, size, MEMREMAP_WB);
+	if (!virt_addr) {
+		pr_err("Failed to map instance memory at 0x%llx\n", (unsigned long long)phys_addr);
+		multikernel_instance_free(instance->instance_pool, phys_addr, size);
+		return NULL;
+	}
+
+	return virt_addr;
+}
+
+/**
+ * mk_instance_free() - Free memory back to instance pool
+ * @instance: Instance to free to
+ * @virt_addr: Virtual address to free
+ * @size: Size to free
+ */
+void mk_instance_free(struct mk_instance *instance, void *virt_addr, size_t size)
+{
+	phys_addr_t phys_addr;
+
+	if (!instance || !instance->instance_pool || !virt_addr)
+		return;
+
+	phys_addr = virt_to_phys(virt_addr);
+	memunmap(virt_addr);
+	multikernel_instance_free(instance->instance_pool, phys_addr, size);
+}
+
+/**
+ * Kimage-based memory pool access functions
+ *
+ * These provide convenient wrappers for accessing instance memory pools
+ * through the kimage structure, commonly used in kexec code paths.
+ */
+
+/**
+ * mk_kimage_alloc() - Allocate memory from kimage's instance pool
+ * @image: kimage with associated mk_instance
+ * @size: Size to allocate
+ * @align: Alignment requirement (must be power of 2)
+ *
+ * Returns virtual address of allocated memory, or NULL on failure.
+ */
+void *mk_kimage_alloc(struct kimage *image, size_t size, size_t align)
+{
+	if (!image || !image->mk_instance)
+		return NULL;
+
+	return mk_instance_alloc(image->mk_instance, size, align);
+}
+
+/**
+ * mk_kimage_free() - Free memory back to kimage's instance pool
+ * @image: kimage with associated mk_instance
+ * @virt_addr: Virtual address to free
+ * @size: Size to free
+ */
+void mk_kimage_free(struct kimage *image, void *virt_addr, size_t size)
+{
+	if (!image || !image->mk_instance)
+		return;
+
+	mk_instance_free(image->mk_instance, virt_addr, size);
+}
+
 static int __init multikernel_init(void)
 {
 	int ret;
-- 
2.34.1

