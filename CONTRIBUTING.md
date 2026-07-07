# Contributing

Thank you for contributing to the CAU Kiel LaTeX templates.

## Guidelines

- Fork the repository and create feature branches named `feat/<short-desc>` or `fix/<short-desc>`.
- Write clear commit messages and include rationale in PR description.
- Add tests where appropriate (example documents that compile without errors).
- Run the relevant `latexmk -pdf` builds for `cau_thesis/` and/or `cau_presentation/` before opening a PR.
- Keep thesis changes inside `cau_thesis/` and presentation changes inside `cau_presentation/` unless the change intentionally affects the shared bundle.
- Preserve relative paths so the templates build both locally and after being copied into Overleaf or another editor.

## Issues

When you want to open an issue please stick to the recommended structure for the TITLE of the new issue.
Please refer to the broad section of the template, that could be one of these:

### General: [general]

Use this category for issues that affect the document as a whole or do not clearly belong to one specific section. This includes general formatting, global spacing, page geometry, language settings, font defaults, color defaults, package options, or overall template behavior.

Examples:
- Global margins or page spacing look inconsistent.
- Default font sizes or colors are wrong across the document.
- A package/class option does not behave as expected.
- The compiled PDF differs from the intended global layout.

### Title Pages and Metadata: [title-pages]

Use this category for issues related to thesis title pages, hard-cover pages, submission title pages, presentation title slides, metadata commands, author information, supervisors, programme details, logos, and repository/license links.

Examples:
- `title_pages/titlepage_alt.tex` does not use the expected metadata.
- A supervisor, author, programme, or submission date field is missing.
- CAU, faculty, or cooperation logos are missing, cropped, or misaligned.
- The presentation title slide does not display authors or GitHub metadata correctly.

### Front Matter and Navigation: [front-matter]

Use this category for issues related to abstracts, acknowledgements, table of contents, lists of figures/tables/algorithms, abbreviation and symbol lists, slide table-of-contents frames, page anchors, clickable links, and PDF navigation.

Examples:
- The thesis table of contents has incorrect page numbers or indentation.
- List of Algorithms entries are missing or duplicated.
- The presentation overview slide does not match the section structure.
- Hyperlinks or page anchors point to the wrong page or slide.

### Thesis Chapters: [thesis-chapters]

Use this category for issues related to the thesis chapter files in `cau_thesis/chapters/`, including introduction, literature review, methodology, data, experiments, results, discussion, conclusion, appendix, and affirmation.

Examples:
- A chapter input file is missing from `cau_thesis/chapters/`.
- Chapter headings, labels, or cross-references are inconsistent.
- Figures, tables, algorithms, or equations in a thesis chapter do not match the class style.
- Appendix or affirmation content appears in the wrong place.

### Presentation Slides: [presentation-slides]

Use this category for issues related to slide files in `cau_presentation/chapters/`, including section order, frame titles, closing slides, appendix slides, list-of-figures/list-of-tables slides, and further-material slides.

Examples:
- A slide chapter is not included in `cau_presentation/main.tex`.
- Frame titles, section headings, or navigation entries are inconsistent.
- Closing or discussion slides do not use the expected CAU layout.
- Figure/table list slides contain stale labels or slide references.

### Figures, Logos, Tables, and Data: [assets]

Use this category for issues related to files in `figures/`, `logos/`, `tables/`, or `data/`, including missing graphics, placeholder assets, Excel/data files, graphic paths, and redistributability of visual assets.

Examples:
- A figure referenced by `\includegraphics` is missing from the template folder.
- A CAU seal, faculty logo, or cooperation logo has the wrong size or format.
- A presentation placeholder figure should be replaced with a real asset.
- A table/data file is not included in the correct project folder.

### References and Bibliography: [references]

Use this category for issues related to `bibliography.bib`, `references.bib`, BibLaTeX settings, citation links, bibliography headings, sectioned bibliographies, and reference-list formatting.

Examples:
- A citation key is undefined or duplicated.
- The thesis sectioned bibliography is missing one of its categories.
- Presentation references do not print or split across frames correctly.
- Bibliography entries have incorrect spacing, labels, or link styling.

### Build, Packaging, and Documentation: [build-docs]

Use this category for issues related to `README.md`, `INSTALL.md`, `PACKAGING.md`, `CHANGELOG.md`, `latexmkrc`, examples, documentation files, ignored build artifacts, release ZIPs, or template packaging.

Examples:
- A documented build command no longer works.
- Generated `.aux`, `.log`, `.bbl`, or PDF files are accidentally committed.
- A template example does not compile from its project folder.
- Packaging instructions no longer match the `cau_thesis/` and `cau_presentation/` structure.

In combination with the specific report or template in a structure like:

[document section, template]

Example issue title:
- [general, cau-thesis] Titles ...
- [title-pages, cau-thesis] Metadata ...
- [front-matter, cau-thesis] ToC links ...
- [thesis-chapters, cau-thesis] Section labels ...
- [presentation-slides, cau-presentation] Frame title ...
- [references, cau-thesis] Bibliography category ...
- [build-docs, all] Packaging command ...

Issues related to the Build Process/CI:

[build] Problems with ....

## Code style

- Keep public package options stable; prefer adding new package options rather than changing existing defaults.

## License and assets

- Ensure any fonts or logos added include a license or are redistributable. For CAU logos, seals, and third-party figures, only include files that are redistributable for the intended template release.

## Publishing Releases

Releases are published through GitHub Actions by pushing version tags. The workflow compiles the examples, builds release ZIP files, and attaches the correct template archive to the matching GitHub release. For `all-v*` tags, it also deploys the template ZIP downloads to GitHub Pages.

### Before creating a release

- Make sure all intended changes are merged into `main` or `master`.
- Update the version and date in `README.md`, `CHANGELOG.md`, and any package metadata that needs to match the release.
- Compile the affected thesis or presentation examples locally with `latexmk -pdf`.
- Check that generated documentation PDFs, example PDFs, previews, and release notes are up to date.
- Confirm that bundled fonts, logos, images, PDFs, and other assets are redistributable for the planned release.

### Release tag names

Use one of the supported tag prefixes, followed by the version number:

```zsh
git tag cau-thesis-v1.0.1
git tag cau-presentation-v1.0.1
git tag all-v1.0.1
```

The tag prefix decides which package is published:

- `cau-thesis-v*` publishes or packages the `cau_thesis/` template.
- `cau-presentation-v*` publishes or packages the `cau_presentation/` template.
- `all-v*` publishes both templates as one CAU Kiel LaTeX bundle.

### Publishing steps

1. Start from an up-to-date release branch:

   ```zsh
   git checkout main
   git pull --ff-only
   ```

2. Create and push the release tag:

   ```zsh
   git tag all-v1.0.1
   git push origin all-v1.0.1
   ```

3. Open the GitHub Actions run for the tag and wait until all release jobs finish successfully.
4. Check the generated GitHub release and confirm that the expected ZIP files are attached.
5. For `all-v*` releases, test the thesis and presentation package links or archive contents after the deployment finishes.

### If a release fails

- Do not move or overwrite a published tag unless the release has not been used externally. Prefer creating a new patch tag.
- If the failure is caused by source code or packaging, fix it on `main` or `master`, merge it, and publish a new tag.
- If GitHub Pages did not update, rerun the failed deployment job from GitHub Actions after confirming the ZIP artifacts were created.
- Document any manual correction in `CHANGELOG.md` when it affects users.

## Commit Style

Please also consider writing meaningful messages in your commits.

```zsh
CLS: thesis class file changes (`.cls`)
STY: presentation style/theme changes (`.sty`)
TEX: example or template source changes (`.tex`)
DOC: documentation updates
FIG: figures, logos, or other visual assets
BIB: bibliography or citation changes
BUG: bug fix
ENH: enhancement or new template feature
COMPAT: compatibility change for engines, packages, or class options
BUILD: build, CI, latexmk, or packaging changes
CTAN: CTAN metadata or release packaging
MAINT: maintenance, refactoring, or small cleanup
REV: revert an earlier commit
TST: compile test or example validation changes
REL: release/versioning changes
```

## Author

Robert Hennings, 2026