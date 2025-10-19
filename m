Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E86239E76
	for <multikernel@lists.linux.dev>; Sun, 19 Oct 2025 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760854635; cv=none; b=EAYif+nsO4MzoT66sB6I69AyD8MUHq3FZHiS5Ptfmo3ZWWxU6I7HFSIQ/VwwSF1c4GZUIY6K/GCWEmZ902MzkMBSKlhDAr5/dtEV5lgTjMaLzdNpqE4+IvAudVcWOzZv0yC4R1Z3PyMVD4BUEXMaCxpZQUN4X075vvnzaQBd9nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760854635; c=relaxed/simple;
	bh=AcYeXfCYBxN5PnHX4zoqm4aCf4KaAZkCLga1VweQ4FU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oZKVy0vp7qNjFXbK81GosxhXTuTqF9guutiFX6o3LzipFsW5vRJjr4XcOjm/3mBZLv1FwrL3rsPic2qKE2c0LlSpZGZ5U2rXOTiISuDToLkzolUhqIVGpZTdgPi36ag6nC1f2uHDWv+vo/sxKbKCTWtuqp5/kMRQbalLIr0A8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7OXvAyj; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7OXvAyj"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso2060744a91.0
        for <multikernel@lists.linux.dev>; Sat, 18 Oct 2025 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854633; x=1761459433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa/MsfNPB6bG2GsTxSNKTLsrafwlRF2VsAPzt2eBf8E=;
        b=Q7OXvAyjiyH8QXJ3+pSgYQMjRDmr474Pyf0hTOgwYSDXJeW9/Nx501MBVNS2T9klKI
         bv/V5TpmNG3kkCcEAtOhoNE9vz9DwoMN8FYP6KRovWhJNtUOd0DhC5hkwMI34g6Wczvc
         +TTpc2IjO5tvTKyOLQXdrcrVMN0k/hP54cqe456yglV2W551t2JyLMISg7n9ajhtotEt
         cZrhUkeTMKFVc3KBegpyhpOmnekylwXf7tZV7g9rG5ffYxkgL9hcmtIoHmyGwEt+BtMt
         ByJbMzr2RVVDnqKqjE9g2UgQhYoTPN4dwdk7WJInoXCnW1n4IB8ZKOTPRF2kECNcDrsE
         D/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854633; x=1761459433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa/MsfNPB6bG2GsTxSNKTLsrafwlRF2VsAPzt2eBf8E=;
        b=V4RzT/r6IBeMLeruuTPckrsRG5dyoqTTUQQUXoFP6elcdNtfJEOudPWkkKhGxHAWnK
         15ke9bEjpYWNDUg8ETjag/o8iPDjUYsEO6RpflE0gNTBsFxC74upRtadz9gjHNSsPGtV
         PfcaME+PJ3Hw4+ZYmUKNPTSiEyRoUDmy+s30gTt3rQUELjFU3n9+Jpsr22ekvyJa86DX
         z7TxnAOFcQRARPDwT+FldQrtoXoqntpxqkTHRiplAvLVDrcTOPBtXvyWZz1XzVQmeIiu
         f7GVkgE+1wEY/irhmkxOGJUNu6ltBsbiJM21x7C9Mr8TlaXPBXzg7SNom3k4uSHrZ/ck
         z7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCW554H8htq1hPXeQKCoy3OuzWWHnrM1uMto1CT9jSJTeivvjV8SOF149lK8wQMCpA7mrly8IQmH7kMoIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGzaLcTyI5vsZaqMnrOuLcmc4R3yYfSv+IlPJCfhZ0t7uYpTve
	MsgnL7U7oyssNHaztUX3GFUAPfWrTT+FZ3/L/KxbPO6CuizSOjt6ByC7
X-Gm-Gg: ASbGnctazKGVaCp89lOnVMFZS/344PWWmy0RGsj8T8ChXNtD6Vfy5m5938p86hHj0mq
	IlgZ5QFjy+MbnPxyLNSDxiUuYNRVpDKWFD22fldDycH9ZH8oHp95Eg4fokvZ82bTPgvArq0c6tO
	zGmAcFdkfndgvg1ug6gDt9Y+irUMCjpPiMNwmPFr+aDEioe/8HHJUGMmLjG9mGAXMWFgpR09yGt
	4HSUOSC/Y1mZvuNqBvnZnOMM7Do3+JVPuX9wHfqHCf8Jdv3ZGS7htoSOcwlsc3mz0OSHM2Suuz0
	ppUNunvIR2FKnc6Y/JcYWzpmVFgtDFeC/aNT6oWkHbwtURFhKClznqMB8ooHUnaWoVqk1/hMz2C
	xVJiMlQlucW+sksgCce2/Z9wt84pERHaqgDUah8HUGLWXWBk6mNp+yxwRn0/9QGaljo4gDzjdtP
	vwnlKBk/Qgz04WVbs=
X-Google-Smtp-Source: AGHT+IEcU9YEdbUoIaZ58UmrsaoQiSd0FUGy1FLPQQWXoQbBycgCM+6raP4xZnOBinCzMBaBjeximQ==
X-Received: by 2002:a17:90b:2ec7:b0:33b:6650:57c3 with SMTP id 98e67ed59e1d1-33bcf8ec60dmr11689870a91.21.1760854632902;
        Sat, 18 Oct 2025 23:17:12 -0700 (PDT)
Received: from pop-os.. ([2601:647:6881:9060:bc87:d8fe:3e55:7ffb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm4332032a12.38.2025.10.18.23.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 23:17:12 -0700 (PDT)
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
Subject: [RFC Patch v2 11/16] kexec: Add /proc/kimage interface for kimage tracking
Date: Sat, 18 Oct 2025 23:16:25 -0700
Message-Id: <20251019061631.2235405-12-xiyou.wangcong@gmail.com>
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

Add a dedicated /proc/kimage file to provide read-only access to
all loaded kernel images in the system, for both regular kexec kernel
images and multikernel images.

The interface displays kernel images in a tabular format showing:
- Type: kexec type (default, crash, multikernel)
- Start Address: entry point in hexadecimal format
- Segments: number of memory segments

This interface is particularly useful for inspecting kimages, debugging
kexec, and verifying that kernel images are loaded correctly.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 kernel/kexec_core.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index ed5c97b4531e..7db755e64dd6 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/kexec.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/highmem.h>
@@ -1214,6 +1216,52 @@ struct kimage *kexec_image;
 struct kimage *kexec_crash_image;
 static int kexec_load_disabled;
 
+/*
+ * Proc interface for /proc/kimage
+ */
+static int kimage_proc_show(struct seq_file *m, void *v)
+{
+	struct kimage *image;
+	const char *type_names[] = {
+		[KEXEC_TYPE_DEFAULT] = "default",
+		[KEXEC_TYPE_CRASH] = "crash",
+		[KEXEC_TYPE_MULTIKERNEL] = "multikernel"
+	};
+
+	seq_printf(m, "MK_ID  Type        Start Address   Segments\n");
+	seq_printf(m, "-----  ----------  --------------  --------\n");
+
+	kimage_list_lock();
+	if (list_empty(&kexec_image_list)) {
+		seq_printf(m, "No kimages loaded\n");
+	} else {
+		list_for_each_entry(image, &kexec_image_list, list) {
+			const char *type_name = "unknown";
+
+			if (image->type < ARRAY_SIZE(type_names) && type_names[image->type])
+				type_name = type_names[image->type];
+
+			seq_printf(m, "%5d  %-10s  0x%012lx  %8lu\n",
+				   image->mk_id, type_name, image->start, image->nr_segments);
+		}
+	}
+	kimage_list_unlock();
+
+	return 0;
+}
+
+static int kimage_proc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, kimage_proc_show, NULL);
+}
+
+static const struct proc_ops kimage_proc_ops = {
+	.proc_open	= kimage_proc_open,
+	.proc_read	= seq_read,
+	.proc_lseek	= seq_lseek,
+	.proc_release	= single_release,
+};
+
 #ifdef CONFIG_SYSCTL
 static int kexec_limit_handler(const struct ctl_table *table, int write,
 			       void *buffer, size_t *lenp, loff_t *ppos)
@@ -1285,6 +1333,21 @@ static int __init kexec_core_sysctl_init(void)
 late_initcall(kexec_core_sysctl_init);
 #endif
 
+static int __init kimage_proc_init(void)
+{
+	struct proc_dir_entry *entry;
+
+	entry = proc_create("kimage", 0444, NULL, &kimage_proc_ops);
+	if (!entry) {
+		pr_err("Failed to create /proc/kimage\n");
+		return -ENOMEM;
+	}
+
+	pr_debug("Created /proc/kimage interface\n");
+	return 0;
+}
+late_initcall(kimage_proc_init);
+
 bool kexec_load_permitted(int kexec_image_type)
 {
 	struct kexec_load_limit *limit;
-- 
2.34.1

