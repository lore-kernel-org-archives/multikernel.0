Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850AA225416
	for <multikernel@lists.linux.dev>; Sun, 19 Oct 2025 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760854617; cv=none; b=JWJvKGmBTKUSlvf67xbcr8chSNzGYm1a4G7SXyAzm6C7qKIECBD5Db5/cUeriUSWg3+lxxY1/K+Lm0BpGo/lazKSq5a7puE2a3qbu3gw4GbumyAHE7AXXnXS8KuIM6DRfBBPZZDWuB13ifuCqvSCiTnYG3nZ2r03dEYoKMwebuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760854617; c=relaxed/simple;
	bh=/fZ+pcXFI/bLxQ2mFY1Xp+wMUpBp0gh4E6urJggyENw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eb1JJsQwGJmwt76NnP1x4q9FOZSp7mY+za/xq7NBu6LgmBwmnBCie6r4D1vJSxWLJxMGY8wjujGi+8qL6BtcJ/TE2YDm4+iOnNbv/9XCvDS3hgHDdm57snbMQaT/7ERtGmzJzYopqj4AP3b/JID1ZWyV+r2O0yyydg3iD8k5thk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHvmu3Yq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHvmu3Yq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-782e93932ffso2877778b3a.3
        for <multikernel@lists.linux.dev>; Sat, 18 Oct 2025 23:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854615; x=1761459415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIeDgxZ048HUq/QptiVsvTSq/SH6NNfnJz16wRbfAOg=;
        b=JHvmu3YqupMF1X/VGlymmzeypV2Dyv4oW6toLYHhwUu5MddTb4tK1vWeFCc4+5GC8G
         DyHgQsymlv/oBZ9hI/e/t2fM5LYazjRuh9qvnqvJ331mpeq7sQV5ZJ2AK3a1WsvBSRZ8
         5NiGeuCcmFBkkKs4L2pu/Kdtr2acwcm0oCr4HDM2eg4VQ28gpmESCaInsNcxAGw5n8ws
         5NYLfUNMbffXIAeJ3w97UHm2jUzu+YwiqO/hQRRphoB9JBdLXMtL+tkP5i4xjdSCYYQK
         Qfb2TJSmQWWheMtjhMtf42PSemtGJMRezuRtu9DvXjfnOZUJFWaXU1KtyP6s0ewOC42h
         4OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854615; x=1761459415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIeDgxZ048HUq/QptiVsvTSq/SH6NNfnJz16wRbfAOg=;
        b=lHDilgnEIb4DjlyEGfetcsP2hKP32ws3ljKyXJYWDDaeV/ZfbxCJDX3lyHK2KsQWFy
         30Cp1zZjQhOCo+A1tSYv08etC2mVGw96CISExtRQzsABg6j6EQ8KIzvXM3sIFid2X204
         m+8PdRlheRARlN5D4pYvvYBIYK9bS1fXb/szhYmEkoe9XvJGJuOBMhCJ2FKzyCmbyFe3
         /tysow0rQdoVBg9ts0sQmayB3VKmEhVoV+HVJRIfFV5DVZbC4XXETNA9Q362BvSjrvyF
         tzLzfYkB5qLK71cOzEMXvPwlOwH4zU0SLqc3eB7NLZrwZAQ8D0ED/hn4hagE59yZt/sL
         jnXA==
X-Forwarded-Encrypted: i=1; AJvYcCVSHCSzLumrOn5ZJtbh/nRidUIMRj+N/2KhDgAmgL3WwQXTQyfWXz3Xor9YrbyA0yzWr9GYVn50CZU24Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUVVumwGMRYsEDG0BRUIVIETlHRO/bKtl+/s4DiehZ0LQdU/J2
	vqcESLsqBGanpjpfq/OdDtBGRD/KbskAclJRpgXTVW6uB97kkVzQOPkQ
X-Gm-Gg: ASbGncusxBjWhZfHyJJQIclYZYi6fXPTIma5BaSgrkSfJrmc4l/z+SBJ9x9gUprVIhO
	dRTp7U7lnS7I4zLAZ02ITTSqdgXUjqK7H/fMhBVE8gT7pNp9nyeYym6sCh88us5TPA3oVCAlljY
	obcVVCXbUlptHklOzSbG4jTT/7jNPD5kOajJfBhFPTECGiDZ69XdXLWVFw6JZeovpmTQ5CNmG3p
	aYrLB8DBy4fYPJbFXI8g9W2gCFS+hAfGHK/LGhiZLpyv21/Cs3uGzQaYRQjbNhCqUI78bzHwLri
	ZwnNpc8q1dr+P59jnWdzrE1+pjTjCBaOIS9e+k70+tGikROBhrpkmNSbEiYuBT7DGJR2Idq4QbP
	+wsZeorHbddZ4wsN6CFQPa+ljnEOgcdJ7m1ObEFSwgt+Q1U+JOoDS+nk7//eJ27EZ++X01ND9Ba
	vHYd8rbsZCer68D4A=
X-Google-Smtp-Source: AGHT+IG0OBW7fmiA2YniV8ymtG2+sPiHKCxBMdY5eWEb2qkoBgohPShQvQn2sQ3XNKwAIyFsb9Df0A==
X-Received: by 2002:a05:6300:4cc:20b0:334:b4ad:154b with SMTP id adf61e73a8af0-334b4ad168fmr5911026637.27.1760854614800;
        Sat, 18 Oct 2025 23:16:54 -0700 (PDT)
Received: from pop-os.. ([2601:647:6881:9060:bc87:d8fe:3e55:7ffb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm4332032a12.38.2025.10.18.23.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 23:16:54 -0700 (PDT)
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
Subject: [RFC Patch v2 03/16] multikernel: Introduce basic multikernel subsystem infrastructure
Date: Sat, 18 Oct 2025 23:16:17 -0700
Message-Id: <20251019061631.2235405-4-xiyou.wangcong@gmail.com>
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

This commit introduces:

* Configuration infrastructure (kernel/multikernel/Kconfig) that adds
  CONFIG_MULTIKERNEL option depending on KEXEC_CORE, it will provide kernfs
  interface for multikernel instance management, device tree based
  resource management, physical memory pool allocation, and kexec integration.

* Core initialization module (kernel/multikernel/core.c) that provides
  basic subsystem initialization using subsys_initcall() to ensure
  multikernel support is initialized after core kernel subsystems.

This foundational commit establishes the basic framework that subsequent
patches will build upon to implement the full multikernel functionality.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 kernel/Kconfig.kexec        |  2 ++
 kernel/Makefile             |  1 +
 kernel/multikernel/Kconfig  | 20 ++++++++++++++++++++
 kernel/multikernel/Makefile |  6 ++++++
 kernel/multikernel/core.c   | 17 +++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 kernel/multikernel/Kconfig
 create mode 100644 kernel/multikernel/Makefile
 create mode 100644 kernel/multikernel/core.c

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 422270d64820..e0fbd7e9af43 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -194,4 +194,6 @@ config CRASH_MAX_MEMORY_RANGES
 	  the computation behind the value provided through the
 	  /sys/kernel/crash_elfcorehdr_size attribute.
 
+source "kernel/multikernel/Kconfig"
+
 endmenu
diff --git a/kernel/Makefile b/kernel/Makefile
index df3dd8291bb6..017ed567f86a 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -56,6 +56,7 @@ obj-y += dma/
 obj-y += entry/
 obj-y += unwind/
 obj-$(CONFIG_MODULES) += module/
+obj-$(CONFIG_MULTIKERNEL) += multikernel/
 
 obj-$(CONFIG_KCMP) += kcmp.o
 obj-$(CONFIG_FREEZER) += freezer.o
diff --git a/kernel/multikernel/Kconfig b/kernel/multikernel/Kconfig
new file mode 100644
index 000000000000..0e61fd2e505a
--- /dev/null
+++ b/kernel/multikernel/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Multikernel configuration
+#
+
+config MULTIKERNEL
+	bool "Multikernel support"
+	depends on KEXEC_CORE
+	help
+	  Enable multikernel support, which allows running multiple kernel
+	  instances simultaneously with resource isolation and inter-kernel
+	  communication capabilities.
+
+	  This feature provides:
+	  - Sysfs interface for multikernel instance management
+	  - Device tree based resource specification
+	  - Memory pool management for kernel instances
+	  - Integration with kexec for kernel loading
+
+	  If unsure, say N.
diff --git a/kernel/multikernel/Makefile b/kernel/multikernel/Makefile
new file mode 100644
index 000000000000..950bace927a0
--- /dev/null
+++ b/kernel/multikernel/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for multikernel support
+#
+
+obj-y += core.o
diff --git a/kernel/multikernel/core.c b/kernel/multikernel/core.c
new file mode 100644
index 000000000000..218424d59cc3
--- /dev/null
+++ b/kernel/multikernel/core.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Multikernel Technologies, Inc. All rights reserved
+ */
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/multikernel.h>
+
+static int __init multikernel_init(void)
+{
+	pr_info("Multikernel support initialized\n");
+	return 0;
+}
+
+/* Initialize multikernel after core kernel subsystems are ready */
+subsys_initcall(multikernel_init);
-- 
2.34.1

