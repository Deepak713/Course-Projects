function [Hber]=lteVisualize_init(enb, PDSCH)
info=lteOFDMInfo(enb);
Rs=info.SamplingRate;
bw=lteDLRBtoBW(enb.NDLRB);
tm=PDSCH.TxScheme;
numLayer=PDSCH.NLayers;
myTitle=['LTE/LTE-A Mode ',tm,' Bandwidth ',bw, ' MHz with ', num2str(numLayer), ' layers'];  
Hsa = dsp.SpectrumAnalyzer('SampleRate',Rs, ...
    'ShowLegend',true, ...
    'Window', 'Rectangular', ...
    'SpectralAverages',10, ...
    'YLimits',[-90 -10], ...
    'Position' ,[6 200 800 450], ...
    'Title', myTitle, ...
    'ChannelNames',...
    {'Transmitted','Received Not-Equalized','Received Equalized'});
Hber=comm.ErrorRate;
Hconst=comm.ConstellationDiagram;
Hconst2=clone(Hconst);
Hconst.Position=[6 37 640 460];
Hconst2.Position=[600 37 640 460];
EVM = comm.EVM;
EVM.Normalization = 'Average constellation power';
Hsa2=clone(Hsa);
