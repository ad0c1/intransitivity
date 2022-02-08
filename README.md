This repository contains data files and MATLAB function M-files used in the manuscript titled "The existence of a priori collective preferential ranking." See overview of the study here: http://www.sogum.com/overviewVideo.mp4 

The data folder contains all of the total 119 subjects' choices and reaction times(RTs) in the Matlab 'mat' file format.  

Below are examples of using the functions to find the number of tricksters from the individual and collective preferences using the majority rule. The data file, colour.mat, contains the results of the 2AFC preferential task for eight colours. If  you load it, you can see the two variables, ALLmat and ALLmatRt, which are adjacency matrices for the choices and their RTs of all 119 subjects, respectively: 

```
>> load ./data/color.mat;
>> whos
  Name          Size               Bytes  Class     Attributes

  ALLmat        8x8x119            60928  double              
  ALLmatRt      8x8x119            60928  double              
```

If you want to investigate the tricksters of the choices from the first subject S1, you can use the function M-file, Generator.m, to find tricksters:
```
>> [trickters, NoTrk]=Generator(ALLmat(:,:,1))

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
Here, NoTrk denotes the number of tricksters. As mentioned in the manuscript, tricksters are defined as a minimal set of alternatives such that the other alternatives could be preferentially ranked. Though tricksters are not uniquely determined, as you see in the above example, their numbers are fixed due to the minimum property.

The study's main finding - the majority's choices have no tricksters - could be checked by the following:

```
>> meanMat=mean(ALLmat,3);
>> M=makeAdjFromAvgMat(meanMat);
>> [trickters, NoTrk]=Generator(M)

trickters =

  1×0 empty double row vector


NoTrk =

     0
```


