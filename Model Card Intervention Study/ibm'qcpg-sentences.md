---
license: apache-2.0
tags:
- text-2-text-generation
- t5
- augmentation
- paraphrase
- paraphrasing
---

# Model Card for qcpg-sentences  
 
# Model Details

# Quality Controlled Paraphrase Generation (ACL 2022)
> Paraphrase generation has been widely used in various downstream tasks. Most tasks benefit mainly from high quality paraphrases, namely those that are semantically similar to, yet linguistically diverse from, the original sentence. Generating high-quality paraphrases is challenging as it becomes increasingly hard to preserve meaning as linguistic diversity increases. Recent works achieve nice results by controlling specific aspects of the paraphrase, such as its syntactic tree. However, they do not allow to directly control the quality of the generated paraphrase, and suffer from low flexibility and scalability. 

<img src="https://github.com/IBM/quality-controlled-paraphrase-generation/raw/main/assets/images/ilus.jpg" width="40%"> 

> Here we propose `QCPG`, a quality-guided controlled paraphrase generation model, that allows directly controlling the quality dimensions. Furthermore, we suggest a method that given a sentence, identifies points in the quality control space that are expected to yield optimal generated paraphrases. We show that our method is able to generate paraphrases which maintain the original meaning while achieving higher diversity than the uncontrolled baseline.

## Training, Evaluation and Inference
The code for training, evaluation and inference for both `QCPG` and `QP` is located in the dedicated directories.  Scripts necassery for reproducing the experiments can be found in the `QCPG/scripts`, `QP/scripts` directories. 

Make sure to run `QCPG/scripts/prepare_data.sh` and set the missing datasets directories accordingly before training!

<img src="https://github.com/IBM/quality-controlled-paraphrase-generation/raw/main/assets/images/arch.png" width="90%"> 

## Trained Models

```
!!! Notice !!! Our results show that on avarage QCPG is follwing the quality conditions and capable of generating higher quality greedy-sampled paraphrases then finetuned model. It does not mean it will output perfect paraphrases all the time!!! In practice, for best preformence, we highly reccomend: (1) Find the right quality control values (2) Use more sophisticated sampling methods (3) Apply post-generation monitoring and filtering. 
```


[`qcpg-questions`](https://huggingface.co/ibm/qcpg-questions) (Trained on `data/wikians`)

[`qcpg-sentences`](https://huggingface.co/ibm/qcpg-sentences) (Trained on `data/parabk2`)

[`qcpg-captions`](https://huggingface.co/ibm/qcpg-captions) (Trained on `data/mscoco`)

## Usage

The best way to use the model is with the following code:
```python
from transformers import pipeline

class QualityControlPipeline:
    
    def __init__(self, type):
        assert type in ['captions', 'questions', 'sentences']
        self.pipe = pipeline('text2text-generation', model=f'ibm/qcpg-{type}')
        self.ranges = {
            'captions': {'lex': [0, 90], 'syn': [0, 80], 'sem': [0, 95]},
            'sentences': {'lex': [0, 100], 'syn': [0, 80], 'sem': [0, 95]},
            'questions': {'lex': [0, 90], 'syn': [0, 75], 'sem': [0, 95]}
        }[type]

    def __call__(self, text, lexical, syntactic, semantic, **kwargs):
        assert all([0 <= val <= 1 for val in [lexical, syntactic, semantic]]), \
                 f' control values must be between 0 and 1, got {lexical}, {syntactic}, {semantic}'
        names = ['semantic_sim', 'lexical_div', 'syntactic_div']
        control = [int(5 * round(val * 100 / 5)) for val in [semantic, lexical, syntactic]]
        control ={name: max(min(val , self.ranges[name[:3]][1]), self.ranges[name[:3]][0]) for name, val in zip(names, control)}
        control = [f'COND_{name.upper()}_{control[name]}' for name in names]
        assert all(cond in self.pipe.tokenizer.additional_special_tokens for cond in control)
        text = ' '.join(control) + text if isinstance(text, str) else [' '.join(control) for t in text]
        return self.pipe(text, **kwargs)
```

Loading:
```python
model = QualityControlPipeline('sentences')
```

Generation with quality controlls:
```python
model('Is this going to work or what are we doing here?', lexical=0.3, syntactic=0.5, semantic=0.8)
```
Output: `[{'generated_text': "Will it work or what is it we're doing?"}]`
    
    
## Citation
```
@inproceedings{bandel-etal-2022-quality,
    title = "Quality Controlled Paraphrase Generation",
    author = "Bandel, Elron  and
      Aharonov, Ranit  and
      Shmueli-Scheuer, Michal  and
      Shnayderman, Ilya  and
      Slonim, Noam  and
      Ein-Dor, Liat",
    booktitle = "Proceedings of the 60th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers)",
    month = may,
    year = "2022",
    address = "Dublin, Ireland",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2022.acl-long.45",
    pages = "596--609",
    abstract = "Paraphrase generation has been widely used in various downstream tasks. Most tasks benefit mainly from high quality paraphrases, namely those that are semantically similar to, yet linguistically diverse from, the original sentence. Generating high-quality paraphrases is challenging as it becomes increasingly hard to preserve meaning as linguistic diversity increases. Recent works achieve nice results by controlling specific aspects of the paraphrase, such as its syntactic tree. However, they do not allow to directly control the quality of the generated paraphrase, and suffer from low flexibility and scalability. Here we propose QCPG, a quality-guided controlled paraphrase generation model, that allows directly controlling the quality dimensions. Furthermore, we suggest a method that given a sentence, identifies points in the quality control space that are expected to yield optimal generated paraphrases. We show that our method is able to generate paraphrases which maintain the original meaning while achieving higher diversity than the uncontrolled baseline. The models, the code, and the data can be found in https://github.com/IBM/quality-controlled-paraphrase-generation.",
}
```
 
## Model Description
The model creators note in the [associated paper](https://arxiv.org/pdf/2203.10940.pdf):
>Here we propose QCPG, a quality-guided controlled paraphrase generation model, that allows directly controlling the quality dimensions. Furthermore, we suggest a method that given a sentence, identifies points in the quality control space that are expected to yield optimal generated paraphrases. We show that our method is able to generate paraphrases which maintain the original meaning while achieving higher diversity than the uncontrolled baseline.
 
- **Developed by:** IBM
- **Shared by [Optional]:** IBM

- **Model type:** Text2Text Generation
- **Language(s) (NLP):** More information needed
- **License:** More information needed
- **Parent Model:** [All T5 Checkpoints](https://huggingface.co/models?search=t5)
- **Resources for more information:** 
  - [GitHub Repo](https://github.com/IBM/quality-controlled-paraphrase-generation)
   - [Associated Paper](https://arxiv.org/pdf/2203.10940.pdf)


# Uses
 

## Direct Use
This model can be used for the task of Text2Text generation. 
 
## Downstream Use [Optional]
 
More information needed.
 
## Out-of-Scope Use
 
The model should not be used to intentionally create hostile or alienating environments for people. 
 
# Bias, Risks, and Limitations
 
 
Significant research has explored bias and fairness issues with language models (see, e.g., [Sheng et al. (2021)](https://aclanthology.org/2021.acl-long.330.pdf) and [Bender et al. (2021)](https://dl.acm.org/doi/pdf/10.1145/3442188.3445922)). Predictions generated by the model may include disturbing and harmful stereotypes across protected classes; identity characteristics; and sensitive, social, and occupational groups.



## Recommendations
 
 
Users (both direct and downstream) should be made aware of the risks, biases and limitations of the model. More information needed for further recommendations.

# Training Details
 
## Training Data
 
The model creators note in the [associated paper](https://arxiv.org/pdf/2203.10940.pdf):
> These datasets are large but noisy, and contain only a relatively small amount of high quality paraphrases.
*MSCOCO:* This dataset consists of 123K im- ages, where each image contains at most five human-labeled captions (Lin et al., 2014). Similar to previous works we consider different captions of the same image as paraphrases.
*WikiAnswers (WikiAns for short):* The WikiAnswers corpus contains clusters of ques- tions tagged by wiki-answers.com users as similar. There are 30, 370, 994 clusters with 25 question in each on average. In total, the corpus contains over 70 million question pairs 
*ParaBank2.0:* A dataset containing clusters of sentential paraphrases, produced from a bilingual corpus using negative constraints, inference sam- pling, and clustering. The dataset is composed of avarage of 5 paraphrases in every cluster and close to 100 million pairs in total.
 
 
## Training Procedure

 
### Preprocessing
 
The model creators note in the [associated paper](https://arxiv.org/pdf/2203.10940.pdf):
> To get comparable results across all datasets, we randomly sub-sampled ParaBank2.0 and WikiAns to the same size as MSCOCO, and split them to train, dev and test sets, of sizes 900K, 14K and 14K respectively. We carefully made sure that there are no pairs from the same cluster in differ- ent splits of the data. 
 


 
### Speeds, Sizes, Times
 
The model creators note in the [associated paper](https://arxiv.org/pdf/2203.10940.pdf):
> All models are trained with batch size of 32 on 2 NVIDIA A100 GPUs for 6 epochs. 
 
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
 
- **Hardware Type:** 2 NVIDIA A100 
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
 
More information needed.
 
# Citation

 
**BibTeX:**
 
More information needed
```bibtex
@inproceedings{bandel-etal-2022-quality,
    title = "Quality Controlled Paraphrase Generation",
    author = "Bandel, Elron  and
      Aharonov, Ranit  and
      Shmueli-Scheuer, Michal  and
      Shnayderman, Ilya  and
      Slonim, Noam  and
      Ein-Dor, Liat",
    booktitle = "Proceedings of the 60th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers)",
    month = may,
    year = "2022",
    address = "Dublin, Ireland",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2022.acl-long.45",
    pages = "596--609",
    abstract = "Paraphrase generation has been widely used in various downstream tasks. Most tasks benefit mainly from high quality paraphrases, namely those that are semantically similar to, yet linguistically diverse from, the original sentence. Generating high-quality paraphrases is challenging as it becomes increasingly hard to preserve meaning as linguistic diversity increases. Recent works achieve nice results by controlling specific aspects of the paraphrase, such as its syntactic tree. However, they do not allow to directly control the quality of the generated paraphrase, and suffer from low flexibility and scalability. Here we propose QCPG, a quality-guided controlled paraphrase generation model, that allows directly controlling the quality dimensions. Furthermore, we suggest a method that given a sentence, identifies points in the quality control space that are expected to yield optimal generated paraphrases. We show that our method is able to generate paraphrases which maintain the original meaning while achieving higher diversity than the uncontrolled baseline. The models, the code, and the data can be found in https://github.com/IBM/quality-controlled-paraphrase-generation.",
}
 
```



**APA:**

More information needed
  
# Glossary [optional]
 
More information needed

# More Information [optional]
More information needed 

# Model Card Authors [optional]
 
IBM  in collaboration with Ezi Ozoani and the Hugging Face team

# Model Card Contact
 
More information needed
 
# How to Get Started with the Model
 
Use the code below to get started with the model.
 
<details>
<summary> Click to expand </summary>

```python
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM

tokenizer = AutoTokenizer.from_pretrained("ibm/qcpg-sentences")

model = AutoModelForSeq2SeqLM.from_pretrained("ibm/qcpg-sentences")

 
 ```
</details>