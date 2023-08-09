---
tags:
- text-generation
---
# Model Card for bt-opt-1.3b
 
 
# Model Details
 
## Model Description
  
- **Developed by:** Opentensor
- **Shared by [Optional]:** Hugging Face and Meta
- **Model type:** Text Generation
- **Language(s) (NLP):** More information needed
- **License:** More information needed
- **Related Models:**
  - **Parent Model:** OPT
- **Resources for more information:** 
    -  [Associated Paper](https://arxiv.org/abs/2205.01068)
 
# Uses
 
## Direct Use
 
This model can be used for the task of Text Generation
 
## Downstream Use [Optional]
 
In addition, the model can be fine-tuned on a downstream task using the [CLM example](https://github.com/huggingface/transformers/tree/main/examples/pytorch/language-modeling)
 
## Out-of-Scope Use
 
The model should not be used to intentionally create hostile or alienating environments for people.
 
# Bias, Risks, and Limitations
 
As mentioned in Meta AI's model card, given that the training data used for this model contains a lot of
unfiltered content from the internet, which is far from neutral the model is strongly biased : 
 
> Like other large language models for which the diversity (or lack thereof) of training
> data induces downstream impact on the quality of our model, OPT-175B has limitations in terms
> of bias and safety. OPT-175B can also have quality issues in terms of generation diversity and
> hallucination. In general, OPT-175B is not immune from the plethora of issues that plague modern
> large language models. 
 
See model [facebook/opt-1.3b model card](https://huggingface.co/facebook/opt-1.3b) for example biased predictions 
 
The model creators noted in the [associated paper](https://arxiv.org/pdf/2205.01068.pdf)
> we found OPT-175B does not work well with declarative instructions or point-blank interrogatives. Prompting with such instructions tends to produce a simulation of a dialogue beginning with such an instruction, rather than an execution of the instruction. Future work into instruction learning, in the vein of InstructGPT (Ouyang et al., 2022), may alleviate these limitations. OPT-175B also tends to be repetitive and can easily get stuck in a loop. 
 
 
## Recommendations
 
Users (both direct and downstream) should be made aware of the risks, biases and limitations of the model. More information needed for further recommendations.
 
 
# Training Details
 
## Training Data
 
The Meta AI team wanted to train this model on a corpus as large as possible. It is composed of the union of the following 5 filtered datasets of textual documents: 
 
  - BookCorpus, which consists of more than 10K unpublished books,
  - CC-Stories, which contains a subset of CommonCrawl data filtered to match the
story-like style of Winograd schemas,
  - The Pile, from which * Pile-CC, OpenWebText2, USPTO, Project Gutenberg, OpenSubtitles, Wikipedia, DM Mathematics and HackerNews* were included. 
  - Pushshift.io Reddit dataset that was developed in Baumgartner et al. (2020) and processed in
Roller et al. (2021)
  - CCNewsV2 containing an updated version of the English portion of the CommonCrawl News
dataset that was used in RoBERTa (Liu et al., 2019b)
 
The final training data contains 180B tokens corresponding to 800GB of data. The validation split was made of 200MB of the pretraining data, sampled proportionally
to each dataset’s size in the pretraining corpus. 
 
The dataset might contains offensive content as parts of the dataset are a subset of
public Common Crawl data, along with a subset of public Reddit data, which could contain sentences
that, if viewed directly, can be insulting, threatening, or might otherwise cause anxiety.
 
Alo see the dataset card in the [associated paper](https://arxiv.org/pdf/2205.01068.pdf).
 
## Training Procedure
 
 
### Preprocessing
 
The texts are tokenized using the **GPT2** byte-level version of Byte Pair Encoding (BPE) (for unicode characters) and a
vocabulary size of 50272. The inputs are sequences of 2048 consecutive tokens.
 
The 175B model was trained on 992 *80GB A100 GPUs*. The training duration was roughly ~33 days of continuous training
 
 
### Speeds, Sizes, Times
 
More information needed
 
# Evaluation
 
 
## Testing Data, Factors & Metrics
 
### Testing Data
 
More information needed
 
### Factors
 
 
### Metrics
 
More information needed
## Results 
 
More information needed
 
# Model Examination
 
More information needed
 
# Environmental Impact
 
 
Carbon emissions can be estimated using the [Machine Learning Impact calculator](https://mlco2.github.io/impact#compute) presented in [Lacoste et al. (2019)](https://arxiv.org/abs/1910.09700).
 
- **Hardware Type:** 992 *80GB A100 GPUs
- **Hours used:** 792 (~33 dyas)
- **Cloud Provider:** More information needed
- **Compute Region:** More information needed
- **Carbon Emitted:** More information needed
 
# Technical Specifications [optional]
 
## Model Architecture and Objective
 
OPTForCausalLM
 
## Compute Infrastructure
 
More information needed
 
### Hardware
 
More information needed
 
### Software
Transformers_version: 4.22.1
 
# Citation
 
 
**BibTeX:**
```bibtex
@misc{zhang2022opt,
      title={OPT: Open Pre-trained Transformer Language Models}, 
      author={Susan Zhang and Stephen Roller and Naman Goyal and Mikel Artetxe and Moya Chen and Shuohui Chen and Christopher Dewan and Mona Diab and Xian Li and Xi Victoria Lin and Todor Mihaylov and Myle Ott and Sam Shleifer and Kurt Shuster and Daniel Simig and Punit Singh Koura and Anjali Sridhar and Tianlu Wang and Luke Zettlemoyer},
      year={2022},
      eprint={2205.01068},
      archivePrefix={arXiv},
      primaryClass={cs.CL}
}
```
 
 
 
# Glossary [optional]
More information needed
 
# More Information [optional]
 
More information needed
 
# Model Card Authors [optional]
 
 
Opentensor in collaboration with Ezi Ozoani and the Hugging Face team
 
# Model Card Contact
 
More information needed
 
# How to Get Started with the Model
 
Use the code below to get started with the model.
 
<details>
<summary> Click to expand </summary>

```python
from transformers import AutoTokenizer, AutoModelForCausalLM
 
tokenizer = AutoTokenizer.from_pretrained("opentensor/bt-opt-1.3b")
 
model = AutoModelForCausalLM.from_pretrained("opentensor/bt-opt-1.3b")
 
```
</details>
 
