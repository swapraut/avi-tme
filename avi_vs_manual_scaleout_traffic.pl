
#!/usr/bin/perl
 
$pid = fork();
if( $pid == 0 ){
 
    $vs = $ARGV[0];
    $cmd = "ab -n 100000 -c 2 -f TLS1.0 -Z ECDHE-ECDSA-AES256-SHA https://$vs/100kb.txt &\
    ab -n 100000 -c 2 -f TLS1.1 -Z ECDHE-ECDSA-AES256-SHA https://$vs/100kb.txt &\
    ab -n 100000 -c 2 -f TLS1.2 -Z ECDHE-ECDSA-AES256-SHA https://$vs/100kb.txt &\
    ab -n 100000 -c 2 -f TLS1.2 -Z AES128-GCM-SHA256 https://$vs/100kb.txt;";
 
    while (1) {
        system ($cmd);
    }
}
print "Traffic script started: $pid.\n";
exit 0;
