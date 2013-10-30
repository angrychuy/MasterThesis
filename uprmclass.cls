%%
%% This files has been adapted from ufthesis.cls by Ron Smith
%% 
%% 
%% This program may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
%% 
\NeedsTeXFormat{LaTeX2e}[2000/06/01]
\ProvidesClass{uprmclass}
   [2002/09/20 v2.0c UF Thesis Class (Ron Smith), Edited by Alberto Santana (2003), Edited By Cesar Aceros (2005)]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Defining Class options and loading required   %
%%     packages                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
     [1996/08/02 v1.0m Standard LaTeX ifthen package (DPC)]
\RequirePackage{ragged2e} %Para justificar texto (\justifying)
%% Declaring Options \& Initializing Flags
\newcommand{\RS@ptsize}{}
\newcounter{RS@ptcnt}
\DeclareOption{10pt}{\renewcommand{\RS@ptsize}{10pt}%
\setcounter{RS@ptcnt}{10}}%
\DeclareOption{11pt}{\renewcommand{\RS@ptsize}{11pt}%
\setcounter{RS@ptcnt}{11}}%
\DeclareOption{12pt}{\renewcommand{\RS@ptsize}{12pt}%
\setcounter{RS@ptcnt}{12}}%
\newboolean{RS@TOCHang}%
\setboolean{RS@TOCHang}{true}%
\DeclareOption{NoTocHang}{\setboolean{RS@TOCHang}{false}}
\newboolean{RS@BfSet}%
\setboolean{RS@BfSet}{false}%
\DeclareOption{Bold}{\setboolean{RS@BfSet}{true}}
\newboolean{RS@CPage}%
\setboolean{RS@CPage}{false}%
\DeclareOption{CPage}{\setboolean{RS@CPage}{true}}
\newboolean{RS@Draft}%
\setboolean{RS@Draft}{false}%
\DeclareOption{Draft}{\setboolean{RS@Draft}{true}}%
\newboolean{RS@Justify}%
\setboolean{RS@Justify}{false}%
\DeclareOption{Justify}{\setboolean{RS@Justify}{true}}%
\newboolean{RS@nopenalties}%
\setboolean{RS@nopenalties}{true}%
\DeclareOption{nopenalties}{\setboolean{RS@nopenalties}{false}}%
\DeclareOption*{\OptionNotUsed}
%% Executing Options \& Loading Required Packages
\ExecuteOptions{12pt}
\ProcessOptions\relax
\LoadClass[\RS@ptsize]{report}[2000/05/19 v1.4b Standard LaTeX document class]
\typeout{ }
\typeout{*****************************************}
\typeout{* Updating commands for Thesis Template *}
\typeout{*****************************************}
\RequirePackage[nodisplayskipstretch]{setspace}[2000/12/01 6.7 Contributed and Supported LaTeX2e package]%
%% Removing 3 minor commands left-over by the setspace 2000/12/01 6.7 package
\providecommand{\filename}{filenametext}%
\providecommand{\filedate}{filedatetext}%
\providecommand{\fileversion}{filevertext}%
\renewcommand{\filename}{}%
\renewcommand{\filedate}{}%
\renewcommand{\fileversion}{}%
\RequirePackage[normalem]{ulem}%
\RequirePackage{sectsty}[1999/04/12 v2.0.1 Commands to change all sectional heading styles]%
\ifthenelse{\boolean{RS@Justify}}{}{%
\RequirePackage{ragged2e}[1999/06/08 v1.02 Ragged2e Package (MS)]%
\setlength{\RaggedRightRightskip}{0pt plus 4em}%
\RaggedRight}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Page layout for RUM  Template                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\normalfont\small\normalsize% Make sure font size is set to normalsize
\newcounter{RS@TmpCnt}% Used to count the number of lines per page
\setcounter{RS@TmpCnt}{1}% and as a counter for handling TOC section spacing.
\newlength{\RS@TOChdent}% Used to define hanging indents.
\setlength{\RS@TOChdent}{1.0em}%
\newlength{\RS@MyHeader}% Used to set space between top of page and
\setlength{\RS@MyHeader}{0.6in}% page numbers
\newlength{\RS@NumPoints}%
\newlength{\RS@StartofHeader}%
\newlength{\RS@EndofFooter}%
\newlength{\RS@TempLength}%
%%    Setting the margin reference point
\setlength{\hoffset}{0pt}%
\setlength{\voffset}{0pt}%
%%    Setting the height of the text page
\setlength{\textheight}{\topskip}%
\addtolength{\textheight}{44\baselineskip}%
\ifthenelse{\value{RS@ptcnt}=11}{%
\addtolength{\textheight}{3\baselineskip}}{}%
\ifthenelse{\value{RS@ptcnt}=10}{%
\addtolength{\textheight}{9\baselineskip}}{}%
%%    Setting the width of the text page
\setlength{\oddsidemargin}{0.5in}%
\@settopoint{\oddsidemargin}%
\setlength{\evensidemargin}{\oddsidemargin}%
\setlength{\textwidth}{0.99\paperwidth}%
\addtolength{\textwidth}{-2in}%
\addtolength{\textwidth}{-\oddsidemargin}%
\@settopoint{\textwidth}%
\setlength{\marginparpush}{8pt}%
\setlength{\marginparwidth}{\paperwidth}%
\addtolength{\marginparwidth}{-1in}%
\addtolength{\marginparwidth}{-\hoffset}%
\addtolength{\marginparwidth}{-\evensidemargin}%
\addtolength{\marginparwidth}{-\textwidth}%
\addtolength{\marginparwidth}{-2\marginparpush}%
\@settopoint{\marginparwidth}%
\settowidth{\parindent}{\ }%
\setlength{\parindent}{6\parindent}%
\ifthenelse{\boolean{RS@Justify}}{}{%
\setlength{\RaggedRightParindent}{\parindent}}%
%%    Positioning the Header
\ifthenelse{\value{RS@ptcnt} = 10}{\setlength{\headheight}{10.0pt}}{}%
\ifthenelse{\value{RS@ptcnt} = 11}{\setlength{\headheight}{11.0pt}}{}%
\ifthenelse{\value{RS@ptcnt} = 12}{\setlength{\headheight}{12.0pt}}{}%
\@settopoint{\RS@MyHeader}%
\setlength{\topmargin}{\RS@MyHeader}%
\addtolength{\topmargin}{-1in}%
\@settopoint{\topmargin}%
\setlength{\headsep}{-\topmargin}%
\addtolength{\headsep}{-\headheight}%
%%    Positioning the Footer
\setlength{\RS@StartofHeader}{\voffset}%
\addtolength{\RS@StartofHeader}{1in}%
\addtolength{\RS@StartofHeader}{\topmargin}%
\setlength{\footskip}{0pt}%
\setlength{\RS@EndofFooter}{100pt}%
\whiledo{\lengthtest{\RS@EndofFooter > \RS@StartofHeader}}%
    {\addtolength{\footskip}{0.5pt}%
    \setlength{\RS@EndofFooter}{-\voffset}%
    \addtolength{\RS@EndofFooter}{-1in}%
    \addtolength{\RS@EndofFooter}{-\topmargin}%
    \addtolength{\RS@EndofFooter}{-\headheight}%
    \addtolength{\RS@EndofFooter}{-\headsep}%
    \addtolength{\RS@EndofFooter}{-\textheight}%
    \addtolength{\RS@EndofFooter}{-\footskip}%
    \addtolength{\RS@EndofFooter}{\paperheight}}%
%%    Creating a 2 inch margin
\newlength{\BigLength}%
\setlength{\BigLength}{0pt}%
\newcommand{\BigMargin}{\hspace*{1in}\normalfont\normalsize%
\settoheight{\RS@TempLength}{()}%
\vspace*{-\baselineskip}\vspace*{-\topskip}\vspace*{1in}%
\vspace*{\RS@TempLength}\vspace*{\BigLength} \\}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Extra stuff by Haysoos				   %
%%          formatting commands and stuff          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\triplespace}{\vspace{12pt}}%
\def\@resumen{\variablefaltante{resumen}} % Resumen del trabajo
\newcommand{\resumen}[1]{\def\@resumen{#1}}
\def\@palabrasclave{\variablefaltante{palabrasclave}} % Palabras clave separadas por coma. (e.g. IA,PSO, etc.)
\newcommand{\palabrasclave}[1]{\def\@palabrasclave{#1}}
\def\@resumenen{\variablefaltante{resumenen}}
\newcommand{\resumenen}[1]{\def\@resumenen{#1}} % Resumen del trabajo en inglés
\def\@keywords{\variablefaltante{keywords}}
\newcommand{\keywords}[1]{\def\@keywords{#1}} % Palabras clave del trabajo en inglés.
\def\@primerjurado{\variablefaltante{primerjurado}} % Nombre del primer jurado
\newcommand{\primerjurado}[1]{\def\@primerjurado{#1}}
\def\@segundojurado{\variablefaltante{segundojurado}} % Nombre del segundo jurado
\newcommand{\segundojurado}[1]{\def\@segundojurado{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Page-breaking penalties and page number  %
%%          formatting commands                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\boolean{RS@nopenalties}}{%
\clubpenalty=10000    % Do not allow orphans
\@clubpenalty \clubpenalty
\widowpenalty=10000   % Do not allow widows
}{}%
\brokenpenalty=10000  % Do not allow hyphenation across
                      % page boundaries.
\providecommand{\frontmatter}{}%
\providecommand{\mainmatter}{}%
\providecommand{\backmatter}{}%
\ifthenelse{\boolean{RS@Draft}}{%
  \renewcommand{\frontmatter}{\clearpage\pagenumbering{arabic}%
    \pagestyle{plain}}%
  \renewcommand{\mainmatter}{\clearpage%
    \pagestyle{myheadings}\markboth{}{}}}%
{\renewcommand{\frontmatter}{\clearpage\pagenumbering{roman}%
    \pagestyle{plain}}%
  \renewcommand{\mainmatter}{\clearpage\pagenumbering{arabic}%
    \pagestyle{myheadings}\markboth{}{}}}%
\renewcommand{\backmatter}{\clearpage\GoSingle\pagestyle{empty}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Line-spacing commands                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{SetDSpace}%
\setboolean{SetDSpace}{true}%
\newcommand{\BaseDiff}{0}
\newcommand{\GoSingle}{\renewcommand{\baselinestretch}{1}%
\normalfont\tiny\normalsize}%
\ifthenelse{\value{RS@ptcnt} = 10}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.667}%
\renewcommand{\BaseDiff}{0.667}\normalfont\tiny\normalsize}}{}%
\ifthenelse{\value{RS@ptcnt} = 11}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.618}%
\renewcommand{\BaseDiff}{0.618}\normalfont\tiny\normalsize}}{}%
\ifthenelse{\value{RS@ptcnt} = 12}{%
\newcommand{\GoDouble}{\renewcommand{\baselinestretch}{1.655}%
\renewcommand{\BaseDiff}{0.655}\normalfont\tiny\normalsize}}{}%
\GoDouble\GoSingle%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Formatting Chapter Headings                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{2}%
\renewcommand{\chaptername}{CAPITULO}
\renewcommand{\appendixname}{APENDICE}
\renewcommand{\@chapapp}{\chaptername}
\let\@afterindentfalse\@afterindenttrue%
\@afterindenttrue%
\newenvironment{RS@Cent}{\centering}{\par}%
\renewcommand{\chapter}{%
    \clearpage%
    %\thispagestyle{plain}%
    \pagestyle{plain}
    \GoSingle%
    \global\@topnum\z@%  Keep floats from top of page
    \@afterindentfalse%
    \secdef\@chapter\@schapter}%
\renewcommand{\@chapter}[2][?]{%
    \ifthenelse{\value{secnumdepth} > -1}{%
      \refstepcounter{chapter}%
      \typeout{***************************}%
      \typeout{\@chapapp\space\thechapter.}%
      \typeout{***************************}%
      \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}{#1}}% Alberto was here 
    }{\addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{#1}}{}}}% Alberto was here
    \setcounter{footnote}{0}%
    \@makechapterhead{\Large{\texorpdfstring{\uppercase{#2}}{}}}}%#2}}% Alberto was here 
\renewcommand{\@makechapterhead}[1]{%
    \begin{RS@Cent}%
    \BigMargin%
    \ifthenelse{\value{secnumdepth} > -1}{%     
			\bfseries\Large{\@chapapp\space\thechapter\\}}{}%
    #1
    \vspace{.4in}
    \end{RS@Cent}%
    \@afterheading%
    \ifthenelse{\boolean{SetDSpace}}{\GoDouble}{}%
    }%
\renewcommand{\@schapter}[2][?]{%
    \@makeschapterhead{#2}}%
\renewcommand{\@makeschapterhead}[1]{%
    \begin{RS@Cent}%
    \BigMargin%
    #1\end{RS@Cent}%
    \@afterheading%
    \ifthenelse{\boolean{SetDSpace}}{\GoDouble}%
    {\addvspace{\BaseDiff\baselineskip}}%
    }%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Formatting Section Headings                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\boolean{RS@BfSet}}%
{\sectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \subsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \subsubsectionfont{\normalsize\normalfont\singlespace\bfseries}%
 \paragraphfont{\normalsize\normalfont\bfseries}%
 \renewcommand{\paragraph}[1]{\@paragraph{#1.}}%
 \newcommand{\@paragraph}{\@startsection{paragraph}{4}{\parindent}%
    {0.1ex}%
    {-1.0em}%
    {\SS@parafont}}%
 \subparagraphfont{\normalsize\normalfont\bfseries}}%
{\sectionfont{\normalsize\normalfont\singlespace\underline}%
 \subsectionfont{\normalsize\normalfont\singlespace\underline}%
 \subsubsectionfont{\normalsize\normalfont\singlespace\underline}%
 \paragraphfont{\normalsize\normalfont\underline}%
 \renewcommand{\paragraph}[1]{\@paragraph{#1}.}%
 \newcommand{\@paragraph}{\@startsection{paragraph}{4}{\parindent}%
    {0.1ex}%
    {0pt}%
    {\SS@parafont}}%
 \subparagraphfont{\normalsize\normalfont\underline}}%
\renewcommand{\section}{%
    \@startsection{section}{1}{\z@}%
    {-0\baselineskip}%
    {0.1ex}%
    {\SS@sectfont}}
\renewcommand{\subsection}{%
    \@startsection{subsection}{2}{\z@}%
    {-1\baselineskip}%
    {0.1ex}%
    {\SS@subsectfont}}
\renewcommand{\subsubsection}{%
    \@startsection{subsubsection}{3}{2.0em}%
    {-0.1ex}%
    {0.1ex}%
    {\SS@subsubsectfont}}
\renewcommand{\subparagraph}{%
    \@startsection{subparagraph}{5}{\z@}%
    {0.1ex}%
    {-1.0em}%
    {\SS@subparafont}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Formatting Generated Lists -- TOC, LOF and LOT %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\@dotsep}{4.5}%
\renewcommand{\@pnumwidth}{1.55em}%
\ifthenelse{\boolean{RS@Justify}}{%
\renewcommand{\@tocrmarg}{2.55em}}{%
\renewcommand{\@tocrmarg}{2.55em plus 1.45em}}%
\renewcommand*{\l@chapter}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \@dottedtocline{0}{\UFdent}{\RS@chapnumwidth}{#1}{#2}%
  }{}}%
\newcommand*{\l@extrachapter}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \@dottedtocline{0}{0pt}{0pt}{#1}{#2}%
  }{}}%
\newcommand*{\l@extraentry}[2]{%
  \setcounter{RS@TmpCnt}{0}%
  \ifthenelse{\value{tocdepth} > -1}{%
    \addpenalty{-\@highpenalty}%
    \vspace{\BaseDiff\baselineskip}%
    \noindent #1\par%
  }{}}%
\renewcommand*{\l@section}{%
  \ifthenelse{\value{RS@TmpCnt} = 0}{%
     \setcounter{RS@TmpCnt}{1}%
     \vspace{\BaseDiff\baselineskip}}{}%
  \@dottedtocline{1}{\RS@secindent}{\RS@secnumwidth}}%
\renewcommand*{\l@subsection}{\@dottedtocline{2}{\RS@subsecindent}%
              {\RS@subsecnumwidth}}%
\renewcommand*{\l@subsubsection}{\@dottedtocline{3}{7.0em}{4.1em}}%
\renewcommand*{\l@paragraph}{\@dottedtocline{4}{10em}{5em}}%
\renewcommand*{\l@subparagraph}{\@dottedtocline{5}{12em}{6em}}%
\renewcommand*{\l@figure}{\vspace{\BaseDiff\baselineskip}%
              \@dottedtocline{-5}{\RS@figindent}{\RS@fignumwidth}}%
\renewcommand*{\l@table}{\vspace{\BaseDiff\baselineskip}%
              \@dottedtocline{-5}{\RS@tabindent}{\RS@tabnumwidth}}%
\newcommand{\leaddots}{%
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill}%
\renewcommand{\@dottedtocline}[5]{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
%%   Handling those sections that are included in TOC, but have
%%   no section numbering. Also including hanging indent when the
%%   NoTocHang option was not used. Only the following 4 lines added.
     \ifthenelse{#1 > \value{secnumdepth}}{%
     \setlength{\@tempdima}{0pt}}{}%
     \ifthenelse{#1 > \value{secnumdepth} \or \boolean{RS@TOCHang}}{%
     \addtolength{\leftskip}{\RS@TOChdent}}{}%
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaddots
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Indenting Generated Lists -- TOC, LOF and LOT  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\UFdent}%
\setlength{\UFdent}{0pt}%
\newlength{\RS@chapnumwidth}%
\setlength{\RS@chapnumwidth}{2.3em}%
\newlength{\RS@secindent}%
\setlength{\RS@secindent}{0pt}%
\AtBeginDocument{%
\addtolength{\RS@secindent}{\UFdent}%
%% Verifying that the chapters are numbered.
\ifthenelse{\value{secnumdepth} > -1}{%
\addtolength{\RS@secindent}{\RS@chapnumwidth}}{}%
}
\newlength{\RS@secnumwidth}%
\setlength{\RS@secnumwidth}{3em}%
\newlength{\RS@subsecindent}%
\setlength{\RS@subsecindent}{0pt}%
\AtBeginDocument{%
\addtolength{\RS@subsecindent}{\RS@secindent}%
%% Verifying that the sections are numbered.
\ifthenelse{\value{secnumdepth} > 0}{%
\addtolength{\RS@subsecindent}{\RS@secnumwidth}}{}%
}
\newlength{\RS@subsecnumwidth}%
\setlength{\RS@subsecnumwidth}{3em}%
\newlength{\RS@figindent}%
\settowidth{\RS@figindent}{Fig}%
\newlength{\RS@fignumwidth}%
\setlength{\RS@fignumwidth}{2.3em}%
\newlength{\RS@tabindent}%
\settowidth{\RS@tabindent}{Ta}%
\newlength{\RS@tabnumwidth}%
\setlength{\RS@tabnumwidth}{2.3em}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Table of Contents                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}%
\renewcommand{\contentsname}{TABLA DE CONTENIDO}%
\newenvironment{simpleenv}[4]{\clearpage}{\clearpage}%
\renewcommand{\tableofcontents}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\contentsname}%
      \vspace*{-\RS@ptsize}%
      \noindent\phantom{Table}\hfill\uline{p\'agina}\par%
      \@starttoc{toc}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of Tables                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\listtablename}{LISTA DE TABLAS}%
\renewcommand{\listoftables}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\listtablename}%
      \vspace*{-\RS@ptsize}%
      \addcontentsline{toc}{extrachapter}{\listtablename}%
      \noindent\uline{Tabla}\hfill\uline{p\'agina}\par%
      \@starttoc{lot}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%% List of Abbreviations and Symbols         %%%
%% Adapted from : Peter Czoschke 						 %%%
%% http://www.ctan.org/tex-archive/macros/latex/contrib/uiucthesis/ 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment*{symbollist}[1][1in]{
    \begin{list}{}{\singlespacing
     \setlength{\leftmargin}{#1}
     \setlength{\labelwidth}{#1}
     \addtolength{\labelwidth}{-\labelsep}
     \setlength{\topsep}{0in}}%
     \def\makelabel##1{\hfil##1\hfil}%
    }{
    \end{list}}
\newenvironment*{symbollist*}[1][1in]{
    \begin{symbollist}[#1]
    \def\makelabel##1{##1\hfil}}
    {\end{symbollist}}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of Figures                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\listfigurename}{LISTA DE FIGURAS}%
\renewcommand{\listoffigures}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\listfigurename}%
      \vspace*{-\RS@ptsize}%
      \addcontentsline{toc}{extrachapter}{\listfigurename}%
      \noindent\uline{Figura}\hfill\uline{p\'agina}\par%
      \@starttoc{lof}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
\renewcommand{\appendix}{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand{\@chapapp}{\appendixname}%
  \renewcommand{\thechapter}{\@Alph\c@chapter}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        List of References                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{REFERENCIAS BIBLIOGR\'AFICAS}%
\renewenvironment{thebibliography}[1]%
     {\clearpage\pagestyle{myheadings}%
      \markboth{}{}%
      \setboolean{SetDSpace}{false}%
      \chapter*{\bibname}%
      \addcontentsline{toc}{extrachapter}{\bibname}%
      \setboolean{SetDSpace}{true}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \setlength{\parsep}{\BaseDiff\baselineskip}%
            \setlength{\itemsep}{0ex}%
            \setlength{\leftmargin}{\labelwidth}%
            \addtolength{\leftmargin}{\labelsep}%
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty10000
      \@clubpenalty \clubpenalty
      \widowpenalty10000%
      \sfcode`\.=1000\relax}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist\clearpage}
%% Special Pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Title Page                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \begin{RS@Cent}%
    \BigMargin%
    \vspace{-0.5in}
    \Titlesp\\*[\BaseDiff\baselineskip]%
    Por \\*[\BaseDiff\baselineskip]%
    \FullName \\*[\BaseDiff\baselineskip]%
    \vspace{1.0in}
    Tesis sometida en cumplimiento parcial de los requerimientos para el grado de\\*[\BaseDiff\baselineskip]%
    \MakeUppercase{\DegreeTypes} \\*[\BaseDiff\baselineskip]%
    en\\*[\BaseDiff\baselineskip]%
    \MakeUppercase{\Specialty}\\*[\BaseDiff\baselineskip]%
    \vspace{0.2in}%
    \includegraphics[width=1.2in]{uabc-logo}\\ %
    \vspace{0.2in}%
    UNIVERSIDAD AUT\'ONOMA DE BAJA CALIFORNIA \\%    
    \vspace{0.2in}%
    \MakeUppercase{\Departamento}\\*[\BaseDiff\baselineskip]%
    \vspace{0.5in}%
    \MakeUppercase{\DegreeType}\\*[\BaseDiff\baselineskip]%
    \vspace{0.2in}%
    \GradMes, \GradYear%
    \end{RS@Cent}%
    \vfill%
% {\flushleft Aprobada por:\\%
% \vspace{0.6cm}
% %%%%%%%%%%%% Begin members of your committee %%%%%%%%%%%%
% %%%%%%%%%%%%     add more if you need to     %%%%%%%%%%%%
% \rule{7.5cm} {0.01cm} \hfill \rule{3cm}{0.01cm}\\%
% \Namea , \Degreea \hfill \makebox[3cm][c]{Fecha}\\
% Mienbro, Comite Graduado\\*[\BaseDiff\baselineskip]%
% %%%%%%%%%%%%
% \rule{7.5cm} {0.01cm} \hfill \rule{3cm}{0.01cm}\\%
% \Nameb , \Degreeb \hfill \makebox[3cm][c]{Fecha}\\
% Mienbro, Comite Graduado\\*[\BaseDiff\baselineskip]%
% %%%%%%%%%%%%
% \rule{7.5cm} {0.01cm} \hfill \rule{3cm}{0.01cm}\\%
% \Namec , \Degreec \hfill \makebox[3cm][c]{Fecha}\\
% Presidente, Comite Graduado\\*[\BaseDiff\baselineskip]%
% %%%%%%%%%%%%
% \rule{7.5cm} {0.01cm} \hfill \rule{3cm}{0.01cm}\\%
% \Named , \Degreed \hfill \makebox[3cm][c]{Fecha}\\
% Representante de Estudios Graduados\\*[\BaseDiff\baselineskip]%
% %%%%%%%%%%%%
% \rule{7.5cm} {0.01cm} \hfill \rule{3cm}{0.01cm}\\%
% \NameChairDep , \DegreeChairDep \hfill \makebox[3cm][c]{Fecha}\\
% Director del Departmento\\*[\BaseDiff\baselineskip]%
% %%%%%%%%%%%% End members of your committee %%%%%%%%%%%%
% }
    \setboolean{SetDSpace}{true}%
    \clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        APPENDICES PAGE                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeappendicespage}{%
    \chapter*{}
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \vspace*{\fill}
    \begin{RS@Cent}
      \addcontentsline{toc}{extrachapter}{AP\'ENDICES}
			\bfseries	
			\begin{center}
			\LARGE{AP\'ENDICES}
			\end{center}
    \end{RS@Cent}
    \vfill%
    \setboolean{SetDSpace}{true}%
    \clearpage}    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Copyright Page                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makecopyright}{%
    \clearpage%
    \setboolean{SetDSpace}{false}%
    \thispagestyle{empty}%
    \GoSingle%
    \vspace*{\fill}%
    \begin{RS@Cent}%
    Copyright \textcopyright ~ \GradYear \\*[\BaseDiff\baselineskip]%
    por \\*[\BaseDiff\baselineskip]%
    \FullName%
    \end{RS@Cent}%
    \vfill%
    \setboolean{SetDSpace}{true}%
    \clearpage}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Dedication                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\dedication}[1]{%
    \begin{simpleenv}{#1}{}{}{}%
      \pagestyle{empty}%
      \GoSingle%
      \BigMargin\par%
      \GoDouble%
      #1%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}%
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Acknowledgments                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acknowledgname}{AGRADECIMIENTOS}%
\newcommand{\acknowledge}[1]{%
    \setboolean{SetDSpace}{true}%
    \begin{simpleenv}{#1}{}{}{}%
      \pagestyle{plain}%
      \chapter*{\acknowledgname}%
      \addcontentsline{toc}{extrachapter}{\acknowledgname}%
      #1%
    \end{simpleenv}}%
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Abstract  English                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\abstractengname}{ABSTRACT}%
\newcommand{\abstracte}{
	\phantomsection %Bug fix
	\addcontentsline{toc}{extrachapter}{\abstractengname}
	\begin{centering} 
		%\MakeUppercase{Universidad Autonoma de Baja California}\\
		\vspace{15pt}
		\Title\\
		\vspace{20pt}
		\raggedleft{
			\textbf{Author:} \FullName\\
			\textbf{Advisor:} \Chair\\
		}
		\vspace{20pt}
		\centering{{\textbf{\MakeUppercase{Abstract}}}}\\
		\vspace{15pt}
		\begin{doublespace}
			\justifying{\@resumenen}
		\end{doublespace}
		\vfill
		\noindent\justifying{\textbf{Keywords:} \@keywords}
	\end{centering}
	\newpage
	}
% \newenvironment{abstracte}{%
%     \clearpage%
% %    \pagestyle{empty}%
%     \setboolean{SetDSpace}{false}%
%     \ifthenelse{\boolean{RS@Draft}}{\pagestyle{empty}}{\pagestyle{plain}}%
%     \GoSingle%
% %    \pagestyle{empty}%
%     \addcontentsline{toc}{extrachapter}{ABSTRACT ENGLISH}%
%     \begin{RS@Cent}%
%     \BigMargin%
%     Abstract of \ThesisTypes\ Presented to\\%
%     Autonomous University of Baja California\\%
%     in partial fulfillment of the requirements for the Degree of \DegreeType
%     \\*[\BaseDiff\baselineskip]% \Title \\*[\BaseDiff\baselineskip]%
%     By \\*[\BaseDiff\baselineskip]%
%     \FullName \\*[\BaseDiff\baselineskip]%
%     \GradMonth\ \GradYear \\*[\BaseDiff\baselineskip]%
%     \end{RS@Cent}%
%     %{\raggedright Chair: \Chair \\%
%     {\raggedright Advisor: \Chair \\%
%     Major Department: \Department} %
%     \setboolean{SetDSpace}{true}%
%     \par%
%     \GoDouble}%
%     {\clearpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Abstract Spanish                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\abstractespname}{RESUMEN}%
\newcommand{\abstracts}{
	\phantomsection %Bug fix
	\addcontentsline{toc}{extrachapter}{\abstractespname}
	\begin{centering} 
		%\MakeUppercase{Universidad Autonoma de Baja California}\\
		\vspace{15pt}
		\Titlesp\\
		\vspace{20pt}
		\raggedleft{
			\textbf{Autor:} \FullName\\
			\textbf{Tutor:} \Chair\\
		}
		\vspace{20pt}
		\centering{{\textbf{\MakeUppercase{Resumen}}}}\\
		\vspace{15pt}
		\begin{doublespace}
			\justifying{\@resumen}
		\end{doublespace}
		\vfill
		\noindent\justifying{\textbf{Palabras Clave:} \@palabrasclave}
	\end{centering}
	\newpage
	}
% \newenvironment{abstracts}{%
%     \clearpage%
%  %   \pagestyle{empty}%
%     \setboolean{SetDSpace}{false}%
%     \ifthenelse{\boolean{RS@Draft}}{\pagestyle{empty}}{\pagestyle{plain}}%
%     \GoSingle%
%  %   \pagestyle{empty}%
%     \addcontentsline{toc}{extrachapter}{RESUMEN EN ESPA\~NOL}%
%     \begin{RS@Cent}%
%     \BigMargin%
%     Resumen de \ThesisTypes\ Presentado a\\%
%     Universidad Autonoma de Baja California\\%
%     como requisito parcial de los requerimientos  para el grado de \DegreeTypes
%     \\*[\BaseDiff\baselineskip]% \Titlesp \\*[\BaseDiff\baselineskip]%
%     Por \\*[\BaseDiff\baselineskip]%
%     \FullName \\*[\BaseDiff\baselineskip]%
%     \GradMes\ \GradYear \\*[\BaseDiff\baselineskip]%
%     \end{RS@Cent}%
%     {\raggedright Consejero: \Chair \\%
%     Departamento: \Departmento} %
%     \setboolean{SetDSpace}{true}%
%     \par%
%     \GoDouble}%
%     {\clearpage}    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Biographical Sketch                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\biographyname}{DATOS BIOGRAFICOS}%
\newcommand{\biography}[1]{%
    \setboolean{SetDSpace}{true}%
    \begin{simpleenv}{#1}{}{}{}%
      \ifthenelse{\boolean{RS@Draft}}{\pagestyle{empty}%
        \let\ps@plain\ps@empty}{\pagestyle{myheadings}}%
      \markboth{}{}%
      \chapter*{\biographyname}%
      \addcontentsline{toc}{extrachapter}{\biographyname}%
      #1%
    \end{simpleenv}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%          Getting personal information and       %
%%          defining other miscellaneous commands  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\SetTitle}[1]{\renewcommand*{\Title}{\uppercase{{\bf #1}}}}%
\newcommand*{\Title}{No Title Given}%
\@onlypreamble{\SetTitle}%
\newcommand*{\SetTitlesp}[1]{\renewcommand*{\Titlesp}{\uppercase{{\bf #1}}}}%
\newcommand*{\Titlesp}{No Title Given}%
\@onlypreamble{\SetTitlesp}%
\newcommand*{\SetFullName}[1]{\renewcommand*{\FullName}{#1}}%
\newcommand*{\FullName}{ASantana}%
\@onlypreamble{\SetFullName}%
\newcommand*{\SetThesisType}[1]{\renewcommand*{\ThesisType}{#1}}%
\newcommand*{\ThesisType}{THESIS OR DISSERTATION}%
\@onlypreamble{\SetThesisType}%
\newcommand*{\SetThesisTypes}[1]{\renewcommand*{\ThesisTypes}{#1}}%
\newcommand*{\ThesisTypes}{TESIS OR DISERTACION}%
\@onlypreamble{\SetThesisTypes}%
\newcommand*{\SetDegreeType}[1]{\renewcommand*{\DegreeType}{#1}}%
\newcommand*{\DegreeType}{UNDEFINED DEGREE}%
\@onlypreamble{\SetDegreeType}%
\newcommand*{\SetDegreeTypes}[1]{\renewcommand*{\DegreeTypes}{#1}}%
\newcommand*{\DegreeTypes}{GRADO NO DEFINIDO}%
\@onlypreamble{\SetDegreeTypes}%
\newcommand*{\SetSpecialty}[1]{\renewcommand*{\Specialty}{#1}}%
\newcommand*{\Specialty}{UNDEFINED SPECIALTY}%
\@onlypreamble{\SetSpecialty}%
\newcommand*{\SetGradMonth}[1]{\renewcommand*{\GradMonth}{#1}}%
\newcommand*{\GradMonth}{UNDEFINED MONTH}%
\@onlypreamble{\SetGradMonth}%
\newcommand*{\SetGradMes}[1]{\renewcommand*{\GradMes}{#1}}%
\newcommand*{\GradMes}{MES NO DEFINIDO}%
\@onlypreamble{\SetGradMes}%
\newcommand*{\SetGradYear}[1]{\renewcommand*{\GradYear}{#1}}%
\newcommand*{\GradYear}{UNDEFINED YEAR}%
\@onlypreamble{\SetGradYear}%
\newcommand*{\SetDepartment}[1]{\renewcommand*{\Department}{#1}}%
\newcommand*{\Department}{UNDEFINED DEPARTMENT}%
\@onlypreamble{\SetDepartment}%
\newcommand*{\SetDepartamento}[1]{\renewcommand*{\Departamento}{#1}}%
\newcommand*{\Departamento}{DEPARTAMENTO NO DEFINIDO}%
\@onlypreamble{\SetDepartmento}%
\newcommand*{\SetChair}[1]{\renewcommand*{\Chair}{#1}}%
\newcommand*{\Chair}{UNDEFINED Chair}%
\@onlypreamble{\SetChair}%
\newcommand*{\SetNamea}[1]{\renewcommand*{\Namea}{#1}}%
\newcommand*{\Namea}{UNDEFINED Graduate Commitee a}%
\@onlypreamble{\SetNamea}%
\newcommand*{\SetDegreea}[1]{\renewcommand*{\Degreea}{#1}}%
\newcommand*{\Degreea}{UNDEFINED Degree member a}%
\@onlypreamble{\SetDegreea}%
\newcommand*{\SetNameb}[1]{\renewcommand*{\Nameb}{#1}}%
\newcommand*{\Nameb}{UNDEFINED Graduate Commitee b}%
\@onlypreamble{\SetNameb}%
\newcommand*{\SetDegreeb}[1]{\renewcommand*{\Degreeb}{#1}}%
\newcommand*{\Degreeb}{UNDEFINED Degree member b}%
\@onlypreamble{\SetDegreeb}%
\newcommand*{\SetNamec}[1]{\renewcommand*{\Namec}{#1}}%
\newcommand*{\Namec}{UNDEFINED Graduate Commitee c}%
\@onlypreamble{\SetNamec}%
\newcommand*{\SetDegreec}[1]{\renewcommand*{\Degreec}{#1}}%
\newcommand*{\Degreec}{UNDEFINED Degree member c}%
\@onlypreamble{\SetDegreec}%
\newcommand*{\SetNamed}[1]{\renewcommand*{\Named}{#1}}%
\newcommand*{\Named}{UNDEFINED Graduate Commitee d}%
\@onlypreamble{\SetNamed}%
\newcommand*{\SetDegreed}[1]{\renewcommand*{\Degreed}{#1}}%
\newcommand*{\Degreed}{UNDEFINED Degree member d}%
\@onlypreamble{\SetDegreed}%
\newcommand*{\SetNameChairDep}[1]{\renewcommand*{\NameChairDep}{#1}}%
\newcommand*{\NameChairDep}{UNDEFINED Graduate Chairperson Department}%
\@onlypreamble{\SetNameChairDep}%
\newcommand*{\SetDegreeChairDep}[1]{\renewcommand*{\DegreeChairDep}{#1}}%
\newcommand*{\DegreeChairDep}{UNDEFINED Degree Chairperson Department}%
\@onlypreamble{\SetDegreeChairDep}%
%%    Adding personal notes to your text
\newboolean{ShowNotes}% Used to display private notes.
\setboolean{ShowNotes}{false}%
\newcommand{\NOTE}[1]{%
    \ifthenelse{\boolean{ShowNotes}}{%
    \begin{spacing}{1}%
    \par\noindent\marginpar{NOTE}%
    \parbox[t]{\textwidth}{\hrulefill\\%
    #1\\*[-0.5\baselineskip]%
    \hspace*{0.1in}\hspace{-0.1in}\hrulefill\\}%
    \vspace{0.25in}\end{spacing}}{}%
    }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Footnotes                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\footnotesep}{0.7\baselineskip}%
\addtolength{\footnotesep}{\BaseDiff\baselineskip}%
\setlength{\skip\footins}{2.5\baselineskip}%
\renewcommand{\footnoterule}{%
   \kern -3\p@
   \kern +8pt
   \hrule \@width 2in
   \kern -8pt
   \kern +2.6\p@}
\renewcommand{\@makefnmark}{%
  \hbox{\@textsuperscript{\normalfont\@thefnmark}}~}%
\renewcommand\@makefntext[1]{%
    \normalsize%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Figures and Tables                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\thefigure}{%
  {\ifnum \c@chapter>\z@ \thechapter--\fi \@arabic\c@figure}}%
\renewcommand{\thetable}{%
  {\ifnum \c@chapter>\z@ \thechapter--\fi \@arabic\c@table}}%
\newlength{\abovefigcaptskip}%
\newlength{\belowfigcaptskip}%
\newlength{\abovetabcaptskip}%
\newlength{\belowtabcaptskip}%
\newcommand{\mylen}{0.8} %%% This adjusts the spacing between caption and Figure/Table
\setlength{\abovefigcaptskip}{-5pt}%\abovecaptionskip}%
\setlength{\belowfigcaptskip}{-1pt}%\belowcaptionskip}12%
\setlength{\abovetabcaptskip}{-10pt}%\belowcaptionskip}%
\setlength{\belowtabcaptskip}{\mylen\abovecaptionskip}%
\renewenvironment{table}
     {\setlength{\abovecaptionskip}{\abovetabcaptskip}%
      \setlength{\belowcaptionskip}{\belowtabcaptskip}%
      \@float{table}}
     {\end@float}
\renewenvironment{figure}
     {\setlength{\abovecaptionskip}{\abovefigcaptskip}%
      \setlength{\belowcaptionskip}{\belowfigcaptskip}%
      \@float{figure}}
     {\end@float}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  UPRM Thesis Multiple Index Generation          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printindex}[4][\jobname]{%
    \IfFileExists{#1.ind}{%
    \setboolean{SetDSpace}{false}%
    \begin{simpleenv}{#1}{#2}{#3}{#4}%
      \pagestyle{plain} %
      \addcontentsline{toc}{extrachapter}{#2}%
      \chapter*{#3}{\GoDouble{#4}\par\GoSingle}%
      \input{#1.ind}%
    \end{simpleenv}%
    \setboolean{SetDSpace}{true}}
    {\typeout{No file #1.ind found.}}}%
\newcommand{\see}[2]{\emph{see} #1}%
\renewcommand{\makeindex}[1][\jobname]{\begingroup
  \makeatletter
  \if@filesw \expandafter\newwrite\csname #1@idxfile\endcsname
  \expandafter\immediate\openout \csname #1@idxfile\endcsname #1.idx\relax
  \typeout{Writing index file #1.idx }\fi \endgroup}
\@onlypreamble{\makeindex}%
\renewcommand{\index}[2][\jobname]{\@bsphack\begingroup
               \def\protect##1{\string##1\space}\@sanitize
               \@wrindex{#1}{#2}}
\renewcommand{\@wrindex}[2]{\let\thepage\relax
   \xdef\@gtempa{\@ifundefined{#1@idxfile}{}{\expandafter
      \write\csname #1@idxfile\endcsname{\string
      \indexentry{#2|RSpset}{\thepage}}}}\endgroup\@gtempa
   \if@nobreak \ifvmode\nobreak\fi\fi\@esphack}
\newcommand{\indxspace}{\par\vspace{\BaseDiff\baselineskip}}
\newcommand{\IndexSet}{%
\renewcommand{\@idxitem}{\par\setlength{\leftskip}{0pt}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\subitem}{\par\setlength{\leftskip}{0.25in}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\subsubitem}{\par\setlength{\leftskip}{0.5in}%
                         \setlength{\hangindent}{\RS@TOChdent}}%
\renewcommand{\indexspace}{}
\renewcommand{\indxspace}{\par\vspace{\BaseDiff\baselineskip}}
\renewenvironment{theindex}{%
                \setlength{\parindent}{\z@}%
                \parskip\z@ \@plus .3\p@\relax
                \setlength{\rightskip}{\@tocrmarg}%
                \setlength{\parfillskip}{-\rightskip}%
                \let\item\@idxitem}
} %% End of the IndexSet definition
\newcommand{\RSpnum}[1]{\makebox[\@pnumwidth][r]{#1}}
\newcommand{\RSnopnum}[1]{\makebox[\@pnumwidth][r]{}}
\newcommand{\RSpset}[1]{\RSpnum{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Fixing the enumerate and itemize environments  %
%%  by updating the general list parameters.       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\@listi}{\leftmargin\leftmargini
      \setlength{\topsep}{0in}%
      \setlength{\partopsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\leftmargin}{0.5in}%
      \setlength{\itemsep}{0in}}
\let\@listI\@listi
\@listi
\renewcommand*{\@listii}{\leftmargin\leftmarginii
      \labelwidth\leftmarginii
      \advance\labelwidth-\labelsep
      \setlength{\topsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\itemsep}{\parsep}}
\renewcommand*{\@listiii}{\leftmargin\leftmarginiii
      \labelwidth\leftmarginiii
      \advance\labelwidth-\labelsep
      \setlength{\topsep}{0in}%
      \setlength{\parsep}{0in}%
      \setlength{\partopsep}{0in}%
      \setlength{\itemsep}{\parsep}}
\ifthenelse{\boolean{RS@CPage}}{%
  \renewcommand{\ps@myheadings}{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\hfil\thepage\hfil}%
      \def\@oddhead{\hfil\thepage\hfil}%
      \let\@mkboth\@gobbletwo
      \let\chaptermark\@gobble
      \let\sectionmark\@gobble
      }
  }{}
%% Disabling some unused commands
\renewcommand{\author}{}
\renewcommand{\date}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  UPRM Thesis Local Configuration                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\InputIfFileExists{ufthesis.cfg}{%
\typeout{***************************************}
\typeout{* Local config file ufthesis.cfg used *}
\typeout{***************************************}}{}
\typeout{ }
\typeout{*****************************************}
\typeout{*\space \space Finished with Thesis Template}
\typeout{*****************************************}
\typeout{ }
\AtBeginDocument{%
\typeout{**************************************}
\typeout{* Executing Begin Document Statement *}
\typeout{**************************************}
}
\endinput
%%
%% End of file `ufthesis.cls'.
