��    �      d  �   �
      8     9  �   O  �     <   �     �     �               1     B     X     r     y  7   �     �     �     �      �       &   6     ]  .   |  4   �  "   �        D   $  A   i  7   �  !   �       "   #  A   F  +   �  '   �     �     �       #   "     F  #   ^  -   �     �     �  $   �               4  %   N  F   t     �     �  *   �          *     >     X     q     �  %   �     �     �  %   �  #        @     Z  1   m  8   �  (   �       ,     )   I     s  *   �  !   �  y   �     W      t  *   �     �  ?   �  4        C     W     m      �     �  %   �  !   �  0   	  8   :  @   s     �     �  D   �     ,     C  1   Z  '   �  0   �  ,   �  )     (   <  &   e     �     �  -   �  '   �  )     !   =  '   _     �     �     �     �  "   �  /   �  6   +  6   b  >   �  �   �     �      �   &   �   M   �   5   D!  2   z!  +   �!  6   �!  #   "     4"  (   D"     m"  .   �"     �"      �"     �"     	#     &#  &   D#  3   k#  h   �#  0   $  '   9$     a$  N   x$     �$  O   �$     %%  
   E%     P%  5   f%  #   �%  ,   �%  0   �%     &  "   $&     G&  	   a&     k&     &  1   �&     �&     �&     �&     �&  (   '  1   /'     a'  p  j'     �(  �   �(  �   �)  C   k*     �*     �*     �*     �*     +     +     ,+     E+     L+  8   [+  !   �+     �+     �+  (   �+  &   ,  :   *,      e,  =   �,  6   �,  $   �,  '    -  d   H-  S   �-  H   .  +   J.     v.  '   �.  B   �.  -   /  /   //     _/     |/     �/  /   �/     �/  .    0  /   /0     _0     y0  /   �0  !   �0     �0     �0  &   1  j   B1     �1     �1  ,   �1     2     2     92     U2  $   q2     �2  "   �2     �2     �2  .   3  %   73     ]3     w3  2   �3  C   �3  /    4      04  >   Q4  :   �4  ,   �4  ;   �4  0   45  �   e5  3   6  0   I6  9   z6     �6  D   �6  <   7     E7     X7     s7  ,   �7  *   �7  0   �7  (   8  )   =8  3   g8  B   �8     �8     �8  O   9     j9      �9  7   �9  6   �9  >   :  .   W:  %   �:  +   �:  %   �:  '   �:     &;  0   <;  %   m;  "   �;     �;  3   �;  $   
<     /<     8<     U<  $   q<  8   �<  X   �<  @   (=  E   i=  �   �=     }>  !   �>     �>  e   �>  @   ;?  0   |?  C   �?  8   �?  )   *@     T@  +   e@     �@  ?   �@     �@  $   A     -A  #   IA  )   mA  1   �A  4   �A  r   �A  ,   qB  +   �B  !   �B  d   �B     QC  S   ]C  (   �C     �C     �C  7   �C  )   4D  (   ^D  0   �D     �D  %   �D     �D     �D     E     "E  8   0E     iE     �E     �E     �E  (   �E  8   �E     F     �              �   �   g   Q      n   .   7   Z   �      �       {   %   �   �   `   o   -   �   S   T      5       �       y   [       P   v   }   r          B      O   F   l   _       R   �   �   ;   W   �   0   #                   �       
          "           �   �   @       x   �   Y       8   �   �       �   H   '             �          4       h   s       �   a   �   p   �   ^       N   �       =         D               6   K   	   2      G      �   \       A       �       ]   �   M   ,   b   i         �       e   �   V       u       X          >   :       �              c   z   (   ~   �          I           �   E          +           J                 L          f   �                         U   �   ?      �       C   �   �       �       q   |          t   �      /   )   9       &   $      1   *   !   3   �   j   w           �   m   d       k   <   �    
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
 memory allocation error in action_luksFormat modify active device - DEPRECATED - see man page msecs open LUKS device as mapping <name> print UUID of LUKS device read-only remove LUKS mapping remove device removes supplied key or key file from LUKS device resize active device secs setpriority %u failed: %s show device status tests <device> for LUKS partition header wipes key with number <key slot> from LUKS device writable Project-Id-Version: cryptsetup 1.1.0-rc4
Report-Msgid-Bugs-To: dm-crypt@saout.de
POT-Creation-Date: 2010-07-03 15:49+0200
PO-Revision-Date: 2010-01-08 11:37+0100
Last-Translator: Daniel Nylander <po@danielnylander.se>
Language-Team: Swedish <tp-sv@listor.tp-sv.se>
Language: sv
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
 
<åtgärd> är en av:
 
<namn> är enheten att skapa under %s
<enhet> är den krypterade enheten
<nyckelplats> är numret för LUKS-nyckelplatsen att ändra
<nyckelfil> valfri nyckelfil för den nya nyckeln för luksAddKey-åtgärden
 
Inkompilerade standardchifferparametrar för enheter:
	plain: %s, Nyckel: %d bitar, Lösenordshashning: %s
	LUKS1: %s, Nyckel: %d bitar, LUKS header-hashning: %s
 
VARNING: verkligt enhetshuvud har annat UUID än säkerhetskopian! %s: kräver %s som argument (Föråldrad, se manualsida) <enhet> <enhet> <nyckelplats> <enhet> <namn>  <enhet> [<nyckelfil>] <enhet> [<ny nyckelfil>] <namn> <namn> <enhet> Justera nyttolast i <n> sektorgränser - för luksFormat Alla nyckelplatser är upptagna.
 Argumentet <åtgärd> saknas. BITAR BLKGETSIZE misslyckades på enheten %s.
 BLKROGET misslyckades på enheten %s.
 Säkerhetskopiera huvud och nyckelplatser från LUKS-enhet Säkerhetskopian %s finns inte.
 Säkerhetskopian innehåller inte något giltigt LUKS-huvud.
 Kan inte verifiera lösenfras på icke-tty-ingångar.
 Kan inte formatera LUKS utan enhet.
 Kan inte rensa huvudet på enheten %s.
 Kan inte lägga till nyckelplats. Alla platser är inaktiverade och ingen volymnyckel har angivits.
 Kan inte skapa LUKS-huvud: huvudsammanfattning misslyckades (använder hashen %s).
 Kan inte skapa LUKS-huvud: läsning av slumpmässigt salt misslyckades.
 Kan inte hämta information om enheten %s.
 Kan inte få processprioritet.
 Kan inte initiera krypteringsbakände.
 Kan inte initiera device-mapper. Är kärnmodulen dm_mod inläst?
 Kan inte läsa %d byte från nyckelfilen %s.
 Kan inte öppna enheten %s för %s%s åtkomst.
 Kan inte öppna enheten %s.
 Kan inte öppna enheten: %s
 Kan inte öppna filen %s.
 Kan inte öppna säkerhetskopia för huvud %s.
 Kan inte läsa enheten %s.
 Kan inte läsa säkerhetskopia för huvud %s.
 Kan inte hämta volymnyckel för vanlig enhet.
 Kan inte låsa upp minne. Kan inte rensa enheten %s.
 Kan inte skriva säkerhetskopia för huvud %s.
 Kommandot misslyckades med kod %i Kommandot lyckades.
 Skapa en skrivskyddad mappning DM-UUID för enheten %s förkortades.
 Dataoffset eller nyckelstorlek skiljer sig på enhet och säkerhetskopia. Återställningen misslyckades.
 Enhet %s %s%s Enheten %s finns redan.
 Enheten %s finns inte eller åtkomst nekas.
 Enheten %s har noll storlek.
 Enheten %s är upptagen.
 Enheten %s är inte aktiv.
 Enheten %s är för liten.
 Visa kort information om användning Fråga inte efter bekräftelse Ange LUKS-lösenfras att ta bort:  Ange LUKS-lösenfras:  Ange valfri lösenfras:  Ange eventuell återstående LUKS-lösenfras:  Ange ny lösenfras för nyckelplats:  Ange lösenfras för %s:  Ange lösenfras:  Fel vid uppdatering av LUKS-huvud på enheten %s.
 Fel vid omläsning av LUKS-huvud efter uppdatering på enheten %s.
 Fel vid läsning av lösenfras från terminal.
 Fel vid läsning av lösenfras.
 Misslyckades med att komma åt temporär nyckellagringsenhet.
 Misslyckades med att läsa av katalog för enhetsmappning. Misslyckades med att öppna nyckelfilen %s.
 Misslyckades med att öppna temporär nyckellagringsenhet.
 Misslyckades med att läsa från nyckellagring.
 Misslyckades med att konfigurera nyckelmappning för dm-crypt för
enheten %s. Kontrollera att kärnan har stöd för chiffret %s
(kontrollera syslog för mer information).
%s Misslyckades med att ta status på nyckelfilen %s.
 Misslyckades med att skriva till nyckellagring.
 Fil med säkerhetskopior av LUKS-huvud och nyckelplatser. Hjälpflaggor: Hur många sektorer av krypterat data som ska hoppas över i början Hur många inmatningsförsök av lösenfrasen som kan göras Ogiltig enhet %s.
 Ogiltig nyckelstorlek %d.
 Ogiltig nyckelstorlek.
 Ogiltiga parametrar för vanlig kryptering.
 Nyckel %d är inte aktiv. Kan inte rensa.
 Nyckelstorlek måste vara en multipel av 8 bitar Nyckelplats %d är aktiv, rensa först.
 Nyckelplats %d är full. Välj en annan.
 Nyckelplats %d är ogiltig. Välj mellan 0 och %d.
 Nyckelplats %d är ogiltig. Välj en nyckelplats mellan 0 och %d.
 Nyckelplats %d är ogiltig.
 Nyckelplats %d används inte.
 Nyckelplats %d material inkluderar för få stripes. Har huvudet manipulerats?
 Nyckelplats %d är upplåst.
 Nyckelplats %d har verifierats.
 LUKS-huvud identifierat men enheten %s är för liten.
 Ingen nyckel finns tillgänglig med denna lösenfras.
 Inget känt chifferspecifikationsmönster kunde identifieras.
 Föråldrad flagga --non-exclusive ignoreras.
 Flaggan --header-backup-file krävs.
 Slut på minne vid läsning av lösenfras.
 PBKDF2-iterationstid för LUKS (i ms) Lösenfraserna stämmer inte överens.
 Skriv ut paketversion Läs nyckeln från en fil (kan vara /dev/random) Läs volymnyckeln (master) från fil. Begärd LUKS-hash %s stöds inte.
 Begärda filen %s finns redan.
 Återställ huvud och nyckelplatser för LUKS-enhet Återuppta LUKS-enhet i vänteläge. SEKTORER Visa felsökningsmeddelanden Visa detta hjälpmeddelande Visar mer detaljerade felmeddelanden Platsnummer för ny nyckel (standard är första lediga) Försätt LUKS-enhet i vänteläge och rensa nyckel (alla in-/ut-åtgärder är frusna). Chiffret som används för att kryptera disken (se /proc/crypto) Hashen som används för att skapa krypteringsnyckel från lösenfras Omläsningsåtgärden är föråldrad. Använd "dmsetup reload" om du verkligen behöver denna funktion.
VARNING: använd inte omläsning för "touch" på LUKS-enheter. Om så är fallet, tryck Ctrl-C nu.
 Storleken för enheten Storleken för krypteringsnyckeln Startoffset i bakändesenheten Detta är sista nyckelplatsen. Enheten kommer att bli oanvändbar efter att denna nyckel tagits bort. Denna åtgärd stöds inte för krypteringsenheter av typen %s.
 Denna åtgärd stöds endast för LUKS-enheter.
 Detta kommer att skriva över data på %s och går inte att ångra. Tidsgräns för interaktiv lösenfrasprompt (i sekunder) Kunde inte läsa av sektorstorlek för %s Okänd åtgärd. Okänd typ av krypteringsenhet %s begärd.
 LUKS-versionen %d stöds inte.
 Verifierar lösenfrasen genom att fråga efter den två gånger Verifiera lösenfras:  Volymen %s är redan i vänteläge.
 Volymen %s är inte aktiv.
 Volymen %s är inte i vänteläge.
 Buffert för volymnyckel är för liten.
 Volymnyckeln stämmer inte överens med volymen.
 VARNING!!! Potentiellt osäkert minne. Är du root?
 Varning: utförlig läsning begärd men nyckelfilen %s är inte en vanlig fil, funktionen kanske aldrig avslutas.
 Felaktigt UUID-format angavs, genererar ny.
 [FLAGGA...] <åtgärd> <åtgärdsspecifik>] lägg till nyckel till LUKS-enhet innehåller redan LUKS-huvud. Ersättningen av huvud kommer att förstöra befintliga nyckelplatser. skapa enhet innehåller inget LUKS-huvud. Ersättning av huvud kan förstöra data på enheten. skriver ut information om LUKS-partition exklusiv formaterar en LUKS-enhet identisk med luksKillSlot - FÖRÅLDRAD - se manualsida nyckeplats %d markerad för borttagning.
 minnesallokeringsfel i action_luksFormat ändra aktiv enhet - FÖRÅLDRAD - se manualsida ms öppna LUKS-enhet som mappning <namn> skriv ut UUID för LUKS-enhet skrivskyddad ta bort LUKS-mappning ta bort enhet tar bort angiven nyckel eller nyckelfil från LUKS-enhet ändra storlek på aktiv enhet s setpriority %u misslyckades: %s visa enhetsstatus testar <enhet> för LUKS-partitionshuvud rensar nyckeln med nummer <nyckelplats> från LUKS-enhet skrivbar 