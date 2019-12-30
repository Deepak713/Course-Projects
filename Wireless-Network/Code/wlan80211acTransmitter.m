function [txSig] = wlan80211acTransmitter(params, bits)
%% Transmitter
% VHT format object at transmitter
cfgVHTTx = wlanVHTConfig( ...
    'ChannelBandwidth',    params.chanBW, ...
    'NumTransmitAntennas', params.numTx, ...
    'NumSpaceTimeStreams', params.numTx, ...
    'STBC',                params.STBC, ...
    'MCS',                 params.MCS, ...
    'GuardInterval',       'Long', ...
    'APEPLength',          params.APEPLen);

% % Waveform generator object
% cfgWaveGen = wlanGeneratorConfig( ...
%     'NumPackets', 1, ...
%     'IdleTime',   2e-6); % Trailing zeros for each packet

% Generate single-packet waveform
txSig = wlanWaveformGenerator(bits, cfgVHTTx,     'NumPackets', 1, ...
    'IdleTime',   2e-6); % Trailing zeros for each packet
