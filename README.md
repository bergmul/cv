# My personal CV

**Current Version:** 9/4/2021

CV is forked from [danhje/latex-resume](https://github.com/danhje/latex-resume) and modified to my liking.

Changes:

- custom accent color (thanks to @kvalkanova)
- adds `about` section
- allows for public and private versions which either omit or print address and phone number
- cleans up file structure substantially
- builds via `Make` or `Snakemake`

## Requirements & Installation

Requirements of [danhje/latex-resume](https://github.com/danhje/latex-resume) plus `Snakemake` and `fd` if chosen to compile via `Snakemake`.

## Usage

Build CV and cover letter:

```
snakemake --cores all all
```

CV only:

```
snakemake --cores all cv
```

Letter only:

```
snakemake --cores all letter
```

Clean LaTeX aux files after build:

```
snakemake --cores all clean
```

Clean LaTeX aux files and output PDFs:

```
snakemake --cores all clean_all
```

For `Make` build follow [danhje/latex-resume](https://github.com/danhje/latex-resume)

