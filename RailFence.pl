#
# Hello World Program in Perl
#

sub getTerm() {
    local($iteration, $row, $size) = @_; # asignación local de los argumentos
    if (($size == 0) || ($size == 1)) {
        return 1;
    }
    if(($row == 0) || ($row == $size-1)) { # Max. distance is achieved at the ends and equally (size-1)*2
        return ($size-1)*2;
    }
    if ($iteration % 2 == 0) { # In the description of the method above this identity is demonstrated
        return ($size-1-$row)*2;
    }
    return 2*$row;
}

sub encode() {
    local($message, $key) = @_; # asignación local de los argumentos
    if ($key < 0) {
        throw IOException("Negative key value");
    } elsif ($key == 0) {
        $key = 1;
    }
    my $encodedMessage = "";
    for(my $row = 0; $row < $key; $row++) { # Look rows
        my $iter = 0; # The number of the  character in the row
        for(my $i = $row; $i < length($message); $i += &getTerm($iter++, $row, $key)) { # i - the number of row character in source line
            $encodedMessage .= &charAt($message,$i); # "Add characters line by row"
        }
    }
    return $encodedMessage;
}

sub charAt() {
    local($cad, $indice) = @_; # asignación local de los argumentos
    #print $cad."\n";
    #print $indice."\n";
    my $ch='';
    #print length($cad)-1;
    for $i (0..length($cad)-1){
        $ch = substr($cad, $i, 1);
        if( $indice == $i){
            return $ch;
        }
        #print "Index: $i, Text: $char \n";  
    }
    return $ch;
}

sub setCharAt() {
    local($cad, $i, $ch) = @_; # asignación local de los argumentos
    #print $cad."\n";
    if($i < 0) {
        $i = 0;
    } elsif($i > length($cad)) {
        $i = length($cad);
    }
    my $s1 = substr($cad, 0, $i);
    #print $s1."\n"; 
    my $a = length($cad) - $i -1;
    #print $a."\n"; 
    my $s2 = substr($cad, $i+1, $a);
    #print $s2."\n";
    return $s1.$ch.$s2;
}

sub decode() {
    local($message, $key) = @_; # asignación local de los argumentos
    if ($key < 0) {
        throw IOException("Negative key value");
    }
    my $decodedMessage = $message;
    #print "-->".$decodedMessage."\n";
    my $currPosition = 0; # Position in source string
    for(my $row = 0; $row < $key; $row++) { # Look rows
        my $iter = 0; # The number of the character in the row
        for(my $i = $row; $i < length($message); $i += &getTerm($iter++, $row, $key)) {
            $decodedMessage = &setCharAt($decodedMessage,$i,&charAt($message,$currPosition++)); #$decodedMessage.setCharAt($i, $message.charAt(currPosition++));
            #print "--".$decodedMessage."\n";
        }
    }
    return $decodedMessage;
}

my ($name, $text , $key) = @ARGV;

if ($key < 1){
    print "Número de líneas > 0";
    exit;
}

if (not defined $name) {
    # name method encode o decode
  die "Need name\n";
}

if (defined $text) {
    if($name eq "encode") {
        $enc = &encode($text,$key);
        print $enc;
        # print $enc;
        exit;
    }
    
    if($name eq "decode") {
        $enc = &decode($text,$key);
        print $enc;
        # print $enc;
        exit;
    }

  exit;
}

# $text = "holamundo";
# print "Cadena Inicial \t\t: ".$text."\n";
# $text = &encode($text,3);
# print "Cadena Encriptada \t: ".$text."\n";
# $text = &decode($text,3);
# print "Cadena Desencriptada \t: ".$text."\n";
#print &charAt($text,10);
#my $s="Hola";
#print $s."\n";


#print &getTerm(**) ;
#print saludar()."\n";
#print "Hello World!\n";