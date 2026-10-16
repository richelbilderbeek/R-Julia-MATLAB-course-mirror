# HPC clusters

## The HPC centers 

!!! info "One national and several local HPC centers"

    There are many similarities:

    - Login vs. calculation/compute nodes
    - Environmental module system with
      software hidden until loaded with `module load`
    - Slurm batch job and scheduling system

    ... many small differences:

    - commands to load R, Matlab and Julia and packages/libraries
    - sometimes different versions of R, Matlab and Julia, etc.
    - slightly different flags to Slurm

    ... and some bigger differences:

    - NAISS is the national center with the big new cluster

        - Arrhenius has both CPUs and GPUs and will have a sensitive data part    

    - UPPMAX has two different clusters

        - Pelle for general purpose computing on CPUs and GPUs
        - Bianca for sensitive data and has GPUs

    - HPC2N has Kebnekaise with GPUs
    - LUNARC has Cosmos with GPUs (and Cosmos-SENS)
    - NSC has several clusters
        - BerzeLiUs (AI/ML, NAISS)
        - Tetralith (NAISS)
        - Sigma (LiU local)
        - Freja (R&D, located at SMHI)
        - Nebula (MET Norway R&D)
        - Stratus (weather forecasts, located at NSC)
        - Cirrus (weather forecasts, located at SMHI)
        - We will be using Tetralith, which also has GPUs
    - PDC has Dardel with AMD GPUs
    - C3SE has Vera (and formerly Alvis) 

!!! warning "Terminology: modules"

    We call the applications available via the *module system* **modules**.

    - [NAISS](https://hpc.pages.naiss.se/user-documentation/support-docs/arrhenius_hpc/software_development/module/)
    - [HPC2N](https://docs.hpc2n.umu.se/software/modules/)
    - [LUNARC](https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_modules/)
    - [NSC](https://www.nsc.liu.se/software/modules/)
    - [PDC](https://support.pdc.kth.se/doc/software/module/)
    - [UPPMAX](https://docs.uppmax.uu.se/cluster_guides/modules/)
    - [C3SE](https://www.c3se.chalmers.se/documentation/module_system/) 

<!-- markdownlint-disable MD013 --><!-- Headers cannot be split up over lines, hence will break 80 characters per line -->

## Briefly about the cluster hardware and system at the HPC centres

<!-- markdownlint-enable MD013 -->


What is a cluster?

- Login nodes and calculations/computation nodes

- A network of computers, each computer working as a **node**.

- Each node contains several processor cores and RAM
  and a local disk called scratch.

![A node](node.png)

- The user logs in to **login nodes**  via Internet through ssh or Thinlinc (or OpenOnDemand).
    - Here the file management and lighter data analysis can be performed.

![Multiple nodes](nodes.png)

- The **calculation nodes** have to be used for intense computing.

### Common features

- Linux kernel
- Bash shell
- x86-64 CPUs, some clusters with Intel processors and some with AMD.
- NVidia GPUs (HPC2N/LUNARC, also AMD) except for Dardel with AMD.

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

| HPC Cluster         | Arrhenius    | Kebnekaise                                           | Pelle           | Bianca      | COSMOS      | Dardel                             | Vera                 | 
|---------------------|--------------|------------------------------------------------------|-----------------|-------------|-------------|------------------------------------|----------------------|
| Cores/compute node  | 128          | 28 (72 for largemem, 128/256 for AMD Zen3/Zen4)      | 48              | 16          | 48          | 128                                | 64                   |
| Memory/compute node | 768 GB       | 128-3072 GB                                          | 768 GB - 3 TB   | 128-512 GB  | 256-512 GB  | 256-2048 GB                        | 512 - 1024 GB        | 
| GPU                 | NVIDIA GH200 | NVidia V100, A100, A6000, L40s, H100, A40, AMD MI100 | NVIDIA T4, H100 | NVidia A100 | NVidia A100 | four AMD Instinct™ MI250X á 2 GCDs | Nvidia T4, A40, A100 |

<!-- markdownlint-enable MD013 -->

## Overview of the UPPMAX systems

```mermaid
  graph TB

  Node1 -- interactive --> SubGraph2Flow
  Node1 -- sbatch --> SubGraph2Flow
  subgraph "Snowy"
  SubGraph2Flow(calculation nodes)
        end

        ThinLinc -- usr-sensXXX + 2FA + VPN ----> SubGraph1Flow
        Terminal/ThinLinc -- usr --> Node1
        Terminal -- usr-sensXXX + 2FA + VPN ----> SubGraph1Flow
        Node1 -- usr-sensXXX + 2FA + no VPN ----> SubGraph1Flow

        subgraph "Bianca"
        SubGraph1Flow(Bianca login) -- usr+passwd --> private(private cluster)
        private -- interactive --> calcB(calculation nodes)
        private -- sbatch --> calcB
        end

        subgraph "Rackham"
        Node1[Login] -- interactive --> Node2[calculation nodes]
        Node1 -- sbatch --> Node2
        end
```

## Overview of the HPC2N system

```mermaid
 graph TB


        Terminal/ThinLinc -- usr --> Node1


        subgraph "Kebnekaise"
        Node1[Login] -- interactive --> Node2[compute nodes]
        Node1 -- sbatch --> Node2
        end
```

## Overview of the LUNARC system

![COSMOS resources](cosmos-resources.png)

## Overview of the NSC systems

![Tetralith image](mermaid-tetralith.png)
