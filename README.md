## My Academic CVs

Here is code for four versions of my CV, all written in LaTeX. Why four versions you may ask? I firstly created my CV using the 'classic' LaTeX style implementing the Computer Modern font before discovering a more 'modern' version using Linux Libertine O. After writing that version, I then discovered the 'Prometheus' template, which was even more attractive to me, so I decided to write a third version. Most recently, I wrote a fourth version in Helvetica Neue, based on the layout of Romy Lorenz's CV. I've ultimately decided to keep a record of all of them because 

1) it took some time to write each of them, and 
2) in case others may want to use my templates. 

Just as a note, in my opinion the 'Classic' and 'Dario' CVs are relatively simple to update and only consist of a single `.tex` file, whereas the 'Prometheus' relies upon pooling together multiple separate `.tex` files for each section and is a bit more tricky.

> Currently, I am only updating the Helvetica Neue CV!

### Classic LaTeX CV (last updated 1/2/2024)

My classic LaTeX CV was built using a template provided by Priya Bhatia, which you can find [here](https://drive.google.com/drive/folders/1eutEE9IBsZSFh8FZzas6pt4ahsxH8GB0).

### Dario CV (last updated 6/2/2024)

My version using Linux Libertine O as it's font was written by [Dario Taraborelli](https://github.com/dartar), which you can find on his [personal website](https://nitens.org/w/cvtex/). More instructions can also be found on his [GitHub page](https://github.com/dartar/cvtex).

### Prometheus CV (last updated 10/11/2024)

The 'Prometheus CV' was made by Christian Bock which you can find [here](https://github.com/chrisby/prometheusCV), although I used [this version](https://github.com/filippomazzoli/academic-CV) forked from the initial repository by Filippo Mazzoli.

### Helvetica Neue CV (last updated 27/10/2026)

The 'Helvetica Neue CV' (in `helvetica_neue_latex_cv/`) reproduces the layout of [Romy Lorenz](https://romylorenz.com)'s CV from March 2019 (`RomyLorenz_CV_March2019.pdf`), which was originally made in Microsoft Word. The font sizes, column positions and margins were measured from that PDF, and all of the styling lives in `helvetica_neue_cv.cls`. Like the Prometheus CV, each section is a separate `.tex` file that is pulled into `main.tex`, and the whole CV fits on two pages.

It must be compiled with XeLaTeX, and needs the Helvetica Neue font, which comes with macOS (so it won't compile on Overleaf as-is):

```
cd helvetica_neue_latex_cv
latexmk -xelatex main.tex
```

## Note regarding TeX versions

If there are issues with compiling the TeX CV's run the following command, which will update all the packages installed in your TeX Live distribution:

```
sudo tlmgr update --all
```