---
language:
- en
license: mit
library_name: transformers
tags:
- legal-contract-review
- roberta
- cuad
datasets:
- cuad
pipeline_tag: question-answering
---
# Model Card for roberta-base-on-cuad
  
# Model Details
 
## Model Description
 
- **Developed by:** Mohammed Rakib
- **Shared by [Optional]:** More information needed
- **Model type:** Question Answering 
- **Language(s) (NLP):** en
- **License:** MIT
- **Related Models:**
  - **Parent Model:** RoBERTa 
- **Resources for more information:** 
    - GitHub Repo: [defactolaw](https://github.com/afra-tech/defactolaw)
    - Associated Paper: [An Open Source Contractual Language Understanding Application Using Machine Learning](https://aclanthology.org/2022.lateraisse-1.6/)
 
 
 
 
# Uses
 
 
## Direct Use
 
This model can be used for the task of  Question Answering  on Legal Documents.
 
# Training Details

Read: [An Open Source Contractual Language Understanding Application Using Machine Learning](https://aclanthology.org/2022.lateraisse-1.6/) 
for detailed information on training procedure, dataset preprocessing and evaluation.
 
## Training Data
 
See [CUAD dataset card](https://huggingface.co/datasets/cuad) for more information.
 
## Training Procedure


### Preprocessing
 
More information needed
 
### Speeds, Sizes, Times
 
More information needed
 
# Evaluation
 
 
## Testing Data, Factors & Metrics
 
### Testing Data
 
See [CUAD dataset card](https://huggingface.co/datasets/cuad) for more information.
 
### Factors
 
 
### Metrics
 
More information needed
## Results 
 
More information needed
 
# Model Examination
 
More information needed
  
- **Hardware Type:** More information needed
- **Hours used:** More information needed
- **Cloud Provider:** More information needed
- **Compute Region:** More information needed
- **Carbon Emitted:** More information needed
 
# Technical Specifications [optional]
 
## Model Architecture and Objective
 
More information needed
 
## Compute Infrastructure
 
More information needed
 
### Hardware
 
Used V100/P100 from Google Colab Pro
 
### Software

Python, Transformers
 
# Citation
 
 
**BibTeX:**
 ```
@inproceedings{nawar-etal-2022-open,
    title = "An Open Source Contractual Language Understanding Application Using Machine Learning",
    author = "Nawar, Afra  and
      Rakib, Mohammed  and
      Hai, Salma Abdul  and
      Haq, Sanaulla",
    booktitle = "Proceedings of the First Workshop on Language Technology and Resources for a Fair, Inclusive, and Safe Society within the 13th Language Resources and Evaluation Conference",
    month = jun,
    year = "2022",
    address = "Marseille, France",
    publisher = "European Language Resources Association",
    url = "https://aclanthology.org/2022.lateraisse-1.6",
    pages = "42--50",
    abstract = "Legal field is characterized by its exclusivity and non-transparency. Despite the frequency and relevance of legal dealings, legal documents like contracts remains elusive to non-legal professionals for the copious usage of legal jargon. There has been little advancement in making legal contracts more comprehensible. This paper presents how Machine Learning and NLP can be applied to solve this problem, further considering the challenges of applying ML to the high length of contract documents and training in a low resource environment. The largest open-source contract dataset so far, the Contract Understanding Atticus Dataset (CUAD) is utilized. Various pre-processing experiments and hyperparameter tuning have been carried out and we successfully managed to eclipse SOTA results presented for models in the CUAD dataset trained on RoBERTa-base. Our model, A-type-RoBERTa-base achieved an AUPR score of 46.6{\%} compared to 42.6{\%} on the original RoBERT-base. This model is utilized in our end to end contract understanding application which is able to take a contract and highlight the clauses a user is looking to find along with it{'}s descriptions to aid due diligence before signing. Alongside digital, i.e. searchable, contracts the system is capable of processing scanned, i.e. non-searchable, contracts using tesseract OCR. This application is aimed to not only make contract review a comprehensible process to non-legal professionals, but also to help lawyers and attorneys more efficiently review contracts.",
}
```
 
 
# Glossary [optional]
More information needed
 
# More Information [optional]
 
More information needed
 
# Model Card Authors [optional]
  
Mohammed Rakib in collaboration with Ezi Ozoani and the Hugging Face team
 
# Model Card Contact
 
More information needed
 
# How to Get Started with the Model
 
Use the code below to get started with the model.
 
<details>
<summary> Click to expand </summary>

```python
from transformers import AutoTokenizer, AutoModelForQuestionAnswering
 
tokenizer = AutoTokenizer.from_pretrained("Rakib/roberta-base-on-cuad")
 
model = AutoModelForQuestionAnswering.from_pretrained("Rakib/roberta-base-on-cuad")
```
</details>