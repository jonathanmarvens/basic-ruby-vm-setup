function fish_prompt
  set last_command_status $status

  echo ""

  echo -n " "
  set_color green
  echo -n (hostname -s)
  set_color normal
  echo -n " "
  set_color red
  echo -n "➡"
  set_color normal
  echo -n " "
  set_color yellow
  echo -n (id -n -u)
  set_color normal
  echo ""

  echo -n " "
  echo -n " "
  echo -n " "
  set_color white
  echo -n "⌊"
  set_color normal
  echo -n " "
  set_color magenta
  echo -n (pwd)
  set_color normal
  echo ""

  echo ""

  echo -n " "
  set_color blue
  if test $last_command_status = 0
    echo -n "✔"
  else
    echo -n "✖"
  end
  set_color normal
  echo -n " "
  set_color cyan
  echo -n "▸▸▸"
  set_color normal
  echo -n " "
end