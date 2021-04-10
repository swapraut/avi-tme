#!/usr/bin/perl
 
$pid = fork();
if( $pid == 0 ){
 
    $ip_list = ["161.98.255.1", "37.60.63.2", "206.223.191.1", "23.26.110.2", "27.113.239.2", "42.97.255.1", "132.247.255.2", "14.192.95.1", "37.16.63.1", "49.213.31.2", "41.67.128.1", "27.97.1.2"];
    $vs = $ARGV[0];
 
    $iphone = "\"Mozilla\/5.0 (iPhone; CPU iPhone OS 5_1_1 like Mac OS X) AppleWebKit\/534.46 (KHTML, like Gecko) Version/5.1 Mobile\/9B206 Safari\/7534.48.3\"";
    $chrome = "\"Mozilla\/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit\/537.36 (KHTML, like Gecko) Chrome\/34.0.1847.131 Safari\/537.36\"";
    $firefox = "\"Mozilla\/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko\/20100101 Firefox\/29.0\"";
    $ie = "\"Mozilla\/5.0 (Windows NT 6.3; WOW64; Trident\/7.0; Touch; rv:11.0) like Gecko\"";
    $ipad = "\"Mozilla/5.0(iPad; U; CPU OS 4_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8F191 Safari/6533.18.5\"";
 
 
    #$url1 = "https://".$vs."/";
    $url1 = "https://".$vs."/imgs/logo.png";
    $url2 = "https://".$vs."/";
    $url3 = "https://".$vs."/imgs/conversion.js";
    $url4 = "https://".$vs."/imgs/header.png";
    $url5 = "https://".$vs."/assets/avi.webm";
 
    while (1) {
            for my $ip (@$ip_list) {
                print "<<<<< Client IP: $ip \n\n";
 
                    $curl = "curl --interface $ip -L --ciphers \'AES128-GCM-SHA256\' -k -A $chrome ".$url1. " -o tmp2";
                    print($curl);
                    system ($curl);
                    sleep(2);
 
                    $curl = "curl --interface $ip -L --ciphers \'ECDHE-ECDSA-AES256-SHA\' -k -A $chrome ".$url5. " -o tmp2";
                    print($curl);
                    system ($curl);
                    sleep(2);
 
                    $curl = "curl --interface $ip -L --tlsv1.1 -k -A $chrome ".$url3. " -o tmp2";
                    print($curl);
                    system ($curl);
                    sleep(2);
 
                    $curl = "curl --interface $ip -L --tlsv1.0 -k -A $chrome ".$url4. " -o tmp2";
                    print($curl);
                    system ($curl);
                    sleep(2);
            }
    }
}
print "Traffic script started: $pid.\n";
exit 0;

