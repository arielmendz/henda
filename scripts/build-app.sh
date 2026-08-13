#!/bin/sh
# SPDX-FileCopyrightText: 2026 Ariel Mendez
# SPDX-License-Identifier: GPL-3.0-only

set -eu

configuration="${1:-release}"
root_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

cd "$root_dir"
swift build -c "$configuration" --product Henda
bin_dir=$(swift build -c "$configuration" --show-bin-path)

app_dir="$root_dir/build/Henda.app"
contents_dir="$app_dir/Contents"
macos_dir="$contents_dir/MacOS"
resources_dir="$contents_dir/Resources"

mkdir -p "$macos_dir" "$resources_dir"
cp "$bin_dir/Henda" "$macos_dir/Henda"
cp "$root_dir/support/Info.plist" "$contents_dir/Info.plist"
cp "$root_dir/support/Henda.icns" "$resources_dir/Henda.icns"
cp "$root_dir/LICENSE" "$resources_dir/LICENSE"

codesign --force --deep --sign - "$app_dir"

echo "$app_dir"
