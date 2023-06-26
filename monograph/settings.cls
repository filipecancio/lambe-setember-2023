\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt,a4paper,oneside]{book} % classe base a ser modificada

\ProvidesClass{./classe/cls-PFC-COEEL}[
     Classe LaTeX para PFC da COEEL criada em Abril de 2023 por Elvio Prado da Silva]
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  DECLARAÇÃO DE PACOTES DE BIBLIOTECAS
%
\RequirePackage[utf8]{inputenc} % formato da codificação
\RequirePackage[T1]{fontenc} % caracteres e acentos
\RequirePackage[brazil]{babel} % idioma
\usepackage{titletoc} % personalizar a tabela de conteúdos, listas de figuras, tabelas
\usepackage{tocloft} % personalizar a tabela de conteúdos, listas de figuras, tabelas
\usepackage{rotating} % rotacionar
\RequirePackage{ifthen} % pacote de condicionais if, else, ifthenelse
\RequirePackage{etoolbox} % pacote de declarações
\RequirePackage[default,scale=1.0]{opensans} % fonte do texto
\RequirePackage{amsmath,amsfonts,amssymb} % pacotes matemáticos
\RequirePackage{array} % pacote matemático
\RequirePackage{newtxmath} % fonte matemática
\RequirePackage{setspace} % pacote (espaçamento)
\RequirePackage{indentfirst} % indentação do primeiro parágrafo
\RequirePackage{fancybox} % caixas bonitas
\RequirePackage[dvipsnames, table]{xcolor} % pacote de cores
% -- Cor na linha do cabeçalho:
\RequirePackage{xpatch}
\RequirePackage{graphicx, graphics} % pacotes gráficos
\RequirePackage{dashrule} % linhas pontilhadas e tracejadas
\RequirePackage{tikz}

%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% DECLARA PFC E RELATÓRIO
%
\newbool{pfc} % declara variável booleana
\newbool{relatorio} % declara variável booleana
% Verifica a escolha pfc e declara true
\DeclareOption{pfc}{\booltrue{pfc}\boolfalse{relatorio}}

% Verifica a escolha relatorio e declara true
\DeclareOption{relatorio}{\booltrue{relatorio}\boolfalse{pfc}}

% executa os comandos das opções declaradas
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Formatação básica:
%
\onehalfspacing % espaçamento 1.5 entre linhas
\setlength{\parindent}{30pt} % indentação do parágrafo
\setlength{\parskip}{10pt} % espaçamento entre parágrafos


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% DEFININDO CORES
%
% RGB maiúsculo varia de 0 a 255
% RGB minúsculo varia de 0 a 1
\definecolor{verdeifba}{RGB}{50,160,65}
\definecolor{vermelhoifba}{RGB}{200,25,30}
\definecolor{verdeescuro}{RGB}{0,128,0}
\definecolor{black}{RGB}{0,0,0}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% CAPTION DE FIGURAS, TABELAS e CÓDIGOS:
%
\RequirePackage{float} % pacote fig./tables
\RequirePackage{adjustbox} % ajuste automático
\RequirePackage{caption} % legendas
\captionsetup[table]{
    labelfont = bf, % fonte do Caption
    labelsep = endash, % separador do Caption
    skip = 7pt, % distância entre caption
    size = small, % tamanho da fonte
    textfont = it % fonte do texto do caption
}
\captionsetup[figure]{
    labelfont = bf, % fonte do Caption
    labelsep = endash, % separador do Caption
    skip = 7pt,   % distância entre caption
    size = small,  % tamanho da fonte
    textfont = it   % fonte do texto do caption
}
\captionsetup[lstlisting]{
    labelfont = bf, % fonte do Caption
    labelsep = endash, % separador do Caption
    skip = 7pt,   % distância entre caption
    size = small,  % tamanho da fonte
    textfont = it   % fonte do texto do caption
}
\setlength{\textfloatsep}{8mm} % espaço entre texto-float
\renewcommand{\arraystretch}{1.2} % espaçamento (tabela)

% fonte de Figuras
\newcommand{\FonteFig}[1]{
    \hspace{1mm}
    \begin{turn}{90}
        {\tiny {\bf FONTE: } #1}
    \end{turn}
}
% fonte de Tabelas
\newcommand{\FonteTab}[1]{
    \par
    \vspace{2mm}
    {\tiny {\bf FONTE: } #1}
}

% linha de Tabelas
\newcommand{\Linha}{
    \noalign{\hrule height 1mm}
    \noalign{\vspace{1mm}}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% ALTERA OS PARÂMETROS DAS LISTAS:
% \itemize \enumerate \description
%
\RequirePackage{enumitem} % pacote listas
\setlist{
   topsep=5mm, % distância do texto até a lista
   itemsep=2mm, % distância entre os items
   labelsep=3mm, % distância entre o marcador e o texto do item
   leftmargin=20mm,
   partopsep=0pt,
   parsep=0pt
}
% lista enumerate com algarismos arábicos seguido de )
\setlist[enumerate]{label=\bfseries\arabic*) }

% lista itemize com Triângulo apontado para a direita
\setlist[itemize]{label={\Large$\blacktriangleright$}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Ícones:
\RequirePackage{fontawesome} % pacote ícones
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% CUSTOMIZANDO TÍTULOS
%
\RequirePackage{titlesec} % customizar títulos de capítulos, seções, subseções, subsubseções, parágrafos e subparágrafos

% -- ESPAÇAMENTO DOS TÍTULOS:
%\titlespacing{comando}{esquerda}{acima}{abaixo}[direita]
\titlespacing{\chapter}{0pt}{20pt}{10pt}
\titlespacing{\section}{0pt}{20pt}{4pt}
\titlespacing{\subsection}{0pt}{20pt}{2pt}
\titlespacing{\subsubsection}{0pt}{4pt}{2pt}

% -- FONTE DOS TÍTULOS:
% \titleformat{comando}[forma do título]{tamanho da fonte}{rótulo do título}{espaço entre o rótulo e o título}{before-code}[after-code]
\ifbool{relatorio}{
    \titleformat{\chapter}{\LARGE\bfseries}{\thechapter}{1em}{}
}{}
\titleformat{\section}{\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\Large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\Large\bfseries}{\thesubsubsection}{1em}{}

% muda o comando \paragraph para ordem alfabética
\renewcommand{\theparagraph}{\alph{paragraph})}
\titleformat{\paragraph}{\normalfont\Large\bfseries}{\theparagraph}{1em}{}

% muda o comando \subparagraph para ordem em algarismos romanos
\renewcommand{\thesubparagraph}{\roman{subparagraph})}
\titleformat{\subparagraph}{\normalfont\Large\bfseries}{\thesubparagraph}{1em}{}

\setcounter{secnumdepth}{5} %Numera até subsubsection. Aumente para conseguir outros níveis de numeração de secções, tais como parágrafo e subparágrafo.
\setcounter{tocdepth}{5}    % Coloca no sumário (toc) as subsubsection



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% ESTILO DA PÁGINA
%
\RequirePackage[top=3cm, bottom=3cm, left=3cm, right=2cm]{geometry} % layout da página
\RequirePackage{fancyhdr}
\fancypagestyle{EstiloPFC}{
   \fancyhf{} % zera tudo
   \ifbool{pfc}{
        \fancyhead[L]{\footnotesize \textit{\rightmark}} % Texto cabeçalho L
    }{}
    \ifbool{relatorio}{
        \fancyhead[L]{\footnotesize \textit{\@Titulo}} % Texto cabeçalho L
    }{}
   \fancyhead[R]{~~} % Texto cabeçalho R
   \fancyfoot[R]{\large \textbf{\thepage}} % texto do rodapé R
    % se é PFC 
    \ifbool{pfc}{
        \fancyfoot[L]{\footnotesize{\textit{PFC - Engenharia Elétrica - COEEL}}} % texto do rodapé L
    }{}
    % se é RELATÓRIO 
\ifbool{relatorio}{
        \fancyfoot[L]{\footnotesize{\textit{Relatório de:  \@Disciplina}}} % texto do rodapé L
    }{}
   \xpretocmd\headrule{\color{black!100}}{}{}
   \renewcommand{\headrulewidth}{1mm} % largura da linha de cabeçalho
   \setlength{\headheight}{9.1mm} % espaço entre a linha do cabeçalho e o texto
   \renewcommand{\footrulewidth}{1mm} % largura da linha de rodapé
   \addtolength{\textheight}{0mm} % distância entre o texto e a linha de rodapé
   \addtolength{\footskip}{0mm} % distância entre o texto e a linha de rodapé       
}
% 
\pagestyle{EstiloPFC} % Estilo de página criado para o PFC do IFBA VDC
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%\RequirePackage{listings} % pacote de listas
\usepackage{pdfpages} % incluir páginas PDF
\RequirePackage{lipsum}
%\Requirepackage{ragged2e} % alinhamento de texto

% numerar as figuras e tabelas com o número do capítulo
\RequirePackage{chngcntr}
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}

% -- Caixas:
\RequirePackage{tcolorbox}
\RequirePackage{setspace}

\usepackage[absolute]{textpos} % posição do texto
\usepackage{tcolorbox} % caixas coloridas
\usepackage{imakeidx} % índice remissivo

%%%%%%%% caixa colorida
\newtcolorbox{CaixaVermelha}{
    colback = red!8, % cor do fundo
    colframe = vermelhoifba, % cor da borda 
    boxrule = 0.3mm, % largura da linha de contorno
    leftrule = 5mm,  % largura da barra da esquerda
    rounded corners, % cantos arredondados
    arc = 5mm % arredondar os cantos
}

\newtcolorbox{CaixaVerde}{
    colback = green!8, % cor do fundo
    colframe = verdeifba, % cor da borda
    boxrule = 0.3mm, % largura da linha de contorno
    bottomrule = 4mm, % cor da barra de baixo
    fontupper = \color{black},
    rounded corners, % cantos arredondados
    arc = 5mm % arredondar os cantos   
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% DEFINIÇÃO DE NOVAS VARIÁVEIS
%
\def \Titulo#1{ \def\@Titulo{#1} } % título
\def \@Titulo {} % inicia a variável como vazia

\def \Autor#1{ \def\@Autor{#1} } 
%\def \@Autor {} % inicia a variável como vazia

\def \Orientador#1{ \def\@Orientador{#1} } 
\def \@Orientador {} % inicia a variável como vazia

\def \Coorientador#1{ \def\@Coorientador{#1} } 
\def \@Coorientador {} % inicia a variável como vazia

\def \Cidade#1{ \def\@Cidade{#1} } 
\def \@Cidade {} % inicia a variável como vazia

\def \Data#1{ \def\@Data{#1} } 
\def \@Data {} % inicia a variável como vazia

\def \Disciplina#1{ \def\@Disciplina{#1} } 
\def \@Disciplina {} % inicia a variável como vazia

\def \Professor#1{ \def\@Professor{#1} } 
\def \@Professor {} % inicia a variável como vazia

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% CONFIGURA OS HIPERLINKS
%
\RequirePackage[hidelinks,pagebackref]{hyperref} 
\RequirePackage{url} % url
\urlstyle{same}

\hypersetup{colorlinks,
  debug=false,
  linkcolor=black,  %%% cor do tableofcontents, \ref, \footnote, etc
  citecolor=black,  %%% cor do \cite
  urlcolor=black,   %%% cor do \url e \href
  filecolor=black,
  bookmarksopen=true,
  pdftitle={PFC - Projeto Final de Curso de Engenharia Elétrica do IFBA campus Vitória da Conquista - COEEL},
  pdfauthor={Estudante de Engenharia Elétrica},
  pdfsubject={Template LaTeX criado pelo professor Elvio},
  pdfkeywords={PFC, Engenharia Elétrica, COEEL}
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% REFERÊNCIAS COM O NÚMERO 
%%%% DAS PÁGINAS CITADAS
%
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
  \ifcase #1 %
   Nenhuma citação no texto.%
  \or
   {\scriptsize ( Citado na página #2. )}%
  \else
   {\scriptsize ( Citado #1 vezes nas páginas #2. )}%
  \fi
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% CAPA de PFC e de RELATÓRIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Capa de PFC
\def\CapaPFC{%
  \thispagestyle{empty}%
\begin{center}%
     \includegraphics[width=\linewidth]{util/logo.pdf}%
     
     \Large
     \vspace{1.5cm}%
     \textbf{COORDENAÇÃO DE SISTEMAS DE INFORMAÇÃO}%
     
     \vspace{0.1cm}%
     \textbf{TRABALHO DE CONCLUSÃO DE CURSO - TCC}%

     \vspace{3cm}%
     
     \@Titulo%

     \vspace{3.5cm}%
     \MakeUppercase{\textbf{\@Autor}}%
  
     \vfill % leva para o botton da página
     \@Cidade \\     
     \vspace{1mm}%
     \@Data%

\end{center}%
}%
%
\clearpage\newpage\pagebreak
\onehalfspacing % espaçamento 1,5 entre linhas
%
%
\clearpage\newpage\pagebreak
%%%% espaçamento 1,5 entre linhas
\onehalfspacing
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% FOLHA DE ROSTO 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\FolhaRosto{%
  \clearpage%
  \thispagestyle{empty}%
  \begin{center}%    
     \MakeUppercase{\textbf{\Large  \@Autor}}\\%
    \vspace{3cm}%
    \textbf{\Large \@Titulo}\\%
  \end{center}%
  \vspace{2.5cm}%
  \begin{flushright}%
    \begin{minipage}{8.5cm}%
       {\singlespacing \normalsize 
       %Projeto de Monografia apresentado como requisito parcial de avaliação da disciplina Trabalho de Conclusão de Curso I, do curso de Sistemas de Informação do Instituto Federal de Educação, Ciência e Tecnologia da Bahia – IFBA.\\
       
       \@Orientador %
       
       \@Coorientador }\\%
    \end{minipage}%
  \end{flushright}%

 \vfill % leva para o botton da página
  \begin{center}%   
    {\Large  \@Cidade}\\%
    \vspace{0.3cm}%
    {\Large  \@Data}%
  \end{center}%
}%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% RESUMO E ABSTRACT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Resumo
\def\NomeResumo{RESUMO}
\def\Resumo{%
  \gdef\@keywordsname{\keywordsnamePT}
  \chapter*{\NomeResumo}}

%% Abstract
\def\NomeAbstract{ABSTRACT}
\def\Abstract{%
  \gdef\@keywordsname{\keywordsnameEN}
  \chapter*{\NomeAbstract}}

%% Keywords
\def\keywordsnamePT{Palavras-chave}
\def\keywordsnameEN{Keywords}
\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\bf\@keywordsname: }}
\def\endkeywords{}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% GLOSSÁRIO: LISTA DE SÍMBOLOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\usepackage{glossaries}
\usepackage{glossary-longbooktabs}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% ANEXOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\Anexos}{
  \clearpage
  \setcounter{chapter}{0} % Reiniciar a numeração dos capítulos em algarismos romanos
  \renewcommand{\thechapter}{\Roman{chapter}} % Usar algarismos romanos para a numeração dos capítulos
  \renewcommand{\chaptername}{ANEXO~~} % Renomear o nome do capítulo para ANEXO
  \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername~\thechapter.\#1}}{}} % Atualizar o cabeçalho de página
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% APÊNDICES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\Apendices}{
  \clearpage
  \setcounter{chapter}{0} % Reiniciar a numeração dos capítulos em algarismos romanos
  \renewcommand{\thechapter}{\Alph{chapter}} % Usar algarismos romanos para a numeração dos capítulos
  \renewcommand{\chaptername}{APÊNDICE~~} % Renomear o nome do capítulo para ANEXO
  \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername~\thechapter.\#1}}{}} % Atualizar o cabeçalho de página
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%         CÓDIGOS
%%%%
% Mais informações de configurações dos
% códigos e linguagens suportadas, acesse:
% https://pt.overleaf.com/learn/latex/Code_listing
%%%%
%
\RequirePackage{listings} % pacote de listas de códigos

% -- Definindo cores do código:
% RGB maiúsculo varia de 0 a 255
% rgb minúsculo varia de 0 a 1
\definecolor{cinza}{rgb}{0.5,0.5,0.5}
\definecolor{roxo}{rgb}{0.58,0,0.82}

\lstnewenvironment{Codigo}[1][]{
    \lstset{language=,basicstyle=\ttfamily,#1}
}{}
\renewcommand\lstlistingname{Código}
\renewcommand\lstlistlistingname{Lista de Códigos}
\newcommand{\listofcodename}{Lista de Códigos}
\renewcommand{\lstlistingname}{Código}

% -- Criando um estilo para os códigos:
\lstdefinestyle{EstiloCodigo}{
    backgroundcolor=\color{green!4}, % cor de fundo    
    commentstyle=\color{verdeifba}, % cor dos comentários
    keywordstyle=\color{blue}, % cor das palavras reservadas
    numberstyle=\tiny\color{cinza}, % cor da numeração das linhas
    stringstyle=\color{vermelhoifba}, % cor das strings
    identifierstyle=\color{roxo}, % cor das variáveis e funções
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=false,                 
    captionpos=t, %local do caption (t/b)    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
% -- Configurando o estilo do código:
\lstset{ 
  style=EstiloCodigo, 
  framexleftmargin=5mm, % tabela entra na margem esquerda
  framexrightmargin=3.3cm, % tabela vai até a margem direita
  frame=shadowbox, % tabela com sombra a direita e abaixo
  rulesepcolor=\color{black}, % cor da sombra
  linewidth=0.8\linewidth, 
  xleftmargin=12pt, % margem esquerda
  aboveskip=5mm, % distância do texto até o título da tabela 
  belowskip=5mm, % distância da tabela até o texto abaixo da tabela
}

% para acrescentar as palavras reservadas do LaTeX e BibTeX:
\lstset{
    literate=
    {@article}{{\textcolor{blue}{@article}}}7 % a palavra article tem 7 espaços em
    {author}{{\textcolor{red}{author}}}6 % a palavra author tem 6 espaços em
    {title}{{\textcolor{red}{title}}}5 % a palavra title tem 5 espaços em
    {journal}{{\textcolor{red}{journal}}}7
    {publisher}{{\textcolor{red}{publisher}}}9 
    {year}{{\textcolor{red}{year}}}4
    {volume}{{\textcolor{red}{volume}}}6
    {begin}{{\textcolor{blue}{begin}}}4
    {caption}{{\textcolor{red}{caption}}}6
    {label}{{\textcolor{red}{label}}}4
    {language}{{\textcolor{red}{language}}}7
    {FonteFig}{{\textcolor{blue}{FonteFig}}}7
    {FonteTab}{{\textcolor{blue}{FonteTab}}}7   
    {Linha}{{\textcolor{red}{Linha}}}4
    {hline}{{\textcolor{red}{hline}}}4
    {pfc}{{\textcolor{blue}{pfc}}}3
    {relatorio}{{\textcolor{blue}{relatorio}}}8
    {description}{{\textcolor{red}{description}}}9
    {name}{{\textcolor{red}{name}}}4
    {newgloss}{{\textcolor{blue}{newgloss}}}6
    {aryentry}{{\textcolor{blue}{aryentry}}}7
    {Importa}{{\textcolor{blue}{Importa}}}5
    {Codigo}{{\textcolor{blue}{Codigo}}}6
    {include}{{\textcolor{blue}{include}}}6
    {graphics}{{\textcolor{blue}{graphics}}}7
    {width}{{\textcolor{red}{width}}}4
    {Caixa}{{\textcolor{red}{Caixa}}}4
    {Vermelha}{{\textcolor{red}{Vermelha}}}7
    {CaixaVerde}{{\textcolor{red}{CaixaVerde}}}9
    {nonumber}{{\textcolor{red}{nonumber}}}7
}
 
% renomeia o comando \lstinputlisting para \ImportaCodigo
\newcommand{\ImportaCodigo}{\lstinputlisting}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%