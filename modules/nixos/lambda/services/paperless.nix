{
  age.secrets."paperlessPass" = {
    file = ../../../../secrets/paperlessPass.age;
    mode = "770";
  };
  services.paperless = {
    enable = true;
    user = "rw";
    domain = "paperless.rwillia.ms";
    address = "192.168.1.192";
    # database.createLocally = true;
    mediaDir = "/mnt/raid0/copyparty/Documents/paperless/Media";
    consumptionDir = "/mnt/raid0/copyparty/Documents/paperless/Import";
    passwordFile = "/run/agenix/paperlessPass";
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
