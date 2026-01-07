# 画像から index.md を自動生成するスクリプト

$output = "index.md"

@"
---
title: ""
draft: false
date:
tags: []
categories: []
cover:
  image: "IMG.jpg"
  alt: ""
  caption: ""
  relative: true
---

"@ | Out-File -Encoding utf8 $output

Get-ChildItem -Filter *.jpg | Sort-Object Name | ForEach-Object {
    $line = '{{< figure src="' + $_.Name + '" alt="" caption="" >}}'
    $line | Add-Content -Encoding utf8 $output
    "" | Add-Content -Encoding utf8 $output
}

""| Add-Content -Encoding utf8 $output
