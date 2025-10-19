Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A1238C3A
	for <multikernel@lists.linux.dev>; Sun, 19 Oct 2025 06:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760854633; cv=none; b=Ky/g4D08UG23Y9Oj0v9G2VuNa1Twau+oydwLULwKKrtadtVWTywmECDlVwc1yKbgJ04oZeTvmqY+jxm+fut08UAJZqWCq5QlZyfmihMI6nGOTaxO3bTPM6g+qyyx2omhV2i61sJ8q+OLNI0a82A8QUcKuAYFVpOTwgnvNBc2GK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760854633; c=relaxed/simple;
	bh=qNpNVdVh5zeFXC+4CWsJxEPp98nIBvSuUO8EukRJmAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQ1m2cNi2LZx5E58YpDkVZ3VD1Lryp5ffaCq5vRVUn01rpMSWHksrWv23Q2xMmteWgi0HwnU+Vr0g2mNCy9NZFcU5J3RgcVyv8nhol5h6Yaj6FjDEv14e6Avol2tVAnoaAr2K2xCJA23k4osrrlGR21rtIL2jhYn1/tFUp00vMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJS4W5Zs; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJS4W5Zs"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782bfd0a977so2466237b3a.3
        for <multikernel@lists.linux.dev>; Sat, 18 Oct 2025 23:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854630; x=1761459430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dhzEiy+8NWdg0h4CeSLeODHjNB3Z/i+xinCfvk2bH8=;
        b=bJS4W5ZsjDwBg1UYNDk7VICL+N5s3FHOAcuDrRIE2TDSxuY6I87aghO706pOAtqSLR
         3YuioB4FFk6Oigo1M+SN4ilUxaNcrcKpclydp/dc6EbWYDcOzQ+bsz49WDNltVN0DHny
         E7+LV13Zjetg1z2hmK9mFFG3kr2ljxWh0EePp5KyeyPEFsTG6n6wAad+YqHXxoIvI1UT
         cigPgcmzB9Q8BMi1uj2DHh5v3ElvCxXN1C0kpbwAvz3cufPxQ9YS4uVed7vsO0PP6kOj
         BtA9pD9dGjkgw1FYpqhfKUaDScqiWf6L12SV6r0g7ShSWcC0TDFq8yaD9rPNuFkLBZoG
         85Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854630; x=1761459430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dhzEiy+8NWdg0h4CeSLeODHjNB3Z/i+xinCfvk2bH8=;
        b=SY6+mI9dl17Y4FgYCWsGEj+zZhg6OHdhzlDyKLovnIaf536zcXqyPLa3j4vyMq8+A1
         HXebEzZ4T0f9pjGfIG72vsO2PCmY89BeuL1HrzDgNvFCsAZDseZEfnF/hLsDzuBxCb2Q
         ARb1BvrCVL076M4N5HHW3tZJcrDpFf2v7VLOzgVmKRSJonRqDG3fVeKk/tqkeKJwzP3f
         PX2oaEDpdAjFr23Kv1eXQrBo3eBe8JfQlWlz+GKULl6zRawdsObmaTFVzRlA4NpiFTY/
         GqxCNot6pq55VNEkawGWnwkSp23w8wcJ4SU++lG2uPpSoeKRCnMHcIxGwEXs43jpBkU0
         e/mg==
X-Forwarded-Encrypted: i=1; AJvYcCU9B98AFyoBeh8tNORk3SILotqdrgPGPHtbIzpCw8tnmgx/f3W+QDPL2sb/H0dPbt1+v5aqgDci7eXmjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWAcvqR+9jeGWWYMSMVolQPBBgCGZzCt84Uv+DfffoKIdR1sF5
	ZO/LqckgtOgx3dIl4HS4qcXuNRc/Aq4K36FF/NZqNQxYEovh2NwMU/HQ
X-Gm-Gg: ASbGncuCvjLTOhX8fczQF+YsJ7yrCECmsbdldaw0rCnPNphilytLtDJyduzKTeFRYxP
	0LoNIzM8Nnsq3X9+7JiB53PSZazNlY1tCsCKwg6So5Lr18WODFHLc3Q9Geufe+q6JGNOGHd69+I
	ovF/C7yLO+GTb6I8bHFStH1xwgUf4CQll3ftsYjX4yXEPxBLcrE1NIGSboXL9T1UldCAm8vUi/j
	1Vr0kWnqNe7/YfgsHsUrnT+1MFeykbgjiO+60M8Q1f2n+1J4UOeFJ0DDyu7CaRZIigEjL1iq2UN
	kyaofeF1YOdK+nGc/tw9zj9cTpqcddntB1wqVBZxEbCOZKdh4u0BJoVVeBcRuqV6kOOo1PjRejO
	pqF7W0TbAdcWZN1SiV0J13IKtlQmpx8OLZtYgPcqW6k7nlt++NqadUeQSLPYduhDrTPFqEF2Par
	MRzPSJpZPGY2RUUl8=
X-Google-Smtp-Source: AGHT+IHsfMse1ea3nbYNy4BvjdFagVFMuvl17zEl9LnMyhbIq3nsVQdQyV1KljR01j/1hJqe5RDh3A==
X-Received: by 2002:a17:90b:1e07:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-33bcf85abb4mr10954646a91.2.1760854630353;
        Sat, 18 Oct 2025 23:17:10 -0700 (PDT)
Received: from pop-os.. ([2601:647:6881:9060:bc87:d8fe:3e55:7ffb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm4332032a12.38.2025.10.18.23.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 23:17:09 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: jiri@resnulli.us,
	stefanha@redhat.com,
	multikernel@lists.linux.dev,
	pasha.tatashin@soleen.com,
	Cong Wang <cwang@multiernel.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org
Subject: [RFC Patch v2 10/16] Documentation: Add multikernel usage
Date: Sat, 18 Oct 2025 23:16:24 -0700
Message-Id: <20251019061631.2235405-11-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251019061631.2235405-1-xiyou.wangcong@gmail.com>
References: <20251019061631.2235405-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: multikernel@lists.linux.dev
List-Id: <multikernel.lists.linux.dev>
List-Subscribe: <mailto:multikernel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:multikernel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multiernel.io>

Signed-off-by: Cong Wang <cwang@multiernel.io>
---
 Documentation/multikernel/usage.rst | 215 ++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)
 create mode 100644 Documentation/multikernel/usage.rst

diff --git a/Documentation/multikernel/usage.rst b/Documentation/multikernel/usage.rst
new file mode 100644
index 000000000000..a2ec8d56ca1d
--- /dev/null
+++ b/Documentation/multikernel/usage.rst
@@ -0,0 +1,215 @@
+===================================
+Multikernel Kernfs Interface Usage
+===================================
+
+Overview
+========
+
+The multikernel kernfs interface provides a clean, user-friendly way to manage multikernel instances through the filesystem. The interface is located at ``/sys/fs/multikernel/`` and supports automatic instance creation from multikernel device trees.
+
+Architecture
+============
+
+::
+
+    /sys/fs/multikernel/
+    ├── device_tree         # Root-level DTB upload (write-only)
+    └── instances/          # Instance directory
+        ├── web-server/     # Instance created from DTB
+        │   ├── id          # Instance ID (read-only)
+        │   ├── status      # Instance status (read-only)
+        │   └── device_tree_source  # Instance DTB in DTS format (read-only)
+        ├── database/       # Another instance
+        │   ├── id
+        │   ├── status
+        │   └── device_tree_source
+        └── ...
+
+Workflow
+========
+
+Phase 1: Instance Creation (Automatic from DTB)
+------------------------------------------------
+
+1. **Create Multikernel Device Tree**
+
+   Create a device tree with multiple instances:
+
+   .. code-block:: dts
+
+      /dts-v1/;
+      / {
+          compatible = "multikernel-v1";
+
+          instances {
+              web-server {
+                  id = <1>;
+                  resources {
+                      cpus = <1>;
+                      memory-bytes = <0x20000000>;   // 512MB
+                  };
+              };
+
+              database {
+                  id = <2>;
+                  resources {
+                      cpus = <2 3>;
+                      memory-bytes = <0x40000000>;   // 1GB
+                  };
+              };
+          };
+      };
+
+2. **Upload Multikernel DTB**
+
+   .. code-block:: bash
+
+      # Compile device tree to binary format
+      dtc -O dtb -o multikernel.dtb multikernel.dts
+
+      # Upload DTB to create instances automatically
+      cat multikernel.dtb > /sys/fs/multikernel/device_tree
+
+   This automatically:
+
+   - Validates DTB format and multikernel-v1 compatibility
+   - Parses each instance in the ``/instances`` node
+   - Creates instance directories under ``instances/``
+   - Reserves memory and CPU resources for each instance
+   - Updates each instance status to "ready"
+
+3. **Check Created Instances**
+
+   .. code-block:: bash
+
+      # List created instances
+      ls /sys/fs/multikernel/instances/
+      # Output: database  web-server
+
+      # Check instance details
+      cat /sys/fs/multikernel/instances/web-server/id
+      # Output: 1
+
+      cat /sys/fs/multikernel/instances/web-server/status
+      # Output: ready
+
+      # View instance device tree
+      cat /sys/fs/multikernel/instances/web-server/device_tree_source
+      # Output: DTS format showing the instance configuration
+
+Phase 2: Kernel Loading (Kexec Integration)
+--------------------------------------------
+
+1. **Load Kernel Image**
+
+   .. code-block:: bash
+
+      # Load kernel for instance ID 1 (web-server)
+      kexec_file_load(..., KEXEC_MULTIKERNEL | KEXEC_MK_ID(1))
+
+   This:
+
+   - Finds pre-reserved resources for instance ID 1
+   - Creates kimage using pre-allocated memory and CPU resources
+   - Updates status to "loading" → "active"
+   - Preserves instance DTB for KHO (Kexec HandOver) restoration
+
+2. **Instance DTB Preservation**
+
+   The multikernel system automatically preserves each instance's device tree during kexec for restoration in the spawn kernel. The spawn kernel will:
+
+   - Detect multikernel KHO data during early boot
+   - Restore the instance's DTB and recreate the instance structure
+   - Re-reserve the same memory and CPU resources
+
+Device Tree Format
+==================
+
+Multikernel DTB Structure
+--------------------------
+
+The multikernel device tree uses the ``/instances`` structure with ``multikernel-v1`` compatibility:
+
+.. code-block:: dts
+
+    /dts-v1/;
+    / {
+        compatible = "multikernel-v1";
+
+        instances {
+            web-server {
+                id = <1>;
+                resources {
+                    cpus = <1>;                      // CPU ID 1
+                    memory-bytes = <0x20000000>;     // 512MB
+                };
+            };
+
+            database {
+                id = <2>;
+                resources {
+                    cpus = <2 3>;                    // CPU IDs 2 and 3
+                    memory-bytes = <0x40000000>;     // 1GB
+                };
+            };
+
+            load-balancer {
+                id = <3>;
+                resources {
+                    cpus = <0>;                      // CPU ID 0
+                    memory-bytes = <0x10000000>;     // 256MB
+                };
+            };
+        };
+    };
+
+Per-Instance DTB Format
+-----------------------
+
+When viewing an instance's ``device_tree_source``, it appears in per-instance format:
+
+.. code-block:: dts
+
+    /dts-v1/;
+
+    /web-server {
+        compatible = "multikernel-v1";
+        id = <1>;
+        resources {
+            cpus = <1>;
+            memory-bytes = <0x20000000>; // 512 MB
+        };
+    };
+
+Resource Properties
+-------------------
+
+- **cpus**: Array of CPU IDs to assign to this instance
+- **memory-bytes**: Memory size in bytes (must be page-aligned)
+- **id**: Unique instance identifier used for kexec operations
+
+The system validates that:
+
+- CPU IDs are valid and available
+- Memory requests don't exceed available multikernel pool
+- Instance IDs are unique
+- All values are properly aligned
+
+Instance States
+===============
+
+- **empty**: Instance created but no resources allocated yet
+- **ready**: DTB processed, resources reserved, ready for kexec
+- **loading**: Kernel being loaded via kexec
+- **active**: Kernel running in this instance
+- **failed**: Error occurred during any phase
+
+Interface Restrictions
+======================
+
+The new kernfs interface has the following restrictions:
+
+- **No manual instance creation**: Use ``mkdir`` under ``instances/`` is disabled
+- **No direct DTB upload to instances**: Instances don't have writable ``device_tree`` files
+- **Centralized DTB management**: All instances must be created via the root ``device_tree`` file
+- **Read-only instance files**: All instance attributes are read-only for consistency
-- 
2.34.1

