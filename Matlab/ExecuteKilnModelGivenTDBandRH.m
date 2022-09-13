clear all;
clc;

MainChamberLength=120;
EndChamberLength=84;
InitialMC=110;
SoutherPineSpecificGravity=0.48;
BoardThickness=1.75;
ResidenceTime=43;
AirVelocity = [400 800 1200 1200 1200 800 400];
TDB = [173.7 196.2 218.6 240.0 218.6 196.2 173.7];
RH = [72.40 50.53 35.65 25.63 35.65 50.53 72.40];

KilnLength=MainChamberLength+EndChamberLength*2;
SectionLength = [(EndChamberLength/3) (EndChamberLength*2/3) (MainChamberLength/3) (MainChamberLength-(MainChamberLength*2/3)) (MainChamberLength/3)  (EndChamberLength*2/3) (EndChamberLength/3)];
TimeinSection = [SectionLength/KilnLength]*ResidenceTime;

% Calculate Psychometric Properties for Given Kiln Data

[TDB,TWB,WetBulbDepression,WaterVaporPressure,WaterVaporSaturationPressure,RH,DewPointTemperature,HumidityRatio,Enthalpy,EMC] = KilnPsychometricsGivenTDBandRH(TDB,RH)
