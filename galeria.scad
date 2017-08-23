
fo_gerenda_szelessege = 1800 ;
fo_gerenda_vastassaga = 150 ;
fo_gerenda_magassaga = 180 ;

galeria_tarto_szelessege = 40 ; 
galeria_tarto_vastassaga = 40 ; 
galeria_tarto_magassaga = 600 ; 
galeria_tarto_ismetles = 400 ;   
galeria_tarto_gerendaba = 150 ;

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

tamagotasi_deszka_szelessege = 2 * lab_tavolsag_tartora + lab_atmeroje * cos( 45 ) ;
tamagotasi_deszka_vastassaga = 20 ;
tamagotasi_deszka_magassaga = 175 ;


keret_also_bar_szelessege = galeria_tarto_ismetles * 2 + galeria_tarto_szelessege ;
keret_also_bar_vastassaga = 40 ;
keret_also_bar_magassaga = 40 ;

keret_felso_bar_szelessege = keret_also_bar_szelessege ;
keret_felso_bar_vastassaga = keret_also_bar_vastassaga ;
keret_felso_bar_magassaga = keret_also_bar_magassaga ;

keret_osszes_magassaga = galeria_tarto_magassaga - galeria_tarto_gerendaba ;

keret_fuggoleges_bar_szelessege = galeria_tarto_szelessege ;
keret_fuggoleges_bar_vastassaga = keret_also_bar_vastassaga ;
keret_fuggoleges_bar_magassaga = keret_osszes_magassaga - keret_also_bar_magassaga - keret_felso_bar_magassaga ;




deszka_szine = [ 0.1, 0.4, 0.6, 0.9 ] ;
lanc_szine = [ 0.6, 0.6, 0.6, 0.6 ] ;


color( [ 0.5, 0.5, 0, 0.6 ] ) {

  for( i = [ 0 : 4 ] ) 
    translate( [ i * galeria_tarto_ismetles, - galeria_tarto_vastassaga, - galeria_tarto_gerendaba ] )
    cube( size = [ galeria_tarto_szelessege, galeria_tarto_vastassaga, galeria_tarto_magassaga ]  ) 
  ;

  translate( [ 0, 0, - fo_gerenda_magassaga ] )
    cube( [ fo_gerenda_szelessege, fo_gerenda_vastassaga, fo_gerenda_magassaga ] ) ;
  
  translate( [ 0, - galeria_felso_bar_vastassaga, galeria_tarto_magassaga - galeria_tarto_gerendaba ] )
    cube( [ galeria_felso_bar_szelessege, galeria_felso_bar_vastassaga, galeria_felso_bar_magassaga] ) ;
}

color( [ 0.2, 0.2, 0.4, 0.8 ] ) {
  translate( [ galeria_tarto_ismetles, 0, 0 ] ) {
    cube( [ keret_also_bar_szelessege , keret_also_bar_vastassaga, keret_also_bar_magassaga ] ) ;
    translate( [ 0, 0, keret_osszes_magassaga - keret_felso_bar_vastassaga ] )
      cube( [ keret_felso_bar_szelessege , keret_felso_bar_vastassaga, keret_felso_bar_magassaga ] ) ;
    for( i = [ 0 : 2 ] ) 
      translate( [ i * galeria_tarto_ismetles, 0, keret_also_bar_magassaga ] )
        cube( [ keret_fuggoleges_bar_szelessege, keret_fuggoleges_bar_vastassaga, keret_fuggoleges_bar_magassaga ] ) ;

  }

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
      translate( [ 0, - tamagotasi_deszka_vastassaga, keret_also_bar_magassaga - tamagotasi_deszka_magassaga ] )
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
//        cube( [ kapcsolato_deszka_szelessege, kapcsolato_deszka_vastassaga, kapcsolato_deszka_magassaga ] ) ;
      translate( [ kapcsolato_deszka_sarok_radiusz, kapcsolato_deszka_sarok_radiusz, 0 ] )
        minkowski() {
          cube( [ kapcsolato_deszka_szelessege - 2 * kapcsolato_deszka_sarok_radiusz,kapcsolato_deszka_vastassaga - 2 * kapcsolato_deszka_sarok_radiusz,kapcsolato_deszka_magassaga ] ) ;
          cylinder( r = kapcsolato_deszka_sarok_radiusz, h = 1 ) ;
  }
}

module hur( eleje, vege ) {
  
  hossz_3d = tavolsag3d( eleje, vege ) ;  // "Norme du vecteur"
  
  hossz_x = abs( abs( vege[ 0 ] ) - abs( eleje[ 0 ] ) ) ;
  hossz_y = abs( abs( vege[ 1 ] ) - abs( eleje[ 1 ] ) ) ;
  hossz_z = abs( abs( vege[ 2 ] ) - abs( eleje[ 2 ] ) ) ;
  
  vektor = [ vege[ 0 ] - eleje[ 0 ], vege[ 1 ] - eleje[ 1 ], vege[ 2 ] - eleje[ 2 ] ] ;
  echo( "Vektor: ", vektor ) ;
  
  hossz_x_z = tavolsag2d( [ eleje[ 0 ], eleje[ 2 ] ], [ vege[ 0 ], vege[ 2 ] ] ) ;
  hossz_y_z = tavolsag2d( [ eleje[ 1 ], eleje[ 2 ] ], [ vege[ 1 ], vege[ 2 ] ] ) ;

  forditas_x = acos( vektor[ 1 ] / hossz_y_z ) ;
  forditas_y = acos( vektor[ 0 ] / hossz_x_z ) ;
  
  echo( "Fordítás x: ", forditas_x ) ;
  echo( "Fordítás y: ", forditas_y ) ;

  color( [ 0.7, 0.7, 0.7, 0.6 ] )
    translate( eleje ) 
      rotate( [ 45, 45, 0 ] )
        translate( [ 0, 0, hossz_3d / 2 ] )
          cylinder( hossz_3d, 20, 10, true ) ;
  
  color( "blue" ) 
    translate( eleje )
      sphere( 25 ) ;

  color( "red" ) 
    translate( vege )
      sphere( 25 ) ;

}

function tavolsag2d( elso, masodik ) =
  sqrt(
      pow( elso[ 0 ] - masodik[ 0 ], 2 ) +
      pow( elso[ 1 ] - masodik[ 1 ], 2 ) 
  )
;

function tavolsag3d( elso, masodik ) =
  sqrt(
      pow( elso[ 0 ] - masodik[ 0 ], 2 ) +
      pow( elso[ 1 ] - masodik[ 1 ], 2 ) +
      pow( elso[ 2 ] - masodik[ 2 ], 2 )
  )
;

/*
echo( "Tavolság 2D: ", tavolsag2d( [ 0, 0 ], [ 3, 4 ] ) ) ;
echo( "Tavolság 3D: ", tavolsag3d( [ 0, 0, 0 ], [ 3, 4, 12 ] ) ) ;
*/

! hur( [ 100, 100, 100 ], [ 300, 400, 500 ] ) ;


