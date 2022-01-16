# Comparison of Fusion Methodologies Using CNV and RNA-Seq for Cancer Classification: A Case Study on Non-Small-Cell Lung Cancer

### *Francisco Carrillo-Perez, Juan Carlos Morales, Daniel Castillo-Secilla, Alberto Guillen, Ignacio Rojas and Luis Javier Herrera*

Implementation of the BIOMESIO 2021 conference paper [Comparison of Fusion Methodologies Using CNV and RNA-Seq for Cancer Classification: A Case Study on Non-Small-Cell Lung Cancer](https://doi.org/10.1007/978-3-030-88163-4_29)

![Early and intermediate fusion](https://assets.digitalocean.com/articles/alligator/boo.svg")

---
## Abstract

Lung cancer is one of the most frequent cancer types, and one among those causing more deceases worldwide. Nowadays, 
in order to improve the diagnosis of cancer more screenings are performed to the same patient and various biological 
sources are being gathered. Fusing the information provided by these sources can lead to a more robust diagnosis, 
which can improve the prognosis of the patient. In this work, a comparison of fusion methodologies (early and intermediate) 
using RNA-Seq and Copy Number Variation data for Non-Small-Cell Lung Cancer classification is performed. We found that great 
results can be attained using both fusion methodologies, with an AUC of 0.984 for the early fusion and 0.989 for the intermediate 
fusion, improving those obtained by each source of information independently (0.978 RNA-Seq and 0.910 Copy Number Variation). 
This work shows that fusion methodologies can enhance the classification of non-small-cell lung cancer, and that these methodologies 
can be promising for the diagnosis of other cancer types.

 
---


## Implementation

Code can be found in the notebooks folder:

- **[early_fusion.ipynb]** -- code for the early fusion of the sources.
- **[intermediate_fusion.ipynb]** -- code for the intermediate fusion of the sources.


---

## Citation

If you find this work useful, please cite as follows:

```
Carrillo-Perez, F., Morales, J. C., Castillo-Secilla, D., Guillen, A., Rojas, I., & Herrera, L. J. (2021, July). Comparison of Fusion Methodologies Using CNV and RNA-Seq for Cancer Classification: A Case Study on Non-Small-Cell Lung Cancer. In International Conference on Bioengineering and Biomedical Signal and Image Processing (pp. 339-349). Springer, Cham.
```

```
@inproceedings{carrillo2021comparison,
  title={Comparison of Fusion Methodologies Using CNV and RNA-Seq for Cancer Classification: A Case Study on Non-Small-Cell Lung Cancer},
  author={Carrillo-Perez, Francisco and Morales, Juan Carlos and Castillo-Secilla, Daniel and Guillen, Alberto and Rojas, Ignacio and Herrera, Luis Javier},
  booktitle={International Conference on Bioengineering and Biomedical Signal and Image Processing},
  pages={339--349},
  year={2021},
  organization={Springer}
}
```
