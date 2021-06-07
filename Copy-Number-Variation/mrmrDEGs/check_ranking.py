import pandas as pd
import numpy as np

genes_appeareances = {}
for i in range(10):
    mrmrDEGs_LC_CNV_3classes_p0-001_m0-1_cov3_split9.txt
    mrmr_genes = pd.read_csv('mrmrDEGs_LC_CNV_3classes_p0-001_m0-1_cov3_split'+str(i)+'.txt', sep=' ')
    genes = mrmr_genes['x'].values[0:13]
    import pdb; pdb.set_trace()
