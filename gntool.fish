#!/usr/bin/fish

function decompressArchive
	switch ($argv[1])
		case '7z'
		7z x $argv[1]
	end
end

function addScriptsToTree
end

function updateArchive
	set target $argv[1]
	set extension $argv[2]
	set source_dir $argv[3]
	switch (extension)
		case '7z'
		7z u -r $target $source_dir
	end
end

function processFile
	set filename $argv[1]
	set extension (echo $filename | sed 's/[^.]\+\.//')
	echo $filename
	echo $extension
end

if test -z $argv[1]
	echo "No file name provided! Please try again."
else if test -e $argv[1]
	processFile $argv[1]
else
	echo "$argv[1] is not a valid file name. Please try something else."
	exit
end
