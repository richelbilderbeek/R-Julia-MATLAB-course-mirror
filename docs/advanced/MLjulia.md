# ML with Julia

!!! note "Questions"

    - Is Julia suitable for Machine Learning (ML)?
    - Which machine learning tools are installed at HPCs?
    - How to run Julia ML jobs on an HPC system (Arrhenius, PDC, C3SE, UPPMAX, HPC2N, LUNARC)

!!! note "Objectives"

    - Short introduction to ML with Julia
    - Overview of installed ML tools at Swedish HPC centres
    - Workflow
    - Show the structure of a suitable batch script
    - Examples to try
    - **We will not learn about:**
        - How to write and optimize ML/DL code.
        - How to use multi-node setup for training models on CPU and GPU.

## Machine Learning job on GPUs (Arrhenius)

Julia has already several packages for ML, one of them is [``Flux``](https://fluxml.ai/). We will work with one of
the test cases provided by ``Flux`` which deals with a data set of tiny images (CIFAR10). Follow this steps:

- Set the variable ``JULIA_DEPOT_PATH`` to a suitable location in your project ``directory``, otherwise Julia will install packages in your ``HOME``
  folder that has a limited space.
- Create an environment in your working directory and activate it
- Fetch the ``vgg_cifar10.jl`` test case from ``Flux`` repo (``wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl``)
- Install (add) the following packages: CUDA, cuDNN, MLDatasets, MLUtils, and Flux
- The first time you use the data set CIFAR10, it will ask you to download it and accept. Do this in ``Julian`` mode:

  ```julia
      julia> using MLDatasets: CIFAR10
      julia> x, y = CIFAR10(:train)[:]
  ```

  if it takes time (>2 min.) to download the dataset, stop the process (Ctrl+C) and use instead a dataset that we already downloaded by
  exporting this variable:  ``export DATADEPS_LOAD_PATH=/nobackup/proj/disk/fall-courses-naiss/shared/datasets``

- Change the number of epochs in the ``vgg_cifar10.jl`` script from 50 to something shorter like 5.
- Submit the job with the script:

```bash
#!/bin/bash
#SBATCH -A naiss202w-xyz     # your project_ID
#SBATCH -J job-gpu           # name of the job
#SBATCH --time=00:15:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file
#SBATCH --partition gpu      # GPU partition     
#SBATCH --gpus=1             # 1 GPU v100 card

ml purge  > /dev/null 2>&1
ml GPU/Julia/1.12.2

julia <fix-activate-environment> <fix-name-script>.jl
```

??? hint "Answer"

    === "Arrhenius"

        ```bash
        # Create a folder for package installations
        mkdir -p /project-folder-suitable-location/Packages
        export JULIA_DEPOT_PATH=/project-folder-suitable-location/Packages
        # Create a folder for datasets 
        mkdir -p /project-folder-suitable-location/datasets
        export DATADEPS_LOAD_PATH=/project-folder-suitable-location/datasets

        # If the downloading of CIFAR10 takes a long time use instead the already available dataset
        export DATADEPS_LOAD_PATH=/nobackup/proj/disk/fall-courses-naiss/shared/datasets
        ```
        ```bash
        ml GPU/Julia/1.12.2
        cd /project-folder-suitable-location
        wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl

        julia
        julia> using Pkg
        julia> Pkg.activate(".")
        julia> Pkg.add(["CUDA","cuDNN","MLDatasets","MLUtils","Flux"])
        julia> using MLDatasets: CIFAR10
        julia> x, y = CIFAR10(:train)[:]
        ```
        The batch script looks like:

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202w-xyz     # your project_ID
        #SBATCH -J job-gpu           # name of the job
        #SBATCH --time=00:15:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file
        #SBATCH --partition gpu      # GPU partition     
        #SBATCH --gpus=1             # 1 GPU v100 card

        ml purge  > /dev/null 2>&1
        ml GPU/Julia/1.12.2

        julia --project=. vgg_cifar10.jl
        ```

    === "UPPMAX"

        ```bash
        ml julia/1.8.5
        mkdir ML
        cd ML
        wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl

        julia
        (v1.8) pkg> activate .
        (ML) pkg> add CUDA
        (ML) pkg> add Flux
        (ML) pkg> add MLDatasets
        (ML) pkg> add MLUtils
        julia> using MLDatasets: CIFAR10
        julia> x, y = CIFAR10(:train)[:]
        ```

        The batch script looks like:

        ```bash
        #!/bin/bash -l
        #SBATCH -A naiss202t-uv-wxyz        # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -M snowy
        #SBATCH -p node
        #SBATCH --gres=gpu:1
        #SBATCH -N 1
        #SBATCH --time=00:15:00      # requested time
        #SBATCH --qos=short
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml julia/1.8.5

        julia --project=. vgg_cifar10.jl
        ```

    === "HPC2N"

        ```bash
        ml Julia/1.8.5-linux-x86_64
        ml CUDA/11.4.1
        mkdir ML
        cd ML
        wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl

        julia
        (v1.8) pkg> activate .
        (ML) pkg> add CUDA
        (ML) pkg> add Flux
        (ML) pkg> add MLDatasets
        (ML) pkg> add MLUtils
        julia> using MLDatasets: CIFAR10
        julia> x, y = CIFAR10(:train)[:]
        ```

        The batch script looks like:

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n202w-xyz     # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:20:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file
        #SBATCH --gres=gpu:v100:1     # 1 GPU v100 card

        ml purge  > /dev/null 2>&1
        ml Julia/1.8.5-linux-x86_64
        ml CUDA/11.4.1

        julia --project=. vgg_cifar10.jl
        ```

        At HPC2N you can use the tool ``job-usage`` on the command line:

        ```bash
        job-usage job_ID   # job_ID number you get upon using sbatch
        ```

        This will give you a URL that you can paste on your local browser. It would display
        statistics after a couple of minutes the job started.
