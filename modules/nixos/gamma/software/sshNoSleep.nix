{
  environment.etc."10-sshNoSleep.sh" = {
    enable = true;
    target = "/etc/pm/sleep.d/10-sshNoSleep.sh";
    text = ''
      #!/bin/bash

      case "$1" in
        suspend|hibernate)
          if (who -u | awk '{print $2}' | grep -q pts/); then
          logger 'ssh user(s) logged in'
              exit 1
          fi
          ;;
      esac
    '';
  };
}
