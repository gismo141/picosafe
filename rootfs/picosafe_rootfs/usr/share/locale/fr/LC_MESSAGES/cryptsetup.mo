��    �      �  �   �	      (     )  �   ?  <   �     ;     X     s     |     �     �     �     �     �  7   �           5     P      U     v  &   �     �  .   �  "   
      -  D   N  A   �  7   �  !        /  "   M  A   p  '   �     �     �     
  #         D  #   \  -   �     �     �  $   �               2  %   L  F   r     �     �  *   �          (     <     V     o     �  %   �     �     �  %   �  #        >     X  1   k  8   �  ,   �  )     *   -  !   X  y   z      �  *        @  ?   N     �     �     �      �     �  %     !   2  0   T  8   �  @   �     �       D   2     w     �  1   �  '   �  0   �  ,   0  )   ]  &   �     �  -   �  '   �  )     !   D  '   f     �     �     �     �  "   �  /     6   2  6   i  >   �  �   �     �     �  &   �  M   �  5   K  2   �  +   �  6   �  #        ;     K  .   i      �     �     �     �  &      3   5   0   i   '   �      �   N   �      (!  O   6!     �!  
   �!     �!  5   �!  #   �!  ,   !"  0   N"     "  "   �"     �"  	   �"     �"     �"  1   �"      #     5#     :#     T#  (   g#  1   �#     �#  `  �#     ,%    G%  \   M&  #   �&  !   �&     �&  &   '     ('  $   @'  0   e'     �'     �'  O   �'  /   (     3(     R(  0   W(  .   �(  J   �(  *   )  A   -)  4   o)  6   �)  �   �)  �   b*  O   �*  E   =+  0   �+  <   �+  \   �+  >   N,  *   �,  ,   �,  #   �,  <   	-  )   F-  ;   p-  \   �-  %   	.  A   /.  =   q.      �.     �.  *   �.  2   /  �   D/     �/  $   0  ?   00  )   p0  "   �0  (   �0  %   �0  .   1     ;1  ,   X1  !   �1     �1  5   �1  A   �1  $   =2     b2  L   2  `   �2  H   -3  1   v3  M   �3  G   �3  �   >4  D   5  Q   I5     �5  ;   �5  '   �5  (   6  '   :6  (   b6  6   �6  5   �6  :   �6  J   37  P   ~7  `   �7  +   08  -   \8  t   �8  -   �8  ,   -9  B   Z9  9   �9  C   �9  1   :  +   M:  .   y:     �:  :   �:  5   ;  @   7;  (   x;  H   �;  5   �;      <  "   )<     L<  .   g<  S   �<  �   �<  R   o=  c   �=  �   &>     ?  #   1?  >   U?  q   �?  [   @  C   b@  ;   �@  N   �@  /   1A     aA  ,   rA  5   �A  (   �A     �A  '   B  /   EB  "   uB  ]   �B  F   �B  /   =C  '   mC  c   �C     �C  g   D  .   zD  	   �D     �D  ;   �D  @   E  6   OE  B   �E     �E  >   �E  &   F     5F     FF     fF  B   �F  &   �F     �F  G   �F  $   7G  9   \G  a   �G     �G     A      I   _       `   �       v   a   �             *       5   m   c   $   }       .   ?   3   N   X   �           �      y       �          e   ,   C                 K   ;          Z      7       :          4      R   B   #      �       M   @      9              F              o   ~   W           �   >           &   2   V   0      E       �       �       j   )   D       w   H   k      t   �       L               [   Q   �   �   i              �   �          8       �                     �          �   -           /       <   �   S      =   r           J          h   z           �       u   d   ]       b   U   p   G   �   �   "   6   1   Y       |   {   �               ^          (   T   %   �   q   +   x   �   �      	   s   O      '   g   l   P      �          n   �   f       �   !   \   
   �    
<action> is one of:
 
<name> is the device to create under %s
<device> is the encrypted device
<key slot> is the LUKS key slot number to modify
<key file> optional key file for the new key for luksAddKey action
 
WARNING: real device header has different UUID than backup! %s: requires %s as arguments (Obsoleted, see man page.) <device> <device> <key slot> <device> <name>  <device> [<key file>] <device> [<new key file>] <name> <name> <device> Align payload at <n> sector boundaries - for luksFormat All key slots full.
 Argument <action> missing. BITS BLKGETSIZE failed on device %s.
 BLKROGET failed on device %s.
 Backup LUKS device header and keyslots Backup file %s doesn't exist.
 Backup file do not contain valid LUKS header.
 Can't format LUKS without device.
 Can't wipe header on device %s.
 Cannot add key slot, all slots disabled and no volume key provided.
 Cannot create LUKS header: header digest failed (using hash %s).
 Cannot create LUKS header: reading random salt failed.
 Cannot get info about device %s.
 Cannot get process priority.
 Cannot initialize crypto backend.
 Cannot initialize device-mapper. Is dm_mod kernel module loaded?
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
 Failed to access temporary keystore device.
 Failed to obtain device mapper directory. Failed to open temporary keystore device.
 Failed to read from key storage.
 Failed to setup dm-crypt key mapping for device %s.
Check that kernel supports %s cipher (check syslog for more info).
%s Failed to write to key storage.
 File with LUKS header and keyslots backup. Help options: How many sectors of the encrypted data to skip at the beginning Invalid device %s.
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
 PBKDF2 iteration time for LUKS (in ms) Print package version Read the key from a file (can be /dev/random) Read the volume (master) key from file. Requested LUKS hash %s is not supported.
 Requested file %s already exist.
 Restore LUKS device header and keyslots Resume suspended LUKS device. SECTORS Show debug messages Show this help message Shows more detailed error messages Slot number for new key (default is first free) Suspend LUKS device and wipe key (all IOs are frozen). The cipher used to encrypt the disk (see /proc/crypto) The hash used to create the encryption key from the passphrase The reload action is deprecated. Please use "dmsetup reload" in case you really need this functionality.
WARNING: do not use reload to touch LUKS devices. If that is the case, hit Ctrl-C now.
 The size of the device The size of the encryption key The start offset in the backend device This is the last keyslot. Device will become unusable after purging this key. This operation is not supported for %s crypt device.
 This operation is supported only for LUKS device.
 This will overwrite data on %s irrevocably. Timeout for interactive passphrase prompt (in seconds) Unable to obtain sector size for %s Unknown action. Unsupported LUKS version %d.
 Verifies the passphrase by asking for it twice Volume %s is already suspended.
 Volume %s is not active.
 Volume %s is not suspended.
 Volume key buffer too small.
 Volume key does not match the volume.
 WARNING!!! Possibly insecure memory. Are you root?
 Wrong UUID format provided, generating new one.
 [OPTION...] <action> <action-specific>] add key to LUKS device already contains LUKS header. Replacing header will destroy existing keyslots. create device does not contain LUKS header. Replacing header can destroy data on that device. dump LUKS partition information exclusive  formats a LUKS device identical to luksKillSlot - DEPRECATED - see man page key slot %d selected for deletion.
 memory allocation error in action_luksFormat modify active device - DEPRECATED - see man page msecs open LUKS device as mapping <name> print UUID of LUKS device read-only remove LUKS mapping remove device removes supplied key or key file from LUKS device resize active device secs setpriority %u failed: %s show device status tests <device> for LUKS partition header wipes key with number <key slot> from LUKS device writable Project-Id-Version: cryptsetup 1.1.0-rc3
Report-Msgid-Bugs-To: dm-crypt@saout.de
POT-Creation-Date: 2010-07-03 15:49+0200
PO-Revision-Date: 2009-11-27 20:10+0100
Last-Translator: Solveig <perso@solveig.org>
Language-Team: French <traduc@traduc.org>
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
<action> est l'une de :
 
<nom> est le périphérique à créer dans %s
<périphérique> est le périphérique chiffré
<emplacement> est le numéro de l'emplacement de clé LUKS à modifier
<fichier de clé> est un fichier optionnel contenant la nouvelle clé pour l'action luksAddKey
 
ATTENTION : l'en-tête du périphérique a un UUID différent de celui de la sauvegarde ! %s : les arguments %s sont requis. (Obsolète, voir la page de man). <périphérique> <périphérique> <emplacement de clé> <périphérique> <nom>  <périphérique> [<fichier de clé>] <périphérique> [<fichier de la nouvelle clé>] <nom> <nom> <périphérique> Utiliser une limite de <n> secteurs pour aligner les données - pour luksFormat Tous les emplacements de clés sont utilisés.
 Il manque l'argument <action>. BITS BLKGETSIZE a échoué sur le périphérique %s.
 BLKROGET a échoué sur le périphérique %s.
 Sauvegarder l'en-tête et les emplacements de clés du périphérique LUKS Le fichier de sauvegarde %s n'existe pas.
 Le fichier de sauvegarde ne contient pas d'en-tête LUKS valide.
 Impossible de formater en LUKS sans périphérique.
 Impossible d'effacer l'en-tête du périphérique %s.
 Impossible d'ajouter un emplacement de clé, tous les emplacements sont désactivés et aucune clé n'a été fournie pour ce volume.
 Impossible de créer un en-tête LUKS : le résumé (« digest ») de l'en-tête a échoué (en utilisant l'algorithme de hachage %s).
 Impossible de créer un en-tête LUKS : échec lors de la lecture de l'aléa.
 Impossible d'obtenir des informations au sujet du périphérique %s.
 Impossible d'obtenir la priorité du processus.
 Impossible d'initialiser le « backend » de chiffrement.
 Impossible d'initialiser le « device-mapper ». Le module noyau dm_mod est-il chargé ?
 Impossible d'ouvrir le périphérique %s pour un accès %s%s.
 Impossible d'ouvrir le périphérique %s.
 Impossible d'ouvrir le périphérique : %s
 Impossible d'ouvrir le fichier %s.
 Impossible d'ouvrir le fichier de sauvegarde d'en-tête %s.
 Impossible de lire le périphérique %s.
 Impossible de lire le fichier de sauvegarde d'en-tête %s.
 Impossible de récupérer la clé du volume pour les périphériques de type « plain ».
 Impossible de débloquer la mémoire. Impossible d'effacer de façon sécurisée le périphérique %s.
 Impossible d'écrire le fichier de sauvegarde d'en-tête %s.
 L'opération a échoué, code %i Opération réussie.
 Créer un « mapping » en lecture seule Le DM-UUID du périphérique %s a été tronqué.
 Il y a une incohérence entre le périphérique et la sauvegarde, au niveau du décalage des données (« offset ») ou de la taille de la clé. La restauration a échoué.
 Périphérique %s %s%s Le périphérique %s existe déjà.
 Le périphérique %s n'existe pas, ou l'accès y est interdit.
 Le périphérique %s a une taille nulle.
 Le périphérique %s est occupé.
 Le périphérique %s n'est pas activé.
 Le périphérique %s est trop petit.
 Afficher, en résumé, la syntaxe d'invocation Ne pas demander confirmation Entrez la phrase de passe LUKS à effacer : Entrez la phrase de passe LUKS : Entrez une phrase de passe : Entrez une phrase de passe LUKS qui restera valide : Entrez une nouvelle phrase de passe pour l'emplacement de clé : Entrez la phrase de passe pour %s : Entrez la phrase de passe : Erreur lors de la mise à jour de l'en-tête LUKS sur le périphérique %s.
 Erreur lors de la relecture de l'en-tête LUKS après la mise à jour sur le périphérique %s.
 Impossible d'accéder au périphérique de stockage temporaire de clé.
 Impossible d'obtenir l'annuaire du device mapper. Échec lors de l'ouverture du périphérique de stockage temporaire de clé.
 Échec lors de la lecture depuis l'emplacement de stockage de la clé.
 Impossible de configurer la clé dm-crypt pour le périphérique %s.
Vérifiez que votre noyau supporte le chiffrement %s (pour davantage d'informations, regardez dans les journaux du système).
%s Échec lors de l'écriture à l'emplacement de stockage de la clé.
 Fichier contenant une sauvegarde de l'en-tête LUKS et des emplacements de clés. Options d'aide : Combien de secteurs de données chiffrées sauter au début Le périphérique %s n'est pas valide.
 %d n'est pas une taille de clé valide.
 La taille de la clé n'est pas valide.
 Paramètres de chiffrement non valides.
 La clé %d n'est pas active. Impossible de l'effacer.
 La taille de la clé doit être un multiple de 8 bits L'emplacement de clé %d est activé, effacez-le d'abord.
 L'emplacement de clé %d est utilisé, merci d'en sélectionner un autre.
 L'emplacement de clé %d n'est pas valide, merci d'en choisir un entre 0 et %d.
 L'emplacement de clé %d n'est pas valide, merci de sélectionner un emplacement entre 0 et %d.
 L'emplacement de clé %d n'est pas valide.
 L'emplacement de clé %d n'est pas utilisé.
 Le matériel de clé contenu à l'emplacement %d a trop peu de « stripes ». L'en-tête a-t-il été modifié ?
 L'emplacement de clé %d a été débloqué.
 L'emplacement de clé %d a été vérifié.
 En-tête LUKs détecté mais le périphérique %s est trop petit.
 Aucune clé n'est disponible avec cette phrase de passe.
 Aucun motif connu d'algorithme de chiffrement n'a été détecté.
 L'option obsolète --non-exclusive est ignorée.
 L'option --header-backup-file est requise.
 Temps d'itération de PBKDF2 pour LUKS (en ms) Afficher la version du paquet Lit la clé depuis un fichier (qui peut être /dev/random) Lit la clé (maîtresse) du volume depuis un fichier. L'algorithme de hachage LUKS demandé (%s) n'est pas supporté.
 Le fichier demandé (%s) existe déjà.
 Restaurer l'en-tête et les emplacements de clés du périphérique LUKS Réveiller le périphérique LUKS de son hibernation. SECTEURS Afficher les messages de débogage Afficher ce message d'aide Affiche des messages d'erreur plus détaillés Numéro de l'emplacement pour la nouvelle clé (par défaut, le premier disponible) Mettre le périphérique LUKS en hibernation et effacer de façon sécurisée la clé (toutes les entrées/sorties sont suspendues). L'algorithme (« cipher ») utilisé pour chiffrer le disque (voir /proc/crypto) L'algorithme de hachage utilisé pour créer la clé de chiffrement à partir de la phrase de passe L'action « reload » est obsolète. Merci d'utiliser « dmsetup reload » si vous avez vraiment besoin de cette fonctionnalité.
ATTENTION : n'utilisez pas « reload » sur des périphériques LUKS. Si c'est le cas, tapez Ctrl-C.
 La taille du périphérique La taille de la clé de chiffrement Le décalage à partir du début du périphérique sous-jacent Ceci est le dernier emplacement de clé. Le périphérique sera inutilisable après la suppression de cette clé. Cette opération n'est pas possible pour les périphériques chiffrés de type « %s ».
 Cette opération n'est possible que pour les périphériques LUKS.
 Cette action écrasera définitivement les données sur %s. Délai d'expiration de la demande interactive de phrase de passe (en secondes) Impossible d'obtenir la taille de secteur de %s Action inconnue. La version %d de LUKS n'est pas supportée.
 Vérifie la phrase de passe en la demandant deux fois Le volume %s est déjà en hibernation.
 Le volume %s n'est pas actif.
 Le volume %s n'est pas en hibernation.
 Le tampon de la clé du volume est trop petit.
 Ceci n'est pas la clé du volume.
 ATTENTION !!! La mémoire n'est peut-être pas sécurisée. Êtes-vous super-utilisateur ?
 Le format d'UUID fourni est incorrect, un nouvel UUID sera généré.
 [OPTION...] <action> <paramètres de l'action>] ajouter une clé au périphérique LUKS contient déjà un en-tête LUKS. Remplacer l'en-tête détruira les emplacements de clés actuels. créer un périphérique ne contient pas d'en-tête LUKS. Remplacer l'en-tête peut détruire les données de ce périphérique. afficher les informations LUKS de la partition exclusif  formate un périphérique LUKS identique à luksKillSlot - OBSOLÈTE - voir la page de man l'emplacement de clé %d est sélectionné pour la suppression.
 erreur d'allocation de mémoire dans action_luksFormat modifier le périphérique actif - OBSOLÈTE - voir la page de man msecs ouvrir un périphérique LUKS avec <nom> comme « mapping » afficher l'UUID du périphérique LUKS en lecture seule retirer le « mapping » LUKS retirer le périphérique retire du périphérique LUKS la clé ou le fichier de clé fourni redimensionner le périphérique actif secs la priorité n'a pu être définie à %u avec « setpriority » : %s afficher le statut du périphérique teste si <périphérique> a un en-tête de partition LUKS efface de façon sécurisée la clé avec le numéro <emplacement de clé> du périphérique LUKS en écriture 