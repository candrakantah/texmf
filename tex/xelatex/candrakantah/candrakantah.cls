% candrakantah.cls - A minimalist XeLaTeX class for IAST and Devanagari
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{candrakantah}[2025/02/11 v1.0.0 Minimalist XeLaTeX class]

% Require XeTeX
\RequireXeTeX

% Ensure a recent LaTeX version
\RequirePackage{expl3}
\RequirePackage{xparse}
\RequirePackage{l3keys2e}
\RequirePackage{geometry}

\ExplSyntaxOn

% Define class options using expl3
\keys_define:nn { candrakantah }
{
  fontsize .choices:nn = {10pt, 11pt, 12pt} { \PassOptionsToClass { #1 } { article } },
  fontsize .default:n = 12pt,
  papersize .choices:nn = {a4paper, a5paper} { \PassOptionsToClass { #1 } { article } },
  papersize .default:n = a4paper,
  pagestyle .choices:nn = {oneside, twoside} { \PassOptionsToClass { #1 } { article } },
  pagestyle .default:n = twoside,
  orientation .choices:nn = {portrait, landscape} { \PassOptionsToClass { #1 } { article } },
  orientation .default:n = portrait
}

\ProcessKeysOptions { candrakantah }

% Check for unknown options
\DeclareOptionX{*}{
  \ClassWarning{candrakantah}{Unknown or non-standard option '\CurrentOption'. I'll see if I can load it from the article class. If you get a warning unused global option(s): `\CurrentOption` then the option is not supported!}
  \PassOptionsToClass{\CurrentOption}{article}
}

% Load base class
\LoadClass{article}

% Document geometry
\RequirePackage[nomarginpar]{geometry}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt plus 2pt minus 4pt}
\setlength{\emergencystretch}{3em}
\frenchspacing

% Page layout adjustments
\makeatletter
\let\ps@plain\ps@empty
\makeatother

% Penalty settings
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
\RequirePackage{xcolor}
\definecolor{darkpowderblue}{RGB}{0, 51, 153}
\definecolor{cadmiumred}{RGB}{227, 0, 34}

% Graphics support
\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.png,.jpg,.jpeg,.pdf}

% FancyVerbatim settings
\RequirePackage{fancyvrb}
\fvset{gobble=1,numbers=left}

% Custom commands
\NewDocumentCommand \st {} {\textsuperscript{st}\xspace}
\NewDocumentCommand \nd {} {\textsuperscript{nd}\xspace}
\NewDocumentCommand \rd {} {\textsuperscript{rd}\xspace}
\RenewDocumentCommand \th {} {\textsuperscript{th}\xspace}

\NewDocumentCommand \eg {} {\textit{e.g.,}\xspace}
\NewDocumentCommand \ie {} {\textit{i.e.,}\xspace}
\NewDocumentCommand \viz {} {\textit{viz.}\xspace}
\NewDocumentCommand \etc {} {\textit{etc.}\xspace}
\NewDocumentCommand \etal {} {\textit{et~al.}\xspace}

\NewDocumentCommand \AD {} {\textsc{ce}\xspace}
\NewDocumentCommand \BC {} {\textsc{bce}\xspace}
\NewDocumentCommand \BCE {} {\textsc{bce}\xspace}
\NewDocumentCommand \CE {} {\textsc{ce}\xspace}
\NewDocumentCommand \IAST {} {\textsc{iast}\xspace}

\NewDocumentCommand \fr {m/m} {\addfontfeatures{Fractions=On}#1/#2}
\NewDocumentCommand \diatop {O{} O{}} {
  \leavevmode\setbox1=\hbox{{#1}}
  \setbox2=\hbox{{#2}}
  \dimen0=\ifdim\wd1>\wd2\wd1\else\wd2\fi
  \dimen1=\ht2\advance\dimen1by-1ex
  \setbox1=\hbox to1\dimen0{\hss#1\hss}
  \rlap{\raise1\dimen1\box1}
  \hbox to1\dimen0{\hss#2\hss}}

% Headers and footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\leftmark}
\fancyhead[R]{\rightmark}
\fancyfoot[L]{\thepage}
\fancyfoot[R]{\thepage}
\fancypagestyle{plain}{\fancyhf{}}

% Tables and lists
\RequirePackage{booktabs,enumitem}
\setlist{noitemsep,topsep=0pt}

% Hyperref setup
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=darkpowderblue,
  citecolor=cadmiumred,
  urlcolor=darkpowderblue,
  pdfauthor={},
  pdftitle={},
  pdfsubject={},
  pdfkeywords={}
}

\ExplSyntaxOff
