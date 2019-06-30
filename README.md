# GeneticSimulationsR
Analysis of the results from [GeneticSimulations](https://github.com/Thalla/GeneticSimulations).

Especially the influence of various start conditions is observed.  

**Naming Convention for data files**  
*config6FactL2029Out0120RandAndMaxL2029Out0110.RData* (this dataset is provided)  
config6Fact -> can be anything that describes the dataset in short  
The following was simulated with translation type "affinity" (default assumption)  
L2029 -> parameter livingAarsSeed has values from 20 to 29  
Out0120 -> parameter outputSeed has values from 1 to 20  
RandAndMax -> the following was simulated with translation types "random" and "max"  
L2019 -> parameter livingAarsSeed has values from 20 to 29 
Out0110 -> parameter outputSeed has values from 1 to 10  

All in all, every simulated parameter combination was simulated with ten different living aaRSs seeds and ten different output seeds.  
The parameter combinations with translation type "affinity" were simulated with ten additional output seeds.

**Notebooks**  
- *Load Data from Config*: Reads the data from the config file that the simulation created. Based on this data the fitness files are read and descriptive statistics are calculated. The result is a table with the mean of each fitness file, the parameter combination that led to the fitness file and the descriptive statistics of the fitness values of this file.  
- *Analysis Notebook*: Diagrams and statistical tests  
- *Load and Save RData*: Code for loading data from RData files and saving data to RData files  
- *Long Run Notebook*: Analysis of one simulated parameter combination  
- *CheatSheet*: Useful code snippets  

**Caution**  
The notebooks are organized as a set of tools that can be used in various ways. So don't run the whole notebook at once. Run chunk for chunk and check the comments in before. 
