function analyzeData(analysisType, makeFrequencyPlot)
    if nargin < 2
        makeFrequencyPlot = false;
    end

    titles = {};
    if strcmp('metronome_70bpm_phone_midline', analysisType) == 1
        accelData = parsePowerSenseData('./Data/70bpm-phonemidline.csv');
        bounds = [400, 1000];
        titles{1} = 'Lateral to body';
        titles{2} = 'Aligned with gravity';
        titles{3} = 'Aligned with direction of motion';
    end
    if strcmp('metronome_90bpm_phone_midline', analysisType) == 1
        accelData = parsePowerSenseData('./Data/90bpm-phonemidline.csv');
        bounds = [500, 1600];
        titles{1} = 'Lateral to body';
        titles{2} = 'Aligned with gravity';
        titles{3} = 'Aligned with direction of motion';
    end
    if strcmp('skateboard', analysisType) == 1
        accelData = parsePowerSenseData('./Data/skateboard.csv');
        bounds = [1, size(accelData,1)];
        titles{1} = 'Lateral to board';
        titles{2} = 'Aligned with direction of motion';
        titles{3} = 'Aligned with gravity';
    end
    % only use the indices within the boundaries
    accelData = accelData(bounds(1):bounds(2), :);
    % make timestamps uniformly spaced, and optionally change sample rate
    makeAccelerometerPlots(accelData, titles, makeFrequencyPlot);
end
