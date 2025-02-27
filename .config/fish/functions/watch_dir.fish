function watch_dir
set -q argv[1]; or set argv[1] "."
watch -d=cumulative ls -a $argv[1]
end
