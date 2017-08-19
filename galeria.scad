
galeria_tarto_szelessege = 40 ; 
galeria_tarto_vastagassaga = 30 ; 
galeria_tarto_magassaga = 600 ; 
galeria_tarto_ismetles = 400 ;   // 
galeria_tarto_gerendaba = 150 ;

fo_gerenda_szelessege = 1800 ;
fo_gerenda_vastassaga = 150 ;
fo_gerenda_magassaga = 180 ;

tamagotasi_deszka_szelessege = 120 ;
tamagotasi_deszka_vastassaga = 10 ;
tamagotasi_deszka_magassaga = 175 ;

kapcsolato_deszka_szelessege = 300 ;
kapcsolato_deszka_vastassaga = 200 ;
kapcsolato_deszka_magassaga = 20 ;


keret_alo_bar_szelessege = galeria_tarto_ismetles * 2 + galeria_tarto_szelessege ;
keret_alo_bar_vastassaga = 30 ;
keret_alo_bar_magassaga = 30 ;

lab_atmeroje = 40 ;
lab_hossza = 500 ;
lab_tavolsag_tartora = 50 ;
lab_alsobb_pontja = -100 ;


deszka_szine = [ 0.2, 0.2, 0.2, 0.8 ] ;


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
  

  translate( [ galeria_tarto_ismetles * 2 + galeria_tarto_szelessege / 2, - lab_hossza * cos( 45 ) + lab_atmeroje + sin( 45 ), lab_hossza * sin( 45 ) + lab_alsobb_pontja ] )
     kapcsolato_deszka() ;

}


module tamagato() {
  
  alap_eltolas = - galeria_tarto_ismetles + galeria_tarto_szelessege / 2 ;
   
  translate( [ alap_eltolas, 0, 0 ] )
    tamagotasi_deszka() ; 
  
  translate( [ alap_eltolas - lab_atmeroje / 2 + lab_tavolsag_tartora, -  tamagotasi_deszka_vastassaga, lab_alsobb_pontja ] )
    lab() ;

  module tamagotasi_deszka() {
    color( deszka_szine )
      translate( [ 0, - tamagotasi_deszka_vastassaga, keret_alo_bar_magassaga - tamagotasi_deszka_magassaga ] )
        cube( size = [ tamagotasi_deszka_szelessege, tamagotasi_deszka_vastassaga, tamagotasi_deszka_magassaga ] ) ;
}
  
  module lab() {
    // Multimatrix-xal lehetne a nyírás, de ezzel már nem lenne pontos 
    // a láb átmerője.
    color( [ 0.5, 0.3, 0.5, 0.8 ] ) 
      //translate( [ - lab_atmeroje / 2, 0, 0 ] )
        rotate( [ 45, 0, 45 ] )
          cube( size = [ lab_atmeroje, lab_atmeroje, lab_hossza ]  ) ;  
  
  }
  
}

module kapcsolato_deszka() {
 
  color( deszka_szine )  
    // X-os eredet a központon.
    translate( [ - kapcsolato_deszka_szelessege / 2, 0, 0 ] )
      cube( [ kapcsolato_deszka_szelessege, kapcsolato_deszka_vastassaga, kapcsolato_deszka_magassaga ] ) ;

}

