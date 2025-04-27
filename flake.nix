{
  description = "Flake utils demo";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = rec {
          argocdCreate = pkgs.writeShellScriptBin "argocd-create" ''
            argocd app create django-workflow \
              --app-namespace argocd \
              --repo https://github.com/jDmacD/django-workflow.git \
              --path kustomize \
              --dest-namespace django-workflow \
              --dest-server https://kubernetes.default.svc;
            argocd app sync django-workflow
          '';
          default = argocdCreate;
        };
        apps = rec {
          argocdCreate = flake-utils.lib.mkApp { drv = self.packages.${system}.argocdCreate; };
          default = argocdCreate;
        };
      }
    );
}