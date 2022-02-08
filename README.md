This repository contains the data files and analysis code used in the manuscript titled "The existence of a priori collective preferential ranking."
The data folder contains all of the total 119 subjects' choices and reaction times(RTs) data in the format of matlab 'mat' file.  

Below is an example of how to use the matlab functions to find the number of tricksters from the individual preferences and the collective preferences using the majority rule.  If you load the data file as below, you can see the two variables, ALLmat and ALLmatRt, which are adjacency matrices for the choices of 119 subjects in the 2AFC preferential tasks and their RTs. 

```
load ./data/color.mat;
>> whos
  Name          Size               Bytes  Class     Attributes

  ALLmat        8x8x119            60928  double              
  ALLmatRt      8x8x119            60928  double              
```

If you want to investigate the tricksters of the choices performed by the first subect S1 of the total 119 participants, you can use the funciton Generator.m
 as follows:
```
[trickters, NoTrk]=Generator(ALLmat(:,:,1))

trickters =

     1     2     4
     1     2     5
     1     4     8
     1     6     7
     2     4     6
     3     6     7
     4     6     7
     4     6     8


NoTrk =

     3
```
As mentioned in the manuscript, trickstes are defined as a minimal set of alternatives such that the other alternatives could be preferentially ranked. Though tricksters are not uniquely determined as you see in the above example, but their numbers are fixed due to the minimum property.

The main finding of the study - majority's choices have no tricksters - could be checked by the following.

```
meanMats=mean(ALLmat,3);
M=makeAdjFromAvgMat(meanMats);
[trickters, NoTrk]=Generator(M)

trickters =

  1×0 empty double row vector


NoTrk =

     0
```


