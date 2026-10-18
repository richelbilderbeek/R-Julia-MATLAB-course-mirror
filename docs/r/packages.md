# Packages

!!! note "R packages"

    - R packages is the main way of extending the functionality of R and **broadens the use of R** to almost infinity! 
    - Instead of writing code yourself there may be others that have done the same!
    - Many **scientific tools** are distributed as **R packages**. This makes it possible to just run a script from the prompt. You can define files to be analysed and use arguments to define exactly what to do.
    - For more details about packages and in particular developing your own,
     see: [R packages](https://r-pkgs.org)

!!! note "Questions"
   
    - What is an R package?
    - How do I find which packages and versions are available?
    - What to do if I need other packages?
    - Are there differences between NAISS Arrhenius, PDC Dardel, HPC2N Kebnekaise, UPPMAX Pelle, and LUNARC Cosmos?
   
!!! note "Objectives"

    - Check if an R package is installed
    - Load and use R packages 
    - Install R packages yourself


## Package libraries

   In R, a library is a directory containing installed packages, sort of like a library for books. Unfortunately, in the R world, you will frequently encounter confused usage of the words “library” and “package”. It’s common for someone to refer to dplyr, for example, as a library when it is actually a package (Wickham & Hadley, 2023).

We might want to know where the ``R`` interpreter will be searching for packages, i.e. where the libraries are located (could be several). The easiest way to check is probably starting the interpreter and running the ``libPaths()`` function.


=== "Arrhenius"

    Load ``R``, e.g. version R/4.5.2 and start the Interpreter 

    ```bash 
    $ ml buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2
    $ R 
    ``` 

    Then check find the path of the library using the ``libPaths()`` function.

    ```bash 
    > .libPaths()
    [1] "/software/sse2/el9_epyc9005/easybuild/prefix/software/R/4.5.2-gfbf-2025b/lib64/R/library"
    ```

=== "Dardel"

    Load ``R``, e.g. version 4.4.1 and start the Interpreter 

    ```bash 
    $ ml PDC/23.12 R/4.4.1-cpeGNU-23.12 
    $ R 
    ```

    Then check find the path of the library using the ``libPaths()`` function. 

    ```R 
    > .libPaths()
    [1] "/cfs/klemming/home/b/bbrydsoe/.R/23.12/4.4.1/library"                  
    [2] "/cfs/klemming/pdc/software/dardel/23.12/eb/software/R/4.4.1-cpeGNU-23.12/lib64/R/library"
    > 
    ```

=== "Pelle"

    Load ``R``, e.g. version 4.4.2 and start the Interpreter

    ```bash 
    $ ml R/4.4.2-gfbf-2024a
    $ R
    ```

    Then check find the path of the library using the ``libPaths()`` function.

    ```R
    > .libPaths()
    [1] "/sw/arch/eb/software/R/4.4.2-gfbf-2024a/lib64/R/library"
    ```
	
=== "Kebnekaise"
   
    Load ``R``, e.g. version R/4.4.1 and start the Interpreter

    ```bash
    $ ml GCC/13.2.0 R/4.4.1 
    $ R
    ```

    Then check find the path of the library using the ``libPaths()`` function.

    ```R
    > [1] "/cvmfs/ebsw.hpc2n.umu.se/amd64_ubuntu2004_bdw/software/R/4.4.1-gfbf-2023b/lib/R/library"
    ```

=== "Cosmos"
   
    Load ``R``, e.g. version 4.2.1 and start the Interpreter

    ```bash
    $ ml GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1
    $ R
    ```

    Then check find the path of the library using the ``libPaths()`` function.

    ```R
    > .libPaths()
    [1] "/home/bbrydsoe/R-packages-4.2.1"                                     
    [2] "/sw/easybuild_milan/software/R/4.2.1-foss-2022a/lib64/R/library"
    ```

!!! warning "Warning: Modules on Dardel"

    If you are using Dardel, then note that there are 13 pre-loaded modules when you login, most of which are related to the machine being a Cray. If you do ``module purge`` there, they will all be removed together with the application software modules you wanted to purge. This may cause problems. 

    List of modules that are pre-loaded (March 2025) *and* which will be removed with ``module purge``: 

    - craype-x86-rome
    - libfabric/1.20.1
    - craype-network-ofi
    - perftools-base/23.12.0
    - xpmem/2.8.2-1.0_3.9__g84a27a5.shasta
    - cce/17.0.0
    - craype/2.7.30
    - cray-dsmml/0.2.2
    - cray-mpich/8.1.28
    - cray-libsci/23.12.5
    - PrgEnv-cray/8.5.0
    - snic-env/1.0.0

    You may have to reload all of these if you do ``module purge``. The easiest solution is this: 

    - Immediately after logging in, and before loading any modules (assuming you have not added any to ``.bashrc`` do 
      
    ```bash
    module save preload
    ``` 

    - then, when you have done a ``module purge`` to remove some application software modules you have loaded (like R and prerequisites) and want to load a different version perhaps, do 

    ```bash
    module restore preload 
    ```

    That will restore the preloaded modules. 


## Preinstalled package libraries

Arrhenius, Dardel, Pelle, Kebnekaise, and Cosmos all offer larger or smaller amounts of preinstalled packages.

!!! note "NAISS - Arrhenius"
 
    On NAISS cluster Arrhenius about 112 packages come with the "R" module. Many more can be found in the "R-bundle-CRAN/2025.11" module and the "R-bundle-Bioconductor/3.22" module. 

!!! note "Dardel - PDC"

    On PDC about 250 packages come with the ``R`` module.

!!! note "Kebnekaise - HPC2N"

    - On HPC2N it depends on the version, but for R/4.4.1 only a smaller number of these (around 110 packages) come with the ``R`` module, but additional ones are in the ``R-bundle-Bioconductor``. Most of the packages are in the module ``R-bundle-CRAN`` and a few more in ``R-bundle-CRAN-extra``. For older versions of R, most packages come with the R module (around 750 packages). Older versions of R also usually have OpenMPI as prerequisite. Use ``module spider <module>/<version>`` to check for prerequisites, as usual. 

!!! note "Pelle - UPPMAX"

    On UPPMAX the module ``R`` contains only a smaller number of packages (110), but almost all packages in the CRAN and BioConductor repositories are in the ``R-bundle-CRAN`` respectively ``R-bundle-Bioconductor`` modules. 

!!! note "Cosmos - LUNARC"

    On LUNARC most of the R packages come with the ``R`` module. 

There are many different ways to check if the package you are after is already installed - chances are it is! The simplest way is probably to simply try loading the package from within ``R`` (you can also get a list of all packages with ``installed.packages()`` but that can be overwhelming): 

```R
library(package-name)
```

To learn about other ways, see the page "More about R packages" under "Extra reading" in the left menu. 


!!! note "<img src="../img/shell-logo_small.png"> Exercise"

    Start R (remember to load a module + prerequisites if you have not already). Check if the packages ``pillar`` and ``caret`` are installed, as shown above. 

=== "NAISS (Arrhenius)" 

    !!! note "Solution" 

         ```bash
         $ module load buildtool-easybuild/5.2.1-hpca3ef7d197  GCC/14.3.0 R/4.5.2
         $ R

         R version 4.5.2 (2025-10-31) -- "[Not] Part in a Rumble"
         Copyright (C) 2025 The R Foundation for Statistical Computing
         Platform: x86_64-pc-linux-gnu
  
         R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

           Natural language support but running in an English locale

         R is a collaborative project with many contributors.
         Type 'contributors()' for more information and
         'citation()' on how to cite R or R packages in publications.

         Type 'demo()' for some demos, 'help()' for on-line help, or
         'help.start()' for an HTML browser interface to help.
         Type 'q()' to quit R.

         > library(pillar)
         > library(caret)
         Error in library(caret) : there is no package called ‘caret’
         > 
         ```

         So "pillar" is installed, but not "caret". The latter can however be found in "R-bundle-CRAN/2025.11" (which has the prerequisite "MPICH/4.3.2"): 

         ```bash
         $ module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2 MPICH/4.3.2 R-bundle-CRAN/2025.11 
         $ R
 
         ... <snip> ... 

         > library(caret)
         Loading required package: ggplot2
         Loading required package: lattice
         > 
         ```

=== "UPPMAX (Pelle)"

    !!! note "Solution"

        If you want, you can try loading the libraries inside R without loading either the R-bundle-CRAN or R-bundle-Bioconductor modules and see that almost nothing is installed. 

        ```bash 
        $ module load R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2  
		# You'll get R/4.4.2-gfbf-2024a on the fly!
        $ R
            
        R version 4.4.2 (2024-10-31) -- "Pile of Leaves"
        Copyright (C) 2024 The R Foundation for Statistical Computing
        Platform: x86_64-pc-linux-gnu

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.

        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R.

        > library(pillar)
        > library(caret)
        Loading required package: ggplot2
        Loading required package: lattice
        >   
        ```

=== "HPC2N"
       
    !!! note "Solution"

        ```bash
        $ module load GCC/13.2.0 R/4.4.1
        $ module load OpenMPI/4.1.6 R-bundle-CRAN/2024.06 
        $ R
        R version 4.4.1 (2024-06-14) -- "Race for Your Life"
        Copyright (C) 2024 The R Foundation for Statistical Computing
        Platform: x86_64-pc-linux-gnu

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.

        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R.

        > library(pillar)
        > library(caret)
        Loading required package: ggplot2
        Loading required package: lattice
        >
        ```

=== "LUNARC"

    !!! note "Solution" 

        ```bash 
        $ module load GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1
        $ R

        R version 4.2.1 (2022-06-23) -- "Funny-Looking Kid"
        Copyright (C) 2022 The R Foundation for Statistical Computing
        Platform: x86_64-pc-linux-gnu (64-bit)

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.
 
        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R.

        > library(pillar)
        > library(caret)
        Loading required package: ggplot2
        Loading required package: lattice
        > 
        ```

=== "PDC"

    !!! note "Solution" 

        ```bash
        $ ml PDC/23.12 R/4.4.1-cpeGNU-23.12 
        $ R 

        R version 4.4.1 (2024-06-14) -- "Race for Your Life"
        Copyright (C) 2024 The R Foundation for Statistical Computing
        Platform: x86_64-suse-linux-gnu

        R is free software and comes with ABSOLUTELY NO WARRANTY.
        You are welcome to redistribute it under certain conditions.
        Type 'license()' or 'licence()' for distribution details.

          Natural language support but running in an English locale

        R is a collaborative project with many contributors.
        Type 'contributors()' for more information and
        'citation()' on how to cite R or R packages in publications.

        Type 'demo()' for some demos, 'help()' for on-line help, or
        'help.start()' for an HTML browser interface to help.
        Type 'q()' to quit R. 

        > library(pillar)
        > library(caret)
        Error in library(caret) : there is no package called ‘caret’
        >
        ```
        
## Installing your own packages

Sometimes you will need R packages that are not already installed. The solution to this is to install your own packages. These packages will usually come from CRAN [https://cran.r-project.org/](https://cran.r-project.org/) - the Comprehensive R Archive Network, or sometimes from other places, like GitHub or R-Forgei

Here we will look at installing R packages with automatic download and with manual download. It is also possible to install from inside Rstudio. 

### Setup

We need to create a place for the own-installed packages to be and to tell R where to find them. The initial setup only needs to be done once, but separate package directories need to be created for each R version used. 

R reads the ``$HOME/.Renviron`` file to setup its environment. It should be created by R on first run, or you can create it with the command: ``touch $HOME/.Renviron``

**NOTE**: In this example we are going to assume you have chosen to place the R packages in a directory under your home directory, but in general it might be good to use the project storage for space reasons. As mentioned, you will need separate ones for each R version.

If you have not yet installed any packages to R yourself, the environment file should be empty and you can update it like this: 

**For placing R packages in home directory:**

```bash 
$ echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron
```

**For placing R packages in your project storage:**

Good if you install many R packages which would take up a lot of space. 

```bash 
$ echo R_LIBS_USER="/path/to/project-storage/my-dir/R-packages-%V" > ~/.Renviron
```

**Example for on Arrhenius in course project storage:**

```bash 
$ echo R_LIBS_USER="/nobackup/proj/disk/fall-courses-naiss/personal/<your-dir>/R-packages-%V" > ~/.Renviron
```

!!! warning

    - If it is **not empty**, you can edit ``$HOME/.Renviron`` with your favorite editor so that ``R_LIBS_USER`` contains the path to your chosen directory for own-installed R packages. 


It should look something like this when you are done:

```bash 
$ R_LIBS_USER="/home/u/user/R-packages-%V"
```

**NOTE** Replace ``/home/u/user`` with the value of ``$HOME``. Run ``echo $HOME`` to see its value.

**For Arrhenius:** 

```bash 
$ R_LIBS_USER="/nobackup/proj/disk/fall-courses-naiss/personal/<your-dir>/R-packages-%V"
```

**NOTE** Replace ``<your-dir>`` with the value of your personal directory under the course project storage directory.

**NOTE** The ``%V`` should be written as-is, it's substituted at runtime with the active R version.

**NOTE** At Dardel (PDC) the path is ``/cfs/klemming/home/u/user`` but you can see it with ``echo $HOME``. 

For each version of R you are using, create a directory matching the pattern used in ``.Renviron`` to store your packages in. This example is shown for R version 4.5.2 (change to version suitable for your centre):

```bash
$ mkdir -p $HOME/R-packages-4.5.2
```

!!! note

    If you will be installing many R packages yourself, it is a good idea to place them in your project storage instead, as they can take up a lot of space and your home directory is not very large.

    In that case, install in the project storage as shown a bit up. 

    And then create directories for each R version you use there, like this, for R/4.5.2. DO NOT JUST DO IT FOR R/4.5.2! Change to the version you will be using, depending on centre! See under [Package libraries](#package-libraries). 

    ```bash
    mkdir -p <path-to-your-space-on-proj-storage>/R-packages-4.5.2
    ```


### Automatical download and install from CRAN

!!! note 

    You find a list of packages in CRAN (https://cran.r-project.org/) and a list of repos here: https://cran.r-project.org/mirrors.html 

    Please choose a location close to you when picking a repo. 


=== "From command line"

    ```bash
    $ R --quiet --no-save --no-restore -e "install.packages('<r-package>', repos='<repo>')"
    ```
    
=== "From inside R"

    ```R
    install.packages('<r-package>', repos='<repo>')
    ```       

In either case, the dependencies of the package will be downloaded and
installed as well. 

      
#### Example

In this example, we will install the R package ``nuggets`` and use the repository http://ftp.acc.umu.se/mirror/CRAN/ 

**Note**: You need to load R (and any prerequisites, and possibly R-bundle-Bioconductor if you need packages from that) before installing packages. 

=== "From command line"

    ```bash
    $ R --quiet --no-save --no-restore -e "install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')"
    ```
       
=== "From inside R"

    ```R
    install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')
    ```

!!! important "Solution for installing nuggets" 

    1)

    - NAISS/Arrhenius: ``buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2 MPICH/4.3.2 R-bundle-CRAN/2025.11``
    - PDC (Dardel): ``module load PDC/23.12 R/4.4.1-cpeGNU-23.12``
    - UPPMAX (Pelle): ``module load R/4.4.2-gfbf-2024a``
    - HPC2N (Kebnekaise): ``module load GCC/13.2.0 R/4.4.1``
    - LUNARC (Cosmos): ``module load GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1``

    2)

    - NAISS/Arrhenius: ``echo R_LIBS_USER="/nobackup/proj/disk/fall-courses-naiss/personal/<your-dir>/R-packages-%V" > ~/.Renviron`` 
    - UPPMAX: ``echo R_LIBS_USER="/proj/r-matlab-julia-pelle/<yourdir>/R-packages-%V" > ~/.Renviron``
    - HPC2N: ``echo R_LIBS_USER="/proj/nobackup/fall-courses-2026/<yourdir>/R-packages-%V" > ~/.Renviron``
    - PDC: ``echo R_LIBS_USER="/cfs/klemming/projects/supr/fall-courses-2026/<yourdir>/R-packages-%V" > ~/.Renviron``

    OR (particularly on LUNARC (Cosmos)): 

    - ``echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron``

    3) Create directory for R packages:

    - NAISS/Arrhenius: 
        - ``mkdir -p /nobackup/proj/disk/fall-courses-naiss/personal/<your-dir>/R-packages-4.5.2
        - OR mkdir -p $HOME/R-packages-4.5.2
    - LUNARC: ``mkdir -p $HOME/R-packages-4.2.1``
    - UPPMAX (Pelle):
        - ``mkdir -p $HOME/R-packages-4.4.2``
        - OR ``mkdir -p /proj/r-matlab-julia-pelle/<yourdir>/R-packages-4.4.2``
    - HPC2N:
        - ``mkdir -p $HOME/R-packages-4.4.1``
        - OR ``mkdir -p /proj/nobackup/fall-courses/<yourdir>/R-packages-4.4.1``
    - PDC: 
        - ``mkdir -p $HOME/R-packages-4.4.1``
        - OR ``mkdir -p /cfs/klemming/projects/supr/courses-fall-2025/<yourdir>/R-packages-4.4.1```

    4) Either of

    - Start R and install: ``install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')``
    - Install from command line: ``R --quiet --no-save --no-restore -e "install.packages('nuggets', repos='http://ftp.acc.umu.se/mirror/CRAN/')"``


For other ways to install R packages, including from GitHub or manually, look at the "More about R packages" from the "Extra reading" section in the bottom left side of the menu. 

!!! note 

    Places to look for R packages
   
    - CRAN (https://cran.r-project.org/)
    - R-Forge (https://r-forge.r-project.org/)
    - Project's own GitHub page
    - etc.
   

!!! note "Keypoints"

    - You can check for installed packages 
        - from inside R with ``installed.packages()``
	- from BASH shell with the 
	    - ``ml help R/<version>`` at UPPMAX
	    - ``ml spider R/<version>`` elsewhere
    - Installation of R packages can be done either from within R or from the
     command line (BASH shell)
    - CRAN is the recommended place to look for R-packages, but many packages can be found on GitHub and if you want the development version of a package you likely need to get it from GitHub or other place outside CRAN. You would then either download and install manually or install with something like devtools, from within R. 

## Install own packages on Bianca

- If an R package is not not available on Bianca already (like Conda repositories) you may have to use the wharf to install the library/package
- Typical workflow
    - Install on Pelle 
    - Transfer to Wharf
    - Move package to local Bianca R package path
    - Test your installation
- Demo and exercise from our Bianca course:
    - `Installing R packages on Bianca <https://uppmax.github.io/bianca_workshops/extra/rpackages/>`_


## Exercises

!!! important "Install a package with automatic download"

    1. First do the setup of `.Renviron` and create the directory for installing R packages (Recommended load R version 4.5.2 on Arrhenius, 4.4.1 on Pelle, 4.1.2 on Kebnekaise, 4.2.1 on LUNARC, and 4.4.1 on PDC)
    2. From the command line. Suggestion: ``anomalize``
    3. From inside R. Suggestion: ``BGLR``
    4. Start R and see if the library can be loaded. 
   
    These are both on CRAN, and this way any dependencies will be installed as well. 
   
    Remember to pick a repo that is nearby, to install from: https://cran.r-project.org/mirrors.html 


!!! important "Solution for R 4.5.2 on Arrhenius (change <user>)" 

    === "Setup"

        First load R and its prerequisites if you have not already done so. 
      
        ```bash
        $ module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2
        $ echo R_LIBS_USER="/nobackup/proj/disk/fall-courses-naiss/personal/<user>/R-packages-%V" > ~/.Renviron
        $ mkdir -p /nobackup/proj/disk/fall-courses-naiss/personal/<user>/R-packages-4.5.2
        ```     

    === "Command line"

        Installing package "anomalize". Using the repo http://ftp.acc.umu.se/mirror/CRAN/

        ```bash
        $ R --quiet --no-save --no-restore -e "install.packages('anomalize', repo='http://ftp.acc.umu.se/mirror/CRAN/')"
        ```

    === "Inside R"

        Installing package "BGLR". Using the repo http://ftp.acc.umu.se/mirror/CRAN/

        ```R
        > install.packages('BGLR', repo='http://ftp.acc.umu.se/mirror/CRAN/')
        ```

    === "Load library"

        ```R
        $ R
        > library("anomalize")
        > library("BGLR")
        ```

        "BGLR" outputs some text/advertisment when loaded. You can ignore this.

!!! important "Solution for 4.4.2 on Pelle (change <user>)" 

    Solution is very similar for the other centres - just change the R version (for instance to 4.2.1 for LUNARC and 4.4.1 for HPC2N and 4.4.2 for PDC).  

    === "Setup"
      
        ```bash
        $ echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron
        $ mkdir -p $HOME/R-packages-4.4.2
        ```	    

    === "Command line"
      
        Installing package "anomalize". Using the repo http://ftp.acc.umu.se/mirror/CRAN/
         
        ```bash
    	$ R --quiet --no-save --no-restore -e "install.packages('anomalize', repo='http://ftp.acc.umu.se/mirror/CRAN/')"
	    ```
  
        This assumes you have already loaded the R module. If not, then do so first. 
	 
    === "Inside R"
      
        Installing package "BGLR". Using the repo http://ftp.acc.umu.se/mirror/CRAN/

        ```R
        > install.packages('BGLR', repo='http://ftp.acc.umu.se/mirror/CRAN/')	     
        ```	     

    === "Load library"

        ```R
        $ R
        > library("anomalize")
        > library("BGLR")
        ``` 
	    
        "BGLR" outputs some text/advertisment when loaded. You can ignore this. 
