% cau_thesis.cls -- reusable CAU-style thesis class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cau_thesis}[2026/07/07 v1.0 Reusable thesis class template]
% Builds on top of the report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass{report}
%------------------------------------------------------------------------------------
%	                  PACKAGES
%------------------------------------------------------------------------------------
%\RequirePackage[latin1]{inputenc} % <- for special characters in the source file
\RequirePackage{xcolor} % <- for custom colors
\RequirePackage[english]{babel} % <- for English language support
\RequirePackage{mdframed} % <- framed/boxed theorem environments
\RequirePackage{xparse} % <- for defining macros that accept optional braced args
\RequirePackage{amsmath,amsfonts,amsthm} % <- for math environments and symbols
\RequirePackage{a4wide} % <- for wider margins
\RequirePackage{fancyhdr} % <- for custom headers and footers
% latexsym intentionally avoided; use amssymb/amsfonts for modern symbols.
\RequirePackage{amssymb} % <- for additional math symbols
\RequirePackage{enumerate} % <- for customizable lists
\RequirePackage{paralist} % <- for compact lists
\RequirePackage{tikz} % <- for drawing diagrams
\RequirePackage{listings} % <- for code listings
\RequirePackage{tocloft} % <- for customizing the table of contents
\RequirePackage{hyperref} % <- for hyperlinks in the document
\RequirePackage{hyperxmp} % <- for extended PDF/XMP metadata
\RequirePackage[figure]{hypcap}
\RequirePackage{etoolbox} % <- for safe hooks and macro accumulation
\RequirePackage{xstring} % <- for string manipulation (normalize urls)
\RequirePackage{float} % <- for improved control over figure and table placement
\RequirePackage{verbatim} % <- for multi-line comments and verbatim text
\RequirePackage{longtable} % <- for tables that span multiple pages
\RequirePackage{tabularx} % <- for tables with adjustable-width columns
\RequirePackage{multirow} % <- for multi-row cells in tables
\RequirePackage{multicol} % <- for multi-column text
\RequirePackage{booktabs} % <- for professional-quality tables
\RequirePackage{array} % <- for extended table features
\RequirePackage{caption} % <- for customizing captions
\RequirePackage{floatflt} % <- for floating figures and tables
\RequirePackage{afterpage} % <- for executing commands after the current page
\RequirePackage{graphicx} % <- for including graphics
\RequirePackage{csquotes} % <- for context-sensitive quotation facilities
\RequirePackage{moreverb} % <- for more verbatim features
\RequirePackage{algorithm} % <- for algorithm floats
\RequirePackage{algpseudocode} % <- for algorithmic commands like \State and \Require
\RequirePackage{bbm} % <- for blackboard bold math symbols
\RequirePackage{import} % <- for importing files
\RequirePackage{titlesec} % <- for customizing section titles
\RequirePackage{footnote}
%------------------------------------------------------------------------------------
%	                  ASSETS PATHS
%------------------------------------------------------------------------------------
\graphicspath{
  {./figures/} % <- General Images
  {./logos/} % <- General Logos
  {./tables/} % <- General Tables
}
%------------------------------------------------------------------------------------
%	                  PAGE DEFINITIONS
%------------------------------------------------------------------------------------
\setlength{\topmargin}{0.8cm}
\setlength{\headheight}{15pt}
\setlength{\headsep}{45pt}
\setlength{\topskip}{12pt}
\setlength{\evensidemargin}{0pt}
\setlength{\oddsidemargin}{0pt}
\setlength{\textheight}{240mm}
\setlength{\textwidth}{160mm}
\setlength{\voffset}{-2cm}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}
\sloppy
\frenchspacing
\allowdisplaybreaks
\hbadness=10000
\vbadness=10000
\hfuzz=120pt
\AtBeginDocument{\hfuzz=200pt\vfuzz=700pt\hbadness=10000\vbadness=10000}
\vfuzz=120pt
%----------------------------------------------------------------------------------------
%	                  CUSTOM COLORS
%----------------------------------------------------------------------------------------
\definecolor{CAU_MAIN}{HTML}{9b0a7d}
\definecolor{CAU_WISO}{HTML}{00677c}
\definecolor{CAU_MATH}{HTML}{F29401}
\definecolor{CustomGrey}{HTML}{B0B0B0}
%------------------------------------------------------------------------------------
%	                  CITATIONS AND REFERENCES
%------------------------------------------------------------------------------------
% Working references from the beamer class project of the seminar
\RequirePackage[backend=biber, style=alphabetic, hyperref=true]{biblatex}
% Keep each printed bibliography subsection together so link annotations do not
% leak into headers or footers at page breaks.
\let\regularprintbibliography\printbibliography
\RenewDocumentCommand{\printbibliography}{O{}}{%
    \par\noindent\begin{minipage}{\linewidth}%
        \regularprintbibliography[#1]%
    \end{minipage}\par%
}
% Add a running number at the very left before the [label]: "1. [ABC12] ..."
\newcounter{bibcount}
\defbibenvironment{bibliography}
{\list
    {\stepcounter{bibcount}\thebibcount.\hspace{0.5em}\printtext[labelalphawidth]{%
            \printfield{labelalpha}%
            \printfield{extraalpha}}}
    {\settowidth{\labelwidth}{99.\hspace{0.5em}[MMMM00]}%
        \setlength{\labelsep}{0.25em}%
        \setlength{\leftmargin}{\labelwidth}%
        \addtolength{\leftmargin}{\labelsep}%
        \setlength{\itemindent}{0pt}%
        \setlength{\listparindent}{0pt}%
        \setlength{\itemsep}{\bibitemsep}%
        \setlength{\parsep}{\bibparsep}}%
    \renewcommand*{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}}
{\endlist}
{\item}
% \RequirePackage[bibstyle=numeric,style=authoryear,citestyle=authoryear,autocite=footnote,backend=bibtex]{biblatex}
% \RequirePackage[bibstyle=numeric,style=authoryear, citestyle=authoryear-comp,autocite=footnote,backend=biber, hyperref=true]{biblatex}
% Customiye the citation style
% \DeclareCiteCommand{\textcite}
%   {\usebibmacro{prenote}}
%   {\usebibmacro{citeindex}%
%    \printnames{labelname}%
%    \setunit{\nameyeardelim}%
%    \printfield{year}}
%   {\multicitedelim}
%   {\usebibmacro{postnote}}
%------------------------------------------------------------------------------------
%	                  HYPERREF SETUP
%------------------------------------------------------------------------------------
% Customize the appearance of hyperlinks with the following lines
\newcommand{\thesislinkboxcolor}{CAU_MAIN}
\newcommand{\thesisshowlinkboxes}{true}
\newcommand{\thesis@frontmatterpageanchor}{false}
\newcommand{\thesispdfsubject}{}
\newcommand{\thesispdfkeywords}{}
\newcommand{\applylinkboxstyle}{%
    \IfStrEq{\thesisshowlinkboxes}{true}{%
        \hypersetup{%
            citebordercolor=\thesislinkboxcolor,
            linkbordercolor=\thesislinkboxcolor,
            urlbordercolor=\thesislinkboxcolor,
            pdfborder={0 0 0.5}%
        }%
    }{%
        \hypersetup{pdfborder={0 0 0}}%
    }%
}
\DeclareDocumentCommand{\linkboxcolor}{g}{%
    \IfNoValueTF{#1}{\thesislinkboxcolor}{%
        \renewcommand{\thesislinkboxcolor}{#1}%
        \applylinkboxstyle%
    }%
}
\DeclareDocumentCommand{\showlinkboxes}{g}{%
    \IfNoValueTF{#1}{\thesisshowlinkboxes}{%
        \renewcommand{\thesisshowlinkboxes}{#1}%
        \applylinkboxstyle%
    }%
}
\DeclareDocumentCommand{\frontmatterpageanchor}{g}{%
    \IfNoValueTF{#1}{\thesis@frontmatterpageanchor}{\renewcommand{\thesis@frontmatterpageanchor}{#1}}%
}
\DeclareDocumentCommand{\pdfsubject}{g}{%
    \IfNoValueTF{#1}{\thesispdfsubject}{\renewcommand{\thesispdfsubject}{#1}}%
}
\DeclareDocumentCommand{\pdfkeywords}{g}{%
    \IfNoValueTF{#1}{\thesispdfkeywords}{\renewcommand{\thesispdfkeywords}{#1}}%
}
\hypersetup{
    % colorlinks=true,
    linkcolor=CAU_MAIN, citecolor=CAU_MAIN, urlcolor=CAU_MAIN,
    breaklinks=true}
\applylinkboxstyle% Allow line breaks in links% Color for internal links (e.g., sections, equations)% Color for citations% Color for URLs    
\AtBeginDocument{%
    \hypersetup{%
        pageanchor=\thesis@frontmatterpageanchor,
        pdfsubject={\thesispdfsubject},
        pdfkeywords={\thesispdfkeywords},
        pdfurl={\thesisgiturl},
        pdfcontactemail={\thesisprivatemail},
        pdfauthortitle={\thesisprogramme}%
    }%
}
%------------------------------------------------------------------------------------
%	                  CHAPTER HEADINGS MANIPULATION
%------------------------------------------------------------------------------------
% Set chapter heading size here: \tiny, \small, \normalsize, \large, \Large, \LARGE, \huge, \Huge
% or use an explicit font size like \fontsize{20}{24}\selectfont
% \newcommand{\chapterheadingsize}{\huge}
\newcommand{\chapterheadingsize}{\LARGE}
% \newcommand{\chapterheadingsize}{\Large}
% \newcommand{\chapterheadingsize}{\fontsize{20}{24}\selectfont}
\titleformat{\chapter}[hang]
{\normalfont\chapterheadingsize\bfseries}{\thechapter}{1em}{}
\titlespacing*{\chapter}{0pt}{-50pt}{10pt} % Adjust the spacing before and after chapter titles
%------------------------------------------------------------------------------------
%	                  PAGE HEADER WITH CHAPTER NAME AND RULE
%------------------------------------------------------------------------------------
\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields
\fancyhead[L]{\nouppercase{\leftmark}} % chapter name on the left
\fancyfoot[C]{\thepage} % page number centered at bottom
\renewcommand{\headrulewidth}{0.4pt} % solid line below header
% Make the header rule span the full page width
\setlength{\headwidth}{\textwidth}
% Ensure chapter pages also use this style (overrides plain style)
\fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyhead[L]{\nouppercase{\leftmark}}%
    \fancyfoot[C]{\thepage}%
    \renewcommand{\headrulewidth}{0.4pt}%
}
%------------------------------------------------------------------------------------
%	                  COMMANDS
%------------------------------------------------------------------------------------
% Helper: print clickable link only when URL is non-empty
\newcommand{\maybehref}[2]{%
    \IfEq{#1}{}{% empty -> just print label
        #2%
    }{% non-empty -> clickable link
        \href{#1}{#2}%
    }%
}
% Student metadata placeholders (setter and getter using same name)
\newcommand{\thesisauthorname}{}
\newcommand{\thesisstunumber}{}
\newcommand{\thesisstuemail}{}
\newcommand{\thesisprivatemail}{}
\DeclareDocumentCommand{\thesisauthor}{g}{%
    \IfNoValueTF{#1}{\thesisauthorname}{\renewcommand{\thesisauthorname}{#1}}%
}
\DeclareDocumentCommand{\stunumber}{g}{%
    \IfNoValueTF{#1}{\thesisstunumber}{\renewcommand{\thesisstunumber}{#1}}%
}
\DeclareDocumentCommand{\stuemail}{g}{%
    \IfNoValueTF{#1}{\thesisstuemail}{\renewcommand{\thesisstuemail}{#1}}%
}
\DeclareDocumentCommand{\privatemail}{g}{%
    \IfNoValueTF{#1}{\thesisprivatemail}{\renewcommand{\thesisprivatemail}{#1}}%
}
\newcommand{\thesissubmissiondate}{}
\newcommand{\thesissubmissiondateCover}{}
\newcommand{\thesismonthname}[1]{%
    \IfStrEqCase{#1}{%
        {1}{January}{01}{January}%
        {2}{February}{02}{February}%
        {3}{March}{03}{March}%
        {4}{April}{04}{April}%
        {5}{May}{05}{May}%
        {6}{June}{06}{June}%
        {7}{July}{07}{July}%
        {8}{August}{08}{August}%
        {9}{September}{09}{September}%
        {10}{October}%
        {11}{November}%
        {12}{December}%
    }[#1]%
}
\def\thesissetcoverdate#1.#2.#3\relax{%
    \renewcommand{\thesissubmissiondateCover}{\thesismonthname{#2}, #3}%
}
\DeclareDocumentCommand{\submissiondate}{g}{%
    \IfNoValueTF{#1}{\thesissubmissiondate}{%
        \renewcommand{\thesissubmissiondate}{#1}%
        \thesissetcoverdate#1\relax%
    }%
}

% Cover submission date derived from \submissiondate{DD.MM.YYYY}; optional manual override retained.
\DeclareDocumentCommand{\submissiondateCover}{g}{%
    \IfNoValueTF{#1}{\thesissubmissiondateCover}{\renewcommand{\thesissubmissiondateCover}{#1}}%
}

% Institution / document metadata (setter/getter pattern)
\newcommand{\thesischair}{}
\newcommand{\thesisinstitute}{}
\newcommand{\thesisfaculty}{}
\newcommand{\thesistypedocument}{}
\newcommand{\thesisprogramme}{}
\DeclareDocumentCommand{\chair}{g}{%
    \IfNoValueTF{#1}{\thesischair}{\renewcommand{\thesischair}{#1}}%
}
\DeclareDocumentCommand{\institute}{g}{%
    \IfNoValueTF{#1}{\thesisinstitute}{\renewcommand{\thesisinstitute}{#1}}%
}
\DeclareDocumentCommand{\faculty}{g}{%
    \IfNoValueTF{#1}{\thesisfaculty}{\renewcommand{\thesisfaculty}{#1}}%
}
\DeclareDocumentCommand{\typedocument}{g}{%
    \IfNoValueTF{#1}{\thesistypedocument}{\renewcommand{\thesistypedocument}{#1}}%
}
\DeclareDocumentCommand{\programme}{g}{%
    \IfNoValueTF{#1}{\thesisprogramme}{\renewcommand{\thesisprogramme}{#1}}%
}

% Cooperation / partner note on title pages
\newcommand{\thesiscooperation}{}
\DeclareDocumentCommand{\cooperation}{g}{%
    \IfNoValueTF{#1}{\thesiscooperation}{\renewcommand{\thesiscooperation}{#1}}%
}
\newcommand{\thesislocation}{}
\DeclareDocumentCommand{\location}{g}{%
    \IfNoValueTF{#1}{\thesislocation}{\renewcommand{\thesislocation}{#1}}%
}

% License and GitHub repository metadata
\newcommand{\thesislicenseText}{}
\newcommand{\thesislicenseURL}{}

\DeclareDocumentCommand{\license}{m m}{%
    \renewcommand{\thesislicenseText}{#1}%
    \renewcommand{\thesislicenseURL}{#2}%
}
\DeclareDocumentCommand{\licencse}{m m}{\license{#1}{#2}}

\newcommand{\thesisgitlabel}{}
\newcommand{\thesisgiturl}{}

\DeclareDocumentCommand{\githubrepo}{m m}{%
    \renewcommand{\thesisgitlabel}{#1}%
    \renewcommand{\thesisgiturl}{#2}%
}
\DeclareDocumentCommand{\GitHubRepo}{m m}{\githubrepo{#1}{#2}}

% Supervisor / assessor metadata (setter/getter pattern)
\newcommand{\thesisfirstsupervisorname}{}
\newcommand{\thesisfirstsupervisortitle}{}
\newcommand{\thesisfirstsupervisordepartment}{}
\DeclareDocumentCommand{\firstsupervisorname}{g}{%
    \IfNoValueTF{#1}{\thesisfirstsupervisorname}{\renewcommand{\thesisfirstsupervisorname}{#1}}%
}
\DeclareDocumentCommand{\firstsupervisortitle}{g}{%
    \IfNoValueTF{#1}{\thesisfirstsupervisortitle}{\renewcommand{\thesisfirstsupervisortitle}{#1}}%
}
\DeclareDocumentCommand{\firstsupervisordepartment}{g}{%
    \IfNoValueTF{#1}{\thesisfirstsupervisordepartment}{\renewcommand{\thesisfirstsupervisordepartment}{#1}}%
}

\newcommand{\thesissecondsupervisorname}{}
\newcommand{\thesissecondsupervisortitle}{}
\newcommand{\thesissecondsupervisordepartment}{}
\DeclareDocumentCommand{\secondsupervisorname}{g}{%
    \IfNoValueTF{#1}{\thesissecondsupervisorname}{\renewcommand{\thesissecondsupervisorname}{#1}}%
}
\DeclareDocumentCommand{\secondsupervisortitle}{g}{%
    \IfNoValueTF{#1}{\thesissecondsupervisortitle}{\renewcommand{\thesissecondsupervisortitle}{#1}}%
}
\DeclareDocumentCommand{\secondsupervisordepartment}{g}{%
    \IfNoValueTF{#1}{\thesissecondsupervisordepartment}{\renewcommand{\thesissecondsupervisordepartment}{#1}}%
}

% Generic title page that does not require institutional logos or private assets.
\newcommand{\makethesistitlepage}{%
    \begin{titlepage}
        \centering
        \vspace*{1.5cm}
        {\LARGE \thesisfaculty\par}
        \vspace{0.5cm}
        {\Large \thesisinstitute\par}
        \vspace{1.5cm}
        {\huge\bfseries \@title\par}
        \vspace{1cm}
        {\Large \thesistypedocument\par}
        \vspace{0.5cm}
        {\large \thesisprogramme\par}
        \vspace{1.5cm}
        {\Large \thesisauthorname\par}
        \vfill
        {\large \thesislocation\par}
        {\large \thesissubmissiondate\par}
        \vspace{0.5cm}
        {\small \maybehref{\thesislicenseURL}{\thesislicenseText}\par}
        {\small \maybehref{\thesisgiturl}{\thesisgitlabel}\par}
    \end{titlepage}%
}

\newenvironment{rcases}
{\left.\begin{aligned}}
        {\end{aligned}\right\rbrace}
% Boxed multi-line equation with equation numbering on the right
\NewDocumentCommand{\boxedequationblock}{m m}{%
    \begin{equation}
        \begingroup
        \setlength{\fboxrule}{0.8pt}% border thickness
        \setlength{\fboxsep}{3pt}% padding inside box
        \fbox{%
            $\displaystyle
                \begin{aligned}
                    #2
                \end{aligned}$%
        }
        \endgroup
        \label{#1}
    \end{equation}
}
% \renewcommand{\baselinestretch}{1.25}                % Zeilenabstand
\renewcommand{\baselinestretch}{1.10}                % Zeilenabstand
\AtBeginDocument{\renewcommand{\figurename}{Figure}}   % Bezeichnung fuer Abbildungen
\renewcommand{\textfraction}{0}
\newcommand{\clearemptydoublepage}{%                 % neue Kapitel auf ungerade Seite
    \newpage{\pagestyle{empty}%
        \cleardoublepage}}
\newcounter{saveeqn}                                 % equation numbering (2.10 a)
\newcommand{\alpheqn}{%
    \stepcounter{equation}%
    \setcounter{saveeqn}{\value{equation}}%
    \setcounter{equation}{0}%
    \renewcommand{\theequation}{\arabic{chapter}.\arabic{saveeqn} \alph{equation}}}
\newcommand{\reseteqn}{%
    \setcounter{equation}{\value{saveeqn}}%
    \renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}}
\newcommand{\sgn}[1]{\rm sgn\left(#1\right)}         % sign-function
\newcommand{\vektor}[1]{\left(\begin{array}{c}#1\end{array}\right)} % Vektoren
\providecommand{\bm}[1]{{\mbox{{\boldmath$#1$}}}}        % Legacy bold math helper; prefer the bm package in new documents.
\newcommand{\mat}[1]{\boldsymbol{#1}}
%------------------------------------------------------------------------------------
%                  REUSABLE FIGURE HELPERS
%------------------------------------------------------------------------------------
% \blendfigure{<width>}{<height>}{<file>} inserts a centered TikZ group that
% draws the image twice with a multiply blend, matching the original inline
% pattern used in main.tex. Provide explicit width and height (e.g., 8cm).
\newcommand{\blendfigure}[3]{%
    \begin{tikzpicture}%
        \node[inner sep=0pt, outer sep=0pt] (img)
        {\includegraphics[width=#1,height=#2,keepaspectratio]{#3}};%
        \begin{scope}[blend group=multiply]%
            \fill[white] (img.south west) rectangle (img.north east);%
            \node[inner sep=0pt, outer sep=0pt, anchor=center] at (img.center)
            {\includegraphics[width=#1,height=#2,keepaspectratio]{#3}};%
        \end{scope}%
    \end{tikzpicture}%
}
%------------------------------------------------------------------------------------
%                  CAPTION-SAFE CITATION FOOTNOTES
%------------------------------------------------------------------------------------
\counterwithout{footnote}{chapter}
\makesavenoteenv{figure}
\makesavenoteenv{table}

\newcommand{\captionfootcite}[3][]{%
    \if\relax\detokenize{#1}\relax
        \caption[#2]{#2\protect\footnote{#3}}%
    \else
        \caption[#1]{#2\protect\footnote{#3}}%
    \fi
}
%------------------------------------------------------------------------------------
%	                  THEOREMS
%------------------------------------------------------------------------------------
\theoremstyle{definition}
\newtheorem{assumption}{Assumption}
\renewcommand*{\theassumption}{\Alph{assumption}}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem{corollary}{Corollary}
\newtheorem{proposition}{Proposition}
%------------------------------------------------------------------------------------
%	                  DEFINITIONS
%------------------------------------------------------------------------------------
\newtheorem{definition}{Definition}[chapter]
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
% Surround definitions with a boxed style
% \surroundwithmdframed[
%     linewidth=1pt,
%     linecolor=CAU_MAIN,
%     leftmargin=0pt,
%     rightmargin=0pt,
%     innertopmargin=6pt,
%     innerbottommargin=6pt,
%     skipabove=8pt,
%     skipbelow=8pt
% ]{definition}
%------------------------------------------------------------------------------------
%	                  CAPTION FORMATTING
%------------------------------------------------------------------------------------
% Make figure and table labels bold and hang wrapped caption lines under the label
\DeclareCaptionLabelFormat{bold}{{\bfseries #1 #2}}%
\captionsetup{
    labelformat=simple, % Change to simple
    format=hang,
    labelsep=colon,
    labelfont=bf,       % <- This already makes the label (e.g., "Figure 1:") bold!
    justification=raggedright,
    singlelinecheck=false
}
% Place table captions below the table (tables default to captions above in many classes)
\captionsetup[table]{position=bottom}
%------------------------------------------------------------------------------------
%	                  TABLE OF CONTENTS
%------------------------------------------------------------------------------------
\setcounter{secnumdepth}{3}
\setlength{\cftbeforetoctitleskip}{-3em} % Move ToC header upwards
\setlength{\cftbeforechapskip}{0.3em}
\setlength{\cftbeforesecskip}{0.15em}
\setlength{\cftbeforesubsecskip}{0.1em}
%------------------------------------------------------------------------------------
%	                  KEYWORDS ENVIRONMENT
%------------------------------------------------------------------------------------
% Prints the label and a same-line flush-left keyword block.
\newlength{\keywordlabelwidth}
\newenvironment{keywords}{%
    \par\medskip\noindent
    \begingroup
    \settowidth{\keywordlabelwidth}{\underline{Keywords:} }%
    \noindent\underline{Keywords:}~%
    \begin{minipage}[t]{\dimexpr\linewidth-\keywordlabelwidth\relax}%
    \raggedright\ignorespaces
}{%
    \end{minipage}%
    \par\endgroup\medskip
}
%------------------------------------------------------------------------------------
%	                  JEL CLASSIFICATION ENVIRONMENT
%------------------------------------------------------------------------------------
% Provide the same hanging-indent environment for JEL Classification
\newlength{\classificationlabelwidth}
\newenvironment{classification}{%
    \par\medskip\noindent
    \begingroup
    \settowidth{\classificationlabelwidth}{\underline{JEL Classification: } }%
    \hangindent=\classificationlabelwidth
    \hangafter=1
    \noindent\underline{JEL Classification: }\ignorespaces
}{%
    \par\endgroup\medskip
}
%------------------------------------------------------------------------------------
%	                  LIST OF FIGURES - LIST OF TABLES - LIST OF ALGORITHMS
%------------------------------------------------------------------------------------
% Display no default header text for this section
\makeatletter
\renewcommand{\@cftmakeloftitle}{}
\renewcommand{\@cftmakelottitle}{}
\@ifundefined{listalgorithmname}{}{\renewcommand{\listalgorithmname}{}}
\makeatother

% \makeatletter
% \newcommand{\listofalgorithmshere}{%
%     \begingroup
%     \let\clearpage\relax
%     \let\cleardoublepage\relax
%     \let\float@listhead\@gobble
%     \renewcommand{\listalgorithmname}{}%
%     \vspace*{0.3cm}
%     \listofalgorithms
%     \endgroup
% }
% \makeatother

% Inject the format override directly into the Algorithm file stream (.loa)
\makeatletter
\addtocontents{loa}{%
    \protect\renewcommand\protect\l@algorithm{\protect\@dottedtocline{1}{0em}{3.2em}}%
}
\makeatother

% 3. Your custom clean-header list layout
\makeatletter
\newcommand{\listofalgorithmshere}{%
    \begingroup
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \let\float@listhead\@gobble
    \renewcommand{\listalgorithmname}{}%
    \vspace*{0.3cm}
    \listofalgorithms
    \endgroup
}
\makeatother

% Number the algorithms according to the chapter
\numberwithin{algorithm}{chapter}

% Set the indentation for figure and table entries in the List of Figures and List of Tables
\cftsetindents{fig}{0em}{3.2em} % Adjust the second value to set the distance between the figure number and the caption text
\cftsetindents{tab}{0em}{3.2em} % Adjust the second value to set the distance between the table number and the caption text
%------------------------------------------------------------------------------------
%	                  FOOTNOTE FORMATTING
%------------------------------------------------------------------------------------
% Remove indentation for footnotes so the footnote number and text are
% flush with the left margin (no hanging indent).
\makeatletter
\renewcommand\@makefntext[1]{\noindent\@makefnmark\ #1}
\makeatother
\endinput