# Functions
function fish_greeting
end

function rm 
	cowsay "Use rip instead" | lolcat
	/bin/rm $argv
end

function full-update
  echo "Not implmented"
end

function unzip
	for arg  in $argv
		set dir (echo $arg | sed 's/\.[^.]*$//')
		7z e -o$dir $arg
		echo $arg
		echo $dir
	end
end

function install-fonts
	for arg  in $argv
		set dir (echo $arg | sed 's/\.[^.]*$//')
		7z e -o$dir $arg
		echo $arg
		echo $dir
    cd $dir
    mv *.ttf ~/.fonts
    cd ..
	end
end


function activate_env
	source .env/bin/activate.fish
end

function activate_cxi
	source ~/.env/bin/activate.fish
end

function remove_links
  for arg in $argv
    unlink $arg
  end
end

function picom
  /usr/bin/picom --experimental-backends &
  disown
end


function cc
  set result (echo $argv | sed 's/\.[^.]*$//')
  gcc -Wall $argv -o $result
  ./$result
end

function reload-emacs
  emacsclient -e "(kill-emacs)"
  emacs --deamon
end
  
