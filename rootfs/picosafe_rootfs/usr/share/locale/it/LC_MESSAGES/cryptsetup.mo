��    �      d  �   �
      8     9  �   O  �     <   �     �     �               1     B     X     r     y  7   �     �     �     �      �       &   6     ]  .   |  4   �  "   �        D   $  A   i  7   �  !   �       "   #  A   F  +   �  '   �     �     �       #   "     F  #   ^  -   �     �     �  $   �               4  %   N  F   t     �     �  *   �          *     >     X     q     �  %   �     �     �  %   �  #        @     Z  1   m  8   �  (   �       ,     )   I     s  *   �  !   �  y   �     W      t  *   �     �  ?   �  4        C     W     m      �     �  %   �  !   �  0   	  8   :  @   s     �     �  D   �     ,     C  1   Z  '   �  0   �  ,   �  )     (   <  &   e     �     �  -   �  '   �  )     !   =  '   _     �     �     �     �  "   �  /   �  6   +  6   b  >   �  �   �     �      �   &   �   M   �   5   D!  2   z!  +   �!  6   �!  #   "     4"  (   D"     m"  .   �"     �"      �"     �"     	#     &#  &   D#  3   k#  h   �#  0   $  '   9$     a$  N   x$     �$  O   �$     %%  
   E%     P%  5   f%  #   �%  ,   �%  0   �%     &  "   $&     G&  	   a&     k&     &  1   �&     �&     �&     �&     �&  (   '  1   /'     a'  l  j'     �(  �   �(  �   �)  N   m*     �*  %   �*     +     
+     $+     5+     N+     m+     t+  @   �+  %   �+     �+     ,  '   ,  %   4,  :   Z,  !   �,  6   �,  :   �,  *   )-  -   T-  g   �-  V   �-  E   A.  1   �.  0   �.  -   �.  N   /  0   g/  4   �/  !   �/  !   �/     0  5   10  "   g0  6   �0  A   �0  !   1  #   %1  7   I1  "   �1     �1  "   �1  ,   �1  t   2     �2      �2  4   �2  !   �2     3     .3      K3     l3     �3  *   �3     �3  #   �3  .   	4  1   84     j4     �4  ?   �4  Q   �4  5   /5  '   e5  >   �5  4   �5  &   6  @   (6  *   i6  �   �6  &   E7  ,   l7  3   �7     �7  3   �7  A   8     U8  '   l8  $   �8  -   �8  -   �8  ;   9  ,   Q9  6   ~9  A   �9  A   �9  $   9:  (   ^:  _   �:     �:     ;  ;   $;  2   `;  :   �;  ,   �;  -   �;  6   )<  .   `<  !   �<      �<  4   �<  -   =  /   5=  "   e=  8   �=  "   �=     �=     �=     >  1   '>  M   Y>  K   �>  <   �>  ?   0?  �   p?     =@  '   V@  '   ~@  d   �@  >   A  8   JA  7   �A  ?   �A  5   �A     1B  1   EB  $   wB  ,   �B     �B     �B     �B     C  ,   9C  /   fC  F   �C  �   �C  4   `D  )   �D  !   �D  c   �D     EE  `   TE  7   �E  
   �E     �E  >   F  2   OF  5   �F  @   �F     �F  ,   �F     +G     IG     YG     sG  :   �G     �G     �G     �G     H  >   H  ?   \H     �H     �              �   �   g   Q      n   .   7   Z   �      �       {   %   �   �   `   o   -   �   S   T      5       �       y   [       P   v   }   r          B      O   F   l   _       R   �   �   ;   W   �   0   #                   �       
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
 memory allocation error in action_luksFormat modify active device - DEPRECATED - see man page msecs open LUKS device as mapping <name> print UUID of LUKS device read-only remove LUKS mapping remove device removes supplied key or key file from LUKS device resize active device secs setpriority %u failed: %s show device status tests <device> for LUKS partition header wipes key with number <key slot> from LUKS device writable Project-Id-Version: cryptsetup-1.1.0-rc4
Report-Msgid-Bugs-To: dm-crypt@saout.de
POT-Creation-Date: 2010-07-03 15:49+0200
PO-Revision-Date: 2010-03-03 15:10+0100
Last-Translator: Sergio Zanchetta <primes2h@ubuntu.com>
Language-Team: Italian <tp@lists.linux.it>
Language: it
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
<azione> è una tra:
 
<nome> è il device da creare in %s
<device> è il device cifrato
<slot di chiave> è il numero dello slot di chiave LUKS da modificare
<file chiave> è il file chiave opzionale per la nuova chiave per l'azione luksAddKey
 
Parametri predefiniti del cifrario del device:
	in chiaro: %s, chiave: %d bit, hash della password: %s
	LUKS1: %s, chiave: %d bit, hash dell'header LUKS: %s
 
ATTENZIONE: l'header reale del device ha un UUID diverso da quello di backup. %s: richiede %s come argomenti (Obsoleto, consultare la pagina man.) <device> <device> <slot di chiave> <device> <nome>  <device> [<file chiave>] <device> [<nuovo file chiave>] <nome> <nome> <device> Allinea il payload agli estremi del settore <n> - per luksFormat Tutti gli slot di chiave sono pieni.
 Argomento <azione> mancante. BIT BLKGETSIZE non riuscito sul device %s.
 BLKROGET non riuscito sul device %s.
 Fa il backup dell'header del device e degli slot di chiave Il file di backup %s non esiste.
 Il file di backup non contiene un header LUKS valido.
 Impossibile verificare la passphrase da un input non tty.
 Impossibile formattare LUKS senza device.
 Impossibile ripulire l'header sul device %s.
 Impossibile aggiungere slot di chiave, tutti gli slot disabilitati e nessuna chiave di volume fornita.
 Impossibile creare l'header LUKS: digest dell'header non riuscito (usando l'hash %s).
 Impossibile creare l'header LUKS: lettura salt casuale non riuscita.
 Impossibile ottenere informazioni sul device %s.
 Impossibile ottenere la priorità del processo.
 Impossibile inizializzare il backend crypto.
 Impossibile inizializzare device-mapper. Il modulo kernel dm_mod è caricato?
 Impossibile leggere %d byte dal file chiave %s.
 Impossibile aprire il device %s per l'accesso %s%s.
 Impossibile aprire il device %s.
 Impossibile aprire il device: %s
 Impossibile aprire il file %s.
 Impossibile aprire il file di backup dell'header %s.
 Impossibile leggere il device %s.
 Impossibile leggere il file di backup dell'header %s.
 Impossibile recuperare la chiave di volume per device in chiaro.
 Impossibile sbloccare la memoria. Impossibile ripulire il device %s.
 Impossibile scrivere il file di backup dell'header %s.
 Comando non riuscito con codice %i Comando eseguito con successo.
 Crea una mappatura in sola lettura DM-UUID per il device %s è stato troncato.
 L'offset di dati oppure la dimensione della chiave sono diversi tra il device e il backup, ripristino non riuscito.
 Il device %s %s%s Il device %s è già esistente.
 Il device %s non esiste oppure è negato l'accesso.
 Il device %s ha dimensione zero.
 Il device %s è occupato.
 Il device %s non è attivo.
 Il device %s è troppo piccolo.
 Mostra il modo d'uso sintetico Non chiede conferma Inserire la passphrase LUKS da eliminare:  Inserire passphrase LUKS:  Inserire una qualsiasi passphrase:  Inserire qualunque passphrase LUKS rimanente:  Inserire nuova passphrase per lo slot di chiave:  Inserire passphrase per %s:  Inserire passphrase:  Errore durante l'aggiornamento dell'header LUKS sul device %s.
 Errore nella rilettura dell'header LUKS dopo l'aggiornamento sul dispositivo %s.
 Errore nella lettura della passphrase dal terminale.
 Errore nella lettura della passphrase.
 Accesso al device temporaneo di deposito chiavi non riuscito.
 Recupero della directory device mapper non riuscito. Impossibile aprire il file chiave %s.
 Apertura del device temporaneo di deposito chiavi non riuscita.
 Lettura dal deposito chiavi non riuscita.
 Impostazione mappatura di chiave dm-crypt non riuscita per il device %s.
Controllare che il kernel supporti il cifrario %s (controllare il syslog per maggiori informazioni).
%s Stat del file chiave %s non riuscito.
 Scrittura nel deposito chiavi non riuscita.
 File con header LUKS e backup degli slot di chiave. Opzioni di aiuto: Quanti settori dei dati cifrati saltare dall'inizio Quante volte può essere ritentato l'inserimento della passphrase Device %s non valido.
 Dimensione della chiave non valida %d.
 Dimensione della chiave non valida.
 Parametri di cifratura in chiaro non validi.
 Chiave %d non attiva. Impossibile ripulirla.
 La dimensione della chiave deve essere un multiplo di 8 bit Slot di chiave %d attivo, eliminarlo prima.
 Lo slot di chiave %d è pieno, selezionarne un altro.
 Lo slot di chiave %d non è valido, selezionarne uno tra 0 e %d.
 Lo slot di chiave %d non è valido, selezionarne uno tra 0 e %d.
 Lo slot di chiave %d non è valido.
 Lo slot di chiave %d non è utilizzato.
 Il materiale dello slot di chiave %d contiene troppe poche strisce. Manipolazione dell'header?
 Slot di chiave %d sbloccato.
 Slot di chiave %d verificato.
 Rilevato un header LUKS ma il device %s è troppo piccolo.
 Nessuna chiave disponibile con questa passphrase.
 Rilevato un modello di specifica cifrario non conosciuto.
 Opzione obsoleta, --non-exclusive ignorato.
 È richiesta l'opzione --header-backup-file.
 Memoria esaurita durante la lettura della passphrase.
 Tempo di iterazione di PBKDF2 per LUKS (in ms) Le passphrase non corrispondono.
 Stampa la versione del pacchetto Legge la chiave da un file (può essere /dev/random) Legge la chiave (master) del volume dal file. L'hash %s di LUKS richiesto non è supportato.
 Il file %s richiesto esiste già.
 Ripristina l'header del device LUKS e gli slot di chiave Ripristina il device LUKS sospeso. SETTORI Mostra i messaggi di debug Mostra questo messaggio d'aiuto Mostra i messaggi di errore con maggior dettaglio Numero dello slot per la nuova chiave (il primo libero è quello predefinito) Sospende il device LUKS e ripulisce la chiave (tutti gli IO sono congelati) Il cifrario usato per cifrare il disco (vedere /proc/crypto) L'hash usato per creare la chiave di cifratura dalla passphrase L'azione reload è deprecata. Usare "dmsetup reload" nel caso sia necessaria questa funzionalità.
ATTENZIONE: non usare ricarica per fare il touch del device LUKS. In questo caso, premere Ctrl-C adesso.
 La dimensione del device La dimensione della chiave di cifratura L'offset iniziale del device di backend Questo è l'ultimo slot di chiave. Il device sarà inutilizzabile dopo aver eliminato questa chiave. Questa operazione non è supportata per il device cifrato %s.
 Questa operazione è supportata solo per i device LUKS.
 Ciò sovrascriverà i dati in %s in modo irreversibile. Timeout per il prompt interattivo della passphrase (in secondi) Impossibile ottenere la dimensione del settore per %s Azione sconosciuta. Richiesto device cifrato di tipo %s sconosciuto.
 Versione %d di LUKS non supportata.
 Verifica la passphrase chiedendola due volte Verifica passphrase:  Il volume %s è già sospeso.
 Il volume %s non è attivo.
 Il volume %s non è sospeso.
 Buffer di chiave del volume troppo piccolo.
 La chiave di volume non corrisponde al volume.
 ATTENZIONE!!! È possibile che la memoria non sia sicura. Si è root?
 Attenzione: è richiesta una lettura esaustiva, ma essendo %s un file chiave non regolare la funzione potrebbe non ritornare mai.
 Fornito un formato UUID errato, generato uno nuovo.
 [OPZIONE...] <azione> <azione-specifica>] aggiunge la chiave al device LUKS contiene già un header LUKS. Sostituendo l'header verranno distrutti gli slot di chiave esistenti. crea il device non contiene un header LUKS. La sostituzione dell'header può distruggere i dati in quel device. esegue il dump delle informazioni sulla partizione LUKS esclusivo  formatta un device LUKS identico a luksKillSlot - DEPRECATO - consultare la pagina man slot di chiave %d selezionato per l'eliminazione.
 errore di allocazione di memoria in action_luksFormat modifica il device attivo - DEPRECATO - consultare la pagina man msec apre il device LUKS come mappatura in <nome> stampa l'UUID del device LUKS in sola lettura rimuove la mappatura LUKS rimuove il device rimuove la chiave fornita o il file chiave dal device LUKS ridimensiona il device attivo sec setpriority %u non riuscito: %s mostra lo stato del device esegue il test del <device> per l'header della partizione LUKS ripulisce la chiave con numero <slot di chiave> dal device LUKS in scrittura 