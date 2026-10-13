% cau_exec_summary.cls -- reusable CAU executive-summary class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cau_exec_summary}[2026/10/12 v1.0 CAU executive summary class]
\LoadClassWithOptions{../cau_thesis/cau_thesis}

\graphicspath{{../cau_thesis/logos/}}

\setlength{\headheight}{35pt}
\setlength{\headsep}{18pt}
\setlength{\textheight}{225mm}
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt}
\setlength{\columnsep}{0.65cm}
\titlespacing*{\section}{0pt}{1.2ex}{0.4ex}
\renewcommand{\thesection}{\arabic{section}}
\titleformat{\section}{\large\bfseries}{\thesection.}{0.5em}{}

\makeatletter
\newcommand{\executivetitle}{\@title}
\makeatother

\newcommand{\thesistermname}{}
\DeclareDocumentCommand{\thesisterm}{g}{%
    \IfNoValueTF{#1}{\thesistermname}{\renewcommand{\thesistermname}{#1}}%
}

\newcommand{\executivesummaryleftlogopath}{}
\newcommand{\executivesummaryrightlogopath}{}
\newcommand{\executivesummaryrightlogoopacity}{1}
\newcommand{\headerlogoleft}[1]{\renewcommand{\executivesummaryleftlogopath}{#1}}
\newcommand{\headerlogoright}[1]{\renewcommand{\executivesummaryrightlogopath}{#1}}
\newcommand{\headerlogorighttransparency}[1]{\renewcommand{\executivesummaryrightlogoopacity}{#1}}
\newcommand{\executivesummaryheadercolor}{CAU_MAIN}
\newcommand{\headerboxcolor}[1]{\renewcommand{\executivesummaryheadercolor}{#1}}
\newsavebox{\executivesummaryleftlogobox}
\newsavebox{\executivesummaryrightlogobox}
\newcommand{\executivesummaryheaderlogos}{%
    \IfStrEq{\executivesummaryleftlogopath}{}{%
        \sbox{\executivesummaryleftlogobox}{}%
    }{%
        \sbox{\executivesummaryleftlogobox}{%
            \includegraphics[width=0.34\textwidth]{\executivesummaryleftlogopath}%
        }%
    }%
    \IfStrEq{\executivesummaryrightlogopath}{}{%
        \sbox{\executivesummaryrightlogobox}{}%
    }{%
        \sbox{\executivesummaryrightlogobox}{%
            \begin{tikzpicture}[baseline=0pt]
                \node[
                    anchor=south west,
                    inner sep=0pt,
                    outer sep=0pt,
                    opacity=\executivesummaryrightlogoopacity
                ] at (0,0) {%
                    \includegraphics[width=0.34\textwidth]{\executivesummaryrightlogopath}%
                };
            \end{tikzpicture}%
        }%
    }%
    \noindent\makebox[\textwidth][l]{%
        \usebox{\executivesummaryleftlogobox}%
    }%
    \IfStrEq{\executivesummaryrightlogopath}{}{}{%
        \makebox[0pt][l]{%
            \hspace*{0.75cm}%
            \makebox[0pt][r]{%
                \raisebox{\dimexpr\ht\executivesummaryleftlogobox-\ht\executivesummaryrightlogobox+2.0cm\relax}[0pt][0pt]{%
                    \usebox{\executivesummaryrightlogobox}%
                }%
            }%
        }%
    }%
    \par
}
\fancypagestyle{executivesummary}{%
    \fancyhf{}%
    \fancyhead[C]{%
        \rule{0pt}{30pt}%
        \begin{tikzpicture}[remember picture,overlay]
            \node[
                anchor=north west,
                fill=\executivesummaryheadercolor,
                minimum width=\textwidth,
                minimum height=0.95cm,
                inner sep=0pt
            ] at ([xshift=\dimexpr1in+\hoffset+\oddsidemargin\relax]current page.north west) {\parbox[c][0.95cm][c]{\dimexpr\textwidth-1.4cm\relax}{%
                \color{white}\bfseries Executive Summary\hfill \thesisauthorname%
            }};
        \end{tikzpicture}%
    }%
    \fancyfoot[C]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
}

\fancypagestyle{summaryfirstpage}{%
    \fancyhf{}%
    \fancyfoot[C]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
}

\newcommand{\executivesummaryfrontmatter}{%
    \thispagestyle{summaryfirstpage}%
    \executivesummaryheaderlogos
    \vspace{1.2cm}
    {\Large\bfseries \typedocument\par}
    \vspace{0.65cm}
    {\Large\bfseries \executivetitle\par}
    \vspace{0.55cm}
    {\large \thesisauthor \ -- \programme\par}
    \vspace{0.6cm}
    Author: \thesisauthor\par
    Advisor: \firstsupervisorname\par
    Term: \thesisterm\par
    \vspace{0.12cm}
    \noindent\rule{\textwidth}{0.4pt}\par
    \begin{multicols}{2}
    \small
    \raggedcolumns
}
\AtBeginDocument{\pagestyle{executivesummary}}