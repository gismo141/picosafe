��    H      \  a   �         o   !  ?   �  �   �  .   h  #   �     �  '   �     �          '     ;  (   J     s  K   �     �     �     �  -   �     -	     <	     D	  Q   R	     �	  8   �	  M   �	  k   B
  8   �
  (   �
            u   4     �     �  X   �  @        N     d  ;   �  6   �  7   �  �   ,  /   �  4   �  =     Y   X  �  �  )   v  7   �     �  1   �  '   )  .   Q  C   �  F  �       �   $     �     �  n   �     ;  @   T     �  &   �     �     �  '   �       !   /     Q  a   m     �  S  �  �   '  ?   �  �   �  8   �  0   �       &   ,     S     \     r     �  0   �     �  a   �     S  &   Z     �  P   �     �     �     �  f        h  @   �  \   �  z     ?   �  .   �       %     �   4     �     �     �  I   V     �      �  F   �  E   "  6   h  �   �  G   @   >   �   @   �   i   !    r!  .   y#  A   �#  )   �#  6   $  /   K$  5   {$  K   �$  |  �$      z&  �   �&     0'     7'  x   W'  "   �'  N   �'     B(  3   ](     �(     �(  1   �(     �(  -   �(  !   %)  f   G)     �)        5       (       C                    ?                       1      ,                !   @       +                  )       4   >   -   <                 9   0   =   7               .      F   /   D           :   B   2                               3   $          E   H         ;      &      8          "       %   #   *   
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
       --no-reload		Do not reload templates. (Use with caution.) Valid priorities are: %s You are using the editor-based debconf frontend to configure your system. See the end of this document for detailed instructions. _Help apt-extracttemplates failed: %s debconf-mergetemplate: This utility is deprecated. You should switch to using po-debconf's po2debconf program. debconf: can't chmod: %s delaying package configuration, since apt-utils is not installed falling back to frontend: %s must specify some debs to preconfigure no none of the above please specify a package to reconfigure template parse error: %s unable to initialize frontend: %s unable to re-open stdin: %s warning: possible database corruption. Will attempt to repair by adding back missing question %s. yes Project-Id-Version: debconf
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2010-07-11 12:57+0100
PO-Revision-Date: 2010-04-12 22:57+0100
Last-Translator: Miguel Figueiredo <elmig@debianpt.org>
Language-Team: Portuguese <traduz@debianpt.org>
Language: pt
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
        --outdated		Juntar até em traduções não actualizadas.
	--drop-old-templates	Não utilizar nenhum modelo desactualizado. 
  -o,  --owner=pacote		Define o pacote que é dono do comando.   -f,  --frontend		Especificar o frontend do debconf a utilizar.
  -p,  --prority		Especificar a prioridade mínima das perguntas a mostrar.
       --terse			Habilitar o modo abreviado.
 %s falhou a pré-configuração, com estado de saída %s %s está defeituoso ou não totalmente instalado %s é fuzzy no byte %s: %s %s é fuzzy no byte %s: %s; deixando-o Falta %s Falta %s; deixando %s %s não está instalado %s está ultrapassado %s está ultrapassado; deixando todo o template! %s tem de ser corrido como root (Introduza os itens que deseja escolher separados por uma vírgula seguida de um espaço (', ').) Atrás Não pode ler o estado do ficheiro: %s Escolhas Base de dados de configuração não especificada no ficheiro de configuração. A configurar %s Debconf Debconf em %s O Debconf não foi configurado para mostrar esta mensagem de erro, por isso enviou-a por mail para si. Debconf, a correr em %s o frontend Dialog é incompatível com buffers de shell do emacs O frontend Dialog requer um ecrã de pelo menos 13 linhas de altura e 31 colunas de largura. O frontend Dialog não irá funcionar num terminal 'estúpido', num buffer de shell emacs, ou sem um terminal controlador. Introduza os items que deseja escolher, separados por espaços. A extrair templates a partir dos pacotes: %d%% Ajuda A ignorar a prioridade inválida "%s" Valor de entrada, "%s" não foi encontrado nas escolhas de C! Isto nunca deveria acontecer. Talvez os templates estejam com os locales incorrectos. Mais Próximo Não está instalado nenhum programa utilizável do tipo dialog, por isso o frontend baseado em dialog não pode ser utilizado. Nota: o Debconf está a correr em modo web. Vá para http://localhost:%i/ Configuração de pacotes A pré-configurar os pacotes...
 Problema ao configurar a base de dados definida pela estrofe %s de %s. TERM não está definida, logo o frontend dialog não é utilizável. Template #%s em %s não contém uma linha 'Template:'
 Template #%s em %s tem um campo duplicado "%s" com o novo valor "%s". Provavelmente os dois templates não estão devidamente separados por uma única newline.
 Base de dados template não especificada no ficheiro de configuração. Erro de parse do template perto de `%s', na estrofe #%s de %s
 Term::ReadLine::GNU é incompatível com buffers de shell emacs. As opções Sigils e Smileys no ficheiro de configuração já não são utilizadas. Por favor remova-as. O frontend de debconf baseado num editor mostra-lhe um ou mais ficheiros de texto para editar. Este é um desses ficheiros de texto. Se está familiarizado com os ficheiros de configuração standard de unix, este ficheiro vai-lhe parecer familiar -- contém comentários intercalados com itens de configuração. Edite o ficheiro, modificando qualquer item que ache necessário, depois grave-o e saia. Nesse ponto, o debconf irá ler o ficheiro editado, e utilizar os valores que introduziu para configurar o sistema. Este frontend necessita de um tty controlador. Não conseguiu carregar Debconf::Element::%s. Falhou devido a: %s Não foi possível iniciar o frontend: %s Campo template desconhecido '%s' na estrofe #%s de %s
 Utilização: debconf [opções] comando [args] Utilização: debconf-communicate [opções] [pacote] Utilização: debconf-mergetemplate [opções] [templates.ll ...] templates Utilização: dpkg-reconfigure [opções] pacotes
  -a,  --all			Reconfigurar todos os pacotes.
  -u,  --unseen-only		Mostrar apenas as questões ainda não vistas.
       --default-priority	Utilizar a prioridade predefinida em vez de baixa.
       --force			Forçar a reconfiguração de pacotes com problemas.	--no-reload		Não carregar novamente os modelos. (Usar com cuidado.) As prioridades válidas são: %s Está a utilizar um frontend de debconf baseado num editor para configurar o seu sistema. Veja o final deste documento para instruções detalhadas. _Ajuda apt-extracttemplates falhou: %s debconf-mergetemplate: Este utilitário é depreciado. Você deve passar a utilizar o programa po2debconf do po-debconf. debconf: não pode fazer chmod: %s a atrasar a configuração do pacote, já que o apt-utils não está instalado caindo para o frontend; %s tem de especificar alguns debs para pré-configurar não nenhum dos acima por favor especifique um pacote para reconfigurar erro de parse do template: %s não foi possível inicializar o frontend: %s não conseguiu re-abrir stdin: %s aviso: possível corrupção de base de dados. Irei tentar reparar adicionando a questão em falta %s. sim 