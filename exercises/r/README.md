# All/most of the R .R and batch scripts for the R session

Batch scripts can be recognized from the ending .sh

There are subdirectories for each cluster. 

In many cases there are batch scripts for Arrhenius, Kebnekaise, Pelle, Cosmos, and Dardel.

You could try creating a batch job for your centre if only one for one of the other centres exist! Or try running different R codes.

You can also try run the R codes directly, with Rscript (after loading R modules)

## add2.R example

- ``add2.R``  :  R code, adding two numbers given as arguments
- ``add2.sh``  : batch script to run the above code on the cluster that it recides in the directory of

## iris_ml example

- ``iris_ml.R``  : R code, using ``caret``, taken from <https://machinelearningmastery.com/machine-learning-in-r-step-by-step/>
- ``iris.csv``  : dataset for the above file, in case the remote data-set cannot be accessed
- ``iris-ml.sh``

## parallel_foreach example

- ``parallel_foreach.R``  : R code
- ``parallel_foreach.sh``  : batch script for the above R code, on the cluster it recides in the directory for

## Rmpi example (Pelle, Kebnekaise, Cosmos)

- ``Rmpi.R``  : R code, uses Rmpi
- ``Rmpi.sh``  : batch script to run the above ``Rmpi.R``

## pdbMPI example (Arrhenius, Dardel) 

- ``pdbMPI.R`` : R code, used pdbMPI 
- ``pdbMPI.sh`` : batch script to run the above ``pdbMPI .R`` 

## ML GPU example

- ``Rscript.R``  : R code
- ``Rscript_ML.sh``

## Validation/ML example

- ``validation.R``
- ``validation.sh``

## Serial example

- ``serial.R``
- ``serial.sh``

## Serial summing example

- ``serial_sum.R``
