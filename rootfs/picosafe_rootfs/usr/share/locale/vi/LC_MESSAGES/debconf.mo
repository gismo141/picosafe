��    H      \  a   �         o   !  ?   �  �   �  .   h  #   �     �  '   �     �          '     ;  (   J     s  K   �     �     �     �  -   �     -	     <	     D	  Q   R	     �	  8   �	  M   �	  k   B
  8   �
  (   �
            u   4     �     �  X   �  @        N     d  ;   �  6   �  7   �  �   ,  /   �  4   �  =     Y   X  �  �  )   v  7   �     �  1   �  '   )  .   Q  C   �  F  �       �   $     �     �  n   �     ;  @   T     �  &   �     �     �  '   �       !   /     Q  a   m     �  �  �  h   y  8   �  �     5   �  =     /   P  =   �     �     �     �     	  "     7   3  �   k     �  /   �     -  U   9     �     �     �  �   �     K  i   h  �   �  �   Y  Q   '  ,   y     �  2   �  �   �  	   �     �  �   �  a   M      �   &   �   i   �   U   Q!  E   �!  �   �!  O   �"  ]   �"  Y   T#  T   �#    $  6   �&  D   �&  0   �&  E   0'  ?   v'  U   �'  x   (  �  �(     C*  �   \*     &+  <   3+  �   p+  9    ,  d   Z,  "   �,  M   �,     0-     7-  /   P-  ,   �-  '   �-  5   �-  �   .     �.        5       (       C                    ?                       1      ,                !   @       +                  )       4   >   -   <                 9   0   =   7               .      F   /   D           :   B   2                               3   $          E   H         ;      &      8          "       %   #   *   
      G      	   6   A   '    
        --outdated		Merge in even outdated translations.
	--drop-old-templates	Drop entire outdated templates. 
  -o,  --owner=package		Set the package that owns the command.   -f,  --frontend		Specify debconf frontend to use.
  -p,  --priority		Specify minimum priority question to show.
       --terse			Enable terse mode.
 %s failed to preconfigure, with exit status %s %s is broken or not fully installed %s is fuzzy at byte %s: %s %s is fuzzy at byte %s: %s; dropping it %s is missing %s is missing; dropping %s %s is not installed %s is outdated %s is outdated; dropping whole template! %s must be run as root (Enter zero or more items separated by a comma followed by a space (', ').) Back Cannot read status file: %s Choices Config database not specified in config file. Configuring %s Debconf Debconf on %s Debconf was not configured to display this error message, so it mailed it to you. Debconf, running at %s Dialog frontend is incompatible with emacs shell buffers Dialog frontend requires a screen at least 13 lines tall and 31 columns wide. Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal. Enter the items you want to select, separated by spaces. Extracting templates from packages: %d%% Help Ignoring invalid priority "%s" Input value, "%s" not found in C choices! This should never happen. Perhaps the templates were incorrectly localized. More Next No usable dialog-like program is installed, so the dialog based frontend cannot be used. Note: Debconf is running in web mode. Go to http://localhost:%i/ Package configuration Preconfiguring packages ...
 Problem setting up the database defined by stanza %s of %s. TERM is not set, so the dialog frontend is not usable. Template #%s in %s does not contain a 'Template:' line
 Template #%s in %s has a duplicate field "%s" with new value "%s". Probably two templates are not properly separated by a lone newline.
 Template database not specified in config file. Template parse error near `%s', in stanza #%s of %s
 Term::ReadLine::GNU is incompatable with emacs shell buffers. The Sigils and Smileys options in the config file are no longer used. Please remove them. The editor-based debconf frontend presents you with one or more text files to edit. This is one such text file. If you are familiar with standard unix configuration files, this file will look familiar to you -- it contains comments interspersed with configuration items. Edit the file, changing any items as necessary, and then save it and exit. At that point, debconf will read the edited file, and use the values you entered to configure the system. This frontend requires a controlling tty. Unable to load Debconf::Element::%s. Failed because: %s Unable to start a frontend: %s Unknown template field '%s', in stanza #%s of %s
 Usage: debconf [options] command [args] Usage: debconf-communicate [options] [package] Usage: debconf-mergetemplate [options] [templates.ll ...] templates Usage: dpkg-reconfigure [options] packages
  -a,  --all			Reconfigure all packages.
  -u,  --unseen-only		Show only not yet seen questions.
       --default-priority	Use default priority instead of low.
       --force			Force reconfiguration of broken packages.
       --no-reload		Do not reload templates. (Use with caution.) Valid priorities are: %s You are using the editor-based debconf frontend to configure your system. See the end of this document for detailed instructions. _Help apt-extracttemplates failed: %s debconf-mergetemplate: This utility is deprecated. You should switch to using po-debconf's po2debconf program. debconf: can't chmod: %s delaying package configuration, since apt-utils is not installed falling back to frontend: %s must specify some debs to preconfigure no none of the above please specify a package to reconfigure template parse error: %s unable to initialize frontend: %s unable to re-open stdin: %s warning: possible database corruption. Will attempt to repair by adding back missing question %s. yes Project-Id-Version: debconf 1.5.29
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2010-07-11 12:57+0100
PO-Revision-Date: 2010-03-09 17:53+0930
Last-Translator: Clytie Siddall <clytie@riverland.net.au>
Language-Team: Vietnamese <vi-VN@googlegroups.com>
Language: vi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Generator: LocFactoryEditor 1.8
 
        --outdated		Trộn ngay cả bản dịch cũ.
	--drop-old-templates	Bỏ toàn bộ mẫu cũ. 
  -o,  --owner=gói		Lập gói sở hữu lệnh đó.   -f,  --frontend		Ghi rõ giao diện debconf cần dùng.
  -p,  --priority		SGhi rõ câu hỏi ưu tiên tối thiểu cần hiển thị.
       --terse			Bật chế độ ngắn gọn.
 %s lỗi cấu hình sẵn, có trang thái thoát %s %s bị hỏng hoặc chưa được cài đặt hoàn thành %s vẫn được dịch mờ tại byte %s: %s %s vẫn được dịch mờ tại byte %s: %s nên bỏ nó %s còn thiếu %s còn thiếu nên bỏ %s %s chưa được cài đặt %s cũ %s cũ nên bỏ toàn bộ mẫu. %s phải được chạy dưới người chủ (root) (Hãy nhập số không hay nhiều mục định giới bằng một dấu phẩy và một dấu cách (v.d. « cái1, cái2, cái3 »).) Lùi Không thể đọc tập tin trạng thái: %s Sự chọn Cơ sở dữ liệu cấu hình không được ghi rõ trong tập tin cấu hình. Đang cấu hình %s Debconf Debconf trên %s Trình Debconf không được cấu hình để hiển thị thông điệp lỗi này, vì vậy nó đã gửi cho bạn trong một thư. Debconf, đang chạy ở %s Giao diện cung cấp hộp thoại thì không tương thích với bộ đệm trình bao của emacs. Giao diện cung cấp hộp thoại thì yêu cầu một màn hình có ít nhất chiều cao 13 dòng và chiều rộng 31 cột. Giao diện cung cấp hộp thoại thì không hoạt động được trên thiết bị cuối câm, trong bộ đệm trình bao của emacs, hoặc khi không có thiết bị cuối điều khiển. Hãy nhận những mục bạn muốn chọn, định giới bằng dấu cách. Đang giải nén các mẫu từ gói: %d%% Trợ giúp Đang bỏ qua ưu tiên không hợp lê « %s » Không tìm thấy giá trị đầu vào « %s » trong các sự chọn C. Trường hợp này không bao giờ nên xảy ra. Có thể là những mẫu bị sai địa phương hoá. Xem thêm Tiếp Chưa cài đặt chương trình kiểu hộp thoại có thể sử dụng được nên không thể sử dụng giao diện cung cấp hộp thoại. Ghi chú : Debconf đang chạy trong chế độ Web. Hãy đi tới « http://localhost:%i/ ». Cấu hình gói Đang cấu hình sẵn các gói ...
 Gặp lỗi khi thiết lập cơ sở dữ liệu được xác định bởi đoạn dòng %s của %s. Chưa đặt TERM nên không thể sử dụng giao diện cung cấp hộp thoại. Mẫu #%s trong %s không chứa một dòng « Template: » (Mẫu)
 Mẫu #%s trong %s có một trường trùng « %s » có giá trị mới « %s ». Rất có thể là hai mẫu chưa định giới được bằng một dòng mới riêng lẻ.
 Cơ sở dữ liệu mẫu không được ghi rõ trong tập tin cấu hình. Gặp lỗi phân tích cú pháp mẫu ở gần « %s », trong đoạn dòng #%s của %s
 « Term::ReadLine::GNU » không tương thích với bộ đệm trình bao của emacs. Không còn dùng lại hai tùy chọn Sigils và Smileys. Hãy gỡ bỏ cả hai. Giao diện debconf dựa vào trình chỉnh sửa sẽ cho bạn chỉnh sửa một hay nhiều tập tin nhập thô. Đây là một tập tin văn bản như vậy. Nếu bạn quen với các tập tin cấu hình Unix tiêu chuẩn, tập tin này hình như thông thường — nó chứa một tổ hợp các ghi chú và mục cấu hình. Hãy chỉnh sửa tập tin đó, cũng thay đổi mục nào như thích hợp, sau đó lưu lại và thoát. Vào điểm thời đó, debconf sẽ đọc tập tin đã chỉnh sửa, và sử dụng những giá trị được bạn chỉnh sửa để cấu hình hệ thống. Giao diện này yêu cầu một tty điều khiển. Không thể nạp « Debconf::Element::%s ». Thất bại vì: %s. Không thể khởi chạy một giao diện: %s Không rõ trường mẫu « %s », trong đoạn dong #%s của %s
 Sử dụng: debconf [tùy_chọn ...] lệnh [đối_số ...] Sử dụng: debconf-communicate [tùy_chọn ...] [gói]

[communicate: liên lạc] Sử dụng: debconf-mergetemplate [tùy_chọn ...] [mẫu.ll ...] mẫu

[mergetemplate: trộn các mẫu với nhau] Sử dụng: dpkg-reconfigure [tùy_chọn ...] những_gói

[reconfigure: cấu hình lại]

  -a,  --all			Cấu hình lại _mọi_ gói.
  -u,  --unseen-only		Hiện _chỉ_ những câu hỏi _chưa xem_.
       --default-priority	Dùng _ưu tiên mặc định_ thay cho
		ưu tiên thấp.
       --force			_Buộc_ cấu hình lại các gói bị ngắt.
       --no-reload		Đừng nạp lại mẫu. (Hãy sử dụng cẩn thận.) Ưu tiên hợp lệ: %s Bạn đang sử dụng giao diện debconf dựa vào trình chỉnh sửa để cấu hình hệ thống của mình. Xem kết thúc của tài liệu này để tìm các hướng dẫn chi tiết. Trợ g_iúp apt-extracttemplates (giải nén các mẫu) bị lỗi: %s debconf-mergetemplate: tiện ích này bị phản đối. Như thế thì bạn nên chuyển đổi sang sử dụng chương trình « po2debconf » của gói po-debconf. debconf: không thể chmod (thay đổi chế độ): %s đang tri hoãn việc cấu hình gói vì chưa cài đặt « apt-utils » (các tiện ích apt) đang phục hồi giao diện: %s phải ghi rõ một số deb (tập tin gói Debian) để cấu hình sẵn không không có gì ở trên hãy ghi rõ một gói cần cấu hình lại lỗi phân tích cú pháp của mẫu : %s không thể sơ khởi giao diện: %s không thể mở lại đầu vào tiêu chuẩn: %s cảnh báo : cơ sở dữ liệu có thể bị hỏng. Trình này sẽ thử sửa chữa nó bằng cách thêm lại câu hỏi còn thiếu %s. có 