cask "emacs@master" do
  arch arm: "arm64-11", intel: "x86_64-10_12"

  version "master"
  # Using master branch, sha256 is commented out since it will change with each build
  # sha256 "6fa18f0f516bc75264fa8971e7521ebf8130619a66acaf278eaf3d2473c9c2b0"

  url "https://github.com/mayphus/emacs/releases/download/emacs-master/Emacs.tar.gz"
  name "Emacs (Master)"
  desc "Text editor - Master branch build"
  homepage "https://mayphus.com/emacs/"

  # Requires macOS 10.12 or later for Intel, macOS 11.0 or later for Apple Silicon
  depends_on macos: ">= :sierra"

  auto_updates true

  livecheck do
    url "https://github.com/mayphus/emacs/releases"
    strategy :github_latest
  end

  conflicts_with cask:    [
                   "emacs",
                   "emacs@nightly",
                   "emacs@pretest",
                 ],
                 formula: "emacs"

  app "Emacs.app"
  binary "#{appdir}/Emacs.app/Contents/MacOS/Emacs", target: "emacs"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin-#{arch}/ctags"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin-#{arch}/ebrowse"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin-#{arch}/emacsclient"
  binary "#{appdir}/Emacs.app/Contents/MacOS/bin-#{arch}/etags"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/ctags.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/ebrowse.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacs.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/emacsclient.1.gz"
  manpage "#{appdir}/Emacs.app/Contents/Resources/man/man1/etags.1.gz"

  zap trash: [
    "~/Library/Caches/org.gnu.Emacs",
    "~/Library/Preferences/org.gnu.Emacs.plist",
    "~/Library/Saved Application State/org.gnu.Emacs.savedState",
  ]
end