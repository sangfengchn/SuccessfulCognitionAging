import os
import shutil
import pandas as pd

src = 'sourcedata/SCA_supplement'
raw = 'rawdata/SCA_supplement'
df = pd.read_csv(os.path.join(src, 'names.csv'), header=0, delimiter='\t')
for i in df.index.values:
    filename = df.loc[i, 'FILENAME']
    subid = df.loc[i, 'SUBID']
    if not os.path.exists(os.path.join(raw, subid)):
        os.makedirs(os.path.join(raw, subid))
    shutil.copy(os.path.join(src, filename), os.path.join(raw, subid, 'anat.nii'))
