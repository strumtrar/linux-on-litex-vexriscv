{
  description = "ptx project";

  inputs =
    {
      flake-utils.url = "github:numtide/flake-utils";
    };


  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
           pkgs = import nixpkgs {
             inherit system;
             overlays = [ ];
           };
        in
        {
          devShell = import ./shell.nix {
            inherit pkgs;
          };
        }
      );
}
