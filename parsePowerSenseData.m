function accel = parsePowerSenseData(filename)
   data = importdata(filename);
   userAccInds = [];
   userAccInds(end+1) = find(strcmp(data.textdata, 'user_acc_x(G)'));
   userAccInds(end+1) = find(strcmp(data.textdata, 'user_acc_y(G)'));
   userAccInds(end+1) = find(strcmp(data.textdata, 'user_acc_z(G)'));
   gravityInds = [];

   gravityInds(end+1) = find(strcmp(data.textdata, 'gravity_x(G)'));
   gravityInds(end+1) = find(strcmp(data.textdata, 'gravity_y(G)'));
   gravityInds(end+1) = find(strcmp(data.textdata, 'gravity_z(G)'));

   timeinds = find(strcmp(data.textdata, 'timestamp(unix)'));
   % some of the time columns are all NaNs for some reason
   timeinds = timeinds(1);
   [~, best] = max(sum(~isnan(data.data(:,timeinds))));
   bestTimeInd = timeinds(best);
   % iOS measures in units of gravities.  We need to multiply by -9.8 to
   % ensure that the signs match up between iOS and Android
   accel = [data.data(:,bestTimeInd) -9.8*(data.data(:,userAccInds) + data.data(:, gravityInds))];
end