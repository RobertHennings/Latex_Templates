# cau_thesis

`cau_thesis` is a reusable LaTeX thesis class based on the standard `report` class. It provides a CAU-style thesis layout, metadata commands, link styling, bibliography support, theorem environments, algorithm/listing helpers, and title-page utilities.

This folder is self-contained: it ships the class, a thesis template entry point, chapter placeholders, bibliography, title-page hooks, assets, documentation, and a minimal example. Build from this folder so all relative paths resolve correctly.

## Minimal Usage

```latex
\documentclass[12pt,a4paper]{cau_thesis}

\title{A Minimal Thesis}
\author{Ada Lovelace}
\thesisauthor{Ada Lovelace}
\submissiondate{01.09.2026}
\faculty{Faculty Name}
\institute{Institute Name}
\typedocument{Master Thesis}
\programme{M.Sc. Programme}
\location{Kiel, Germany}
\license{CC BY 4.0}{https://creativecommons.org/licenses/by/4.0/}
\githubrepo{Project Repository}{https://example.org/repository}
\addbibresource{bibliography.bib}

\begin{document}
\makethesistitlepage
\hypersetup{pageanchor=true}
\tableofcontents
\chapter{Introduction}
Hello world.
\end{document}
```

A complete minimal example is available in `examples/thesis-example.tex`. The package manual source is available in the repository-level `doc/cau-thesis-doc.tex`.

## Public Commands

### Metadata

- `\thesisauthor{<name>}` sets/prints the thesis author used by title pages.
- `\stunumber{<number>}`, `\stuemail{<email>}`, and `\privatemail{<email>}` set student metadata.
- `\submissiondate{DD.MM.YYYY}` sets the submission date and derives a month/year cover date.
- `\pdfsubject{<text>}` and `\pdfkeywords{<comma-separated keywords>}` set PDF metadata.
- `\submissiondateCover{<text>}` manually overrides the cover date.
- `\chair{<text>}`, `\institute{<text>}`, `\faculty{<text>}`, `\typedocument{<text>}`, `\programme{<text>}`, `\cooperation{<text>}`, and `\location{<text>}` set institutional metadata.
- `\license{<label>}{<url>}` sets a license label and optional link.
- `\licencse{<label>}{<url>}` is retained as a deprecated compatibility alias.
- `\githubrepo{<label>}{<url>}` sets repository metadata.
- `\GitHubRepo{<label>}{<url>}` is retained as a compatibility alias.

### Supervisors

- `\firstsupervisorname{...}`, `\firstsupervisortitle{...}`, `\firstsupervisordepartment{...}`.
- `\secondsupervisorname{...}`, `\secondsupervisortitle{...}`, `\secondsupervisordepartment{...}`.

### Layout and Links

- `\linkboxcolor{<color name>}` changes the PDF link border color.
- `\showlinkboxes{true|false}` toggles visible PDF link boxes.
- `\frontmatterpageanchor{true|false}` controls the class-level initial `hyperref` page-anchor setting. The default is `false`; re-enable anchors with `\hypersetup{pageanchor=true}` after title/front matter when needed.
- `\makethesistitlepage` creates a generic title page without private/institutional images.

### Figures, Tables, and Bibliography Helpers

- `\captionfootcite[<short caption>]{<caption>}{<footnote/citation text>}` creates a caption with citation-style footnote text.
- `\blendfigure{<width>}{<height>}{<image>}` overlays a faded background copy of an image behind the foreground image.
- `\listofalgorithmshere` prints an algorithm list without an additional chapter title.

## Build

Use `latexmk` from inside `cau_thesis/` for normal builds:

```sh
latexmk -xelatex main.tex
latexmk -xelatex examples/thesis-example.tex
cd ..
latexmk -cd -xelatex doc/cau-thesis-doc.tex
```

`main.tex` is the full thesis template entry point. `examples/thesis-example.tex` is the reusable class smoke test and avoids project-specific title pages or assets.

## Folder Structure

- `cau_thesis.cls`: reusable class code.
- `main.tex`: full thesis template entry point.
- `chapters/`: thesis body, references, appendix, and affirmation files.
- `title_pages/`: title-page include hooks used by `main.tex`.
- `figures/`, `logos/`, `tables/`: project assets referenced by the template.
- `examples/`: minimal standalone example.
- `doc/`: package documentation source.

## License

The reusable class and documentation are intended to be distributed under the LaTeX Project Public License 1.3c or later. See `LICENSE`.
