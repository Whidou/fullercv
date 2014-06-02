%% start of file `fullercv.cls'.
%% Copyright 2014 Whidou (whidou@openmailbox.org).
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.

% Setup
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{customcv}
\LoadClass[11pt,a4paper,sans]{moderncv}
\ProcessOptions

% Packages
\RequirePackage[french,english]{babel}
\RequirePackage[scale=0.9,nohead,nofoot]{geometry}

% Base theme
\moderncvtheme{classic}

% Layout
\setlength{\hintscolumnwidth}{2.33cm}
\setlength{\separatorcolumnwidth}{0.3cm}

% Colors
\definecolor{color0}{rgb}{0,0,0}
\definecolor{color1}{rgb}{0.22,0.70,0.60}
\definecolor{color2}{rgb}{0.45,0.45,0.45}

% Title
\renewcommand*{\namefont}{\LARGE\mdseries\slshape}
\renewcommand*{\titlefont}{\fontsize{2.5em}{4em}\mdseries\upshape}
\renewcommand*{\namestyle}[1]{{\namefont\textcolor{color2}{#1}}}
\renewcommand*{\titlestyle}[1]{{\titlefont\textcolor{color0}{#1}}}
\renewcommand*{\makecvtitle}{%
%
    \recomputecvlengths%
%
    % Detailed information (pre-rendering)
    \def\phonesdetails{}%
    \collectionloop{phones}{%
        \protected@edef\phonesdetails{%
            \phonesdetails\protect\makenewline\csname\collectionloopkey%
            phonesymbol\endcsname\collectionloopitem%
        }}%
%
    \def\socialsdetails{}%
    \collectionloop{socials}{
        \protected@edef\socialsdetails{%
            \socialsdetails\protect\makenewline\csname\collectionloopkey%
            socialsymbol\endcsname\collectionloopitem%
        }}%
%
    \newbox{\makecvtitledetailsbox}%
    \savebox{\makecvtitledetailsbox}{%
        \addressfont\color{color2}%
        \begin{tabular}[b]{@{}r@{}}%
            \ifthenelse{\isundefined{\@addressstreet}}{}{%
                \makenewline\addresssymbol\@addressstreet%
                \ifthenelse{\equal{\@addresscity}{}}{}{%
                    \makenewline\@addresscity%
                }%
                \ifthenelse{\equal{\@addresscountry}{}}{}{%
                    \makenewline\@addresscountry%
                }}%
            \phonesdetails
            \ifthenelse{\isundefined{\@email}}{}{%
                \makenewline\emailsymbol\emaillink{\@email%
            }}%
            \ifthenelse{\isundefined{\@homepage}}{}{%
                \makenewline\homepagesymbol\httplink{\@homepage%
            }}%
            \socialsdetails
            \ifthenelse{\isundefined{\@extrainfo}}{}{\makenewline\@extrainfo}%
        \end{tabular}%
    }%
    \newlength{\makecvtitledetailswidth}%
    \settowidth{\makecvtitledetailswidth}{\usebox{\makecvtitledetailsbox}}%
%
    % Title and name
    \setlength{\makecvtitlenamewidth}{\textwidth-\makecvtitledetailswidth}%
    \begin{minipage}[b]{\makecvtitlenamewidth}%
        \titlestyle{\@title\\[.5em]}%
        \namestyle{\@firstname\ \@lastname}%
    \end{minipage}%
    \hfill%
%
    % Detailed information (rendering)
    \llap{\usebox{\makecvtitledetailsbox}}%
    \par%
}

\AtBeginDocument{%
    \renewcommand*{\labelitemi}{%
        \strut\textcolor{color1}{\large\rmfamily$\circ$}%
    }%
}

%% end of file `fullercv.cls'.
