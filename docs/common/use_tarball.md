# Use the tarball with exercises

!!! info "Goal"

    You can run the example files needed for the exercises

A tarball is a file that contains multiple files,
similar to a zip file.
To use the files it contains, it needs to be untarred/unzipped/uncompressed
first.

## Procedure

???- tip "Prefer a video?"

    [This part of this YouTube video](https://youtu.be/N-TRzv9LdF4?si=6uIqHI4J8h_2ry7P&t=396)
    shows you this procedure.

The procedure has these steps:

- Get the tarball
- Uncompress the tarball

## Step 1: get the tarball

- In a terminal, ``cd`` to a good directory to keep the exercises
  (for instance in your just created folder in the project directory)
- You may create a new folder (``mkdir``), called ``exercises`` or similar).
- Use the following command to download the file to your current folder:


=== "R"

    <!-- markdownlint-disable MD013 --><!-- Verbatim one-liners cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    wget https://gitlab.naiss.se/hpc/training/R-matlab-julia-HPC/-/raw/main/exercises/exercisesR.tar.gz
    ```

    <!-- markdownlint-enable MD013 -->

=== "MATLAB (wait until that day)"

    <!-- markdownlint-disable MD013 --><!-- Verbatim one-liners cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    wget https://gitlab.naiss.se/hpc/training/R-matlab-julia-HPC/-/raw/main/exercises/exercisesMatlab.tar.gz
    ```

    <!-- markdownlint-enable MD013 -->

=== "Julia (wait until that day)"

    <!-- markdownlint-disable MD013 --><!-- Verbatim one-liners cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    wget https://gitlab.naiss.se/hpc/training/R-matlab-julia-HPC/-/raw/main/exercises/exercisesJulia.tar.gz
    ```

    <!-- markdownlint-enable MD013 -->

???- hint "How does that look like?"

    Your output will look somewhat like  this:

    <!-- markdownlint-disable MD013 --><!-- Verbatim output cannot be split up over lines, hence will break 80 characters per line -->

    ```bash
    [bbrydsoe@arrhenius1 ~]$ wget https://gitlab.naiss.se/hpc/training/R-matlab-julia-HPC/-/raw/main/exercises/exercisesR.tar.gz
    --2026-10-05 15:31:44--  https://gitlab.naiss.se/hpc/training/R-matlab-julia-HPC/-/raw/main/exercises/exercisesR.tar.gz
    Resolving gitlab.naiss.se (gitlab.naiss.se)... 2001:6b0:17:2004::56:71, 130.236.56.71
    Connecting to gitlab.naiss.se (gitlab.naiss.se)|2001:6b0:17:2004::56:71|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 15037 (15K) [application/octet-stream]
    Saving to: ‘exercisesR.tar.gz’

    exercisesR.tar.gz   100%[===================>]  14.68K  --.-KB/s    in 0.004s  

    2026-10-05 15:31:45 (4.04 MB/s) - ‘exercisesR.tar.gz’ saved [15037/15037]
    ```

    <!-- markdownlint-enable MD013 -->


## Step 2: Uncompress the tarball

In a terminal, use the following command to uncompress the file:

=== "R"

    ```bash
    tar -xvzf exercisesR.tar.gz
    ```

=== "MATLAB (wait until that day)"

    ```bash
    tar -xvzf exercisesMatlab.tar.gz
    ```

=== "Julia (wait until that day)"

    ```bash
    tar -xvzf exercisesJulia.tar.gz
    ```

???- hint "How does that look like?"

    Your output will look similar to this:

    === "R"

        ```bash
        [bbrydsoe@arrhenius1 ~]$ tar -xvzf exercisesR.tar.gz
        r/
        r/MyRscript.R
        r/MyRscript_ML-cosmos.sh
        r/MyRscript_ML-dardel.sh
        r/MyRscript_ML-kebnekaise.sh
        r/MyRscript_ML-pelle.sh
        r/README.md
        r/Rmpi-cosmos.sh
        r/Rmpi-dardel.sh
        r/Rmpi-kebnekaise.sh
        r/Rmpi-pelle.sh
        r/Rmpi.R
        r/add2-cosmos.sh
        r/add2-dardel.sh
        r/add2-kebnekaise.sh
        r/add2-pelle.sh
        r/add2.R
        r/clusterapply.R
        r/gpu-script-db-higgs.R
        r/hello-cosmos.sh
        r/hello-dardel.sh
        r/hello-kebnekaise.sh
        r/hello-pelle.sh
        r/hello.R
        r/integration2d-cosmos.sh
        r/integration2d-dardel.sh
        r/integration2d-kebnekaise.sh
        r/integration2d.R
        r/iris.csv
        r/iris_ml-cosmos.sh
        r/iris_ml-dardel.sh
        r/iris_ml-kebnekaise.sh
        r/iris_ml-pelle.sh
        r/iris_ml.R
        r/job-gpu-cosmos.sh
        r/job-gpu-kebnekaise.sh
        r/job-gpu-pelle.sh
        r/parallel_foreach-cosmos.sh
        r/parallel_foreach-dardel.sh
        r/parallel_foreach-kebnekaise.sh
        r/parallel_foreach-pelle.sh
        r/parallel_foreach.R
        r/script-df-cosmos.sh
        r/script-df-dardel.sh
        r/script-df-fixme.R
        r/script-df-kebnekaise.sh
        r/script-df-pelle.sh
        r/script-df-tetralith.sh
        r/script-df.R
        r/serial-cosmos.sh
        r/serial-dardel.sh
        r/serial-kebnekaise.sh
        r/serial.R
        r/serial_sum.R
        r/sleep.R
        r/validation-cosmos.sh
        r/validation-dardel.sh
        r/validation-kebnekaise.sh
        r/validation-pelle.sh
        r/validation.R
        r/add2-arrhenius.sh
        r/hello-arrhenius.sh
        r/integration2d-arrhenius.sh
        r/iris_ml-arrhenius.sh
        r/job-gpu-arrhenius.sh
        r/MyRscript_ML-arrhenius.sh
        r/parallel_foreach-arrhenius.sh
        r/Rmpi-arrhenius.sh
        r/script-df-arrhenius.sh
        r/serial-arrhenius.sh
        r/validation-arrhenius.sh
        ```

    === "MATLAB"

        ```bash
        [bbrydsoe@arrhenius1 ~]$ tar zxvf exercisesMatlab.tar.gz 
        matlab/
        matlab/MorePractice.rst
        matlab/add2.m
        matlab/dice_stats_par.m
        matlab/example-parallel-matlab.sh
        matlab/gpu-matlab-script-cosmos.sh
        matlab/gpu-matlab-script-dardel.sh
        matlab/gpu-matlab-script-kebnekaise.sh
        matlab/gpu-matlab-script-pelle.sh
        matlab/mandelgpu.m
        matlab/mmult.m
        matlab/monte_carlo_pi.m
        matlab/parallel_example-cosmos.sh
        matlab/parallel_example-dardel.sh
        matlab/parallel_example-kebnekaise.sh
        matlab/parallel_example-pelle.sh
        matlab/parallel_example.m
        matlab/parfeval_mean.m
        matlab/parfor-greet.m
        matlab/serial-monte-cosmos.sh
        matlab/serial-monte-dardel.sh
        matlab/serial-monte-kebnekaise.sh
        matlab/serial-monte-pelle.sh
        matlab/threaded_array_init.sh
        matlab/threaded_arrinit.m
        matlab/wine.csv
        matlab/gpu-matlab-script-arrhenius.sh
        matlab/parallel_example-arrhenius.sh
        matlab/serial-monte-arrhenius.sh
        ```

    === "Julia"

        ```bash
        [bbrydsoe@arrhenius1 ~]$ tar -xvzf exercisesJulia.tar.gz
        julia/
        julia/script-df-rackham.sh
        julia/parallelJulia/
        julia/parallelJulia/solution/
        julia/parallelJulia/solution/script-df-sol.jl
        julia/parallelJulia/script-df.jl
        julia/parallelJulia/runHPC2N.sh
        julia/parallelJulia/runUPPMAX.sh
        julia/parallelJulia/1.md
        julia/script-df.jl
        julia/batchJulia/
        julia/batchJulia/3.md
        julia/batchJulia/2.md
        julia/batchJulia/3.uppmax-batch-script.sh
        julia/batchJulia/serial-sum.jl
        julia/batchJulia/3.kebnekaise-batch-script.sh
        julia/batchJulia/script-gpu.jl
        julia/batchJulia/Solutions/
        julia/batchJulia/Solutions/2/
        julia/batchJulia/Solutions/2/Kebnekaise.md
        julia/batchJulia/Solutions/2/Rackham.sh
        julia/batchJulia/Solutions/3/
        julia/batchJulia/Solutions/3/3.kebnekaise-batch-script.sh
        julia/batchJulia/Solutions/3/Solution.md
        julia/batchJulia/Solutions/1/
        julia/batchJulia/Solutions/1/Rackham.md
        julia/batchJulia/Solutions/1/Kebnekaise.md
        julia/batchJulia/1.md
        julia/README.md
        julia/sleep-threads.jl
        julia/script-df-kebnekaise.sh
        julia/script-df-fixme.jl
        julia/isolatedJulia/
        julia/isolatedJulia/2.md
        julia/isolatedJulia/Solutions/
        julia/isolatedJulia/Solutions/2/
        julia/isolatedJulia/Solutions/2/Solution.md
        julia/isolatedJulia/Solutions/1/
        julia/isolatedJulia/Solutions/1/Solution.md
        julia/isolatedJulia/1.md
        julia/loadRun/
        julia/loadRun/2.md
        julia/loadRun/serial-sum.jl
        julia/loadRun/Solutions/
        julia/loadRun/Solutions/2/
        julia/loadRun/Solutions/2/Rackham.md
        julia/loadRun/Solutions/2/Kebnekaise.md
        julia/loadRun/Solutions/1/
        julia/loadRun/Solutions/1/Solution.md
        julia/loadRun/1.md
        ```

After decompressing, there is a folder called `r`, or `matlab` or `julia`
that contains the exercises.

???- hint "Do you want the whole repo?"

    If you are happy with just the exercises,
    the tarballs of the language specific ones are enough.

    By cloning the whole repo, you get all the materials, planning documents,
    and exercises.

    If you think this makes sense type this in the command line
    in the directory you want it:

    ```bash
    git clone https://gitlab.naiss.se/hpc/training/R-matlab-julia-HPC.git
    ```

    Note however, that if you during exercise work modify files,
    they will be overwritten if you make `git pull`
    (like if the teacher needs to modify something).
    If this is the case, then make a copy somewhere
    else with your answers!

