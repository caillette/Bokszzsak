
galeria_tarto_szelessege = 40 ; 
galeria_tarto_vastagassaga = 30 ; 
galeria_tarto_magassaga = 600 ; 
galeria_tarto_ismetles = 400 ;   // 
galeria_tarto_gerendaba = 150 ;

fo_gerenda_szelessege = 1800 ;
fo_gerenda_vastassaga = 150 ;
fo_gerenda_magassaga = 180 ;

tamagotasi_deszka_szelessege = 140 ;
tamagotasi_deszka_vastassaga = 10 ;
tamagotasi_deszka_magassaga = 175 ;

keret_alo_bar_szelessege = galeria_tarto_ismetles * 2 + galeria_tarto_szelessege ;
keret_alo_bar_vastassaga = 30 ;
keret_alo_bar_magassaga = 30 ;

lab_atmeroje = 40 ;
lab_hossza = 480 ;

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


{
  translate( [ galeria_tarto_ismetles * 2 + galeria_tarto_szelessege / 2, 0, 0 ] ) {
    tamagato() ;
    mirror( [ 1, 0, 0 ] ) tamagato() ;
  }
}


module tamagato() {
  
  alap_eltolas = - galeria_tarto_ismetles + galeria_tarto_szelessege / 2 ;
   
  translate( [ alap_eltolas, 0, 0 ] )
    tamagotasi_deszka() ; 
  
  translate( [ alap_eltolas + tamagotasi_deszka_szelessege / 2 - lab_atmeroje / 2, 0, - tamagotasi_deszka_magassaga / 2 - lab_atmeroje ] )
    lab() ;

  module tamagotasi_deszka() {
    color( [ 0.2, 0.2, 0.2, 0.8 ] )
      translate( [ 0, - tamagotasi_deszka_vastassaga, keret_alo_bar_magassaga - tamagotasi_deszka_magassaga ] )
        cube( size = [ tamagotasi_deszka_szelessege, tamagotasi_deszka_vastassaga, tamagotasi_deszka_magassaga ] ) ;
}


  
  module lab() {
    // Multimatrix-xal lehetne a nyírás, de ezzel már nem lenne pontos 
    // a láb átmerője.
    color( [ 0.5, 0.3, 0.5, 0.8 ] ) 
      translate( [ - lab_atmeroje / 2, 0, 0 ] )
        rotate( [ 45, 0, 45 ] )
          cube( size = [ lab_atmeroje, lab_atmeroje, lab_hossza ]  ) ;  
  
}
  
}

