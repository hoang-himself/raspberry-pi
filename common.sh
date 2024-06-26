#!/usr/bin/env bash

function set_openssh {
  for rc in ./configs/sshd_config.d/*.conf; do
    [[ -f "$rc" ]] && sudo ln -frs "$rc" "/etc/ssh/sshd_config.d/$(basename "$rc")"
  done
  for rc in ./configs/ssh_config.d/*.conf; do
    [[ -f "$rc" ]] && ln -frs "$rc" "$HOME/.ssh/config.d/$(basename "$rc")"
  done
}

function set_runcom {
  for rc in ./runcoms/*.zsh; do
    [[ -f "$rc" ]] && ln -frs "$rc" "$ZDOTDIR/zshrc.d/$(basename "$rc")"
  done
  ln -frs ./runcoms/sshrc "$HOME/.ssh/rc"
}

function repair_locale {
  sudo sed -i "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" -i /etc/locale.gen
  sudo locale-gen en_US.UTF-8
  sudo update-locale en_US.UTF-8

  export LANGUAGE=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
}
