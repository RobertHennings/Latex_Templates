# Installation and build notes

## Requirements

- A TeX engine that supports OpenType fonts and unicode: `XeLaTeX` or `LuaLaTeX`.
- `biber` when using `biblatex`-based bibliographies.
- `latexmk` is recommended for convenient builds.

## Local development

1. Compile from the repository root or the specific example folder.
2. Example build command (XeLaTeX + biber):

```bash
cd kiel_report
latexmk -xelatex -bibtex -interaction=nonstopmode example_article.tex

# Kiel Working Paper
cd ../kiel_working_paper
latexmk -xelatex -bibtex -interaction=nonstopmode example_article.tex
```

Note: replace `-bibtex` with `-pdf`/`-xelatex` flags as appropriate; when using `biber` run `latexmk -xelatex -interaction=nonstopmode -use-biber example_article.tex`.

## Installing system-wide (TDS layout)

1. Create a local texmf tree (if not already): `mkdir -p ~/texmf/tex/latex/kielinstitute` and copy the `.sty` files and `common/` assets there.
2. Run `texhash` (or `mktexlsr`) if your TeX distribution requires it.

## Fonts and logos

- Fonts included in `kielinstitute/common/fonts/` may have licensing restrictions. Verify font licenses before redistributing on CTAN. If fonts are not redistributable, remove them from the CTAN upload and document installation steps for end users.

## Bundled fonts policy

- The repository excludes proprietary fonts from the CTAN-distributable tree. The following fonts are NOT distributed with the package and must be installed by the user if required by a template:
  - `Cambria Math` (`cambria-math.ttf`) — proprietary (Microsoft).
  - `Suisse` family — commercial; obtain from the design supplier or your institution's asset library.

If you require the exact corporate fonts for publication, install them into your local texmf tree under `~/texmf/fonts/opentype/` (or system-wide as your OS requires). Example:

```bash
mkdir -p ~/texmf/fonts/opentype/suisse
cp /path/to/Suisse-*.otf ~/texmf/fonts/opentype/suisse/
mktexlsr
```

## CTAN packaging notes

- Prepare a TDS layout for CTAN: put `.sty` files in `tex/latex/kielinstitute/` and documentation in `doc/`.
- Add `ctan.json` (this file) and ensure `LICENSE` is present.

## Author

Robert Hennings, 2026
