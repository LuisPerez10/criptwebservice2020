

#---------------------------

#esto se supone que representa a cada imagen
my @lista = (
    "A", "B", "C", "D", "E", "F",
    "G", "H", "I", "J", "K", "L",
    "M", "N", "O", "P", "Q", "R",
    "S", "T", "U", "V", "W", "X",
    "Y", "Z"
);

sub encriptar(){
    local($mensaje) = @_;
    my $l = length($mensaje);
    my $c;
    my $ascii;
    my @encriptado;
    for(my $i = 0; $i < $l ; $i++){
        $c = substr($mensaje,$i,1);
        $ascii = ord($c);
        push(@encriptado,@lista[$ascii - 65]);
        #print @encriptado;
        #print "\n";
    }
    return @encriptado; #regresa un array con los nombres de las imagenes que debe mostrar
    
}

sub desencriptar(){
    local(@mensaje) = @_; #ingresa un array con los nombre de las imagenes que se debe desencriptar
    my $l = scalar(@mensaje);
    my $c;
    my $d;
    my $ascii;
    my $desencriptado="";
    for(my $i = 0; $i< $l; $i++){
        $c = @mensaje[$i];
        for(my $j = 0; $j < scalar(@lista); $j++){
            $d = @lista[$j];
            if($c eq $d){
                $ascii = chr($j + 65);
                $desencriptado = $desencriptado . $ascii; 
            }
        }
    }
    return $desencriptado; # devuelve el mensaje desencriptado
}

my ($name, @text) = @ARGV;

if (not defined $name) {
    # name method encode o decode
  die "Need name\n";
}

if($name eq "encode") {
    @enc = &encriptar(@text);
    print @enc;
    exit;
}

if($name eq "decode") {
    # print "decode";
    @enc = &desencriptar(@text);
    print @enc;
    # print $enc;
        exit;
}

    # if($name eq "decode") {
    #     print "decode";
    #     print @text;
    #     @enc = &desencriptar(@text);
    #     print @enc;
    #     # print $enc;
    #     exit;
    # }

  exit;



# my @text = &encriptar("JULIOCESARLEON");
# print @text;
# print "\n";
# print &desencriptar(@text);