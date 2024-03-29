---
language: en
license: cc-by-nc-sa-4.0
tags:
- layoutlm
- document-classification
- pdf
- invoices
---

 # Model Card for LayoutLM for Document Classification
 
# Model Details
 
## Model Description
 
This is a fine-tuned version of the multi-modal LayoutLM model for the task of classification on documents. 
 
 
- **Developed by:** Impira team
- **Shared by [Optional]:** Hugging Face
- **Model type:** Text Classification
- **Language(s) (NLP):** en
- **License:** cc-by-nc-sa-4.0
- **Related Models:** layoutlm
  - **Parent Model:** More information needed
- **Resources for more information:** 
  - [Associated Paper](https://arxiv.org/abs/1912.13318) 
  - [Blog Post](https://www.impira.com/blog/introducing-instant-invoices)
 
# Uses
 
 
## Direct Use
 
Text Classification
 
## Downstream Use [Optional]
 
More information needed
 
## Out-of-Scope Use
 
The model should not be used to intentionally create hostile or alienating environments for people. 
# Bias, Risks, and Limitations
 
 
Significant research has explored bias and fairness issues with language models (see, e.g., [Sheng et al. (2021)](https://aclanthology.org/2021.acl-long.330.pdf) and [Bender et al. (2021)](https://dl.acm.org/doi/pdf/10.1145/3442188.3445922)). Predictions generated by the model may include disturbing and harmful stereotypes across protected classes; identity characteristics; and sensitive, social, and occupational groups.
 
 
## Recommendations
 
 
Users (both direct and downstream) should be made aware of the risks, biases and limitations of the model. More information needed for further recommendations.
 
 
# Training Details
 
## Training Data
 
More information needed
 
## Training Procedure
 
More information needed
 
### Preprocessing
 
More information needed
 
### Speeds, Sizes, Times
 
Num_attention_head: 12
Num_hidden_layer:12,
Vocab_size: 30522
 
# Evaluation
 
## Testing Data, Factors & Metrics
 
### Testing Data
 
More information needed
 
### Factors
More information needed
 
### Metrics
 
More information needed
 
## Results 
 
More information needed
 
# Model Examination
 
More information needed
 
# Environmental Impact
 
 
Carbon emissions can be estimated using the [Machine Learning Impact calculator](https://mlco2.github.io/impact#compute) presented in [Lacoste et al. (2019)](https://arxiv.org/abs/1910.09700).
 
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
 
More information needed
 
### Software
Transformers  version: 4.4.0.dev0

# Citation
 
 
**BibTeX:**
 
More information needed}
 
**APA:**
 
More information needed
 
# Glossary [optional]
 
More information needed
 
# More Information [optional]
 
More information needed
 
# Model Card Authors [optional]
Impira team in collaboration with Ezi Ozoani and the Hugging Face team.
 
# Model Card Contact
 
More information needed
 
# How to Get Started with the Model
 
Use the code below to get started with the model.
 
<details>
<summary> Click to expand </summary>

```python
from transformers import AutoTokenizer, AutoModelForSequenceClassification
 
tokenizer = AutoTokenizer.from_pretrained("impira/layoutlm-document-classifier")
 
model = AutoModelForSequenceClassification.from_pretrained("impira/layoutlm-document-classifier")
 
 ```
</details>
 
 
 

