# CAU Presentation

`cau_presentation` is a reusable Beamer style package for CAU-themed presentations.
This folder is self-contained: it ships the style file, a presentation template entry point, slide section files, bibliography, title page, figures/data, and a minimal example. Build from this folder so all relative paths resolve correctly.

## Minimal Usage

```tex
\documentclass{beamer}
\usepackage{cau_presentation}

\title[Short Title]{Full Presentation Title}
\author[Short Author]{Author Name}
\institute[CAU]{Christian-Albrechts-Universität zu Kiel}
\date{\today}

\begin{document}
\begin{frame}
  \titlepage
\end{frame}
\end{document}
```

## Package Options

```tex
\usepackage[
  theme=Madrid,
  innertheme=circles,
  maincolor=9b0a7d,
  accentcolor=00677c,
  neutralcolor=B0B0B0,
  hidelinks=true,
  numberedcaptions=true
]{cau_presentation}
```

- `theme`: Beamer outer theme loaded via `\usetheme`.
- `innertheme`: Beamer inner theme loaded via `\useinnertheme`.
- `maincolor`: Main CAU color in HTML hex without `#`.
- `accentcolor`: Accent/faculty color in HTML hex without `#`.
- `neutralcolor`: Neutral grey color in HTML hex without `#`.
- `hidelinks`: Enables hidden PDF link borders.
- `numberedcaptions`: Enables numbered figure/table captions.

## Helper Macros

Preferred namespaced commands:

```tex
\caupresentationlistfigure{<label>}{<caption text>}
\caupresentationlisttable{<label>}{<caption text>}
\caupresentationclickablefigure[<graphics options>]{<file>}{<caption>}{<url>}
```

For backwards compatibility, the package also provides `\listfigure`, `\listtable`, and `\clickablefigure` if these names have not already been defined.

## Bibliography and Metadata

Add bibliography resources in the document:

```tex
\addbibresource{references.bib}
\hypersetup{pdfauthor={Author}, pdftitle={Title}}
```

The style package loads `biblatex` with the `biber` backend. Use `latexmk -xelatex` so the bibliography tool is run automatically.

## Build

Use `latexmk` from inside `cau_presentation/`:

```sh
latexmk -xelatex main.tex
latexmk -xelatex examples/presentation-example.tex
```

## Folder Structure

- `cau_presentation.sty`: reusable Beamer style code.
- `main.tex`: full presentation template entry point.
- `titlepage.tex`: custom title frame used by `main.tex`.
- `chapters/`: slide section files and supporting lists/references.
- `figures/`, `data/`: assets referenced by the template.
- `examples/`: minimal standalone example.

## CTAN Notes

Before CTAN submission, add a clear free software license file, package documentation PDF/source, and a minimal example document.
