sub commify {
	my $number = reverse shift;
	$number =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
	return scalar reverse $number;
}

return 1;