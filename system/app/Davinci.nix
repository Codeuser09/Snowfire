{ pkgs, ... }:

{
  permittedInsecurePackages = [
    "python-2.7.18.8"
  ];
  environment.systemPackages = with pkgs; [
    davinci-resolve
    librsvg
    libGLU
    libGL
    xorg.libICE
    xorg.libSM
    xorg.libXxf86vm
    xorg.libxcb
    udev
    opencl-headers
    alsa-lib
    xorg.libX11
    xorg.libXext
    expat
    zlib
    libuuid
    bzip2
    libtool
    ocl-icd
    glib
    libarchive
    xdg-utils # xdg-open needed to open URLs
    python
    dbus
    ];
}
