% resume.cls
% Custom one-page resume class, styled after the SJTU "Blue Dream" Typst
% template (colored header banner, icon + rule section headings, arrow
% bullets) that this project was originally scaffolded from.
%
% Usage:
%   \documentclass{resume}            % English content -> compile with pdflatex or xelatex
%   \documentclass[zh]{resume}        % Chinese content  -> MUST compile with xelatex
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/07/16 v1.0 Custom one-page resume class]

\newif\if@zh
\@zhfalse
\DeclareOption{zh}{\@zhtrue}
\ProcessOptions\relax

\LoadClass[10pt,a4paper]{article}

\RequirePackage[margin=1.15cm,top=0.4cm,bottom=0.2cm]{geometry}
\RequirePackage{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{ragged2e}
\RequirePackage[hidelinks]{hyperref}

\if@zh
  \RequirePackage[fontset=fandol,heading=false]{ctex}
\else
  \RequirePackage{lmodern}
\fi

% ---------------------------------------------------------------- colors ---
\definecolor{themecolor}{RGB}{23,95,139}
\definecolor{darkgray}{RGB}{80,80,80}
\definecolor{midgray}{RGB}{120,120,120}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\emergencystretch}{2em}
\linespread{0.9}\selectfont

\hypersetup{colorlinks=true, urlcolor=themecolor, linkcolor=themecolor}
\newcommand{\resumelink}[2]{\href{#1}{\color{themecolor}#2}}

% ------------------------------------------------------------- bullets ----
\setlist[itemize,1]{%
  label={\color{themecolor}\small\faAngleRight},
  leftmargin=1.2em,
  itemsep=0pt,
  topsep=0.02em,
  parsep=0pt,
  partopsep=0pt
}

% -------------------------------------------------------------- header ---
% #1 name  #2 tagline (target role)  #3 contact info line (icons + text)
\newcommand{\resumeheader}[3]{%
  \noindent
  \colorbox{themecolor}{%
    \begin{minipage}[t]{\dimexpr\linewidth-2\fboxsep\relax}
      \color{white}\raggedright
      \vspace{0.3em}
      \begin{tabularx}{\linewidth}{@{}X r@{}}
        {\fontsize{19}{23}\selectfont\bfseries #1} & {\fontsize{10}{12}\selectfont #2} \\
      \end{tabularx}
      \vspace{0.2em}\par
      {\small #3}
      \vspace{0.3em}
    \end{minipage}%
  }
  \vspace{0.35em}
  \color{black}
}

% contact info helper: \contactitem{\faSomeIcon}{text}
\newcommand{\contactitem}[2]{{#1}\,#2}
\newcommand{\contactsep}{\quad\textbar\quad}

% ------------------------------------------------------------- sections ---
% #1 fontawesome icon command  #2 section title
\newcommand{\ressection}[2]{%
  \vspace{0.02em}
  {\color{themecolor}\bfseries #1\ \ #2}\par
  \vspace{-0.65em}
  {\color{themecolor}\rule{\linewidth}{0.8pt}}
  \vspace{0.02em}
}

% -------------------------------------------------------- entry heading ---
% \resumeentry{Title/Institution}{Date range}{Subtitle/Degree}{Location}
\newcommand{\resumeentry}[4]{%
  \noindent
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1} & {\color{darkgray}\footnotesize #2} \\
  \end{tabularx}%
  \ifx&#3&\else
    \par\vspace{-0.22em}
    \noindent
    \begin{tabularx}{\linewidth}{@{}X r@{}}
      {\itshape\color{darkgray}\footnotesize #3} & {\color{midgray}\footnotesize\itshape #4} \\
    \end{tabularx}%
  \fi
  \vspace{0.02em}
}

% ----------------------------------------------------------- skill line ---
% \skillline{Category}{content}
\newcommand{\skillline}[2]{%
  \noindent{\color{themecolor}\bfseries #1: }#2\par\vspace{0.08em}
}

% ------------------------------------------------------- draft placeholder ---
\newcommand{\TODO}[1]{\textcolor{red}{\bfseries [#1]}}

\endinput
