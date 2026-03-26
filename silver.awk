{
	string = @/^".*?"$/
	file_out = @/^>[>!]$/
}
$1 ~ /^[a-z_][a-z_0-9]*$/ && $3 ~ string {
	matched = 1
	print $1"="$3
}
$2 ~ file_out {
	matched = 1
	fd = ""
	file = ""
	if ($2 ~ />!/) fd = "2>& 1"
	if ($3 ~ string) file = $3
	print "echo", $1, fd, file
}
!matched {
	print $0
}
