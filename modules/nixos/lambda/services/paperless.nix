{
  age.secrets = {
    "paperlessPass" = {
      file = ../../../../secrets/paperlessPass.age;
      mode = "770";
    };
    "paperless.env" = {
      file = ../../../../secrets/paperless.env.age;
      mode = "770";
    };
  };
  services.paperless = {
    enable = true;
    domain = "paperless.rwilliams.info";
    address = "192.168.0.192";
    port = 28981;
    mediaDir = "/mnt/raid0/paperless/Media";
    consumptionDir = "/mnt/raid0/paperless/Import";
    passwordFile = "/run/agenix/paperlessPass";
    environmentFile = "/run/agenix/paperless.env";
    settings = {
      PAPERLESS_CONSUMER_IGNORE_PATTERN = [
        ".DS_STORE/*"
        "desktop.ini"
      ];
      PAPERLESS_OCR_LANGUAGE = "eng";
      PAPERLESS_OCR_USER_ARGS = {
        optimize = 1;
        pdfa_image_compression = "lossless";
      };
    };
  };
}
