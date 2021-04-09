#-------------------------------------------------------------------------------
# Snakemake rules to compile cv and cover letter
# author: Ulrich Bergmann (@bergmul)
# usage: snakemake --cores all name_of_rule
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# params & dicts
#-------------------------------------------------------------------------------

out_dir = "out"

RESOURCES   = glob_wildcards("resources/{iResource}").iResource
MODULES     = glob_wildcards("modules/{iModule}").iModule

print(RESOURCES)
print(MODULES)

#-------------------------------------------------------------------------------
# build rules
#-------------------------------------------------------------------------------

rule cv_target:
  input:
    "cv.pdf"
  output:
    "cv.jpg"
  shell:
    "convert -density 600 {input} -quality 100 {output}"

rule cv:
  input:
    main      = "cv.tex",
    resources = expand("resources/{iResource}", iResource = RESOURCES),
    modules   = expand("modules/{iModule}", iModule = MODULES)
  output:
    "cv.pdf"
  params:
    out_dir
  shell:
    "latexmk {input.main} -xelatex -output-directory={params} -jobname=cv && \
     mv {params}/{output} {output}"

rule letter:
  input:
    main      = "letter.tex",
    resources = expand("resources/{iResource}", iResource = RESOURCES),
    modules   = expand("modules/{iModule}", iModule = MODULES)
  output:
    "letter.pdf"
  params:
    out_dir
  shell:
    "latexmk {input.main} -xelatex -output-directory={params} -jobname=letter && \
     mv {params}/{output} {output}"

#-------------------------------------------------------------------------------
# clean rules
#-------------------------------------------------------------------------------

rule clean:
  params:
    out_dir
  shell:
    "fd -td -I {params} --exec rm -R"

rule clean_all:
  params:
    out_dir
  shell:
    "fd -td -I {params} --exec rm -R && \
     fd --extension pdf --exec rm && \
     fd --extension jpg --maxdepth=1 --exec rm"

