{ config, pkgs, inputs, services, ... }:

{
  config.services.kanata = {
    enable = true;
    keyboards.default.config = ''
      ;; defsrc is still necessary
      (defcfg
        process-unmapped-keys yes
      )

      (defsrc
        caps a s d f j k l u ; g o
      )

      (defvar
        tap-time 150
        hold-time 200
      )

      (defalias
        u u
        o o
        u2 (unicode ü)
        o2 (unicode ö)

        escctrl (tap-hold 100 100 esc lctl)
        a (tap-hold $tap-time $hold-time a lmet)
        a2 (tap-hold $tap-time $hold-time (unicode ä) lmet)
        s (tap-hold $tap-time $hold-time s lalt)
        s2 (tap-hold $tap-time $hold-time (unicode ß) lalt)

        d (tap-hold $tap-time $hold-time d lsft)
        f (tap-hold $tap-time $hold-time f lctl)
        j (tap-hold $tap-time $hold-time j rctl)
        k (tap-hold $tap-time $hold-time k rsft)
        l (tap-hold $tap-time $hold-time l ralt)
        ; (tap-hold $tap-time $hold-time ; rmet)
        sym (tap-hold $tap-time $hold-time g (layer-toggle symbols))
      )

      (deflayer base
        @escctrl @a @s @d @f @j @k @l @u @; @sym  @o
      )

      (deflayer symbols
        @escctrl @a2 @s2 @d @f @j @k @l @u2 @; @sym @o2
      )
    '';
  };
}
