��    �      �  �   �	      �  �  �  h   �  �   
  i  �  �   e     �       %   !  5   G     }     �     �  !   �     �     �     �                6     W     r  	   �     �  6   �  '   �  '   	  "   1  4   T  *   �  .   �     �  
   �     �               .     @     ]     u     �     �     �     �     �     �               4     I     b     u     }     �     �     �     �     �          *  %   J  &   p  #   �  #   �  #   �  !     (   %  <   N  %   �     �      �     �  #        3     S  #   k  %   �  ?   �  	   �     �  %        9     I     Y     k     �     �     �     �     �     �     �                   4   8     m          �     �     �     �     �     �          %     .     C     L     ]  '   b     �  &   �  	   �     �     �     �     �     �            "   /     R     _     l     u  *   ~  $   �  +   �  #   �  7     %   V  "   |  4   �  (   �  (   �     &      6      I      ]      n            �      �      �   
   �   &   �   '   �   ,   !     E!     Z!     ^!      z!  N  �!    �"  q   �%    `&  v  h'  �   �(     �)      �)  1   �)  7   �)     2*     B*     I*      U*     v*     �*     �*     �*  $   �*  -   �*  &   %+  '   L+  
   t+     +  4   �+  *   �+  *   �+  /   !,  >   Q,  -   �,  2   �,     �,  	   �,     -     -     1-     I-  +   ^-  !   �-     �-     �-     �-     .     #.     B.     `.     ~.     �.     �.  !   �.     �.     /  /   &/  
   V/  "   a/     �/     �/  (   �/  '   �/  -   
0  '   80  .   `0  &   �0  !   �0  #   �0  '   �0  5   $1  C   Z1  3   �1  "   �1  .   �1  *   $2  +   O2  $   {2  "   �2  /   �2  6   �2  M   *3  
   x3     �3  2   �3     �3     �3     �3     4     *4     B4     V4     i4     }4     �4     �4     �4     �4  )   �4  G   5     `5     v5     �5  ,   �5     �5     �5     �5     6     :6  	   W6  "   a6     �6     �6     �6  1   �6     �6  3   �6     !7     .7  	   :7     D7     G7     P7     f7      m7  &   �7     �7     �7     �7     �7  #   �7     8  .   %8     T8  @   o8     �8  $   �8  ;   �8     09     M9     l9     �9     �9     �9     �9     �9     �9     �9     :     -:  ,   <:  -   i:  2   �:     �:     �:  !   �:  &   	;                 $                  y   M   C   E                 �           :   ~   6   |   9      �   �      m                      K       W   }   k   ^   �      �   "   X       =   p   -   I   t      �   2   V       F   �   \   �   	   �           #       b   J          /   e   i   �   H   c       1   _         5   g             T   ?                    @   l   {              +   <   �       '   A   
   *   q       [   a               �   .   �   f   L   U       0          n   G   v   �   �   (                 �       w   )           4       o       7       B   !   �          ;   &   Y               �   u       S           �   8      %   s   �   R   d   Q   N       >   j           �   x   ,   z          �       ]      �   O      D      �   Z   r   `   P               �   �   h              3              -h --help            Show this help
    -V --version         Show version
    -D --browse-domains  Browse for browsing domains instead of services
    -a --all             Show all services, regardless of the type
    -d --domain=DOMAIN   The domain to browse in
    -v --verbose         Enable verbose mode
    -t --terminate       Terminate after dumping a more or less complete list
    -c --cache           Terminate after dumping all entries from the cache
    -l --ignore-local    Ignore local services
    -r --resolve         Resolve services found
    -f --no-fail         Don't fail if the daemon is not available
    -p --parsable        Output in parsable format
     -k --no-db-lookup    Don't lookup service types
    -b --dump-db         Dump service type database
 %s [options]

    -h --help            Show this help
    -s --ssh             Browse SSH servers
    -v --vnc             Browse VNC servers
    -S --shell           Browse both SSH and VNC
    -d --domain=DOMAIN   The domain to browse in
 %s [options] %s <host name ...>
%s [options] %s <address ... >

    -h --help            Show this help
    -V --version         Show version
    -n --name            Resolve host name
    -a --address         Resolve address
    -v --verbose         Enable verbose mode
    -6                   Lookup IPv6 address
    -4                   Lookup IPv4 address
 %s [options] <new host name>

    -h --help            Show this help
    -V --version         Show version
    -v --verbose         Enable verbose mode
 : All for now
 : Cache exhausted
 <i>No service currently selected.</i> A NULL terminated list of service types to browse for Access denied Address Address family An unexpected D-Bus error occured Avahi Discovery Avahi SSH Server Browser Avahi VNC Server Browser Avahi Zeroconf Browser Avahi client failure: %s Avahi domain browser failure: %s Avahi resolver failure: %s Bad number of arguments
 Bad state Browse Service Types Browse for Zeroconf services available on your network Browse for Zeroconf-enabled SSH Servers Browse for Zeroconf-enabled VNC Servers Browse service type list is empty! Browsing for service type %s in domain %s failed: %s Browsing for services in domain <b>%s</b>: Browsing for services on <b>local network</b>: Browsing... Canceled.
 Change domain Choose SSH server Choose Shell Server Choose VNC server Client failure, exiting: %s
 Connecting to '%s' ...
 DNS failure: FORMERR DNS failure: NOTAUTH DNS failure: NOTIMP DNS failure: NOTZONE DNS failure: NXDOMAIN DNS failure: NXRRSET DNS failure: REFUSED DNS failure: SERVFAIL DNS failure: YXDOMAIN DNS failure: YXRRSET Daemon connection failed Daemon not running Desktop Disconnected, reconnecting ...
 Domain E Ifce Prot %-*s %-20s Domain
 E Ifce Prot Domain
 Established under name '%s'
 Failed to add address: %s
 Failed to add service: %s
 Failed to add subtype '%s': %s
 Failed to connect to Avahi server: %s Failed to create address resolver: %s
 Failed to create browser for %s: %s Failed to create client object: %s
 Failed to create domain browser: %s Failed to create entry group: %s
 Failed to create host name resolver: %s
 Failed to create resolver for %s of type %s in domain %s: %s Failed to create simple poll object.
 Failed to parse address '%s'
 Failed to parse port number: %s
 Failed to query host name: %s
 Failed to query version string: %s
 Failed to read Avahi domain: %s Failed to register: %s
 Failed to resolve address '%s': %s
 Failed to resolve host name '%s': %s
 Failed to resolve service '%s' of type '%s' in domain '%s': %s
 Host Name Host name conflict
 Host name successfully changed to %s
 Initializing... Invalid DNS TTL Invalid DNS class Invalid DNS return code Invalid DNS type Invalid Error Code Invalid RDATA Invalid address Invalid argument Invalid configuration Invalid domain name Invalid flags Invalid host name Invalid interface index Invalid number of arguments, expecting exactly one.
 Invalid operation Invalid packet Invalid port number Invalid protocol specification Invalid record Invalid record key Invalid service name Invalid service subtype Invalid service type Is empty Local name collision Location Memory exhausted Name Name collision, picking new name '%s'.
 No command specified.
 No suitable network protocol available Not found Not permitted Not supported OK OS Error Operation failed Port Resource record key is pattern Server version: %s; Host name: %s
 Service Name Service Type TXT Data Terminal The IP port number of the resolved service The TXT data of the resolved service The address family for host name resolution The address of the resolved service The domain to browse in, or NULL for the default domain The host name of the resolved service The object passed in was not valid The requested operation is invalid because redundant The service name of the selected service The service type of the selected service Timeout reached Too few arguments
 Too many arguments
 Too many clients Too many entries Too many objects Type Version mismatch Waiting for daemon ...
 _Domain... avahi_domain_browser_new() failed: %s
 avahi_service_browser_new() failed: %s
 avahi_service_type_browser_new() failed: %s
 execlp() failed: %s
 n/a service_browser failed: %s
 service_type_browser failed: %s
 Project-Id-Version: avahi
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2010-07-13 03:02+0200
PO-Revision-Date: 2009-02-13 09:12+0200
Last-Translator: Timo Jyrinki <timo.jyrinki@iki.fi>
Language-Team: Finnish <gnome-fi-laatu@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
     -h --help            Näytä tämä ohje
    -V --version         Näytä versio
    -D --browse-domains  Selaa selaavia verkkoalueita palveluiden sijaan
    -a --all             Näytä kaikki palvelut tyypistä riippumatta
    -d --domain=DOMAIN   Selattava verkkoalue
    -v --verbose         Ota käyttöön suulaampi tila
    -t --terminate       Poistu enemmän tai vähemmän täydellisen luettelon tulostuksen jälkeen
    -c --cache           Poistu kun kaikki kohteet tulostettu välimuistista
    -l --ignore-local    Jätä paikalliset palvelut huomiotta
    -r --resolve         Selvitä löydetyt palvelut
    -f --no-fail         Älä epäonnistu jos taustaprosessia ei saatavilla
    -p --parsable        Tulosta jäsennettävissä olevassa muodossa
     -k --no-db-lookup    Älä etsi palvelutyyppejä
    -b --dump-db         Tulosta palvelutyyppien tietokanta
 %s [valitsimet]

    -h --help            Näytä tämä ohje
    -s --ssh             Selaa SSH-palvelimia
    -v --vnc             Selaa VNC-palvelimia
    -S --shell           Selaa sekä SSH- että VNC-palvelimia
    -d --domain=DOMAIN   Selattava verkkoalue
 %s [valitsimet] %s <verkkonimi ...>
%s [valitsimet] %s <osoite ... >

    -h --help            Näytä ohje
    -V --version         Näytä versio
    -n --name            Selvitä verkkonimi
    -a --address         Selvitä osoite
    -v --verbose         Ota suulaampi tila käyttöön
    -6                   Etsi IPv6-osoite
    -4                   Etsi IPv4-osoite
 %s [valitsimet] <uusi verkkonimi>

    -h --help            Näytä tämä ohje
    -V --version         Näytä versio
    -v --verbose         Ota suulaampi tila käyttöön
 : Kaikki toistaiseksi
 : Välimuisti kulutettu loppuun
 <i>Palvelua ei tällä hetkellä ole valittu.</i> NULL-päätetty luettelo selattavista palvelutyypeistä Pääsy evätty Osoite Osoiteperhe Tapahtui odottamaton D-Bus-virhe Avahi-löytäjä Avahin SSH-palvelinselain Avahin VNC-palvelinselain Avahin Zeroconf-selain Avahi-asiakkaan toimintahäiriö: %s Avahi-verkkoalueselaimen toimintahäiriö: %s Avahi-selvittimen toimintahäiriö: %s Virheellinen argumenttien lukumäärä
 Huono tila Selaa palvelutyyppejä Selaa verkossa saatavilla olevia Zeroconf-palveluita Selaa Zeroconf-varustettuja SSH-palvelimia Selaa Zeroconf-varustettuja VNC-palvelimia Selattavien palvelutyyppien luettelo on tyhjä. Palvelutyypin %s selaaminen verkkoaluuessa %s epäonnistui: %s Selataan palveluita verkkoalueessa <b>%s</b>: Selataan palveluita <b>paikallisessa verkossa</b>: Selataan... Peruttu.
 Vaihda verkkoaluetta Valitse SSH-palvelin Valitse päätepalvelin Valitse VNC-palvelin Asiakkaan toimintahäiriö, poistutaan: %s
 Yhdistetään kohteeseen "%s"...
 DNS-toimintahäiriö: FORMERR DNS-toimintahäiriö: NOTAUTH DNS-toimintahäiriö: NOTIMP DNS-toimintahäiriö: NOTZONE DNS-toimintahäiriö: NXDOMAIN DNS-toimintahäiriö: NXRRSET DNS-toimintahäiriö: REFUSED DNS-toimintahäiriö: SERVFAIL DNS-toimintahäiriö: YXDOMAIN DNS-toimintahäiriö: YXRRSET Taustaprosessiyhteys epäonnistui Taustaprosessi ei käynnissä Työpöytä Yhteys katkaistiin, yhdistetään uudelleen...
 Verkkoalue T Liit Yhtk %-*s %-20s Verkkonimi
 T Liit Yhtk Verkkonimi
 Muodostettiin nimellä "%s"
 Osoitteen lisääminen epäonnistui: %s
 Palvelun lisääminen epäonnistui: %s
 Alatyypin "%s" lisääminen epäonnistui: %s
 Avahi-palvelimeen ei voi yhdistää: %s Osoitteen selvittimen luonti epäonnistui: %s
 Selainta ei voi luoda kohteelle %s: %s Asiakasobjektia ei voi luoda: %s
 Verkkoalueselainta ei voi luoda: %s Kohderyhmän luominen epäonnistui: %s
 Verkko-osoitteen selvittimen luonti epäonnistui: %s
 Kohteelle %s ei voi luoda selvitintyyppiä %s verkkoalueessa %s: %s Yksinkertaisen kyselyobjektin luonti epäonnistui.
 Osoitetta "%s" ei voi jäsentää
 Porttinumeron jäsentäminen epäonnistui: %s
 Verkko-osoitteen pyyntö epäonnistui: %s
 Versiomerkkijonon pyyntö epäonnistui: %s
 Avahi-verkkoaluetta ei voi lukea: %s Rekisteröiminen epäonnistui: %s
 Osoitteen "%s" selvittäminen epäonnistui: %s
 Verkko-osoitteen "%s" selvittäminen epäonnistui: %s
 Palvelua "%s", tyypiltään "%s", ei voi selvittää verkkoalueessa "%s": %s
 Verkkonimi Palvelinnimen ristiriita
 Verkko-osoite muutettiin onnistuneesti nimelle %s
 Alustetaan... Virheellinen DNS TTL Virheellinen DNS-luokka Virheellinen DNS-palautuskoodi Virheellinen DNS-tyyppi Kelvoton virhekoodi Virheellinen RDATA Virheellinen osoite Virheellinen argumentti Virheelliset asetukset Kelvoton verkkoalueen nimi Virheelliset liput Kelvoton verkkonimi Virheellinen liitännän järjestysnumero Virheellinen argumenttien lukumäärä, odotettiin täsmälleen yhtä.
 Virheellinen toiminto Virheellinen paketti Virheellinen porttinumero Virheellinen yhteyskäytännön määrittely Virheellinen tietue Virheellinen tietueavain Virheellinen palvelun nimi Virheellinen palvelun alatyyppi Virheellinen palvelun tyyppi On tyhjä Paikallinen nimien yhteentörmäys Sijainti Muisti loppui Nimi Nimien yhteentörmäys, valitaan uusi nimi "%s".
 Komentoa ei määritelty.
 Sopivaa verkkoyhteyskäytäntöä ei ole saatavilla Ei löytynyt Ei sallittu Ei tuettu OK OS-virhe Toiminto epäonnistui Portti Resurssin tietueavain on lauseke Palvelimen versio: %s, verkkonimi: %s
 Palvelun nimi Palvelun tyyppi TXT-data Pääte Selvitetyn palvelun IP-porttinumero Selvitetyn palvelun TXT-data Osoiteperhe verkkonimen selvittämistä varten Selvitetyn palvelun osoite Selattava verkkoalue, tai NULL oletusverkkoalueen valitsemiseksi Selvitetyn palvelun verkkonimi Annettu objekti ei ollut kelvollinen Pyydetty toiminto on tarpeettomuudesta johtuen virheellinen Valitun palvelun palvelunimi Valitun palvelun palvelutyyppi Tapahtui aikakatkaisu Liian vähän argumentteja
 Liian monta argumenttia
 Liian monta asiakasta Liian monta kohdetta Liian monta objektia Tyyppi Versioristiriita Odotetaan taustaprosessia...
 _Verkkoalue... avahi_domain_browser_new() epäonnistui: %s
 avahi_service_browser_new() epäonnistui: %s
 avahi_service_type_browser_new() epäonnistui: %s
 execlp() epäonnistui: %s
 - service_browser epäonnistui: %s
 service_type_browser epäonnistui: %s
 