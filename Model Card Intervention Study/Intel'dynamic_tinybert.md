---
tags:
- question-answering
- bert
license: apache-2.0
datasets:
- squad
language:
- en
model-index:
- name: dynamic-tinybert
  results: 
  - task:
      type: question-answering
      name: question-answering
    metrics:
    - type: f1
      value: 88.71

---

## Model Details: Dynamic-TinyBERT: Boost TinyBERT's Inference Efficiency by Dynamic Sequence Length

Dynamic-TinyBERT has been fine-tuned for the NLP task of question answering, trained on the SQuAD 1.1 dataset. [Guskin et al. (2021)](https://neurips2021-nlp.github.io/papers/16/CameraReady/Dynamic_TinyBERT_NLSP2021_camera_ready.pdf) note:

> Dynamic-TinyBERT is a TinyBERT model that utilizes sequence-length reduction and Hyperparameter Optimization for enhanced inference efficiency per any computational budget. Dynamic-TinyBERT is trained only once, performing on-par with BERT and achieving an accuracy-speedup trade-off superior to any other efficient approaches (up to 3.3x with <1% loss-drop).



| Model Detail | Description |
| ----------- | ----------- | 
| Model Authors - Company | Intel | 
| Model Card Authors | Intel in collaboration with Hugging Face | 
| Date | November 22, 2021 | 
| Version | 1 | 
| Type | NLP - Question Answering | 
| Architecture | "For our Dynamic-TinyBERT model we use the architecture of TinyBERT6L: a small BERT model with 6 layers, a hidden size of 768, a feed forward size of 3072 and 12 heads." [Guskin et al. (2021)](https://gyuwankim.github.io/publication/dynamic-tinybert/poster.pdf) |
| Paper or Other Resources | [Paper](https://neurips2021-nlp.github.io/papers/16/CameraReady/Dynamic_TinyBERT_NLSP2021_camera_ready.pdf); [Poster](https://gyuwankim.github.io/publication/dynamic-tinybert/poster.pdf); [GitHub Repo](https://github.com/IntelLabs/Model-Compression-Research-Package) | 
| License | Apache 2.0 |
| Questions or Comments | [Community Tab](https://huggingface.co/Intel/dynamic_tinybert/discussions) and [Intel Developers Discord](https://discord.gg/rv2Gp55UJQ)|

| Intended Use | Description |
| ----------- | ----------- | 
| Primary intended uses | You can use the model for the NLP task of question answering: given a corpus of text, you can ask it a question about that text, and it will find the answer in the text. | 
| Primary intended users | Anyone doing question answering | 
| Out-of-scope uses |  The model should not be used to intentionally create hostile or alienating environments for people.|

### How to use

Here is how to import this model in Python:

 <details>
<summary> Click to expand </summary>

```python
from transformers import AutoTokenizer, AutoModelForQuestionAnswering

tokenizer = AutoTokenizer.from_pretrained("Intel/dynamic_tinybert")

model = AutoModelForQuestionAnswering.from_pretrained("Intel/dynamic_tinybert")
 ```
</details>


| Factors | Description | 
| ----------- | ----------- | 
| Groups | Many Wikipedia articles with question and answer labels are contained in the training data | 
| Instrumentation | - |
| Environment | Training was completed on a Titan GPU. |
| Card Prompts | Model deployment on alternate hardware and software will change model performance |

| Metrics | Description | 
| ----------- | ----------- | 
| Model performance measures | F1 |
| Decision thresholds | - | 
| Approaches to uncertainty and variability | - | 

| Training and Evaluation Data | Description | 
| ----------- | ----------- | 
| Datasets | SQuAD1.1: "Stanford Question Answering Dataset (SQuAD) is a reading comprehension dataset, consisting of questions posed by crowdworkers on a set of Wikipedia articles, where the answer to every question is a segment of text, or span, from the corresponding reading passage, or the question might be unanswerable." (https://huggingface.co/datasets/squad)|
| Motivation | To build an efficient and accurate model for the question answering task. |
| Preprocessing | "We start with a pre-trained general-TinyBERT student, which was trained to learn the general knowledge of BERT using the general-distillation method presented by TinyBERT. We perform transformer distillation from a fine- tuned BERT teacher to the student, following the same training steps used in the original TinyBERT: (1) intermediate-layer distillation (ID) — learning the knowledge residing in the hidden states and attentions matrices, and (2) prediction-layer distillation (PD) — fitting the predictions of the teacher." ([Guskin et al., 2021](https://neurips2021-nlp.github.io/papers/16/CameraReady/Dynamic_TinyBERT_NLSP2021_camera_ready.pdf))| 

Model Performance Analysis:

| Model            | Max F1 (full model) | Best Speedup within BERT-1% |
|------------------|---------------------|-----------------------------|
| Dynamic-TinyBERT | 88.71               | 3.3x                        |

| Ethical Considerations | Description | 
| ----------- | ----------- | 
| Data | The training data come from Wikipedia articles |
| Human life | The model is not intended to inform decisions central to human life or flourishing. It is an aggregated set of labelled Wikipedia articles. | 
| Mitigations | No additional risk mitigation strategies were considered during model development. |
| Risks and harms | Significant research has explored bias and fairness issues with language models (see, e.g., [Sheng et al., 2021](https://aclanthology.org/2021.acl-long.330.pdf), and [Bender et al., 2021](https://dl.acm.org/doi/pdf/10.1145/3442188.3445922)). Predictions generated by the model may include disturbing and harmful stereotypes across protected classes; identity characteristics; and sensitive, social, and occupational groups. Beyond this, the extent of the risks involved by using the model remain unknown.|
| Use cases | - | 


| Caveats and Recommendations |
| ----------- | 
| Users (both direct and downstream) should be made aware of the risks, biases and limitations of the model. There are no additional caveats or recommendations for this model. |


### BibTeX entry and citation info
```bibtex
@misc{https://doi.org/10.48550/arxiv.2111.09645,
  doi = {10.48550/ARXIV.2111.09645},
  
  url = {https://arxiv.org/abs/2111.09645},
  
  author = {Guskin, Shira and Wasserblat, Moshe and Ding, Ke and Kim, Gyuwan},
  
  keywords = {Computation and Language (cs.CL), Machine Learning (cs.LG), FOS: Computer and information sciences, FOS: Computer and information sciences},
  
  title = {Dynamic-TinyBERT: Boost TinyBERT's Inference Efficiency by Dynamic Sequence Length},
  
  publisher = {arXiv},
  
  year = {2021},
```