#!/usr/bin/perl -w
use utf8; 
use warnings; 


my $filename_in_1 = 'a1q4-test1.in';
my $filename_out_1 = 'a1q4-test1.out';
my $filename_in_2 = 'a1q4-test2.in';
my $filename_out_2 = 'a1q4-test2.out';
read_header_tags($filename_in_1,$filename_out_1);
read_header_tags($filename_in_2,$filename_out_2);

sub read_header_tags {
	my ($filename_in,$filename_out) = @_;
	open (my $fh,">",$filename_out) or die "Could not open file <%s> !\n",$filename_out; 
	close $fh;

	if(open(MYFILE,$filename_in)){	
		my @myfile = <MYFILE>;
		my $count = 0;
		printf "\nI have opened this file: <%s>!\n", $filename_in;
	
		while($count < @myfile){
			$_ = $myfile[$count];
			while(/\<[Hh]\d((\s)*|(\s.*))\>[^\<]*\<\/[Hh]\d\>/){
				$tmp = $&;
				$_=$';
				$tmp =~ s/\<[Hh]/\<H/g;
                $tmp =~ s/\<\/[Hh]/\<\/H/g;
				$tmp =~ s/\s[^\>||^<]*\>/\>/g;
				open (my $fh,">>",$filename_out) or die "Could not open file <%s> !\n",$filename_out;
				print $fh "$tmp\n";
				close $fh;
			}
			$count ++ ;	
		}
		close(MYFILE);		
	}
	else{
		printf "Could not open file <%s> !\n", $filename_in;
	}
	printf "I have down fetching header tags and writen in file <%s> !\n\n",$filename_out;
}

