## My Academic CVs

Here is code for three versions of my CV, all written in LaTeX. Why three versions you may ask? I firstly created my CV using the 'classic' LaTeX style implementing the Computer Modern font before discovering a more 'modern' version using Linux Libertine O. After writing that version, I then discovered the 'Prometheus' template, which was even more attractive to me, so I decided to write a third version. I've ultimately decided to keep a record of all three because 

1) it took some time to write each of them, and 
2) in case others may want to use my templates. 

Just as a note, in my opinion the 'Classic' and 'Dario' CVs are relatively simple to update and only consist of a single `.tex` file, whereas the 'Prometheus' relies upon pooling together multiple separate `.tex` files for each section and is a bit more tricky.

> Currently, I am only updating the Prometheus CV!

### Classic LaTeX CV (last updated 1/2/2024)

My classic LaTeX CV was built using a template provided by Priya Bhatia, which you can find [here](https://drive.google.com/drive/folders/1eutEE9IBsZSFh8FZzas6pt4ahsxH8GB0).

### Dario CV (last updated 6/2/2024)

My version using Linux Libertine O as it's font was written by [Dario Taraborelli](https://github.com/dartar), which you can find on his [personal website](https://nitens.org/w/cvtex/). More instructions can also be found on his [GitHub page](https://github.com/dartar/cvtex).

### Prometheus CV (last updated 10/11/2024)

The 'Prometheus CV' was made by Christian Bock which you can find [here](https://github.com/chrisby/prometheusCV), although I used [this version](https://github.com/filippomazzoli/academic-CV) forked from the initial repository by Filippo Mazzoli.

## Note regarding TeX versions

If there are issues with compiling the TeX CV's run the following command, which will update all the packages installed in your TeX Live distribution:

```
sudo tlmgr update --all
```