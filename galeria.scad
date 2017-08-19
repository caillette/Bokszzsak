
galeria_tarto_magassaga = 500 ; 
galeria_tarto_szelessege = 40 ; 
galeria_tarto_vastagassaga = 30 ; 
galeria_tarto_ismetles = 400 ;   // 
galeria_tarto_gerendaba = 150 ;

fo_gerenda_szelessege = 1800 ;
fo_gerenda_vastassaga = 150 ;
fo_gerenda_magassaga = 180 ;

tamazso_deszka_szelessege = 140 ;
tamaszo_deszka_vastassaga = 10 ;
tamaszo_deszka_magassaga = 175 ;

keret_alo_bar_szelessege = galeria_tarto_ismetles * 2 + galeria_tarto_szelessege ;
keret_alo_bar_vastassaga = 30 ;
keret_alo_bar_magassaga = 30 ;

lab_atmeroje = 40 ;
lab_hossza = 380 ;

color( [ 0.5, 0.5, 0, 0.6 ] ) {

  for( i = [ 0 : 4 ] ) 
    translate( [ i * galeria_tarto_ismetles, - galeria_tarto_vastagassaga, - galeria_tarto_gerendaba ] )
    cube( size = [ galeria_tarto_szelessege, galeria_tarto_vastagassaga, galeria_tarto_magassaga ]  ) 
  ;

  translate( [ 0, 0, - fo_gerenda_magassaga ] )
  cube( size = [ fo_gerenda_szelessege, fo_gerenda_vastassaga, fo_gerenda_magassaga ] ) ;
}

color( [ 0.2, 0.2, 0.4, 0.8 ] ) {
  translate( [ galeria_tarto_ismetles, 0, 0 ] )
  cube( size = [ keret_alo_bar_szelessege , keret_alo_bar_vastassaga, keret_alo_bar_magassaga ] ) ;
}


color( [ 0.2, 0.2, 0.2, 0.8 ] ) {
  translate( [ galeria_tarto_ismetles, 0, 0 ] )
  tamaszo_deszka() ; 
  translate( [ galeria_tarto_ismetles * 3 - tamazso_deszka_szelessege, 0, 0 ] )
  tamaszo_deszka() ; 
}

module tamaszo_deszka() {
  translate( [ 0, - tamaszo_deszka_vastassaga, keret_alo_bar_magassaga - tamaszo_deszka_magassaga ] )
  cube( size = [ tamazso_deszka_szelessege, tamaszo_deszka_vastassaga, tamaszo_deszka_magassaga ] ) ;
}


color( [ 0.5, 0.3, 0.5, 0.8 ] ) {
  galeria_tarto_intervallum = galeria_tarto_szelessege + galeria_tarto_ismetles ;
  

  translate( [ galeria_tarto_terkoz + tamazso_deszka_szelessege, 0, - tamaszo_deszka_magassaga / 2 ] )
  lab( 1 ) ;
  
  translate( [ ( galeria_tarto_ismetles ) * 2 - tamazso_deszka_szelessege, 0, - tamaszo_deszka_magassaga / 2 ] )
  lab( -1 ) ;
  
  // Multimatrix-xal lehetne a nyírás, de ezzel már nem lenne pontos 
  // a láb átmerője.
  
}

  
module lab( forgas ) {
//  rotate( [ 45, 0, 45 * forgas ] )
  // Hogy forgasson az közepeső pont körül az X tengelyen.
//  translate( [ - lab_atmeroje / 2, 0, 0 ] )
  cube( size = [ lab_atmeroje, lab_atmeroje, lab_hossza ]  ) ;  
  
}