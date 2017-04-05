
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MNE_UOM_thesis}[2017/03/22 v1.0 UOM MNE thesis class by Josef Magri]

%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
%\LoadClass[a4paper,twoside,openright]{report}

\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing

\raggedbottom

%define the default submitted text
\newcommand{\submittedtext}{Submitted in partial fulfillment of the requirements for the degree of}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the thesis is submitted 

\newtoks\degreedate
\newtoks\title
\newtoks\author
\newtoks\degree
\newtoks\department

% % The full (unabbreviated) name of the degree
% \def\degree#1{\gdef\@degree{#1}}
% % The name of your Oxford college (e.g. Christ Church, Pembroke)
% \def\department#1{\gdef\@department{#1}}


% Latest Logo, Square version (the default!)
% you need an oxlogo.eps or oxlogo.pdf file as appropriate
\def\logo{{\includegraphics[width=32mm]{UOMcrest}}}
{}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \null\vfill
  \begin{center}
  
     { \Huge {\bfseries {\the\title}} \par}
     
     {{\Large \vspace*{5ex}\bfseries {\the\author}} \par}
    
    {\large \vspace*{25mm} {\logo \par} \vspace*{25mm}}

    {\large \vspace*{1ex}
    {\bfseries{\the\department} \par}
    
    \vspace*{1ex}
    \bfseries{University of Malta \par}
    
    \vspace*{2ex}
    {\the\degreedate} \par}
    
    \vspace*{25mm}
    {{\submittedtext} \par}
    
    \vspace*{1ex}
    {\it {\the\degree} \par}
    
  \end{center}
  \null\vfill
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


% COPYRIGHT NOTICE
%

\newenvironment{copyrightnotice}
{\begin{alwayssingle}
  \thispagestyle{plain}
%   \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries COPYRIGHT NOTICE}
% \end{center}
  \vspace{0.5cm}
\begin{center}}
{\end{center}\end{alwayssingle}}

% DECLERATION 
%

\newenvironment{declaration}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace{1.5cm}
{\large  \bfseries FACULTY OF INFORMATION AND COMMUNICATION TECHNOLOGY \par}
\vspace{0.5cm}
{\large \bfseries DECLARATION}
\end{center}
\vspace{0.5cm}
\begin{center}}
{\end{center}\end{alwayssingle}}

% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries ACKNOWLEDGEMENTS}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  ABSTRACT}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%Table of Contents
%
\renewcommand*\contentsname{
    \begin{center}
        % \vspace*{1.5cm}
            {\Large \bfseries   TABLE OF CONTENTS}
    \end{center}
}

%List of figures
%
\renewcommand*\listfigurename{
    \begin{center}
        % \vspace*{1.5cm}
            {\Large \bfseries   LIST OF FIGURES}
    \end{center}
}

%List of tables
%
\renewcommand*\listtablename{
    \begin{center}
        % \vspace*{1.5cm}
            {\Large \bfseries   LIST OF TABLES}
    \end{center}
}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

 \newenvironment{romanpages}
 {\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
 {\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
