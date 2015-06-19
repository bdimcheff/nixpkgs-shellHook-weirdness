# run nix-shell --pure
# npm install will fail
# rm -rf node_modules
# run it from the shell and it will succeed

with import <nixpkgs> {}; {
  shellHookEnv = stdenv.mkDerivation rec {
    name = "shellHook-env";


    buildInputs = [
      nodejs
      python27Full
      stdenv
      utillinux
    ];

    shellHook = ''
      # this will not work in the shellHook
      # but it works fine if you run it manually from the shell
      npm install
    '';
  };
}
