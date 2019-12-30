function numBits=getPSDUlength(params)
cfgVHTTx = wlanVHTConfig( ...
    'ChannelBandwidth',    params.chanBW, ...
    'NumTransmitAntennas', params.numTx, ...
    'NumSpaceTimeStreams', params.numTx, ...
    'STBC',                params.STBC, ...
    'MCS',                 params.MCS, ...
    'APEPLength',          params.APEPLen);
% Generate random PSDU bits
numBits=8*cfgVHTTx.PSDULength;