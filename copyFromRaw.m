% Copies BOLD, MPRAGE, and fieldmaps from raw_BMC_data folder to nondartel

subStr = {'SLEEP_033'}; %insert subject names here 'SLEEP_033', 'SLEEP_034', 'SLEEP_035'
boldStr = 'BOLD_*';
fmapStr = 'SpinEchoFieldMap_*';
mprStr = 'MPRAGE_*';

old = '/space/raid8/data/lieber/MINERVA2/raw_BMC_data/';
new = '/space/raid8/data/lieber/MINERVA2/nondartel/data/';
mprage = '/space/raid8/data/lieber/MINERVA2/raw_BMC_data/';

cd(old);

for s = 1:length(subStr)
    cd(old);
    cd(subStr{s})
    cd('raw');
    boldDirs = dir(boldStr);
    fmapDirs = dir(fmapStr);
    mprDirs = dir(mprStr);
    cd(old);
    system(['cp --parents ' subStr{s} '/notes/* ' new], '-echo');
    system(['mkdir ' new subStr{s} '/analysis'], '-echo');
    for d = 1:length(boldDirs)
        boldPath{s,d} = [subStr{s} '/raw/' boldDirs(d).name '/' boldDirs(d).name];
        system(['cp --parents ' boldPath{s,d} '.nii ' new], '-echo');
        system(['cp --parents ' boldPath{s,d} '.json ' new], '-echo');
        system(['cp --parents ' subStr{s} '/raw/' boldDirs(d).name '/dicom-path.txt ' new], '-echo');
    end
    for d = 1:length(fmapDirs)
        fmapPath{s,d} = [subStr{s} '/raw/' fmapDirs(d).name '/' fmapDirs(d).name];
        system(['cp --parents ' fmapPath{s,d} '.nii ' new], '-echo');
        system(['cp --parents ' fmapPath{s,d} '.json ' new], '-echo');
        system(['cp --parents ' subStr{s} '/raw/' fmapDirs(d).name '/dicom-path.txt ' new], '-echo');
    end
    for d = 1:length(mprDirs)
        mprPath{s,d} = [subStr{s} '/raw/' mprDirs(d).name '/' mprDirs(d).name];
        system(['cp --parents ' mprPath{s,d} '.nii ' new], '-echo');
        system(['cp --parents ' mprPath{s,d} '.json ' new], '-echo');
        system(['cp --parents ' subStr{s} '/raw/' mprDirs(d).name '/dicom-path.txt ' new], '-echo');
    end
end