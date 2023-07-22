\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gunote}[2023/07/22 Gemini Usagi LaTeX class for noting]
%
% Based on ctexart documentclass
%
\LoadClass[fontset=none]{ctexart}
%
% Package dependencies
%
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{unicode-math}
\RequirePackage{tocloft}
\RequirePackage{xcolor}
\RequirePackage{caption}
\RequirePackage{minted}
%
% Options
%
\DeclareOption*{\ClassWarning{gunote}{Unknown option '\CurrentOption'}}
\ProcessOptions\relax
%
% Font setting
%
\setmainfont{TeX Gyre Pagella}
\setsansfont{Gill Sans MT}
\setmonofont{JetBrains Mono}
\setmathfont{TeX Gyre Pagella Math}
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
\definecolor{mahirolight}{RGB}{228,243,248}
\definecolor{mahirodark}{RGB}{125,134,156}
\definecolor{mahiropink1}{RGB}{234,157,169}
\definecolor{mahiropink2}{RGB}{234,212,207}
\definecolor{mahirogray}{RGB}{133,149,174}
\definecolor{miharigold}{RGB}{245,195,134}
\definecolor{miharipurple}{RGB}{221,157,240}
\definecolor{miharired}{RGB}{234,140,156}
\definecolor{kaedepink}{RGB}{241,172,184}
\definecolor{kaedeblue}{RGB}{103,210,231}
\definecolor{momijibrown}{RGB}{151,119,128}
\definecolor{momijiblue}{RGB}{152,213,238}
\definecolor{asahibrown}{RGB}{188,153,134}
\definecolor{asahigreen}{RGB}{119,147,109}
\definecolor{miyopurple}{RGB}{185,133,145}
\definecolor{miyoyellow}{RGB}{254,234,153}
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
%
% Minted setting
%
\setminted{linenos, breaklines, frame=topline, framerule=2pt, framesep=4pt, style=xcode, bgcolor=mahirolight, highlightcolor=miyoyellow, rulecolor=mahirodark}