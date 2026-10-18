# Interactive work on the compute nodes

!!! note

    - It is possible to run R directly on the login (including ThinLinc) nodes.
       - should *only* be done for short and small jobs 
       - otherwise the login node becomes slow for all users. 
    - If you want to work interactively with your code or data, you should 
       - start an **interactive session**.
       - this includes Open OnDemand at those centres that have it 
    - If you rather will run a script which **won't use any interactive user input while running**, you should
       - start a **batch job**, see previous session.
   
!!! note "Questions"

    - How do I proceed to work interactively on a compute node
   
!!! note "Objectives"

    - Show how to reach the calculation nodes on your centre 
    - Test some commands on the calculation nodes

!!! note "Compute allocations in this workshop" 

   - Arrhenius: ``nais2026-4-1022`` (remember to add either `-cpu` or `-gpu`) 
   - Pelle: ``uppmax2025-2-393``
   - Kebnekaise: ``hpc2ncourses2026-017``
   - Dardel: ``naiss2026-4-1022``

## Overview of an HPC cluster

![Generic HPC cluster - thanks to Rebecca Pitts who made this image that I lightly modified](../img/clusterlayout-v2.png)

## General

In order to run interactively, you need to have compute nodes allocated to run on, and this is done through the batch system (including through OpenOnDemand where available).  

!!! warning

    - (HPC2N) Do note that it (salloc) is not *real* interactivity as you probably mean it, as you will have to run it as a R script instead of by starting R and giving commands inside it. The reason for this is that you are not actually logged into the compute node and only sees the output of the commands you run. You also need to preface with ``srun`` or it will run on the login node. 

    - The way to get real interactivity at HPC2N is to use the Open OnDemand desktop (https://portal.hpc2n.umu.se) 

## R "interactively" on the compute nodes 

To run interactively, you need to allocate resources on the cluster first. You can use the command ``salloc``/``interactive`` to allow interactive use of resources allocated to your job. When the resources are allocated, if you are using HPC2N and ``salloc`` you need to preface commands with ``srun`` in order to run on the allocated nodes instead of the login node. 
      
- First, you make a request for resources with ``interactive``/``salloc``, like this:

=== "NAISS Arrhenius (interactive)" 

    ```bash 
    $ salloc --nodes=1 -t 1:00:00 -A naiss2026-<cpu|gpu> -p <partition>      
    ```

=== "UPPMAX (interactive)"

    ```bash
    $ interactive -n <tasks> --time=HHH:MM:SS -A uppmax2025-2-393
    ``` 
  
=== "HPC2N (salloc)" 

    ```bash
    $ salloc -n <tasks> --time=HHH:MM:SS -A hpc2ncourses2026-017 
    ```          

=== "LUNARC (interactive)"

    ```bash
    interactive -A luXXXX-Y-ZZ -t HHH:MM:SS
    ```

=== "PDC (salloc + ssh)" 

    ```bash
    salloc --time=HHH:MM:SS -A naiss2026-4-1022 -p [partition]
    ```

    Where ``[partition]`` is main, shared, or gpu. After your resources have been allocated, you can login to the compute node with ``ssh <node>`` and have real interactivity. 

Your request enters the job queue just like any other job, and interactive/salloc will tell you that it is waiting for the requested resources. When salloc tells you that your job has been allocated resources, you can interactively run programs on those resources with ``srun`` (or login to the compute node with ssh on PDC). The commands you run with ``srun`` will then be executed on the resources your job has been allocated. If you do not preface with ``srun`` the command is run on the login node! 
      
You can now run R scripts on the allocated resources directly instead of waiting for your batch job to return a result. This is an advantage if you want to test your R script or perhaps figure out which parameters are best.
                  
!!! warning

    **Let us use ThinLinc or Open OnDemand (where available)**

    === "NAISS Arrhenius" 

        - ThinLinc: ``tl.hpc.arrhenius.naiss.se`` as the server in the client. 

    === "UPPMAX"

        - ThinLinc app: ``<user>@rackham-gui.uppmax.uu.se``
        - ThinLinc (Pelle): ``<user>@pelle-gui.uppmax.uu.se``
        - ThinLinc (Pelle) in web browser: ``https://pelle-gui.uppmax.uu.se``   This requires 2FA!

    === "HPC2N"

        - ThinLinc: kebnekaise-tl.hpc2n.umu.se
        - From web browser: https://kebnekaise-tl.hpc2n.umu.se:300/
        - OpenOnDemand: https://portal.hpc2n.umu.se (click [https://docs.hpc2n.umu.se/tutorials/connections/#interactive__apps__-__rstudio__server](here for documentation on RStudio with Open OnDemand))

    === "LUNARC"

        - ThinLinc: ``cosmos-dt.lunarc.lu.se``
            - Note that you need to setup <a href="https://lunarc-documentation.readthedocs.io/en/latest/getting_started/login_howto/" target="_blank">TFA (PocketPass)</a> to use LUNARC!
        - You can start Gfx (Open OnDemand) from inside ThinLinc! 

    === "PDC"

        - ThinLinc: dardel-vnc.nsc.kth.se
            - SSH keys or kerberos needed! https://support.pdc.kth.se/doc/support/?section=/doc/support-docs/basics/quickstart

    **Using terminal** 

    === "Arrhenius"

        - SSH: ``ssh username@login.hpc.arrhenius.naiss.se``
        - Then start interactive job (here for CPU, change to -gpu for GPU): interactive --nodes=1 -t 1:00:00 -A naiss2026-4-1022-cpu -p cpu

    === "HPC2N"

        - SSH: ``ssh <user>@kebnekaise.hpc2n.umu.se``

        **Pelle*

        - SSH: ``ssh <user>@pelle.uppmax.uu.se``
        - Note that you may have to setup <a href="https://docs.uppmax.uu.se/getting_started/get_uppmax_2fa/" target="_blank">TFA for Uppmax</a> when using either of the ThinLinc connections.

    === "LUNARC"

        - SSH: ``ssh <user>@cosmos.lunarc.lu.se``
        - Note that you need to setup <a href="https://lunarc-documentation.readthedocs.io/en/latest/getting_started/login_howto/" target="_blank">TFA (PocketPass)</a> to use LUNARC!

    === "PDC"

        - SSH: ``ssh <user>@dardel.pdc.kth.se``
        - Note that you need to setup <a href="https://support.pdc.kth.se/doc/login/ssh_login/" target="_blank">SSH keys</a> or kerberos in order to login to PDC!

    - On Windows
       - Use MobaXterm or
       - install XMING and use with Putty or PowerShell


### Example 

**Requesting 4 cores for 10 minutes, then running R**

=== "NAISS Arrhenius" 

    ```bash 
    [bbrydsoe@arrhenius1 ~]$ interactive -n 4 --time=00:10:00 -A naiss2026-4-1022-cpu -p cpu
    salloc: Granted job allocation 3985564
    salloc: Waiting for resource configuration
    salloc: Nodes n216 are ready for job
    [bbrydsoe@n216 ~]$ module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2
    [bbrydsoe@n216 ~]$ R

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

    >
    ```

    Let us check that we actually run on the compute node: 

    ```bash 
    [bbrydsoe@n216 ~]$ srun hostname
    n216
    n216
    n216
    n216
    ```

    We are. Notice that we got a response from all four cores we have allocated. 

=== "UPPMAX"

    ```bash
    [bjornc@pelle2 ~]$ interactive -A uppmax2025-2-393 -n 4 -t 10:00
    This is a temporary version of interactive-script for Pelle
    Most interactive-script functionality is removed
    salloc: Pending job allocation 82050
    salloc: job 82050 queued and waiting for resources
    salloc: job 82050 has been allocated resources
    salloc: Granted job allocation 82050
    salloc: Waiting for resource configuration
    salloc: Nodes p102 are ready for job
    [bjornc@p102 ~]$
    ```      

    Let us check that we actually run on the compute node: 

    ```bash
    [bjornc@p102 ~]$ srun hostname
    p102.uppmax.uu.se
    p102.uppmax.uu.se
    p102.uppmax.uu.se
    p102.uppmax.uu.se
    ```
        
    We are! Notice that we got a response from all four cores we have allocated.   

    === "HPC2N"
         
        ```bash
        [~]$ salloc -n 4 --time=00:30:00 -A hpc2n2024-025
        salloc: Pending job allocation 20174806
        salloc: job 20174806 queued and waiting for resources
        salloc: job 20174806 has been allocated resources
        salloc: Granted job allocation 20174806
        salloc: Waiting for resource configuration
        salloc: Nodes b-cn0241 are ready for job
        [~]$ module load GCC/12.2.0  OpenMPI/4.1.4 R/4.2.2
        [~]$ 
        ```            
      
        Let us check that we actually run on the compute node: 
      
        ```bash   
        [~]$ srun hostname
        b-cn0241.hpc2n.umu.se
        b-cn0241.hpc2n.umu.se
        b-cn0241.hpc2n.umu.se
        b-cn0241.hpc2n.umu.se
        ``` 
      
        We are. Notice that we got a response from all four cores we have allocated.           
      
**Running a script**
   
!!! warning

    - You need to reload all modules you used on the login node!!!


**The script** 

Adding two numbers from user input (``serial_sum.R``)
   
- You will find it in the exercise directory ``exercises/r/`` so go there with ``cd``.
- Otherwise, use your favourite editor and add the text below and save as ``serial_sum.R``.
   
         
```R
# This program will add two numbers that are provided by the user
args = commandArgs(trailingOnly = TRUE)
res = as.numeric(args[1]) + as.numeric(args[2])
print(paste("The sum of the two numbers is", res))
```
  
**Running the script**

- Note that after loading the modules, the commands are the same for all the centres! 
      
Running a R script in the allocation we made further up. Notice that since we asked for 4 cores, the script is run 4 times, since it is a serial script
         
```bash
$ srun Rscript serial_sum.R 3 4
[1] "The sum of the two numbers is 7"
[1] "The sum of the two numbers is 7"
[1] "The sum of the two numbers is 7"
[1] "The sum of the two numbers is 7"
```
 
Without the ``srun`` command, R won't understand that it can use several cores. Therefore the program is run only once.
                  
```bash
$ Rscript serial_sum.R 3 4
[1] "The sum of the two numbers is 7"
```

**Running R with workers**

- First start R and check available workers with ``future``. 
- Create a R script called `script-workers.R`` with the following content:

```R 
library(future)
availableWorkers()
availableCores()
```

- Execute the code with ``srun -n 1 -c 4 Rscript script-workers.R``

## Exit

When you have finished using the allocation, either wait for it to end, or close it with ``exit``

**Don't do it now!** 

- We shall test RStudio first in the next session!


=== "NAISS Arrhenius" 

    ```bash
    [bbrydsoe@n216 ~]$ exit
    logout
    salloc: Relinquishing job allocation 3985564
    [bbrydsoe@arrhenius1 ~]$ 
    ```

=== "UPPMAX"
   
    ```bash        
    [bjornc@p102 ~]$ exit
    
    exit
    [screen is terminating]
    Connection to p102 closed.
      
    [bjornc@pelle2 ~]$
    ```
    
=== "HPC2N"
   
    ```bash
    [~]$ exit
    exit
    salloc: Relinquishing job allocation 20174806
    salloc: Job allocation 20174806 has been revoked.
    [~]$
    ``` 

!!! note "Keypoints"

    - Start an interactive session on a calculation node by a SLURM allocation
       - At PDC/Dardel, HPC2N/Kebnekaise: ``salloc`` ...
       - At NAISS/Arrhenius, UPPMAX/Pelle, LUNARC/Cosmos: ``interactive`` ...
    - Follow the same procedure as usual by loading the R module and possible prerequisites.
    
