��    �      �  �   �
      �     �  �   �  �   f  <   �     4     Q     l     u     �     �     �     �     �  7   �          .     I      N     o  &   �     �  .   �  4     "   8      [  D   |  A   �  7     !   ;     ]  "   {  A   �  +   �  '        4     L     d  #   z     �  #   �  -   �            $   6     [     w     �  %   �  F   �          "  *   =     h     �  %   �  &   �     �     �          *  %   F     l     �  %   �  #   �     �     �  1     8   D  (   }     �  ,   �  )   �       *   5  !   `  y   �     �        *   :     e  ?   s  4   �     �     �           %     F  0   f  %   �  !   �  0   �  8     @   I     �     �  D   �            1   0  '   b  0   �  9   �  ,   �  )   "  (   L  &   u     �     �  -   �  '   �  )   #  !   M  '   o     �     �     �     �  "   �  /      6   ;   6   r   >   �   �   �      �!     �!  &   �!  M   "  5   T"  2   �"  +   �"  6   �"  #    #     D#  (   T#     }#  .   �#     �#      �#     �#     $     6$  &   T$  3   {$  h   �$  0   %  '   I%     q%  N   �%     �%  O   �%     5&  
   U&     `&  5   v&  #   �&  ,   �&  0   �&     .'  "   4'     W'  	   q'     {'     �'  1   �'     �'     �'     �'     (  (   (  1   ?(     q(  �  z(      *  �   *  �   �*  H   ~+     �+     �+     ,     ,     ,,     A,  !   ^,     �,     �,  :   �,  %   �,     �,     -  .   -  ,   K-  0   x-  &   �-  =   �-  G   .  -   V.  /   �.  \   �.  i   /  K   {/  .   �/  '   �/  2   0  L   Q0  0   �0  2   �0  "   1  "   %1     H1  6   f1  "   �1  6   �1  =   �1     52  #   S2  5   w2  %   �2     �2  (   �2  +   3  p   A3     �3     �3  7   �3  !   4     <4  4   X4  5   �4      �4     �4  *   5     .5     H5     b5     o5     5     �5     �5     �5  ;   �5  P   	6  (   Z6     �6  S   �6  .   �6  $   #7  I   H7     �7  �   �7  /   I8     y8  -   �8     �8  3   �8  3   9     @9     W9     r9     �9  0   �9  7   �9  /   :  ;   C:  4   :  B   �:  =   �:  $   5;     Z;  6   v;     �;     �;  9   �;  )   <  0   D<  @   u<  0   �<  *   �<  $   =  /   7=     g=     �=  /   �=  1   �=  +   �=     '>  ?   E>  (   �>     �>  '   �>     �>  6   �>  2   .?  V   a?  6   �?  7   �?  �   '@     �@     A  ,   #A  S   PA  A   �A  9   �A  %    B  <   FB  -   �B     �B  2   �B     �B  7   C     LC  "   `C     �C      �C  !   �C  '   �C  :   D  s   GD  *   �D  %   �D  !   E  J   .E     yE  U   �E      �E     F     F  7   0F     hF  .   �F  ?   �F     �F  2   �F      -G     NG     _G     {G  <   �G  $   �G     �G  #   �G     H  9   3H  ?   mH  	   �H        Z   G   v       �   6   �   ^           D   P            l   �   �   V   A       e   �       J       m   ]          E   7   o       �      _           \      N      ,      $   {             /   3   :   w   �   4   *   ?   S   #          �           !       �   �   <   =   8   |   @           �          I   `   q   �      �       h   �   �   u   �   �   �   g   b   [           }   n   �               �      i              -   �                 >   (           2   �          �           �                  �   5   t   ~   '   s      �           y   k       U      �   z           �       R      L   �   �   "   %   Y   O   �           �       ;   F   �       p   d               �   W   �          )      �   C       �   �      H   �       �   f   �          r                 
   &   M   x   �   9   �   B       �   �   +   Q   .   1   j   0   K       a       c   �   X       T       	        
<action> is one of:
 
<name> is the device to create under %s
<device> is the encrypted device
<key slot> is the LUKS key slot number to modify
<key file> optional key file for the new key for luksAddKey action
 
Default compiled-in device cipher parameters:
	plain: %s, Key: %d bits, Password hashing: %s
	LUKS1: %s, Key: %d bits, LUKS header hashing: %s
 
WARNING: real device header has different UUID than backup! %s: requires %s as arguments (Obsoleted, see man page.) <device> <device> <key slot> <device> <name>  <device> [<key file>] <device> [<new key file>] <name> <name> <device> Align payload at <n> sector boundaries - for luksFormat All key slots full.
 Argument <action> missing. BITS BLKGETSIZE failed on device %s.
 BLKROGET failed on device %s.
 Backup LUKS device header and keyslots Backup file %s doesn't exist.
 Backup file do not contain valid LUKS header.
 Can't do passphrase verification on non-tty inputs.
 Can't format LUKS without device.
 Can't wipe header on device %s.
 Cannot add key slot, all slots disabled and no volume key provided.
 Cannot create LUKS header: header digest failed (using hash %s).
 Cannot create LUKS header: reading random salt failed.
 Cannot get info about device %s.
 Cannot get process priority.
 Cannot initialize crypto backend.
 Cannot initialize device-mapper. Is dm_mod kernel module loaded?
 Cannot not read %d bytes from key file %s.
 Cannot open device %s for %s%s access.
 Cannot open device %s.
 Cannot open device: %s
 Cannot open file %s.
 Cannot open header backup file %s.
 Cannot read device %s.
 Cannot read header backup file %s.
 Cannot retrieve volume key for plain device.
 Cannot unlock memory. Cannot wipe device %s.
 Cannot write header backup file %s.
 Command failed with code %i Command successful.
 Create a readonly mapping DM-UUID for device %s was truncated.
 Data offset or key size differs on device and backup, restore failed.
 Device %s %s%s Device %s already exists.
 Device %s doesn't exist or access denied.
 Device %s has zero size.
 Device %s is busy.
 Device %s is not a valid LUKS device. Device %s is not a valid LUKS device.
 Device %s is not active.
 Device %s is too small.
 Display brief usage Do not ask for confirmation Enter LUKS passphrase to be deleted:  Enter LUKS passphrase:  Enter any passphrase:  Enter any remaining LUKS passphrase:  Enter new passphrase for key slot:  Enter passphrase for %s:  Enter passphrase:  Error during update of LUKS header on device %s.
 Error re-reading LUKS header after update on device %s.
 Error reading passphrase from terminal.
 Error reading passphrase.
 Failed to access temporary keystore device.
 Failed to obtain device mapper directory. Failed to open key file %s.
 Failed to open temporary keystore device.
 Failed to read from key storage.
 Failed to setup dm-crypt key mapping for device %s.
Check that kernel supports %s cipher (check syslog for more info).
%s Failed to stat key file %s.
 Failed to write to key storage.
 File with LUKS header and keyslots backup. Help options: How many sectors of the encrypted data to skip at the beginning How often the input of the passphrase can be retried Invalid device %s.
 Invalid key size %d.
 Invalid key size.
 Invalid plain crypt parameters.
 Key %d not active. Can't wipe.
 Key processing error (using hash algorithm %s).
 Key size must be a multiple of 8 bits Key slot %d active, purge first.
 Key slot %d is full, please select another one.
 Key slot %d is invalid, please select between 0 and %d.
 Key slot %d is invalid, please select keyslot between 0 and %d.
 Key slot %d is invalid.
 Key slot %d is not used.
 Key slot %d material includes too few stripes. Header manipulation?
 Key slot %d unlocked.
 Key slot %d verified.
 LUKS header detected but device %s is too small.
 No key available with this passphrase.
 No known cipher specification pattern detected.
 Not compatible PBKDF2 options (using hash algorithm %s).
 Obsolete option --non-exclusive is ignored.
 Option --header-backup-file is required.
 Out of memory while reading passphrase.
 PBKDF2 iteration time for LUKS (in ms) Passphrases do not match.
 Print package version Read the key from a file (can be /dev/random) Read the volume (master) key from file. Requested LUKS hash %s is not supported.
 Requested file %s already exist.
 Restore LUKS device header and keyslots Resume suspended LUKS device. SECTORS Show debug messages Show this help message Shows more detailed error messages Slot number for new key (default is first free) Suspend LUKS device and wipe key (all IOs are frozen). The cipher used to encrypt the disk (see /proc/crypto) The hash used to create the encryption key from the passphrase The reload action is deprecated. Please use "dmsetup reload" in case you really need this functionality.
WARNING: do not use reload to touch LUKS devices. If that is the case, hit Ctrl-C now.
 The size of the device The size of the encryption key The start offset in the backend device This is the last keyslot. Device will become unusable after purging this key. This operation is not supported for %s crypt device.
 This operation is supported only for LUKS device.
 This will overwrite data on %s irrevocably. Timeout for interactive passphrase prompt (in seconds) Unable to obtain sector size for %s Unknown action. Unknown crypt device type %s requested.
 Unsupported LUKS version %d.
 Verifies the passphrase by asking for it twice Verify passphrase:  Volume %s is already suspended.
 Volume %s is not active.
 Volume %s is not suspended.
 Volume key buffer too small.
 Volume key does not match the volume.
 WARNING!!! Possibly insecure memory. Are you root?
 Warning: exhausting read requested, but key file %s is not a regular file, function might never return.
 Wrong UUID format provided, generating new one.
 [OPTION...] <action> <action-specific>] add key to LUKS device already contains LUKS header. Replacing header will destroy existing keyslots. create device does not contain LUKS header. Replacing header can destroy data on that device. dump LUKS partition information exclusive  formats a LUKS device identical to luksKillSlot - DEPRECATED - see man page key slot %d selected for deletion.
 memory allocation error in action_luksFormat modify active device - DEPRECATED - see man page msecs open LUKS device as mapping <name> print UUID of LUKS device read-only remove LUKS mapping remove device removes supplied key or key file from LUKS device resize active device secs setpriority %u failed: %s show device status tests <device> for LUKS partition header wipes key with number <key slot> from LUKS device writable Project-Id-Version: cryptsetup 1.1.1-rc1
Report-Msgid-Bugs-To: dm-crypt@saout.de
POT-Creation-Date: 2010-07-03 15:49+0200
PO-Revision-Date: 2010-06-11 21:38+0200
Last-Translator: Jakub Bogusz <qboosh@pld-linux.org>
Language-Team: Polish <translation-team-pl@lists.sourceforge.net>
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
 
<akcja> to jedno z:
 
<nazwa> to urz�dzenie do utworzenia wewn�trz %s
<urz�dzenie> to zaszyfrowane urz�dzenie
<numer klucza> to numer klucza LUKS do zmiany
<plik klucza> to opcjonalny plik nowego klucza dla akcji luksAddKey
 
Domy�lne wkompilowane parametry szyfrowania urz�dze�:
	plain: %s, bit�w klucza: %d, skr�t has�a: %s
	LUKS1: %s, bit�w klucza: %d, skr�t nag��wka LUKS: %s
 
UWAGA: nag��wek prawdziwego urz�dzenia ma inny UUID ni� kopia zapasowa! %s: wymaga %s jako argument�w (przestarza�e, p. strona man) <urz�dzenie> <urz�dzenie> <numer klucza> <uz�dzenie> <nazwa>  <urz�dzenie> [<plik klucza>] <urz�dzenie> [<nowy plik klucza>] <nazwa> <nazwa> <urz�dzenie> Wyr�wnanie danych do granicy <n> sektor�w - dla luksFormat Wszyskie miejsca na klucze s� pe�ne.
 Brak argumentu <akcja>. BIT�W BLKGETSIZE nie powiod�o si� na urz�dzeniu %s.
 BLKROGET nie powiod�o si� na urz�dzeniu %s.
 Kopia zapasowa nag��wka i kluczy urz�dzenia LUKS Plik kopii zapasowej %s nie istnieje.
 Plik kopii zapasowej nie zawiera prawid�owego nag��wka LUKS.
 Nie mo�na wykona� weryfikacji has�a, je�li wej�ciem nie jest terminal.
 Nie mo�na sformatowa� LUKS-a bez urz�dzenia.
 Nie mo�na wyczy�ci� nag��wka na urz�dzeniu %s.
 Nie mo�na doda� klucza, wszystkie miejsca na klucze wy��czone i nie podano klucza wolumenu.
 Nie mo�na utworzy� nag��wka LUKS: uzyskanie skr�tu nag��wka nie powiod�o si� (przy u�yciu algorytmu %s).
 Nie mo�na utworzy� nag��wka LUKS: odczyt losowego zarodka nie powi�d� si�.
 Nie mo�na uzyska� informacji o urz�dzeniu %s.
 Nie mo�na odczyta� priorytetu procesu.
 Nie mo�na zainicjowa� backendu kryptograficznego.
 Nie mo�na zainicjowa� device-mappera. Czy modu� j�dra dm_mod jest wczytany?
 Nie mo�na odczyta� %d bajt�w z pliku klucza %s.
 Nie mo�na otworzy� urz�dzenia %s do %sdost�pu %s.
 Nie mo�na otworzy� urz�dzenia %s.
 Nie mo�na otworzy� urz�dzenia: %s
 Nie mo�na otworzy� pliku %s.
 Nie mo�na otworzy� pliku kopii zapasowej nag��wka %s.
 Nie mo�na odczyta� urz�dzenia %s.
 Nie mo�na odczyta� pliku kopii zapasowej nag��wka %s.
 Nie mo�na odtworzy� klucza wolumenu dla zwyk�ego urz�dzenia.
 Nie mo�na odblokowa� pami�ci. Nie mo�na wyczy�ci� urz�dzenia %s.
 Nie mo�na zapisa� pliku kopii zapasowej nag��wka %s.
 Polecenie nie powiod�o si� z kodem %i Polecenie si� powiod�o.
 Utworzenie odwzorowania tylko do odczytu DM-UUID dla urz�dzenia %s zosta� skr�cony.
 Offset danych lub rozmiar klucza r�ni� si� mi�dzy urz�dzeniem a kopi� zapasow�; przywr�cenie nie powiod�o si�.
 Urz�dzenie %s %s%s Urz�dzenie %s ju� istnieje.
 Urz�dzenie %s nie istnieje lub dost�p jest zabroniony.
 Urz�dzenie %s ma zerowy rozmiar.
 Urz�dzenie %s jest zaj�te.
 Urz�dzenie %s nie jest prawid�owym urz�dzeniem LUKS. Urz�dzenie %s nie jest prawid�owym urz�dzeniem LUKS.
 Urz�dzenie %s nie jest aktywne.
 Urz�dzenie %s jest zbyt ma�e.
 Wy�wietlenie kr�tkiej informacji o sk�adni Bez pyta� o potwierdzenie Has�o LUKS do usuni�cia:  Has�o LUKS:  Dowolne has�o:  Dowolne pozosta�e has�o LUKS:  Nowe has�o dla klucza:  Has�o dla %s:  Has�o:  B��d podczas uaktualniania nag��wka LUKS na urz�dzeniu %s.
 B��d podczas ponownego odczytu nag��wka LUKS po uaktualnieniu na urz�dzeniu %s.
 B��d podczas odczytu has�a z terminala.
 B��d podczas odczytu has�a.
 Nie uda�o si� uzyska� dost�pu do urz�dzenia do tymczasowego przechowywania kluczy.
 Nie uda�o si� uzyska� katalogu device mappera. Nie mo�na otworzy� pliku klucza %s.
 Nie uda�o si� otworzy� urz�dzenia do tymczasowego przechowywania kluczy.
 Nie uda�o si� odczyta� klucza.
 Nie uda�o si� ustawi� odwzorowania klucza dm-crypt dla urz�dzenia %s.
Prosz� sprawdzi�, czy j�dro obs�uguje szyfr %s (wi�cej informacji w syslogu).
%s Nie uda�o si� wykona� stat na pliku klucza %s.
 Nie uda�o si� zapisa� klucza.
 Plik z kopi� zapasow� nag��wka LUKS i kluczy. Opcje pomocnicze: Liczba sektor�w zaszyfrowanych danych do pomini�cia Jak cz�sto mo�na powtarza� pr�by wprowadzenia has�a B��dne urz�dzenie %s.
 B��dny rozmiar klucza %d.
 B��dny rozmiar klucza.
 B��dne parametry szyfru plain.
 Klucz %d nie jest aktywny. Nie mo�na wyczy�ci�.
 B��d przetwarzania klucza (u�yto algorytmu skr�tu %s).
 Rozmiar klucza musi by� wielokrotno�ci� 8 bit�w Klucz numer %d jest aktywny, nale�y go najpierw wyczy�ci�.
 Miejsce na klucz %d jest pe�ne, prosz� wybra� inne.
 Numer klucza %d jest b��dny, prosz� wybra� warto�� mi�dzy 0 a %d.
 Numer klucza %d jest b��dny, prosz� wybra� numer od 0 do %d.
 Numer klucza %d jest nieprawid�owy.
 Klucz %d nie jest u�ywany.
 Klucz %d zawiera zbyt ma�o pas�w. Zmieniony nag��wek?
 Klucz numer %d odblokowany.
 Klucz %d sprawdzony.
 Wykryto nag��wek LUKS, ale urz�dzenie %s jest zbyt ma�e.
 Dla tego has�a nie ma dost�pnego klucza.
 Nie wykryto znanego wzorca okre�laj�cego szyfr.
 Niekompatybilne opcje PBKDF2 (przy u�yciu algorytmu skr�tu %s).
 Zignorowano przestarza�� opcj� --non-exclusive.
 Wymagana jest opcja --header-backup-file.
 Brak pami�ci podczas odczytu has�a.
 Czas iteracji PBKDF2 dla LUKS (w milisekundach) Has�a nie zgadzaj� si�.
 Wypisanie wersji pakietu Odczyt klucza z pliku (mo�e to by� /dev/random) Odczyt klucza wolumenu (klucza g��wnego) z pliku. ��dany skr�t LUKS %s nie jest obs�ugiwany.
 ��dany plik %s ju� istnieje.
 Odtworzenie nag��wka i kluczy urz�dzenia LUKS z kopii zapasowej Wznowienie zatrzymanego urz�dzenia LUKS. SEKTOR�W Wy�wietlanie informacji diagnostycznych Wy�wietlenie tego opisu Wy�wietlanie bardziej szczeg�owych komunikat�w b��d�w Numer dla nowego klucza (domy�lny: pierwszy wolny) Zatrzymanie urz�dzenia LUKS i wyczyszczenie klucza (zamra�a wszystkie operacje we/wy). Szyfr u�ywany do zaszyfrowania dysku (p. /proc/crypto) Skr�t u�ywany do utworzenia klucza szyfruj�cego z has�a Akcja reload jest przestarza�a. Prosz� u�y� "dmsetup reload", je�li to naprawd� konieczne.
UWAGA: na urz�dzeniach LUKS nie nale�y u�ywa� akcji reload. Je�li to ten przypadek, prosz�
teraz wcisn�� Ctrl-C.
 Rozmiar urz�dzenia Rozmiar klucza szyfruj�cego Offset pocz�tku na urz�dzeniu przechowuj�cym To jest ostatni klucz. Urz�dzenie stanie si� bezu�yteczne po usuni�ciu tego klucza. Ta operacja nie jest obs�ugiwana dla urz�dzenia szyfruj�cego %s.
 Ta operacja jest obs�ugiwana tylko na urz�dzeniach LUKS.
 To nieodwo�alnie nadpisze dane na %s. Limit czasu przy interaktywnym pytaniu o has�o (w sekundach) Nie uda�o si� uzyska� rozmiaru sektora dla %s Nieznana akcja. Nieznany typ ��danego urz�dzenia szyfruj�cego %s.
 Nieobs�ugiwana wersja LUKS %d.
 Sprawdzenie poprawno�ci has�a poprzez dwukrotne pytanie Weryfikacja has�a:  Wolumen %s ju� zosta� zatrzymany.
 Wolumen %s nie jest aktywny.
 Wolumen %s nie jest zatrzymany.
 Bufor klucza wolumenu zbyt ma�y.
 Klucz wolumenu nie pasuje do wolumenu.
 UWAGA! Pami�� mo�e nie by� bezpieczna. Czy jeste� rootem?
 Uwaga: ��dano odczytu ca�o�ci, ale plik klucza %s nie jest zwyk�ym plikiem i funkcja mo�e nigdy si� nie zako�czy�.
 Podano z�y format UUID, tworzenie nowego.
 [OPCJA...] <akcja> <parametry-akcji>] dodanie klucza do urz�dzenia LUKS ju� zawiera nag��wek LUKS. Nadpisanie nag��wka zniszczy istniej�ce klucze. utworzenie urz�dzenia nie zawiera nag��wka LUKS. Nadpisanie nag��wka mo�e zniszczy� dane na tym urz�dzeniu. zrzut informacji o partycji LUKS wy��cznego  sformatowanie urz�dzenia LUKS to samo, co luksKillSlot (PRZESTARZA�E - p. strona man) klucz %d wybrany do usuni�cia.
 b��d przydzielania pami�ci w action_luksFormat modyfikacja aktywnego urz�dzenia (PRZESTARZA�E - p. strona man) ms otwarcie urz�dzenia LUKS jako odwzorowania <nazwa> wypisanie UUID-a urz�dzenia LUKS tylko do odczytu usuni�cie odwzorowania LUKS usuni�cie urz�dzenia usuni�cie podanego klucza lub pliku klucza z urz�dzenia LUKS zmiana rozmiaru aktywnego urz�dzenia s setpriority %u nie powiod�o si�: %s pokazanie stanu urz�dzenia sprawdzenie <urz�dzenia> pod k�tem nag��wka partycji LUKS wyczyszczenie klucza o numerze <numer klucza> z urz�dzenia LUKS do zapisu 