#!/usr/bin/perl                                                                 
use warnings;


while (<>) {


        #detect tags and output
        while(/<h(\d+)\b.*?>(.*)<\/h\1\b.*?>/gi){
            #g means keep match,i means
            #i 无论大小写
            
            print "<H$1>$2</H$1>\n";
        }
}                                                                               

