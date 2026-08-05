{
  accounts.email.accounts = {
    personal = {
      enable = true;
      flavor = "plain";
      primary = true;
      address = "ryan@ryan01.com";
      name = "Personal";
      realName = "Ryan Williams";
      userName = "ryan@ryan01.com";
      passwordCommand = "cat $XDG_RUNTIME_DIR/agenix/ryan01EmailPass";
      imap = {
        host = "mail.privateemail.com";
        port = 993;
        tls = {
          enable = true;
          useStartTls = false;
        };
        authentication = "login";
      };
      smtp = {
        host = "mail.privateemail.com";
        port = 465;
        tls = {
          enable = true;
          useStartTls = false;
        };
        authentication = "login";
      };
      neomutt = {
        enable = true;
      };
    };
  };
  programs.neomutt = {
    enable = true;
  };
}
