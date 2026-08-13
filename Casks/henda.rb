# SPDX-FileCopyrightText: 2026 Ariel Mendez
# SPDX-License-Identifier: GPL-3.0-only

cask "henda" do
  version "0.1.5"
  sha256 "84c89f4c189872f51c6663c053fd189e75fb8f9aaf78fc6194e57023970030f3"

  url "https://github.com/arielmendz/henda/releases/download/v#{version}/Henda-#{version}.zip"
  name "Henda"
  desc "Automatically maximize or cascade windows in the current workspace"
  homepage "https://github.com/arielmendz/henda"

  depends_on macos: :ventura

  app "Henda.app"

  uninstall quit: "dev.arielmendez.henda"

  zap trash: "~/Library/Preferences/dev.arielmendez.henda.plist"

  caveats do
    unsigned_accessibility
    free_license "https://github.com/arielmendz/henda/blob/main/LICENSE"
  end
  caveats <<~EOS
    Henda is currently ad-hoc signed and not notarized by Apple. Gatekeeper may
    block it from opening. Do not disable Gatekeeper globally. See the first-run
    instructions at:
      https://github.com/arielmendz/henda#first-launch
  EOS
end
