# Packaging for CTAN (TDS)

This repository includes a helper script to assemble a CTAN-style TDS zip archive.

Usage

```bash
./scripts/package_ctan.sh
```

The script creates `dist/kielinstitute-tds-YYYYMMDD.zip` containing:

- `tex/latex/kielinstitute/*.sty`
- `doc/latex/kielinstitute/*` (README, LICENSE, INSTALL, CHANGELOG, CONTRIBUTING)
- `doc/latex/kielinstitute/examples/` (example sources; generated outputs are excluded)
- `fonts/opentype/kielinstitute/` (only Fira/OFL fonts included)

## Notes

- Proprietary fonts (Cambria, Suisse) are intentionally excluded and must be installed by users as documented in `INSTALL.md`.
- Review the generated ZIP before uploading to CTAN.

## Author

Robert Hennings, 2026