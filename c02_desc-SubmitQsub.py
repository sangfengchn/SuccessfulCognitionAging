'''
 # @ Author: feng
 # @ Create Time: 2022-08-12 09:50:01
 # @ Modified by: feng
 # @ Modified time: 2022-08-12 10:08:48
 # @ Description: submit job for each image.
 '''
import os
from os.path import join as opj
from glob import glob
import time
import re
import subprocess
import logging
logging.basicConfig(
    format='%(asctime)s: %(message)s',
    level=logging.INFO
)

def func_jobNumber(server='zhang'):
    cli = f'qstat | grep {server}'
    resCli = os.popen(cli).readlines()
    return len(resCli)

def func_jobIsExists(subId):
    cli = f'qstat | grep {subId}'
    resCli = os.popen(cli).readlines()
    if len(resCli) == 0:
        return False
    else:
        return True
    
def submit(jobName, tmpPath, rawdata, subId):
    templateScript = [
        '#! /bin/bash\n',
        f'#PBS -N {jobName}\n',
        '#PBS -l nodes=1:ppn=8\n',
        '#PBS -q zhang\n',
        f'#PBS -o {tmpPath}/preprocessing.log\n',
        f'#PBS -e {tmpPath}/preprocessing.err\n',
        '#PBS -V\n',
        'set -ex\n',
        'export PATH=/opt/software/singularity-2.4.6-20190826/bin:$PATH\n',
        'proj=/brain/babri_in/Desktop/S_task-forYiru\n',
        f'rawdata={rawdata}\n',
        f'subId={subId}\n',
        'SENV_MATLAB=/brain/babri_in/sangf/Envs/matlab-r2020a.simg\n',
        'cd $rawdata/$subId\n',
        '''singularity exec -e $SENV_MATLAB matlab -batch "addpath('${proj}/utils'); sfSegment('anat.nii', '$proj/spm12'); exit;"\n''',
        'echo "Done."\n'
    ]
    templateScript = ''.join(templateScript)
    try:
        p = subprocess.run('qsub', input=templateScript, encoding='utf-8', shell=True, check=True, stdout=subprocess.PIPE)
        logging.info(p.stdout)
    except subprocess.CalledProcessError as err:
        logging.error('Error: ', err)

if __name__ == '__main__':
    proj = '/brain/babri_in/Desktop/S_task-forYiru'
    rawdata = opj(proj, 'rawdata', 'SCA_supplement')
    
    jobNumMax = 500
    # for each image
    for i in glob(opj(rawdata, 'ADNI*')):
        subId = os.path.split(i)[-1]
        logging.info(subId)
    
        while func_jobNumber() >= jobNumMax:
            time.sleep(5)
        
        subLogPath = opj(rawdata, subId, 'log')
        if not os.path.exists(subLogPath):
            os.makedirs(subLogPath)
        
        # subJobName = 'sf_' + subId
        subJobName = subId[5:14]
        logging.info(subJobName)
        if func_jobIsExists(subJobName) or os.path.exists(opj(rawdata, subId, 'TIV.txt')):
            continue
        
        submit(jobName=subJobName,
               tmpPath=subLogPath,
               rawdata=rawdata,
               subId=subId)
        time.sleep(2)

