\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{candrakantah}[2025-02-01 v1.01 Minimalist XeLaTeX article class (expl3)]

% Load expl3
\RequirePackage{expl3}
\ExplSyntaxOn

% Define keys for options
\keys_define:nn { candrakantah }
{
  fontsize .choice: ,
  fontsize .default:n = 12pt ,
  fontsize /10pt .code:n = { \PassOptionsToClass{10pt}{article} } ,
  fontsize /11pt .code:n = { \PassOptionsToClass{11pt}{article} } ,
  fontsize /12pt .code:n = { \PassOptionsToClass{12pt}{article} } ,

  papersize .choice: ,
  papersize .default:n = a4paper ,
  papersize /a4paper .code:n = { \PassOptionsToClass{a4paper}{article} } ,
  papersize /a5paper .code:n = { \PassOptionsToClass{a5paper}{article} } ,

  oneside .bool_set:N = \l_candrakantah_oneside_bool ,
  oneside .default:n = false ,
  twoside .code:n = { \PassOptionsToClass{twoside}{article} } ,

  portrait .bool_set:N = \l_candrakantah_portrait_bool ,
  portrait .default:n = false ,
  landscape .code:n = { \PassOptionsToClass{landscape}{article} }
}

% Process class options
\ProcessKeysOptions { candrakantah }

% Handle oneside/twoside
\bool_if:NT \l_candrakantah_oneside_bool { \PassOptionsToClass{oneside}{article} }
\bool_if:NF \l_candrakantah_oneside_bool { \PassOptionsToClass{twoside}{article} }

% Handle portrait/landscape
\bool_if:NT \l_candrakantah_portrait_bool { \PassOptionsToClass{portrait}{article} }
\bool_if:NF \l_candrakantah_portrait_bool { \PassOptionsToClass{landscape}{article} }

\LoadClass{article}

% Essential packages
\RequirePackage{iftex}
\RequireXeTeX
\RequirePackage{xparse}
\RequirePackage{xspace}
\RequirePackage{tabularx}
\RequirePackage[nomarginpar]{geometry}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{latexcolors}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{enumitem}
\RequirePackage{fontspec}
\RequirePackage{polyglossia}

% Typography settings
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 4pt}
\setlength{\emergencystretch}{3em}
\frenchspacing

% Page penalties
\clubpenalty=9996
\widowpenalty=9999
\brokenpenalty=4991
\predisplaypenalty=10000
\postdisplaypenalty=1549
\displaywidowpenalty=1602

\interfootnotelinepenalty 10
\vfuzz2pt
\hfuzz2pt

% Define colors
\definecolor{darkpowderblue}{rgb}{0.0, 0.2, 0.6}
\definecolor{cadmiumred}{rgb}{0.89, 0.0, 0.13}

% Graphics settings
\setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
\DeclareGraphicsExtensions{.png, .jpg, .jpeg, .pdf}

% Verbatim settings
\fvset{gobble=1,numbers=left}

% Itemization settings
\setlist[itemize]{noitemsep}
\setlist[description]{style=nextline,leftmargin=1.25em}

% Font settings
\defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
\setmainfont{gentium-bookplus}[Extension=.ttf, UprightFont=*-regular, ItalicFont=*-italic, BoldFont=*-bold, BoldItalicFont=*-bolditalic]
\setsansfont{libertinus-sans}[Extension=.otf, UprightFont=*-regular, ItalicFont=*-italic, BoldFont=*-bold, Scale=MatchLowercase]

% Language settings
\setmainlanguage[variant=british]{english}
\setotherlanguage{sanskrit}
\newfontfamily\sanskritfont[Script=Latin,Numbers=Lining,Scale=MatchLowercase]{Brill}
\newfontfamily\devanagarifont[Script=Devanagari,Mapping=iast-dn,Scale=MatchLowercase]{Shobhika}

% Macros for Sanskrit and transliteration
\NewDocumentCommand{\dn}{m}{\textsanskrit{\devanagarifont#1}}
\NewDocumentCommand{\sa}{m}{\textsanskrit{\sanskritfont#1}}
\NewDocumentCommand{\tl}{m}{\textsanskrit{\emph{\sanskritfont#1}}}

\NewDocumentCommand{\danda}{}{{\dn।}\@\xspace}
\NewDocumentCommand{\ddanda}{}{{\dn॥}\@\xspace}
\NewDocumentCommand{\iti}{m}{\begin{center}{\dn॥}\@\xspace \textsanskrit#1 {\dn॥}\end{center}\par}

% Improved numeral suffixes
\NewDocumentCommand{\st}{} {\textsuperscript{\textup{st}}\xspace}
\NewDocumentCommand{\nd}{} {\textsuperscript{\textup{nd}}\xspace}
\NewDocumentCommand{\rd}{} {\textsuperscript{\textup{rd}}\xspace}
\RenewDocumentCommand{\th}{} {\textsuperscript{\textup{th}}\xspace}

% Common abbreviations
\NewDocumentCommand{\eg}{} {\textit{e.g.,}\xspace}
\NewDocumentCommand{\ie}{} {\textit{i.e.,}\xspace}
\NewDocumentCommand{\viz}{} {\textit{viz.}\@\xspace}
\NewDocumentCommand{\etc}{} {\textit{etc.}\@\xspace}
\NewDocumentCommand{\etal}{} {\textit{et~al.}\@\xspace}

% Chronological abbreviations
\NewDocumentCommand{\AD}{} {\textsc{ce}{}\@\xspace}
\NewDocumentCommand{\BC}{} {\textsc{bce}{}\@\xspace}
\NewDocumentCommand{\BCE}{} {\textsc{bce}{}\@\xspace}
\NewDocumentCommand{\CE}{} {\textsc{ce}{}\@\xspace}
\NewDocumentCommand{\IAST}{} {\textsc{iast}{}\@\xspace}

% Fractional numbers with OpenType support
\NewDocumentCommand{\fr}{m/m} {\addfontfeatures{Fractions=On}#1/#2}

\ExplSyntaxOff
\endinput
