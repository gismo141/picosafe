��    �      �  �   �
      �     �  �   �  �   f  <   �     4     Q     l     u     �     �     �     �     �  7   �          .     I      N     o  &   �     �  .   �  4     "   8      [  D   |  A   �  7     !   ;     ]  "   {  A   �  +   �  '        4     L     d  #   z     �  #   �  -   �            $   6     [     w     �  %   �  F   �          "  *   =     h     �  %   �  &   �     �     �          *  %   F     l     �  %   �  #   �     �     �  1     8   D  (   }     �  ,   �  )   �       *   5  !   `  y   �     �        *   :     e  ?   s  4   �     �     �           %     F  0   f  %   �  !   �  0   �  8     @   I     �     �  D   �            1   0  '   b  0   �  9   �  ,   �  )   "  (   L  &   u     �     �  -   �  '   �  )   #  !   M  '   o     �     �     �     �  "   �  /      6   ;   6   r   >   �   �   �      �!     �!  &   �!  M   "  5   T"  2   �"  +   �"  6   �"  #    #     D#  (   T#     }#  .   �#     �#      �#     �#     $     6$  &   T$  3   {$  h   �$  0   %  '   I%     q%  N   �%     �%  O   �%     5&  
   U&     `&  5   v&  #   �&  ,   �&  0   �&     .'  "   4'     W'  	   q'     {'     �'  1   �'     �'     �'     �'     (  (   (  1   ?(     q(  �  z(  ;   7*    s*  �   w+  ^   _,  %   �,  /   �,     -     #-     >-  "   U-  (   x-     �-     �-  Z   �-  $   .  $   >.     c.  -   g.  +   �.  A   �.  *   /  <   ./  M   k/  >   �/  7   �/  e   00  c   �0  H   �0  4   C1  8   x1  2   �1  v   �1  5   [2  7   �2  #   �2  #   �2      3  :   23  %   m3  <   �3  F   �3  $   4  #   <4  <   `4  *   �4  &   �4  1   �4  7   !5  �   Y5     �5     6  K   6  ,   i6     �6  H   �6  I   �6  '   G7  +   o7  :   �7     �7  ,   �7  "   "8  -   E8  1   s8  1   �8  $   �8     �8  M   9  b   h9  I   �9  &   :  D   <:  5   �:     �:  7   �:  "   ;  �   2;  3   �;  %   ,<  Y   R<     �<  D   �<  A   
=     L=  #   l=      �=  /   �=  :   �=  B   >  0   _>  9   �>  7   �>  V   ?  O   Y?     �?  $   �?  _   �?  "   K@  &   n@  I   �@  G   �@  =   'A  b   eA  6   �A  =   �A  ;   =B  9   yB  0   �B     �B  M   �B  /   JC  B   zC  "   �C  E   �C  =   &D  	   dD  &   nD     �D  6   �D  P   �D  U   ;E  ?   �E  Q   �E  J  #F     nG      �G  ;   �G  c   �G  I   MH  @   �H  q   �H  @   JI  .   �I     �I  A   �I  1   J  H   HJ  $   �J     �J  %   �J     �J  *   K  =   CK  r   �K  �   �K  U   �L  9   M  "   ;M  b   ^M     �M  z   �M  &   ON     vN  -   �N  I   �N  )   �N  A   %O  X   gO  
   �O  6   �O  +   P     .P     ;P     YP  H   pP  8   �P     �P     �P  ,   Q  >   CQ  8   �Q     �Q        Z   G   v       �   6   �   ^           D   P            l   �   �   V   A       e   �       J       m   ]          E   7   o       �      _           \      N      ,      $   {             /   3   :   w   �   4   *   ?   S   #          �           !       �   �   <   =   8   |   @           �          I   `   q   �      �       h   �   �   u   �   �   �   g   b   [           }   n   �               �      i              -   �                 >   (           2   �          �           �                  �   5   t   ~   '   s      �           y   k       U      �   z           �       R      L   �   �   "   %   Y   O   �           �       ;   F   �       p   d               �   W   �          )      �   C       �   �      H   �       �   f   �          r                 
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
PO-Revision-Date: 2010-05-03 18:14+0930
Last-Translator: Clytie Siddall <clytie@riverland.net.au>
Language-Team: Vietnamese <vi-VN@googlegroups.com>
Language: vi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Generator: LocFactoryEditor 1.8
 
<hành_vi> là một của những điều dưới đây:
 
<tên> là thiết bị cần tạo dưới %s
<thiết_bị> là thiết bị đã mật mã
<khe_khoá> là số thứ tự khe khoá LUKS cần sửa đổi
<tập_tin_khoá> là tập tin khoá tuỳ chọn cho khoá mới trong hành động luksAddKey
 
Các tham số mặc định về mật mã thiết bị biên dịch vào:
	bình thường: %s, Khoá: %d bit, Tạo chuỗi duy nhất mật khẩu: %s
	LUKS1: %s, Khoá: %d bit, Tạo chuỗi duy nhất phần đầu LUKS: %s
 
CẢNH BÁO: phần đầu thiết bị thật có mã số UUID khác với bản sao lưu ! %s: cần thiết %s làm đối số (Bị phản đối, xem trang hướng dẫn.) <thiết_bị> <thiết_bị> <khe_khoá> <thiết_bị> <tên>  <thiết_bị> [<tập_tin_khoá>] <thiết_bị> [<tập_tin_khoá_mới>] <tên> <tên> <thiết_bị> Sắp hàng trọng tải ở <n> biên giới rãnh ghi — cho định dạng luksFormat Mọi khe khoá đều bị đầy.
 Đối số <hành_vi> còn thiếu. BIT BLKGETSIZE bị lỗi trên thiết bị %s.
 BLKROGET bị lỗi trên thiết bị %s.
 Sao lưu phần đầu và các khe khoá của thiết bị LUKS Tập tin sao lưu %s không tồn tại.
 Tập tin sao lưu không chứa phần đầu LUKS đúng.
 Không thể thẩm tra cụm từ mật khẩu trên đầu vào khác TTY.
 Không thể định dạng LUKS mà không có thiết bị.
 Không thể xoá phần đầu trên thiết bị %s.
 Không thể thêm khe khoá vì mọi khe đều bị tắt và không cung cấp khoá khối tin.
 Không thể tạo phần đầu LUKS: lỗi tạo bản tóm tắt (dùng chuỗi duy nhất %s).
 Không thể tạo phần đầu LUKS: lỗi đọc salt ngẫu nhiên.
 Không thể lấy thông tin về thiết bị %s.
 Không thể lấy mức ưu tiên của tiến trình.
 Không thể sơ khởi hậu phương mật mã.
 Không thể sơ khởi tiến trình ánh xạ thiết bị. Mô-đun hạt nhân « dm_mod » được nạp chưa?
 Không thể đọc %d byte từ tập tin khoá %s.
 Không thể mở thiết bị %s cho truy cập %s%s.
 Không thể mở thiết bị %s.
 Không thể mở thiết bị: %s
 Không thể mở tập tin %s.
 Không mở được tập tin sao lưu phần đầu %s.
 Không thể đọc thiết bị %s.
 Không đọc được tập tin sao lưu phần đầu %s.
 Không thể lấy khoá khối tin cho thiết bị bình thường.
 Không thể mở khoá vùng nhớ. Không thể xoá thiết bị %s.
 Không thể ghi nhớ tập tin sao lưu phần đầu %s.
 Câu lệnh đã thất bại với mã %i Câu lệnh đã chạy thành công.
 Tạo một sự ánh xạ chỉ cho phép đọc Mã số DM-UUID cho thiết bị %s bị cắt bớt.
 Khoảng bù dữ liệu hoặc kích cỡ khoá vẫn khác nhau trên thiết bị và bản sao lưu thì chức năng phục hồi bị lỗi.
 Thiết bị %s %s%s Thiết bị %s đã có.
 Thiết bị %s không tồn tại hoặc không đủ quyền truy cập.
 Thiết bị %s có kích cỡ số không.
 Thiết bị %s đang bận.
 Thiết bị %s không phải là một thiết bị kiểu LUKS đúng. Thiết bị %s không phải là một thiết bị kiểu LUKS đúng.
 Thiết bị %s không hoạt động.
 Thiết bị %s có kích cỡ quá nhỏ.
  Hiển thị thông điệp ngắn về cách sử dụng Đừng yêu cầu xác nhận Gõ cụm từ mật khẩu LUKS cần xoá: Gõ cụm từ mật khẩu LUKS:  Gõ bất cứ cụm từ mật khẩu nào:  Gõ cụm từ mật khẩu LUKS nào còn lại: Gõ cụm từ mật khẩu mới cho khe khoá:  Gõ cụm từ mật khẩu cho %s:  Gõ cụm từ mật khẩu:  Gặp lỗi trong khi cập nhật phần đầu LUKS trên thiết bị %s.
 Gặp lỗi trong khi đọc lại phần đầu LUKS sau khi cập nhật trên thiết bị %s.
 Gặp lỗi khi đọc cụm từ mật khẩu từ thiết bị cuối.
 Lỗi đọc cụm từ mật khẩu.
 Lỗi truy cập đến thiết bị lưu trữ khoá tạm thời.
 Lỗi lấy thư mục trình ánh xạ thiết bị. Lỗi mở tập tin khoá %s.
 Lỗi mở thiết bị lưu trữ khoá tạm thời.
 Lỗi đọc từ kho lưu khoá.
 Lỗi thiết lập chức năng ánh xạ khoá dm-crypt cho thiết bị %s.
Kiểm tra lại hạt nhân hỗ trợ mật mã %s
(xem sổ theo dõi hệ thống để tìm thêm thông tin.)
%s Lỗi lấy trạng thái về tập tin khoá %s.
 Lỗi ghi khoá vào kho lưu khoá.
 Tập tin chứa bản sao lưu phần đầu và các khe khoá của thiết bị LUKS. Tùy chọn trợ giúp: Bao nhiêu rãnh ghi dữ liệu mật mã cần bỏ qua ở đầu Số các lần có thể thử lại gõ cụm từ mật khẩu Thiết bị không đúng %s.
 Kích cỡ khoá không đúng %d.
 Kích cỡ khoá không đúng.
 Sai lập tham số mật mã bình thường.
 Khoá %d không hoạt động thì không xoá được.
 Lỗi xử lý khoá (dùng thuật toán chuỗi duy nhất %s).
 Kích cỡ khoá phải là bội số cho 8 bit Khe khoá %d vẫn hoạt động: cần tẩy trước.
 Khe khoá %d bị đầy, hãy chọn một khe khác.
 Khe khoá %d không đúng, hãy chọn một giá trị trong phạm vi 0 đến %d.
 Khe khoá %d không đúng: hãy chọn khe khoá trong phạm vi 0 đến %d.
 Khe khoá %d không đúng.
 Khe khoá %d không được dùng.
 Nguyên liệu khe khoá %d gồm có quá ít sọc. Có nên thao tác phần đầu không?
 Khe khoá %d được mở khoá.
 Khe khoá %d được thẩm định.
 Phát hiện được phần đầu LUKS mà thiết bị %s quá nhỏ.
 Không có khoá sẵn sàng dùng với cụm từ mật khẩu này.
 Không phát hiện mẫu chỉ thị mật mã đã biết.
 Gặp các tuỳ chọn PBKDF2 không tương thích (dùng thuật toán chuỗi duy nhất %s).
 Tuỳ chọn cũ « --non-exclusive » bị bỏ qua.
 Tuỳ chọn « --header-backup-file » cũng cần thiết.
 Tràn bộ nhớ trong khi đọc cụm từ mật khẩu.
 Thời gian lặp lại PBKDF2 cho LUKS (theo mili-giây) Hai cụm từ mật khẩu không trùng nhau.
 In ra phiên bản gói Đọc khoá từ một tập tin nào đó (có thể là « /dev/random ») Đọc khoá khối tin (chủ) từ tập tin. Không hỗ trợ chuỗi duy nhất LUKS %s được yêu cầu.
 Yêu cầu tập tin %s đã có.
 Phục hồi phần đầu và các khe khoá của thiết bị LUKS Tiếp tục lại sử dụng thiết bị LUKS bị ngưng. RÃNH GHI Hiển thị thông điệp gỡ lỗi Hiển thị trợ giúp này Hiển thị các thông điệp lỗi chi tiết hơn Số thứ tự khe cho khoá mới (mặc định là khe trống thứ nhất) Ngưng thiết bị LUKS và xoá khoá (thì mọi việc V/R đều đông cứng). Mật mã dùng để bảo vệ đĩa (xem « /proc/crypto ») Chuỗi duy nhất dùng để tạo khoá mật mã từ cụm từ mật khẩu Hành động nạp lại bị phản đối. Hãy sử dụng « dmsetup reload » trong trường hợp bạn thực sự yêu cầu chức năng này.
CẢNH BÁO : đừng sử dụng chức năng nạp lại để thao tác thiết bị kiểu LUKS. Trong trường hợp đó, bấm tổ hợp phím Ctrl-C ngay bây giờ.
 Kích cỡ của thiết bị Kích cỡ của khoá mật mã Khoảng bù đầu tiên trong thiết bị hậu phương Đây là khe khoá cuối cùng. Sau khi tẩy khoá này thì thiết bị không dùng được. Thao tác này không được hỗ trợ cho thiết bị mật mã %s.
 Thao tác này được hỗ trợ chỉ cho thiết bị LUKS.
 Hành động này sẽ ghi đè lên dữ liệu trên thiết bị %s một cách không phục hồi được. Thời hạn khi nhắc gõ cụm từ mật khẩu (theo giây) Không thể lấy kích cỡ rãnh ghi cho %s Hành động không rõ. Không rõ kiểu thiết bị mật mã %s được yêu cầu.
 Phiên bản LUKS không được hỗ trợ %d.
 Thẩm tra cụm từ mật khẩu bằng cách yêu cầu nó hai lần Thẩm tra cụm từ mật khẩu:  Khối %s đã bị ngưng.
 Khối tin %s không hoạt động.
 Khối %s không bị ngưng.
 Vùng đệm khoá khối tin quá nhỏ.
 Khoá khối tin không tương ứng với khối tin đó.
 CẢNH BÁO ! Có thể là vùng nhớ không an toàn. Bạn đang chạy dưới người chủ (root) không?
 Cảnh báo : yêu cầu một hàm đọc vét kiệt mà tập tin khoá %s không phải là một tập tin thông thường thì có thể là hàm chưa bao giờ trả lại.
 Đưa ra định dạng mã số UUID không đúng nên tạo định dạng mới.
 [TÙY_CHỌN...] <hành_vi> <đặc_trưng_cho_hành_vi>] thêm khoá vào thiết bị LUKS đã chứa phần đầu LUKS. Thay thế phần đầu thì cũng hủy các khe khoá đã có. tạo thiết bị không chứa phần đầu LUKS. Thay thế phần đầu thì cũng có thể hủy dữ liệu trên thiết bị đó. đổ thông tin về phân vùng LUKS dành riêng định dạng một thiết bị kiểu LUKS trùng với luksKillSlot - BỊ PHẢN ĐỐI - xem trang hướng dẫn khe khoá %d được chọn để xoá.
 gặp lỗi phân cấp vùng nhớ trong « action_luksFormat » sửa đổi thiết bị hoạt động - BỊ PHẢN ĐỐI - xem trang hướng dẫn mili-giây mở thiết bị LUKS như là bản ánh xạ <tên> in ra mã số UUID của thiết bị LUKS chỉ đọc gỡ bỏ sự ánh xạ LUKS gỡ bỏ thiết bị gỡ bỏ khỏi thiết bị LUKS khoá hoặc tập tin khoá đưa ra thay đổi kích cỡ của thiết bị hoạt động giây setpriority %u bị lỗi: %s hiển thị trạng thái về thiết bị thử <thiết_bị> có phần đầu phân vùng LUKS không xoá khỏi thiết bị LUKS khoá có số <khe_khoá> ghi được 