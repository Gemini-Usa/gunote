\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gunote}[2024/01/25 Gemini Usagi LaTeX class for noting]
%
% Based on ctexrep documentclass
%
\LoadClass[fontset=none, punct=CCT]{ctexrep}
%
% Package dependencies
%
\RequirePackage{geometry}
\RequirePackage{amssymb}
\RequirePackage[math-style=ISO]{unicode-math}
\RequirePackage{tocloft}
\RequirePackage{xcolor}
\RequirePackage{caption}
\RequirePackage{minted}
\RequirePackage[theorems, breakable, minted]{tcolorbox}
%
% Options
%
\DeclareOption*{\ClassWarning{gunote}{Unknown option '\CurrentOption'}}
\ProcessOptions\relax
%
% Page setting
%
\geometry{
  hmargin=3cm,
  vmargin=4cm
}
%
% Font setting
%
\setmainfont{TeX Gyre Pagella}
\setsansfont{Gill Sans MT}
\setmonofont[Scale=0.9]{JetBrains Mono}
\setmathfont{TeX Gyre Pagella Math}
\setmathfont{Latin Modern Math}[range=cal]
\setCJKmainfont{Source Han Serif CN}[BoldFont=Source Han Serif CN Bold, ItalicFont=KaiTi]
\setCJKsansfont{.PingFang SC}[BoldFont=.PingFang SC Medium]
\setCJKmonofont{DengXian}
\setCJKfamilyfont{zhsong}{Source Han Serif CN}[BoldFont=Source Han Serif CN Bold]
\setCJKfamilyfont{zhhei}{.PingFang SC}[BoldFont=.PingFang SC Medium]
\setCJKfamilyfont{zhfs}{FangSong}
\setCJKfamilyfont{zhkai}{KaiTi}
\NewDocumentCommand\songti{}{\CJKfamily{zhsong}}
\NewDocumentCommand\heiti{}{\CJKfamily{zhhei}}
\NewDocumentCommand\fangsong{}{\CJKfamily{zhfs}}
\NewDocumentCommand\kaishu{}{\CJKfamily{zhkai}}
%
% Color define
%
\definecolor{mahirolight}  {RGB}{228,243,248}
\definecolor{mahirodark}   {RGB}{125,134,156}
\definecolor{mahiropink1}  {RGB}{234,157,169}
\definecolor{mahiropink2}  {RGB}{234,212,207}
\definecolor{mahirogray}   {RGB}{133,149,174}
\definecolor{miharigold}   {RGB}{245,195,134}
\definecolor{miharipurple} {RGB}{221,157,240}
\definecolor{miharired}    {RGB}{234,140,156}
\definecolor{kaedepink}    {RGB}{241,172,184}
\definecolor{kaedeblue}    {RGB}{103,210,231}
\definecolor{momijibrown}  {RGB}{151,119,128}
\definecolor{momijiblue}   {RGB}{152,213,238}
\definecolor{asahibrown}   {RGB}{188,153,134}
\definecolor{asahigreen}   {RGB}{119,147,109}
\definecolor{miyopurple}   {RGB}{185,133,145}
\definecolor{miyoyellow}   {RGB}{254,234,153}
%
% Title page redefine
%
\renewcommand{\maketitle}{
  \newpage
  \vspace*{2cm}
  {\raggedright\sffamily\Huge \@title\par}
  {\raggedright \textcolor{momijiblue}{\rule{0.8\linewidth}{2pt}}\par}
  \medskip
  {\raggedright\normalsize \@date\par}
  \bigskip
  {\raggedleft\large \@author\par}
  \vspace*{2cm}
  \thispagestyle{plain}
}
%
% Table of contents
%
\renewcommand{\cfttoctitlefont}{\huge\bfseries\color{mahirogray}}
\setlength{\cftaftertoctitleskip}{5ex}
%
% Chapter format setting
%
\ctexset{
  part/format+=\color{mahirogray},
  chapter/format+=\color{mahirogray},
  section/format+=\raggedright\color{mahirogray},
  subsection/format+=\color{mahirogray},
  subsubsection/format+=\color{mahirogray}
}
%
% Figure and table caption resetting
%
\captionsetup{
  font={color=mahirogray}
}
\numberwithin{figure}{section}
\numberwithin{table}{section}
%
% Settings of package tcolorbox
%
\tcbset{
  general/.style={
    rightrule=0pt,
    leftrule=3pt,
    toprule=0pt,
    bottomrule=0pt,
    sharp corners,
    fonttitle=\bfseries,
    breakable
  },
  default minted options={
    autogobble,
    linenos,
    breaklines,
    fontsize=\small,
    numbersep=2mm,
    style=xcode
  }
}
%
% Math things
%
\numberwithin{equation}{section}
\newcommand{\QEDsymbol}{\hfill$\square$}
\newtcbtheorem[number within=section]{Example}{例}{%
  general,
  colback=asahigreen!5, 
  colframe=asahigreen
}{eg} % Example env
\newtcbtheorem[number within=section]{Definition}{定义}{%
  general,
  colback=miharipurple!5,
  colframe=miharipurple
}{def} % Definition env
\newtcbtheorem[number within=section]{Theorem}{定理}{%
  general,
  colback=miharigold!5,
  colframe=miharigold
}{thm} % Definition env
\newenvironment{Proof}{\textbf{证：}}{\QEDsymbol} % Proof env
%
% Code environment based on tcolorbox
%
\DeclareTCBListing[auto counter, number within=section]{Code}{ m O{latex} }{
  listing only,
  listing engine=minted,
  minted language=#2,
  general,
  colback=mahirolight,
  colframe=mahirodark,
  title=代码~\thetcbcounter:~#1
}
\DeclareTCBListing{Code*}{ !O{latex} }{
  listing only,
  listing engine=minted,
  minted language=#1,
  general,
  colback=mahirolight,
  colframe=mahirodark
}