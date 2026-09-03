let
  lambda = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHFROhAVMLnJWRzmXi8pbOQI3UIhLgXSY/Y0GBirGbgX";
  gamma = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAsH1Nlv75vVgwCMcTwPa8tt11Z+2Ak7YUqtH8/5UkFb";
  omicron = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJg//gZtFBIGWikK9gHgopA+rr1GCHfA+iuBurXJXWGl";
  kappa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoN0lsT2cyxUgcx/mKe/WZM9BGTxd50azlFLsB08Iw1";
  fleet = [lambda gamma kappa omicron];
in {
  "traefik.env.age".publicKeys = fleet;
  "authentik.env.age".publicKeys = fleet;
  "grafanaSecret.age".publicKeys = fleet;
  "paperlessPass.age".publicKeys = fleet;
  "ryan01EmailPass.age".publicKeys = fleet;
  "geminiApiKey.age".publicKeys = fleet;
  "unifiApiKey.age".publicKeys = fleet;
}
