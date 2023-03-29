
Data and code for "Reproductive inequality in humans and other
mammals", published in JOURNAL

----------------------------
# The manuscript can be found at:

- EMPTY RIGHT NOW

# Requirements for analyses:

- R: https://cran.r-project.org
- rstan: https://mc-stan.org

# Packages used for data processing and visualisation:

- ape: http://ape-package.ird.fr
- caper: https://cran.r-project.org/web/packages/caper/index.html
- phytools: https://github.com/liamrevell/phytools
- plyr: https://cran.r-project.org/web/packages/plyr/index.html
- Rcolorbrewer: https://cran.r-project.org/web/packages/RColorBrewer/index.html
- reshape2: https://cran.r-project.org/web/packages/reshape2/index.html
- Rethinking: https://xcelab.net/rm/statistical-rethinking/
- scales: https://scales.r-lib.org
- SkewCalc: https://github.com/ctross/SkewCalc
- tidyverse (includes ggplot2, stringr, etc.): https://www.tidyverse.org

# Details

To reproduce the results presented in the manuscript, please first go into the 'Code/' folder of the repository. It would probably be best to review the many different scripts for data processing, analysis and visualisation. Then, if you would like to reproduce the results reported in the publication, call the "Run_Analysis.R" file. This can be done by simply downloading the repository, editing the "basewd" in "Run_Analysis.R", and then calling:

``````````
source("Run_Analysis.R")
``````````

in the R console. 

# Notes

"*Empirical data included here from the Matsigenka [and Mestizos] are provided so that other researchers can check the analyses in the associated manuscript. Due to agreements with participants, these data shall not be used for any other purpose unless express permission is granted by John Bunce (john_bunce@eva.mpg.de) or Caissa Revilla Minaya (caissa_revilla@eva.mpg.de).*"
