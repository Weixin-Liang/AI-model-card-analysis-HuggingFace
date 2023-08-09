---
tags:
- pegasus
---
# Model Card for brio-xsum-cased
 
 
# Model Details
 
## Model Description
 
BRIO: Bringing Order to Abstractive Summarization
 
- **Developed by:** Yale LILY Lab
- **Shared by [Optional]:** Hugging Face
- **Model type:** PEGASUS
- **Language(s) (NLP):** Text2Text Generation
- **License:** More information needed
- **Related Models:** 
  - **Parent Model:** PEGASUS
- **Resources for more information:** 
  - [Github Repo](https://github.com/Yale-LILY/BRIO)
  - [Associated Paper](https://arxiv.org/abs/2203.16804)
  - [Associated Space](https://huggingface.co/spaces/darveen/text_summarizer)
 
 
# Uses
 
## Direct Use
This model can be used for the task of Text2Text Generation
 
## Downstream Use [Optional]
 
The model creators note in the [associated paper](https://arxiv.org/abs/2203.16804)
> It is possible to apply our method in a reinforcement learning setting, where the candidate summaries are dynamically generated. 
 
## Out-of-Scope Use
 
 
The model should not be used to intentionally create hostile or alienating environments for people. 
 
# Bias, Risks, and Limitations
 
 
Significant research has explored bias and fairness issues with language models (see, e.g., [Sheng et al. (2021)](https://aclanthology.org/2021.acl-long.330.pdf) and [Bender et al. (2021)](https://dl.acm.org/doi/pdf/10.1145/3442188.3445922)). Predictions generated by the model may include disturbing and harmful stereotypes across protected classes; identity characteristics; and sensitive, social, and occupational groups.
 
 
## Recommendations
 
 
Users (both direct and downstream) should be made aware of the risks, biases and limitations of the model. More information needed for further recommendations.
 
 
# Training Details
 
## Training Data
The model creators note in the [associated paper](https://arxiv.org/abs/2203.16804)
> CNNDM4: is a large scale news dataset.
Nallapati et al: we treat the news articles as the source documents and the associated highlights as the summaries. 
XSum5: is a highly abstractive dataset of articles from the British Broadcasting Corporation (BBC). NYT6: contains articles from the New York Times and the associated summaries
 
## Training Procedure
 
 
### Preprocessing
 The model creators note in the [associated paper](https://arxiv.org/abs/2203.16804)
 > We follow Kedzie et al. (2018) for data preprocessing and splitting, and use the associated archival abstracts as the summaries
 
### Speeds, Sizes, Times
 
More information needed
 
# Evaluation
 
 
## Testing Data, Factors & Metrics
 
### Testing Data
 
More information needed
 
### Factors
 
More information needed
 
### Metrics
 
More information needed
 
## Results 
 

 
### CNNDM
|          | ROUGE-1 | ROUGE-2 | ROUGE-L |
|----------|---------|---------|---------|
| BART     | 44.16   | 21.28   | 40.90   |
| Ours     | 47.78   | 23.55   | 44.57   |

 
### XSum
|          | ROUGE-1 | ROUGE-2 | ROUGE-L |
|----------|---------|---------|---------|
| Pegasus  | 47.21   | 24.56   | 39.25   |
| Ours     | 49.07   | 25.59   | 40.40   |

 
### NYT
|          | ROUGE-1 | ROUGE-2 | ROUGE-L |
|----------|---------|---------|---------|
| BART     | 55.78   | 36.61   | 52.60   |
| Ours     | 57.75   | 38.64   | 54.54   |

 
 
# Model Examination
The model creators note in the [associated paper](https://arxiv.org/abs/2203.16804)
We attribute BRIO-Ctr’s superior performance to its use of the same model architecture (BART) for both candidate generation and scoring, while SimCLS uses RoBERTa as the evaluation model. As a result, BRIO-Ctr maximizes the parameter sharing between the two stages, and preserves the power of the Seq2Seq model pre-trained on the same dataset.
 
# Environmental Impact
 
 
Carbon emissions can be estimated using the [Machine Learning Impact calculator](https://mlco2.github.io/impact#compute) presented in [Lacoste et al. (2019)](https://arxiv.org/abs/1910.09700).
 
- **Hardware Type:** More information needed
- **Hours used:** More information needed
- **Cloud Provider:** More information needed
- **Compute Region:** More information needed
- **Carbon Emitted:** More information needed
 
# Technical Specifications [optional]
 
## Model Architecture and Objective
The model creators note in the [associated paper](https://arxiv.org/abs/2203.16804)
 
> Formulate summarization as a sequence-to-sequence (Seq2Seq) problem
 
## Compute Infrastructure
 
More information needed
 
### Hardware
 
More information needed
 
### Software
 
More information needed
 
# Citation
 
 
**BibTeX:**
 ```
@misc{https://doi.org/10.48550/arxiv.2203.16804,
  doi = {10.48550/ARXIV.2203.16804},
  
  url = {https://arxiv.org/abs/2203.16804},
  
  author = {Liu, Yixin and Liu, Pengfei and Radev, Dragomir and Neubig, Graham},
  
  keywords = {Computation and Language (cs.CL), FOS: Computer and information sciences, FOS: Computer and information sciences},
  
  title = {BRIO: Bringing Order to Abstractive Summarization},
```
 
 
 
# Glossary [optional]
 
More information needed
 
# More Information [optional]
 
More information needed
 
# Model Card Authors [optional]
 
Yale LILY Lab in collaboration with Ezi Ozoani and the Hugging Face team
 
# Model Card Contact
 
More information needed
 
# How to Get Started with the Model
 
Use the code below to get started with the model.
 
<details>
<summary> Click to expand </summary>

```python
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
 
tokenizer = AutoTokenizer.from_pretrained("Yale-LILY/brio-xsum-cased")
 
model = AutoModelForSeq2SeqLM.from_pretrained("Yale-LILY/brio-xsum-cased")
 
```
</details>