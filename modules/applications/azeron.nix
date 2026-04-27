{ lib, buildNpmPackage, fetchFromGitHub, electron, makeWrapper, pkg-config, libusb1, udev }:

buildNpmPackage rec {
  pname = "azeron-linux";
  version = "1.2.5"; # Update this based on the latest release

  src = fetchFromGitHub {
    owner = "renatoi";
    repo = "azeron-linux";
    rev = "v${version}";
    sha256 = "lib.fakeSha256"; # Run build once, then replace with the actual hash Nix gives you
  };

  # Nix cannot download binaries in the sandbox
  ELECTRON_SKIP_BINARY_DOWNLOAD = "1";

  nativeBuildInputs = [ pkg-config makeWrapper ];
  buildInputs = [ libusb1 udev ];

  npmDepsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Also replace this after first build failure

  postInstall = ''
    makeWrapper ${electron}/bin/electron $out/bin/azeron-linux \
      --add-flags "$out/lib/node_modules/azeron-linux/app/main.js" \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ libusb1 udev ]}
  '';

  meta = with lib; {
    description = "Community software for Azeron keypad on Linux";
    homepage = "https://github.com/renatoi/azeron-linux";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
