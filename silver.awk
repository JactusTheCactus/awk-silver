{
	string = @/^".*?"$/
	file_out = @/^>[>!]$/
}
$1 ~ /^[a-z_][a-z_0-9]*$/ && $2 == "=" {
	matched = 1
	value = ""
	if ($3 ~ string) value = $3
	if (length(value)) print $1"="value
}
$2 ~ file_out {
	matched = 1
	fd = ""
	file = ""
	if ($2 ~ />!/) fd = "2>& 1"
	if ($3 ~ string) file = $3
	print "echo", $1, fd, file
}
$1 == "." {
	matched = 1
	print "cat <(s", $2")"
}
!matched {
	if (length()) print $0
}
