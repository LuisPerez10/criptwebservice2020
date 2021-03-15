

#---------------------------

#esto se supone que representa a cada imagen
my @lista = (
    "A.png", "B.png", "C.png", "D.png", "E.png", "F.png",
    "G.png", "H.png", "I.png", "J.png", "K.png", "L.png",
    "M.png", "N.png", "O.png", "P.png", "Q.png", "R.png",
    "S.png", "T.png", "U.png", "V.png", "W.png", "X.png",
    "Y.png", "Z.png"
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

my @text = &encriptar("JULIOCESARLEON");
print @text;

print "\n";
print &desencriptar(@text);