{
  accounts.email.accounts = {
    personal = {
      enable = true;
      primary = true;
      address = "ryan@ryan01.com";
      name = "Personal";
      realName = "Ryan Williams";
      imap = {
        host = "mail.privateemail.com";
        port = "993";
        tls = {
          enable = true;
          useStartTls = false;
        };
      };
    };
  };
}
