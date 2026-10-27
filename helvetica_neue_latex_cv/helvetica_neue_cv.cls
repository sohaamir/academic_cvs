%% helvetica_neue_cv.cls
%% A LaTeX class reproducing the typography and layout of Romy Lorenz's
%% CV (March 2019, originally typeset in Microsoft Word). All sizes and
%% positions were measured from that PDF and are given in bp (PostScript
%% points), the unit used by PDF viewers, so they match the original 1:1.
%%
%% Compile with XeLaTeX (needs Helvetica Neue, which ships with macOS):
%%   latexmk -xelatex main.tex      (or run xelatex twice for "x of N")

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{helvetica_neue_cv}[2026/10/20 CV class after Romy Lorenz's 2019 CV]

\LoadClass[a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% PAGE GEOMETRY %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Text block runs from x = 71.3bp to x = 539.3bp (468bp wide).
\RequirePackage[
	a4paper,
	left       = 71.3bp,
	right      = 56bp,
	top        = 58bp,
	bottom     = 58bp,
	headheight = 14bp,
	headsep    = 7.5bp,
	footskip   = 20bp
]{geometry}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% FONTS %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Body text is Helvetica Neue Light; bold is Helvetica Neue Bold.
\RequirePackage{fontspec}
\setmainfont{Helvetica Neue}[
	UprightFont    = * Light,
	ItalicFont     = * Light Italic,
	BoldFont       = * Bold,
	BoldItalicFont = * Bold Italic
]
\newfontfamily\cvmedium{Helvetica Neue Medium}		% used for years in publications
\newfontfamily\cvregular{Helvetica Neue}

% The sizes used throughout the original. \fontsize reads its arguments as
% TeX points, so \cv@fontsize converts the measured bp values first.
\newcommand{\cv@fontsize}[2]{\fontsize{\fpeval{#1*72.27/72}}{\fpeval{#2*72.27/72}}\selectfont}
\renewcommand{\normalsize}{\cv@fontsize{9.12}{11}}		% main entry text
\newcommand{\sizedate}{\cv@fontsize{7.92}{9.6}}			% dates, labels, header, footer
\newcommand{\sizedesc}{\cv@fontsize{6.96}{8.4}}			% descriptions and publications
\newcommand{\sizeloc}{\cv@fontsize{6}{7.9}}				% city/country under institutions
\newcommand{\sizesection}{\cv@fontsize{12}{14}}			% section headings
\newcommand{\sizename}{\cv@fontsize{24}{28}}			% name on page 1
\newcommand{\sizetitle}{\cv@fontsize{12}{14}}			% "Curriculum Vitae" on page 1
\newcommand{\sizerunhead}{\cv@fontsize{11.04}{13}}		% running head on pages 2+
\normalsize

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% FAKE SMALL CAPS %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Helvetica Neue has no small caps, so (like Word) lowercase letters are
% uppercased and set at a fraction of the current size. Usage:
%   \fakesc{Text}          (default ratio 0.8)
%   \fakesc[0.826]{Text}
\ExplSyntaxOn
\cs_new_protected:Npn \__cv_sc_char:nn #1#2
	{
		\tl_set:Ne \l_tmpb_tl { \text_uppercase:n {#2} }
		\tl_if_eq:NnTF \l_tmpb_tl {#2}
			{#2}
			{ { \fontsize { \fp_eval:n { #1 * \f@size } pt } { \baselineskip } \selectfont \l_tmpb_tl } }
	}
\NewDocumentCommand \fakesc { O{0.8} m }
	{
		\seq_set_split:Nnn \l_tmpa_seq { ~ } {#2}
		\seq_map_indexed_inline:Nn \l_tmpa_seq
			{
				\int_compare:nNnT {##1} > {1} { \c_space_tl }
				\tl_map_inline:nn {##2} { \__cv_sc_char:nn {#1} {####1} }
			}
	}
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% COLOURS AND LINKS %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xcolor}
\definecolor{cvrule}{gray}{0.749}		% grey rule under the page 1 header
\definecolor{cvpub}{HTML}{222222}		% publication text
\definecolor{cvlink}{HTML}{0563C1}		% Word's hyperlink blue

\RequirePackage{url}
\urlstyle{same}
\RequirePackage[colorlinks=true, linkcolor=black, urlcolor=cvlink]{hyperref}

% A link set in the surrounding text colour (header, emails, DOIs)
\newcommand{\plainhref}[2]{{\colorlet{cv@current}{.}\href{#1}{\color{cv@current}#2}}}
\newcommand{\email}[1]{\plainhref{mailto:#1}{#1}}
\newcommand{\doi}[1]{\plainhref{https://doi.org/#1}{doi:~\nolinkurl{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% SECTION HEADINGS %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\section}{\sizesection\bfseries\raggedright}{}{0pt}{\fakesc}
\titlespacing*{\section}{0pt}{18bp}{2.7bp}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% PERSONAL DETAILS AND PAGE 1 HEADER %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set these in the preamble of main.tex. Separate lines with \\.
\newcommand{\cv@name}{}
\newcommand{\cv@address}{}
\newcommand{\cv@contact}{}
\newcommand{\cv@updated}{}
\newcommand{\cvname}[1]{\renewcommand{\cv@name}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cv@address}{#1}}
\newcommand{\cvcontact}[1]{\renewcommand{\cv@contact}{#1}}
\newcommand{\cvupdated}[1]{\renewcommand{\cv@updated}{#1}}

% Address (left), "Curriculum Vitae" (centre), contact details (right) and
% the grey rule are placed at absolute page positions, as in the original.
\newcommand{\cv@firstpageheader}{%
	\setlength{\unitlength}{1bp}%
	\put(73.2,-19.5){\sizedate
		\begin{tabular}[t]{@{}l@{}}\cv@address\end{tabular}}%
	\put(535.5,-19.5){\sizedate
		\llap{\begin{tabular}[t]{@{}r@{}}\cv@contact\end{tabular}}}%
	\put(297.64,-48.1){\makebox[0pt]{\sizetitle Curriculum Vitae}}%
	\put(65.5,-53.7){\color{cvrule}\rule[-0.625bp]{474.1bp}{1.25bp}}%
}

% Call right after \begin{document}
\newcommand{\makecvheader}{%
	\thispagestyle{cvfirstpage}%
	\AddToHookNext{shipout/foreground}{\cv@firstpageheader}%
	\vspace*{-17bp}%
	{\centering
		\sizename\fakesc[0.79]{\cv@name}\par
		\ifx\cv@updated\@empty\else
			\vspace{-12bp}{\sizedesc Last updated: \cv@updated}\par
		\fi}%
	\vspace{-14bp}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% RUNNING HEAD AND FOOTER %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\newcommand{\cv@pagecount}{\sizedate\thepage\ of \pageref*{LastPage}}

\fancypagestyle{cvfirstpage}{%
	\fancyhf{}%
	\fancyfoot[C]{\cv@pagecount}%
}
\fancypagestyle{cv}{%
	\fancyhf{}%
	\fancyhead[L]{\sizerunhead Curriculum Vitae -- \fakesc[0.826]{\cv@name}}%
	\fancyfoot[C]{\cv@pagecount}%
}
\pagestyle{cv}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% ENTRIES %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\present}{present}		% word used for open-ended dates

% Small description text beneath an entry title
\newcommand{\cvdesc}[1]{\par{\sizedesc #1\par}}

% Three-column entry, as in Education and Research Positions:
%   \cventry{dates}{title}{description}{institution}{location}
% Columns: dates 85bp | title + description 262bp | gap 7bp | institution 114bp
\newcommand{\cventry}[5]{%
	\par\noindent
	\parbox[t]{85bp}{\leavevmode\sizedate #1}%
	\parbox[t]{262bp}{\raggedright #2%
		\if\relax\detokenize{#3}\relax\else\cvdesc{#3}\fi}%
	\hspace{7bp}%
	\parbox[t]{114bp}{\raggedright #4%
		\if\relax\detokenize{#5}\relax\else\par{\sizeloc #5\par}\fi}%
	\par\vspace{3.5bp}%
}

% Two-column entry with a label column of the given width, as in Teaching,
% Public Engagement, Grants and Skills:
%   \cvitem[label width]{dates or label}{content}
\newcommand{\cvitem}[3][64bp]{%
	\par\noindent
	\parbox[t]{#1}{\leavevmode\sizedate\raggedright #2}%
	\parbox[t]{\dimexpr\linewidth-#1\relax}{\raggedright #3}%
	\par\vspace{2.5bp}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% PUBLICATIONS %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A group of publications with its label on the left, level with the first
% entry. Groups can break across pages.
%   \begin{pubgroup}{Journal papers} \pub{...} \pub{...} \end{pubgroup}
\newcommand{\me}{\textbf{Sohail A}}				% highlighted own name
\newcommand{\yr}[1]{{\cvmedium #1}}				% year, in Helvetica Neue Medium

\newcommand{\cv@publabel}{}
\newenvironment{pubgroup}[1]{%
	\par\renewcommand{\cv@publabel}{#1}%
	\sizedesc\color{cvpub}\raggedright
	\leftskip=70.8bp
}{%
	\par\vspace{10bp}%
}

% A single publication with a 35bp hanging indent; the first one in a group
% also prints the group label in the left column
\newcommand{\pub}[1]{%
	\par\hangindent=35bp\hangafter=1
	\leavevmode
	\ifx\cv@publabel\@empty\else
		\llap{\makebox[70.8bp][l]{\smash{\color{black}\normalsize
			\parbox[t]{64bp}{\raggedright\cv@publabel}}}}%
		\renewcommand{\cv@publabel}{}%
	\fi
	#1\par\vspace{1.2bp}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% REFERENCES %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   \referee{name}{url}{position}{department}{institution}{email}
% Place several in a row; each is a 152bp-wide column.
\newcommand{\referee}[6]{%
	\parbox[t]{152bp}{\raggedright
		\textbf{\plainhref{#2}{#1}}\par
		{\sizedate #3\\ #4\\ #5\\ \email{#6}\par}}%
	\hspace{6bp}%
}

\endinput
