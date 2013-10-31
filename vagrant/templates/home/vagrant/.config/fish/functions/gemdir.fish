function gemdir
  if test (count $argv) -eq 1
    rvm use $argv[1]
    cd (rvm gemdir)
    echo "Switched to directory: "(pwd)
  else
    echo "Please pass the desired Ruby version as an argument."
  end
end