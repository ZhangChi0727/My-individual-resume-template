# My Individual Resume Template (LaTeX)

A one-page resume template (English + Chinese) with a colored header banner,
icon + horizontal-rule section headings, and arrow-style bullets — styled
after the SJTU "蓝色梦想" (Blue Dream) look popularized by
[JunzheShen/SJTU-Resume-Template-in-Typst](https://github.com/JunzheShen/SJTU-Resume-Template-in-Typst),
rebuilt from scratch in LaTeX.

This repo is populated with a real, working example (my own resume, targeting
a systems/function-development engineering role) so you can see exactly how
the template renders — just replace the content with your own.

## Files

- `resume.cls` — shared style class (colors, header, section, entry, bullet macros)
- `resume-en.tex` — English resume (example content)
- `resume-zh.tex` — Chinese resume (example content, requires XeLaTeX + `ctex`/Fandol fonts)
- `build.ps1` — compiles both to PDF (PowerShell)

## Build

Requires a TeX distribution with XeLaTeX (MiKTeX or TeX Live) and the packages
`fontawesome5`, `enumitem`, `tabularx`, `hyperref`, `ctex`, `xecjk` (MiKTeX
installs these on demand; on TeX Live, install via `tlmgr`).

```powershell
powershell -File build.ps1
# or individually:
xelatex resume-en.tex
xelatex resume-zh.tex
```

The Chinese version **must** be compiled with `xelatex` (not `pdflatex`) for
CJK font support.

## Customizing

1. Edit `resume-en.tex` / `resume-zh.tex` with your own info — the class
   exposes simple macros: `\resumeheader`, `\ressection`, `\resumeentry`,
   `\skillline`.
2. Tweak colors/spacing in `resume.cls` (see the `themecolor` definition and
   the `\linespread` / `geometry` settings near the top) if your content runs
   long or short relative to one page.
3. Keep `\ressection{\faSomeIcon}{Section Title}` pairs for each section —
   any [Font Awesome 5](https://fontawesome.com/v5/search) icon name works.

## License

Feel free to fork and adapt for your own resume.
