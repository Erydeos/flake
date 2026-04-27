{ lib, buildNpmPackage, fetchFromGitHub, electron, makeWrapper, pkg-config, libusb1, udev }:

buildNpmPackage rec {
  pname = "azeron-linux";
  version = "1.5.6"; # Updated to current community version

  src = fetchFromGitHub {
    owner = "renatoi";
    repo = "azeron-linux";
    rev = "v${version}";
    sha256 = "sha256-DGLLncmXw4ZfCkzYUZE0DTEVmwFoot41BNPDAh2zQk0="; # Leave empty for now to get the correct hash
  };

  dontNpmBuild = true;

  makeCacheWritable = true;
  npmFlags = [ "--legacy-peer-deps" ];
  ELECTRON_SKIP_BINARY_DOWNLOAD = "1";

  nativeBuildInputs = [ pkg-config makeWrapper ];
  buildInputs = [ libusb1 udev ];

  npmWorkspace = "app"; 
  
  npmDepsHash = "sha256-1BoXRGEcDopYR0Nt6jX6VKaxVUzuuspMn83Cn5jsbPE="; # Leave empty for now

  postInstall = ''
    makeWrapper ${electron}/bin/electron $out/bin/azeron-linux \
      --add-flags "$out/lib/node_modules/azeron-linux/app/dist/main-process.js" \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ libusb1 udev ]}
  '';



  meta = with lib; {
    description = "Community software for Azeron keypad on Linux";
    homepage = "https://github.com/renatoi/azeron-linux";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
