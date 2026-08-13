# SPDX-FileCopyrightText: 2026 Ariel Mendez
# SPDX-License-Identifier: GPL-3.0-only

cask "henda" do
  version "0.1.5"
  sha256 "fde492b04e99e656ba25649bc51726e56c0ce48864a1e2b180c61c478281fc27"

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
