let
  lambda = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIsiPG6+pCjlunLlkohwipslfj0z9L49Ddc72HseFZZSbR+8lJUSCDY4jliPD6Dzi11mxKQERQO4yLVuZrpUaaIw/cNEQaulhIXokMpM4b/B6RHdUZAJyioRU+1JI+Rios05xLYBkMHo8xCuUNoez30uPVbIVHz3XixhOJMYWA7QAbT8AdLuPJK7eXO/SH9Zw+B1g3d0r4rwD8mfwjE/qLXfCNwtRgy9fbJ6swClmsJPDSZChpW9DWeTzNS4IaRHNmT+Ezt08gVtnsX1csietPUHbJPLWSsj3c/svjf6JMXphXf+wSQgCGlHqJ1dOEmqHSkJRDSV62wpdAfeXzBOJgHiMtqzk0kw7k3wNvcKCtO4MANzD2f3hCkfmO8pUy7Q1w0vgrISjL7SradxjADJSW9z/3Z71oKKxtwXMgGMRKAP5wZ4sJIPpIwXh8K+yY8T8SpA9wkXxaIeH5n1VBjO2ISeGvRiMw+FWf0bqTLwd1eU1rbaMuidZ+dKdfWAg4mt7CuGOBKzU4MnjLoYPO1ZBRYW3/Op5CYtkQwQshxwZapK++mqGSZjxT/zminDznBlAzdmrz/hStKkAoqjgQllpw/dvRXnk2lDkYHnaPG4r1VVuAzscbedSgK2OtxXi2tsj6JmHqI/KsEXnAur8lk86UfuahTKDJv9qnbclzAhF/PQ==";
  gamma = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAsH1Nlv75vVgwCMcTwPa8tt11Z+2Ak7YUqtH8/5UkFb";
  omicron = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJg//gZtFBIGWikK9gHgopA+rr1GCHfA+iuBurXJXWGl";
  kappa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoN0lsT2cyxUgcx/mKe/WZM9BGTxd50azlFLsB08Iw1";
in {
  "traefik.env.age".publicKeys = [gamma lambda];
  "authentik.env.age".publicKeys = [gamma lambda];
  "grafanaSecret.age".publicKeys = [gamma lambda];
  "paperlessPass.age".publicKeys = [gamma lambda];
  "ryan01EmailPass.age".publicKeys = [gamma];
  "geminiApiKey.age".publicKeys = [gamma kappa];
}
