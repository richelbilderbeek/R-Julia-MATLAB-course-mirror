# Load and Run MATLAB

!!! info "Objectives"

    - Load MATLAB
    - Start MATLAB shell
    - Run MATLAB scripts
    - Start the MATLAB graphical user interface (GUI)

!!! warning "Recording"

!!! important

    Different recommended procedures for each HPC center:
    
    - **Arrhenius, UPPMAX, and HPC2N**: use module system to load at command line
    - **LUNARC**: recommended to use Desktop On-Demand menu, but interactive and non-interactive command lines available
    - **PDC**: recommended to load at command line; can run interactively on a compute node with X-forwarding and `salloc`. ThinLinc access is restricted to 30 users for the whole Dardel cluster.

Most HPC centres in Sweden use the same or a similar module system for their software. The difference lies in which modules are installed and their versions/naming. The general examples below will be similar for all HPC centres in Sweden, with some variation in naming and available versions.

??? faq "Short cheat sheet"

    - See which modules exists: `module spider` or `ml spider`
    - Find module versions for a particular software: `module spider <software>`
    - Modules depending only on what is currently loaded: `module avail` or `ml av`
    - See which modules are currently loaded: `module list` or `ml`
    - Load a module: `module load <module>/<version>` or `ml <module>/<version>`
    - Unload a module: `module unload <module>/<version>` or `ml -<module>/<version>`
    - More information about a module: `module show <module>/<version>` or `ml show <module>/<version>`
    - Unload all modules except the "sticky" modules: `module purge` or `ml purge`
    - Save currently loaded modules: `module save <collection_name>` (especially useful on Dardel)
    - (Re)load modules from saved collection: `module restore <collection_name>`

!!! caution  

    - Note that the module systems at the different clusters are slightly different.
    - On **Arrhenius** some modules are visible, like MATLAB, whereas others are hidden and you need to use `module spider`
    - While all modules at **UPPMAX** not directly related to bio-informatics are shown by `ml avail`, modules at the other centers may be hidden until one has loaded a prerequisite, like the compiler `GCC`.
    - You need to use `module spider` to see all modules at **HPC2N, LUNARC, and PDC**, and `ml avail` for those available to load given your currently loaded prerequisites.
    - New sessions on Dardel (**PDC**) start with 13 modules loaded, but only one of them is sticky (i.e. will remain loaded after a `ml purge` command). We highly recommended that you save the preloaded modules as a collection so that you can quickly restore the default modules if you accidentally use `ml purge` instead of `ml unload <module>`.

## Principles

!!! info "Demo on Arrhenius"

    You may follow on your cluster, but there is time during exercises to go back if you got lost.

### 1. Check for MATLAB versions

Below we have examples for how to check for MATLAB versions on different clusters. Follow along at your cluster.

=== "Arrhenius"

    Check all available MATLAB versions with:

    ```bash
    module avail matlab
    ```

    Output on Arrhenius as of 16 October 2026:

    ```bash
    $ ml av matlab

    ------------------------------------------------- CPU partition (epyc9005) modules --------------------------------------------------
       MATLAB/recommendation (D)    MATLAB/2025b-bdist

      Where:
       D:  Default Module
    ```


=== "UPPMAX (Pelle)"

    Check all available MATLAB versions with:

    ```bash
    module avail matlab
    ```

    Output on Pelle as of 16 October 2026:

    ```bash
    ------------------------------------------------------ /sw/arch/local/modules -------------------------------------------------------
       matlab/R2019a

    ------------------------------------------------------ /sw/arch/eb/modules/all ------------------------------------------------------
       MATLAB/2023b-update4    MATLAB/2024a    MATLAB/2025b (D)
    
      Where:
       D:  Default Module

    ```


=== "HPC2N"

    Check all available MATLAB versions with:

    ```bash
    module spider MATLAB
    ```

    As of 19 Oct 2026, the above outputs the following on Kebnekaise:
    
    ```bash
    ----------------------------------------------------------------------------
      MATLAB:
    ----------------------------------------------------------------------------
        Description:
          MATLAB is a high-level language and interactive environment that
          enables you to perform computationally intensive tasks faster than
          with traditional programming languages such as C, C++, and Fortran.

         Versions:
            MATLAB/2023a.Update4-build2
            MATLAB/2024b
            MATLAB/2025b-r2
            MATLAB/2026a-r2
         Other possible modules matches:
            MATLAB-parallel-support

    ----------------------------------------------------------------------------
    ```

    Note that it is case-sensitive and must be in ALL-CAPS. There will be results if you type ``matlab``, but they won't be the ones you want.
    To see how to load a specific version of MATLAB, including the prerequisites, do

    ```bash
    module spider MATLAB/<version>
    ```

    Example for MATLAB 2023a.Update4

    ```bash
    module spider MATLAB/2023a.Update4
    ```

=== "LUNARC"

    See all available MATLAB versions at the command line with:

    ```bash
    ml spider matlab
    ```

    Or, if on Desktop On-Demand, select `Applications` in the top left corner and hover over ``Applications - Matlab`` (see also GUI section below).

    As of 19 Oct 2026, `ml spider matlab` on COSMOS outputs the following:

    ```bash
    ----------------------------------------------------------------------------
    matlab:
    ----------------------------------------------------------------------------
        Versions:
            matlab/2022a
            matlab/2023a
            matlab/2023b
            matlab/2024b
            matlab/2025b

    ----------------------------------------------------------------------------
    For detailed information about a specific "matlab" package (including how to
    load the modules) use the module's full name. Note that names that have a
    trailing (E) are extensions provided by other modules.
    For example:

    module spider matlab/2023b
    ----------------------------------------------------------------------------
    ```

=== "PDC (Dardel)"

    See all available MATLAB versions at the command line with:

    ```bash
    ml spider matlab
    ```
    
    As of 19 Oct 2026, the above command outputs the following on Dardel:
    
    ```bash
    Versions:
      matlab/r2020b
      matlab/r2021b
      matlab/r2022b
      matlab/r2023a
      matlab/r2024a-ps
      matlab/r2024a
      matlab/r2024b
      matlab/r2025a
      matlab/r2025b
      matlab/r2026a

    ```

    On Dardel, all MATLAB versions have a prerequisite that needs to be loaded (it will called something like PDC/xx.xx or PDCOLD/xx.xx). To view the prerequisites for a specific version of MATLAB, do

    ```bash
    module spider matlab/<version>
    ```

    For example, `module spider matlab/r2024b` outputs the following:

    ```bash
    matlab: matlab/r2024b
      You will need to load all module(s) on any one of the lines below before the "matlab/r2024b" module is available to load.
        PDC/23.12
      Help:
        For more information, visit:
           https://www.mathworks.com
    ```

### 2. Load a MATLAB module

For reproducibility, we recommend ALWAYS loading a specific module instead of using the default version!

For this course, we recommend these MATLAB versions 
- Arrhenius 2025b
- UPPMAX R2023b
- HPC2N 2023b
- LUNARC 2024b
- PDC r2026a

Load a MATLAB module in the command line. First, go back and check which MATLAB modules were available.

=== "Arrhenius"

     To load version 2025b, do:

     ```bash
     module load MATLAB/2025b
     ```

     Note: MATLAB is all uppercase.
     For short, you can also use `ml` instead of `module load`
     
=== "UPPMAX"

     **Bianca.** To load version 2023b, do:

     ```bash
     module load matlab/R2023b
     ```

     Note: all lowercase except the R.
     For short, you can also use `ml` instead of `module load`

     **Pelle.** To load version 2023b-update4, do:

     ```bash
     module load MATLAB/2023b-update4
     ```

     Note: MATLAB is all uppercase.
     For short, you can also use `ml` instead of `module load`

     
=== "HPC2N (Kebnekaise)"

     To load version 2023b, do:
     
     ```bash
     module load MATLAB/2023b
     ```

     Note: all Uppercase except for the letter after the year.
     For short, you can also use:

     ```bash
     ml MATLAB/2023b
     ```
     
=== "LUNARC (COSMOS)"

     To load version 2024b, do:

     ```bash
     module load matlab/2024b
     ```

     Note: all lowercase.
     For short, you can also use:

     ```bash
     ml matlab/2024b
     ```

=== "PDC (Dardel)"

     Go back and check which MATLAB modules were available, and what their prerequisites are. To load version 2026a, do:

     ```bash
     module load PDC/26.0
     module load matlab/r2026a
     ```

     Notes: the module name is all lowercase including the ``r`` before the year.
     For short, you can also use:

     ```bash
     ml PDC/26.0 matlab/r2026a
     ```

### 3. Start MATLAB from the Command Line

Most of the time, you will run either MATLAB live scripts (``.mlx``) or basic script or function files (``.m``).

- Live scripts can only be opened and worked on in the GUI
- Basic function or script files can also be run from a batch script and/or at the command line.

The GUI is often the recommended interface where it is offered. 

- SLURM jobs can be set up through the ``Parallel Computing Toolbox``, which will be discussed later. 
- The resources required to run the GUI and those required to run a job submitted to SLURM are separate, so do not worry if the maximum allocation time for a MATLAB GUI session is much less than the limit for a SLURM job.

!!! important "`-singleCompThread`"

    When starting MATLAB from the command line, the `-singleCompThread` flag is usually required to prevent MATLAB from spawning as many processes as it thinks it needs up to the full capacity of a node. At most HPC centers, terminal instances launch MATLAB (either the GUI or command line) on a login node by default. Hogging a login node can disrupt jobs and access for other users, and violates the NAISS user agreement. HPC center staff reserve the right to kill disruptive tasks without warning. A few HPC centers detect if you have started on a login node and set `maxCompThreads` to 1 automatically, but when in doubt, use `-singleCompThread` to be safe.
    
    Setting `-singleCompThread` does **not** prevent MATLAB from sending parallelised and/or multi-threaded jobs to SLURM or the MATLAB Distributed Computing Server (MDCS).

#### 3a. MATLAB shell in the terminal

![MATLAB GUI, Rackham](../img/Rackham-Matlab.png)


Try starting MATLAB at the command line. We will use the same versions as in the previous section.

=== "Arrhenius"

     Once you've loaded your preferred version of MATLAB, type:

     ```bash
     matlab -nodisplay
     ```

     to start MATLAB in the terminal. The maximum number of computational threads will be set to 1 automatically if you are on a log-in node.

=== "UPPMAX (Bianca and Pelle)"

     Once you've loaded your preferred version of MATLAB, type:

     ```bash
     matlab -nodisplay
     ```

     to start MATLAB in the terminal. The maximum number of computational threads will be set to 1 automatically if you are on a log-in node.

=== "HPC2N (Kebnekaise)"

     To start MATLAB in the terminal, load matlab/2023b or your preferred version, and then type:

     ```bash
     matlab -singleCompThread -nodisplay
     ```

     to start MATLAB in the terminal. The `-singleCompThread` is important to prevent MATLAB from hogging a whole node, and the `-nodisplay` flag prevents the GUI from launching.

=== "LUNARC (COSMOS)"
     

    ```bash
    matlab -singleCompThread -nodisplay
    ```

=== "PDC (Dardel)"

     Starting a MATLAB session on Dardel looks different depending on whether or not you are affiliated KTH or have been added to the MATLAB user group by PDC support (e.g. as part of this course, if you signed up in time). If you are a KTH affiliate or another PDC-approved academic user, you are covered by KTH's university license. Otherwise, you will need to have a MathWorks account and be logged into it in your browser before getting started, because MATLAB on Dardel will ask you provide the email associated with your MathWorks account and a one-time password (OTP) sent to that account online (which you will have to copy from your browser).

     Either way, you will first need to load the corresponding PDC, PDCOLD, or PDCTEST prerequisite. The current default is PDC/23.12, and that makes available any MATLAB version from 2024. The only version that reliably works for non-KTH users without asking for credentials is r2024-ps.

     If you, for example, wanted to start matlab/r2024a-ps in the terminal, the sequence would look as follows:

     ```bash
     ml PDC/26.0  matlab/r2026a
     matlab -singleCompThread -nosplash -nodesktop -nodisplay
     ```

     If you are an academic user who has been vetted by PDC staff, the above should be enough to eventually take you to the MATLAB command prompt. Otherwise, you will see the following:

     ```bash
     Please enter your MathWorks Account email address and press Enter: <your.email@your.institute.se>
        You need a one-time password to sign in. To get a one-time password, follow these steps:
          1. Go to https://www.mathworks.com/mwa/otp
          2. Enter your MathWorks Account email address.
          3. Copy the generated one-time password.
          4. Return here and enter the password.
        Enter the one-time password:
     ```

     If you are a student or staff member at KTH and you see these credential requests, that means PDC support did not receive your request for MATLAB access.

     !!! note
     
         PDC users may also go through ThinLinc and open MATLAB from the On-Demand Applications menu, but this is not recommended. Only 30 users are allowed to interface with Dardel via ThinLinc at any one time, and queue times are very long.

#### 3b. Start the MATLAB GUI

Running the MATLAB GUI requires that users be logged into a ThinLinc session. Refer to [the login section](../common/login/README.md#step-1-log-in) for help.

=== "Arrhenius"

     Once logged into the remote desktop, the procedure for starting the MATLAB GUI is the same as what was shown above to start it at the command line, except that the ``-nodisplay`` flag is omitted (as are ``-nodesktop -nosplash`` if applicable). You should still include ``-singleCompThread``!

     It is also possible to start the MATLAB GUI on the compute node. More about this in the [interactive session](interactive.md).

=== "HPC2N (Kebnekaise)"
  
    For HPC2N, once logged into the remote desktop, the procedure for starting the MATLAB GUI is the same as what was shown above to start it at the command line, except that the ``-nodisplay`` flag is omitted (as are ``-nodesktop -nosplash`` if applicable). You should still include ``-singleCompThread``!
  
    The GUI can be started in a ThinLinc session by going to "Application" &rarr; "HPC2N Applications" &rarr; "Applications" &rarr; "Matlab <version>" and clicking the desired version.

    It is possible to start the MATLAB GUI on a compute node on Kebnekaise (HPC2N). More about this in the [interactive session](interactive.md).

    Finally, HPC2N also has MATLAB available through the Open OnDemand portal. We will cover this briefly [in a later lecture](https://uppmax.github.io/R-matlab-julia-HPC/common/on-demand/), and there is more specific documentation in the [HPC2N connection guides](https://docs.hpc2n.umu.se/tutorials/connections/#interactive__apps__-__matlab__proxy).
     

=== "UPPMAX (Pelle)"

     For UPPMAX users, once logged into the remote desktop, the procedure for starting the MATLAB GUI is the same as what was shown above to start it at the command line, except that the ``-nodisplay`` flag is omitted (as are ``-nodesktop -nosplash`` if applicable). You should still include ``-singleCompThread``!

     It is also possible to start the MATLAB GUI on the compute node. More about this in the [interactive session](interactive.md).

=== "LUNARC (COSMOS)"

     It is recommended that GUI be started in ThinLinc at the LUNARC HPC Desktop On-Demand. We will go over this in the first session after lunch.

    To start MATLAB in the terminal, you must first choose the correct terminal. There are several in the Applications menu:
  
    - three in `Applications - General`, which can safely launch either the MATLAB GUI or MATLAB command line on a compute node, 
    - one in `Applications - Visualization`, which should be reserved for very graphics-heavy jobs, and 
    - one in `Favorites`, which **MATLAB users should avoid** because it runs on a login node.
     
    Once you've opened a terminal session and loaded your preferred version type:
 
     Starting any of the ones under menu headings starting with `Applications -` will open a GfxLauncher popup that prompts you for your account and resource choices. Even users who have been awarded GPU time are encouraged to use the CPU-only terminal whenever possible, as they are abundant, less resource intensive, and allow longer wall times.

    ![MATLAB GUI, COSMOS](../img/Cosmos-AppMenu-Matlab.png)

    There are 3 versions per MATLAB release in the Apps menu---regular, (CPU), and (HEP,CPU)---and your resource choices partly depend on which of those you select

    The (HEP,CPU) nodes are private. The regular versions may run on either AMD/NVIDIA A40 48-core nodes or Intel/NVIDIA A40 32-core nodes, and the maximum allowed wall times for each are 24 and 48 hours, respectively. If you do not plan to do any intensive graphical work inside the GUI, you can choose the (CPU) version of your preferred release to access an AMD A100 48-core node, which also allows you to run for up to 7 days (168:00:00).

=== "PDC (Dardel)"

    There are 2 ways to run MATLAB interactively on Dardel: via SSH with X-forwarding (recommended), or via Desktop On-Demand in a ThinLinc window. ThinLinc access to Dardel is limited to 30 users total, and even if you do get through, interactive jobs are likely to be stuck in queues for a long time. More about this in [Desktop On-Demand](https://uppmax.github.io/R-matlab-julia-HPC/common/on-demand/)

    **SSH with X-forwarding.** When you first ssh into Dardel, you will need to have added the `-X` flag between `ssh` and your username. Once you are logged in, you need to book a compute node with `salloc`, and then SSH (again with the `-X` flag) into whichever node you are assigned to by `salloc`. The `salloc` step and its output will look something like this:
    More about this in the [interactive session](interactive.md).

!!! warning "No recording"

??? question "Questions"

### Exercises

Try them yourself! Note that `$` indicates a bash prompt and `>>` indicates the MATLAB prompt; those characters should not be included at the front of your input.

!!! example "**Challenge 1.** Load MATLAB in the terminal or GUI."

    Follow the steps for your cluster above!

    Then do a few simple commands at the command line. For example,
    ```bash
    $ ml matlab/2025b
    $ matlab -singleCompThread -nodisplay
                                < M A T L A B (R) >
                      Copyright 1984-2025 The MathWorks, Inc.
                      R2025b (25.2.0.2998904) 64-bit (glnxa64)
                                  August 21, 2025

    To get started, type doc.
    For product information, visit www.mathworks.com.
    >> a = 5;
    >> b = eye(2);
    >> c = a+b
    c =
        6     5
        5     6
    ```

!!! example "**Challenge 2.** Run a function."

    Copy the example function below to a file called ``add2.m`` in your working directory or the MATLAB directory that the configuration step created for you in your Documents folder. Then run it at the MATLAB command line.

    ```matlab
    function result = add2(x,y)
    result = x+y
    disp("The sum of "+x+" and "+y+" is "+result)
    end
    ```

??? check "Solution"

    ```matlab
    >> add2(5,8)
    result =
        13
    The sum of 5 and 8 is 13
    >>
    ```

!!! example "**Challenge 3.** Exit the MATLAB command line."

    Use `quit` or `exit` (this can take a few seconds).

??? check "Solution"

    ```matlab
    >> exit
    ```

!!! summary

    - You can start MATLAB either in a GUI or, with the `-nodisplay` flag, run it in the terminal.
    - If you start either interface from the terminal, you must first load the correct module(s).
    - For interactive work, you will usually have to reserve time on a compute node, but some facilities have a Desktop On-Demand interface that makes that easier.
    - If you take the risk of starting on a login node, use the `-singleCompThread` flag in the starting command to avoid hogging the node, unless you are sure that your cluster sets that constraint on the login node automatically.
