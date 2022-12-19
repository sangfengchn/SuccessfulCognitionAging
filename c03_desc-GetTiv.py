import os
import numpy as np

der = 'derivatives'

res = []
for i in os.listdir(der):
    for j in os.listdir(os.path.join(der, i)):
        tiv = np.loadtxt(os.path.join(der, i, j, 'TIV.txt'))
        res.append(f'{i},{j},{tiv[0]},{tiv[1]},{tiv[2]},{tiv[3]}\n')
        
with open('results_tiv.csv', 'w') as f:
    f.writelines(res)
