
galeria_tarto_szama = 6 ;
galeria_tarto_szelessege = 40 ; 
galeria_tarto_vastassaga = 40 ; 
galeria_tarto_magassaga = 800 ; 
galeria_tarto_arasz = 400 ;   
galeria_tarto_gerendaba = 150 ;

fo_gerenda_szelessege = galeria_tarto_szama * galeria_tarto_arasz + galeria_tarto_szelessege * 5 ;
fo_gerenda_vastassaga = 150 ;
fo_gerenda_magassaga = 180 ;

galeria_felso_bar_szelessege = fo_gerenda_szelessege ; 
galeria_felso_bar_vastassaga = galeria_tarto_vastassaga ; 
galeria_felso_bar_magassaga = galeria_felso_bar_vastassaga ; 

kapcsolato_deszka_szelessege = 320 ;
kapcsolato_deszka_vastassaga = 120 ;
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
// Csálnunk kell egy kicsit a támagató szimmetriája miatt.
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


// A kapcsolato_deszka koordinátjáiban.
kapcsolato_deszka_felso_kotopontja = [ 
    0, 
    - lab_hossza * cos( 45 ) + 2 * lab_atmeroje * sin( 45 ) + kapcsolato_deszka_vastassaga / 2 - tamogatasi_deszka_vastassaga, 
    lab_hossza * sin( 45 ) + kapcsolato_deszka_magassaga  + lab_alsobb_pontja
] ;

// A kapcsolato_deszka koordinátjáiban.
kapcsolato_deszka_also_kotopontja = fordit_pontot( 
    kapcsolato_deszka_felso_kotopontja,
    [ 0, 0, - kapcsolato_deszka_magassaga ]
) ;

// A kapcsolato_deszka koordinátjáiban.
keret_kinti_kotopontja = [ 
    ( - keret_felso_bar_szelessege / 2 ) + ( keret_fuggoleges_bar_szelessege * 1.5 ), 
    0, 
    keret_osszes_magassaga - keret_felso_bar_magassaga / 2
] ;

// A kapcsolato_deszka koordinátjáiban.
keret_belsoi_kotopontja = fordit_pontot( keret_kinti_kotopontja, [ 0, keret_felso_bar_vastassaga, 0 ] ) ;


bokszzsak_hur_hossza = 520 ;
// http://www.everlastbox.hu/everlast-powerstrike-120-cm-es-boxzsak-u6441.html
bokszzsak_atmero = 350 ;
bokszzsak_hossz = 1200 ;


szoba_szelessege = 5000 ;
szoba_magassaga = 5000 ;


deszka_szine = [ 0.1, 0.4, 0.6, 0.9 ] ;
lanc_szine = [ 0.6, 0.6, 0.6, 0.6 ] ;
galeria_szine = [ 0.5, 0.5, 0, 0.6 ] ;
keret_szine = [ 0.2, 0.2, 0.4, 0.8 ] ;
lab_szine = [ 0.5, 0.3, 0.5, 0.8 ] ;
lanc_szin = [ 0.7, 0.7, 0.7, 0.7 ] ;
bokszzsak_szin = [ 0.3, 0.2, 0.1, 1 ] ;
parketta_szin = [ 0.3, 0.3, 0.05, 0.1 ] ;



// =======
// Jelenet
// =======

parketta() ;

translate( [ 0, 2000, 2000 ] ) {
  galeria() ;
  
  translate( [ tamotago_tavolsag_falrol, 0, 0 ] ) {
    tamagato() ;
    keret() ;
    bokszzsak() ; 
  }
}



// =========
// Module-ök
// =========

module parketta() {
  color( parketta_szin ) 
    square( szoba_szelessege, szoba_magassaga ) ;
}

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
  keret_tamagato_egy_hura() ;
  keret_parketta_egy_hura() ;
  mirror( [ 1, 0, 0 ] ) {
    tamagato_fele() ;  
    keret_tamagato_egy_hura() ;
    keret_parketta_egy_hura() ;
  }
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
    color( lab_szine ) 
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


module keret_tamagato_egy_hura() {
  
  hur( 
      eleje = kapcsolato_deszka_felso_kotopontja, 
      vege = keret_kinti_kotopontja, 
      radiusz_eleje = 5,
      radiusz_vege = 5,
      szin = lanc_szin,
      gomb = true  
  ) ;   
}

module keret_parketta_egy_hura() {
  hur( 
      eleje = keret_belsoi_kotopontja, 
      vege = [ keret_belsoi_kotopontja[ 0 ], keret_osszes_magassaga, 0 ], 
      radiusz_eleje = 5,
      radiusz_vege = 5,
      szin = lanc_szin,
      gomb = true   
  ) ;  
}

module bokszzsak() {
  zsak_kotopontja = fordit_pontot( kapcsolato_deszka_also_kotopontja, [ 0, 0, - bokszzsak_hur_hossza ] ) ;
  hur( eleje = kapcsolato_deszka_also_kotopontja, vege = zsak_kotopontja, radiusz_eleje = 6, radiusz_vege = 7, szin = lanc_szin ) ;
  
 translate( zsak_kotopontja ) {
   translate( [ 0, 0, - bokszzsak_hossz / 2 ] ) 
     color( bokszzsak_szin )
      cylinder( $fa = 5, bokszzsak_hossz, bokszzsak_atmero / 2, bokszzsak_atmero / 2, true ) ;
    
    
  }
  
}


module hur( eleje, vege, radiusz_eleje = 20, radiusz_vege = 10, szin = [ 0.7, 0.7, 0.7, 0.6 ], gomb = true ) {
  
  vektor = vektor( eleje, vege ) ;

  // https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language#rotate
  
  hossz = norm( vektor ) ;
  
  b = acos( vektor[ 2 ] / hossz ) ; 
  c = atan2( vektor[ 1 ], vektor[ 0 ] ) ;
  
  color( szin )
    translate( eleje ) 
      rotate( [ 0, b, c ] )
        translate( [ 0, 0, hossz / 2 ] )
          cylinder( hossz, radiusz_eleje, radiusz_vege, true ) ;
  
  if( gomb ) {
    color( "blue" ) 
      translate( eleje )
        sphere( radiusz_eleje ) ;

    color( "red" ) 
      translate( vege )
        sphere( radiusz_vege ) ;
  }

}

function vektor( eleje, vege ) = 
  [ vege[ 0 ] - eleje[ 0 ], vege[ 1 ] - eleje[ 1 ], vege[ 2 ] - eleje[ 2 ] ]
;

function fordit_pontot( pont, forditas ) = 
  [ pont[ 0 ] + forditas[ 0 ], pont[ 1 ] + forditas[ 1 ], pont[ 2 ] + forditas[ 2 ] ]
;


*hur( [ 100, 100, -100 ], [ 300, 400, -500 ] ) ;


