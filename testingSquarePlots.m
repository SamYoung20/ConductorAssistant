[accelDataSquare, gyroDataSquare] = parsePowerSenseData_1('square90bpm.csv');
[accelData4in, gyroData4in] = parsePowerSenseData_1('4inchtest90bpm.csv');
makeAccelerometerPlots(accelDataSquare,{},true)
