function icat
if test (count $argv) -eq 0
echo "Missing required argument"
return 1
end
set ipath $argv[1]
kitty +kitten icat --align=left $ipath
end
