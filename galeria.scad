
galeria_tarto_szama = 6 ;
galeria_tarto_szelessege = 40 ; 
galeria_tarto_vastassaga = 40 ; 
galeria_tarto_magassaga = 600 ; 
galeria_tarto_arasz = 400 ;   
galeria_tarto_gerendaba = 150 ;

fo_gerenda_szelessege = galeria_tarto_szama * galeria_tarto_arasz + galeria_tarto_szelessege * 5 ;
fo_gerenda_vastassaga = 150 ;
fo_gerenda_magassaga = 180 ;

galeria_felso_bar_szelessege = fo_gerenda_szelessege ; 
galeria_felso_bar_vastassaga = galeria_tarto_vastassaga ; 
galeria_felso_bar_magassaga = galeria_felso_bar_vastassaga ; 

kapcsolato_deszka_szelessege = 320 ;
kapcsolato_deszka_vastassaga = 180 ;
kapcsolato_deszka_magassaga = 20 ;
kapcsolato_deszka_sarok_radiusz = 50 ;

lab_atmeroje = 40 ;
lab_hossza = 500 ;
lab_tavolsag_tartora = 60 ;
lab_alsobb_pontja = -120 ;

tamogatasi_deszka_szelessege = 2 * lab_tavolsag_tartora + lab_atmeroje * cos( 45 ) ;
tamogatasi_deszka_vastassaga = 20 ;
tamogatasi_deszka_magassaga = 175 ;

tamogato_elso_tarto = 4 ;
// A támagató szimmetriája miatt csálni kell egy kicsit.
tamotago_tavolsag_falrol = tamogato_elso_tarto * galeria_tarto_arasz + galeria_tarto_szelessege / 2 ;
keret_tavolsag_falrol = ( tamogato_elso_tarto - 1 ) * galeria_tarto_arasz ;

keret_also_bar_szelessege = galeria_tarto_arasz * 2 + galeria_tarto_szelessege ;
keret_also_bar_vastassaga = 40 ;
keret_also_bar_magassaga = 40 ;

keret_felso_bar_szelessege = keret_also_bar_szelessege ;
keret_felso_bar_vastassaga = keret_also_bar_vastassaga ;
keret_felso_bar_magassaga = keret_also_bar_magassaga ;

keret_osszes_magassaga = galeria_tarto_magassaga - galeria_tarto_gerendaba ;

keret_fuggoleges_bar_szelessege = galeria_tarto_szelessege ;
keret_fuggoleges_bar_vastassaga = keret_also_bar_vastassaga ;
keret_fuggoleges_bar_magassaga = keret_osszes_magassaga - keret_also_bar_magassaga - keret_felso_bar_magassaga ;

// ==========
// Kötőpontok
// ==========



deszka_szine = [ 0.1, 0.4, 0.6, 0.9 ] ;
lanc_szine = [ 0.6, 0.6, 0.6, 0.6 ] ;
galeria_szine = [ 0.5, 0.5, 0, 0.6 ] ;
keret_szine = [ 0.2, 0.2, 0.4, 0.8 ] ;


galeria() ;

translate( [ tamotago_tavolsag_falrol, 0, 0 ] ) {
  tamagato() ;
  keret() ;
}

// ==============
// A többi module
// ==============

module galeria() {
  color( galeria_szine ) {

    for( i = [ 0 : galeria_tarto_szama ] ) 
      translate( [ i * galeria_tarto_arasz, - galeria_tarto_vastassaga, - galeria_tarto_gerendaba ] )
        cube( size = [ galeria_tarto_szelessege, galeria_tarto_vastassaga, galeria_tarto_magassaga ] ) ;

    translate( [ 0, 0, - fo_gerenda_magassaga ] )
      cube( [ fo_gerenda_szelessege, fo_gerenda_vastassaga, fo_gerenda_magassaga ] ) ;
  
    translate( [ 0, - galeria_felso_bar_vastassaga, galeria_tarto_magassaga - galeria_tarto_gerendaba ] )
      cube( [ galeria_felso_bar_szelessege, galeria_felso_bar_vastassaga, galeria_felso_bar_magassaga] ) ;
  }
}


/*
 * A x0 a keret központja.
 */
module keret() {
  color( keret_szine )
    translate( [ - keret_also_bar_szelessege / 2, 0, 0 ] ) {
//    translate( - keret_also_bar_szelessege / 20, 0, 0 ) {
      cube( [ keret_also_bar_szelessege , keret_also_bar_vastassaga, keret_also_bar_magassaga ] ) ;
      translate( [ 0, 0, keret_osszes_magassaga - keret_felso_bar_vastassaga ] )
        cube( [ keret_felso_bar_szelessege , keret_felso_bar_vastassaga, keret_felso_bar_magassaga ] ) ;
      for( i = [ 0 : 2 ] ) 
        translate( [ i * galeria_tarto_arasz, 0, keret_also_bar_magassaga ] )
          cube( [ keret_fuggoleges_bar_szelessege, keret_fuggoleges_bar_vastassaga, keret_fuggoleges_bar_magassaga ] ) ;
    
    }
}

/*
 * A x0 a támagató központja.
 */
module tamagato() {
  tamagato_fele() ;
  mirror( [ 1, 0, 0 ] ) tamagato_fele() ;  
  translate( [ 0, - lab_hossza * cos( 45 ) + lab_atmeroje + sin( 45 ), lab_hossza * sin( 45 ) + lab_alsobb_pontja ] )
     kapcsolato_deszka() ;
}


module tamagato_fele() {
  
  alap_eltolas = - galeria_tarto_arasz + galeria_tarto_szelessege / 2 ;
   
  translate( [ alap_eltolas, 0, 0 ] )
    tamogatasi_deszka() ; 
  
  translate( [ alap_eltolas - lab_atmeroje / 2 + lab_tavolsag_tartora, -  tamogatasi_deszka_vastassaga, lab_alsobb_pontja ] )
    lab() ;

  module tamogatasi_deszka() {
    color( deszka_szine )
      translate( [ 0, - tamogatasi_deszka_vastassaga, keret_also_bar_magassaga - tamogatasi_deszka_magassaga ] )
        cube( size = [ tamogatasi_deszka_szelessege, tamogatasi_deszka_vastassaga, tamogatasi_deszka_magassaga ] ) ;
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
//        cube( [ kapcsolato_deszka_szelessege, kapcsolato_deszka_vastassaga, kapcsolato_deszka_magassaga ] ) ;
      translate( [ kapcsolato_deszka_sarok_radiusz, kapcsolato_deszka_sarok_radiusz, 0 ] )
        minkowski() {
          cube( [ kapcsolato_deszka_szelessege - 2 * kapcsolato_deszka_sarok_radiusz,kapcsolato_deszka_vastassaga - 2 * kapcsolato_deszka_sarok_radiusz,kapcsolato_deszka_magassaga ] ) ;
          cylinder( r = kapcsolato_deszka_sarok_radiusz, h = 1 ) ;
  }
}

module hur( eleje, vege ) {
  
  vektor = vektor( eleje, vege ) ;

  // https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#rotate
  
  hossz = norm( vektor ) ;
  
  b = acos( vektor[ 2 ] / hossz ) ; 
  c = atan2( vektor[ 1 ], vektor[ 0 ] ) ;
  
  color( [ 0.7, 0.7, 0.7, 0.6 ] )
    translate( eleje ) 
      rotate( [ 0, b, c ] )
        translate( [ 0, 0, hossz / 2 ] )
          cylinder( hossz, 20, 10, true ) ;
  
  color( "blue" ) 
    translate( eleje )
      sphere( 25 ) ;

  color( "red" ) 
    translate( vege )
      sphere( 25 ) ;

}

function vektor( eleje, vege ) = 
  [ vege[ 0 ] - eleje[ 0 ], vege[ 1 ] - eleje[ 1 ], vege[ 2 ] - eleje[ 2 ] ]
;


*hur( [ 100, 100, -100 ], [ 300, 400, -500 ] ) ;


