% Copies BOLD, MPRAGE, and fieldmaps from raw_BMC_data folder to nondartel

subStr = 'SLEEP_032'; %insert subject name here
boldStr = 'BOLD_*';
fmapStr = 'SpinEchoFieldMap_*';
mprStr = 'MPRAGE_*';

old = '/space/raid8/data/lieber/MINERVA2/raw_BMC_data/';
new = '/space/raid8/data/lieber/MINERVA2/nondartel/data/';
mprage = '/space/raid8/data/lieber/MINERVA2/raw_BMC_data/';

cd(old);

for s=1
    cd(subStr)
    cd('raw');
    boldDirs = dir(boldStr);
    fmapDirs = dir(fmapStr);
    mprDirs = dir(mprStr);
    cd(old);
    system(['cp --parents ' subStr '/notes/* ' new], '-echo');
    system(['mkdir ' new subStr '/analysis'], '-echo');
    for d = 1:length(boldDirs)
        boldPath{s,d} = [subStr '/raw/' boldDirs(d).name '/' boldDirs(d).name];
        system(['cp --parents ' boldPath{s,d} '.nii ' new], '-echo');
        system(['cp --parents ' boldPath{s,d} '.json ' new], '-echo');
        system(['cp --parents ' subStr '/raw/' boldDirs(d).name '/dicom-path.txt ' new], '-echo');
    end
    for d = 1:length(fmapDirs)
        fmapPath{s,d} = [subStr '/raw/' fmapDirs(d).name '/' fmapDirs(d).name];
        system(['cp --parents ' fmapPath{s,d} '.nii ' new], '-echo');
        system(['cp --parents ' fmapPath{s,d} '.json ' new], '-echo');
        system(['cp --parents ' subStr '/raw/' fmapDirs(d).name '/dicom-path.txt ' new], '-echo');
    end
    for d = 1:length(mprDirs)
        mprPath{s,d} = [subStr '/raw/' mprDirs(d).name '/' mprDirs(d).name];
        system(['cp --parents ' mprPath{s,d} '.nii ' new], '-echo');
        system(['cp --parents ' mprPath{s,d} '.json ' new], '-echo');
        system(['cp --parents ' subStr '/raw/' mprDirs(d).name '/dicom-path.txt ' new], '-echo');
    end
end

% also copy field maps, mprage, and .json files using --parents in terminal