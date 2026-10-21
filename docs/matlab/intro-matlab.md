# Introduction to MATLAB

!!! info "Objectives"

    - Find best practices for using MATLAB at NAISS resources, especially on Arrhenius
    - Load MATLAB modules and site-installed MATLAB packages
    - Install MATLAB packages with **Add-Ons** manager
    - Write a batch script for running MATLAB
    - Use the matlab scheduler
    - Use MATLAB in parallel mode 

    Advanced day

    - Use GPUs with MATLAB 
    - Use MATLAB for ML

## Welcome

!!! info "Teaching approach in Björn's sessions"

    - Recording session first
        - Lecture
        - Interact if you are OK being recorded.
    - Q/A and exercises not recorded
        - Show face and talk directly.
        - Don't be afraid of saying "I don't know!"
 
!!! note "No recording"

## Schedule

[See schedule here.](schedule.md)

## What is MATLAB?

??? question "What do you know about Matlab?"

??? hint "Answers"

    MATLAB is a numerical computing environment and a high-level programming language. 

    - A "low-code" interactive development environment (IDE) in which many common data import methods, analysis techniques, plotting formats, and even AI/ML techniques can be run from menus and generate the code required to reproduce the results automatically
    - A rich library of Toolboxes and Add-Ons for different STEM disciplines, especially for modeling and simulations, all written and tested by professionals
    - The ability to set **cluster configurations** and **parallelisation** settings graphically, and save them to profiles that can be reloaded at a click.
    - **Automatic multi-threading** (note: this can also be a drawback)
    - Full documentation available straight from the command line (requires internet)

??? question "Is it free?"

??? hint "Answers"

    No, but universities pays for licenses and therefore academics can use MATLAB on the different clusters.

## Exercise 0

!!! hint "Add the cluster you will use today to your name"

    In **ZOOM**, rename yourself by adding the **cluster name** in ``[ ]`` **BEFORE** your name, like: 
    
        [Arrhenius] Lisa

    This makes it easier for the teacher to plan breakout rooms and understand your settings!

## Exercise 1: Log in to two sessions on your clusters (if not already)

Follow the [procedure for your cluster](https://hpc.pages.naiss.se/training/R-matlab-julia-HPC/common/login/) to
    
1. Log in via terminal. Add ``-x`` to the ``ssh ...`` line to activate simple graphics.

2. Log in via ThinLinc.

## MATLAB documentation at NAISS HPC centers

- Documentation at the HPC centres/clusters Arrhenius UPPMAX, HPC2N, LUNARC, and PDC

    - [Arrhenius Matlab docs](https://hpc.pages.naiss.se/user-documentation/support-docs/applications/matlab/arrhenius/) 
    - [Dardel Matlab docs](https://hpc.pages.naiss.se/user-documentation/support-docs/applications/matlab/dardel/)
    - [UPPMAX Matlab docs](http://docs.uppmax.uu.se/software/matlab/)
    - HPC2N: [Matlab docs](https://www.hpc2n.umu.se/resources/software/matlab) and [parallel Matlab docs](https://www.hpc2n.umu.se/documentation/guides/parallel-matlab)
    - [LUNARC Matlab docs](https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/)

- Official MATLAB documentation is found [here](https://se.mathworks.com/help/matlab/index.html?s_tid=hc_panel)

!!! tip "Material for improving your programming skills"

    - [Extra material](extra.md)
       - Courses
       - Debugging
       - Parallel computing
       - Add-ons

??? hint "More info"

    MATLAB is a numerical computing environment and a high-level programming language. 

    - A "low-code" interactive development environment (IDE) in which many common data import methods, analysis techniques, plotting formats, and even AI/ML techniques can be run from menus and generate the code required to reproduce the results automatically
    - A rich library of Toolboxes and Add-Ons for different STEM disciplines, especially for modeling and simulations, all written and tested by professionals
    - The ability to set cluster configurations and parallelisation settings graphically, and save them to profiles that can be reloaded at a click.
    - Automatic multi-threading (note: this can also be a drawback)
    - Full documentation available straight from the command line (requires internet)

    - Developed by MathWorks, MATLAB allows matrix manipulation, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs in other languages. 
    - Although it is numeric only, an optional toolbox uses the MuPAD symbolic engine, allowing access to computer algebra capabilities.
    Distinguishing pros of MATLAB include:

    - A "low-code" interactive development environment (IDE) in which many common data import methods, analysis techniques, plotting formats, and even AI/ML techniques can be run from menus and generate the code required to reproduce the results automatically
    - A rich library of Toolboxes and Add-Ons for different STEM disciplines, especially for modeling and simulations, all written and tested by professionals
    - The ability to set cluster configurations and parallelisation settings graphically, and save them to profiles that can be reloaded at a click.
    - Automatic multi-threading (note: this can also be a drawback)
    - Full documentation available straight from the command line (requires internet)

    MATLAB also has some drawbacks:

    - It is proprietary software, so you need a license and to sign up for an account (students and faculty at universities typically get these through the university). Many Add-Ons require a separate license.
    - With respect to the 2-language problem (where one can optimise for either performance or ease of prototyping, but not both), MATLAB even more than Python is geared toward usability. It can be slow.
    - The way MATLAB automates multithreading means it will typically hog a full node unless you explicitly tell it not to by setting `-singleCompThread` as an option at startup, or unless your local cluster is configured to automatically limit the number of processes started on a login node.
    - Built-in plotting functions generate very low-resolution raster graphics with poor anti-aliasing in the GUI, and what the GUI shows is not necessarily how the saved image will appear. Making publication-ready plots requires extensive tuning of graphics parameters and repeated exports to special file formats to check your work. 


!!! summary

    - MATLAB is a high-level computing language with an interactive environment that can generate code to handle common problems for you.
    - Academics can use MATLAB on Arrhenius and other clusters.

