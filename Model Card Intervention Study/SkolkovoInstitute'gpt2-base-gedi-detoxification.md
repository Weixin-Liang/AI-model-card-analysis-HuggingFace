---
language:
- en
tags:
- text-generation
- conditional-text-generation
---
# Model Details
 

This is a conditional language model based on [gpt2-medium](https://huggingface.co/gpt2-medium/) but with a vocabulary from [t5-base](https://huggingface.co/t5-base), for compatibility with T5-based paraphrasers such as [t5-paranmt-detox](https://huggingface.co/SkolkovoInstitute/t5-paranmt-detox). The model is conditional on two styles, `toxic` and `normal`, and was fine-tuned on the dataset from the Jigsaw [toxic comment classification challenge](https://www.kaggle.com/c/jigsaw-toxic-comment-classification-challenge).

The model was trained for the paper [Text Detoxification using Large Pre-trained Neural Models](https://arxiv.org/abs/2109.08914) (Dale et al, 2021) that describes its possible usage in more detail. 

An example of its use and the code for its training is given in https://github.com/skoltech-nlp/detox. 


## Model Description
 
- **Developed by:** SkolkovoInstitute
- **Model type:** Conditional Text Generation
- **Language:** English
- **Related Models:**
  - **Parent Model:** [gpt2-medium](https://huggingface.co/gpt2-medium/)
  - **Source of vocabulary:** [t5-base](https://huggingface.co/t5-base)
- **Resources for more information:** 
  - The paper [Text Detoxification using Large Pre-trained Neural Models](https://arxiv.org/abs/2109.08914)
  - Its repository https://github.com/skoltech-nlp/detox. 
 
# Uses

The model is intended for usage as a discriminator in a text detoxification pipeline using the ParaGeDi approach (see [the paper](https://arxiv.org/abs/2109.08914) for more details). It can also be used for text generation conditional on toxic or non-toxic style, but  we do not know how to condition it on the things other than toxicity, so we do not recommend this usage. Another possible use is as a toxicity classifier (using the Bayes rule), but the model is not expected to perform better than e.g. a BERT-based standard classifier.

# Bias, Risks, and Limitations
The model inherits all the risks of its parent model, [gpt2-medium](https://huggingface.co/gpt2-medium/). It also inherits all the biases of the [Jigsaw dataset](https://www.kaggle.com/c/jigsaw-toxic-comment-classification-challenge) on which it was fine-tuned. The model is intended to be conditional on style, but in fact it does not clearly separate the concepts of style and content, so it might regard some texts as toxic or safe based not on the style, but on their topics or keywords. 

# Training Details
See the paper [Text Detoxification using Large Pre-trained Neural Models](https://arxiv.org/abs/2109.08914) and [the associated code](https://github.com/s-nlp/detox/tree/main/emnlp2021/style_transfer/paraGeDi).

# Evaluation
The model has not been evaluated on its own, only as a part as a ParaGeDi text detoxification pipeline (see [the paper](https://arxiv.org/abs/2109.08914)).

# Citation
**BibTeX:**
 ```
@inproceedings{dale-etal-2021-text,
    title = "Text Detoxification using Large Pre-trained Neural Models",
    author = "Dale, David  and
      Voronov, Anton  and
      Dementieva, Daryna  and
      Logacheva, Varvara  and
      Kozlova, Olga  and
      Semenov, Nikita  and
      Panchenko, Alexander",
    booktitle = "Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing",
    month = nov,
    year = "2021",
    address = "Online and Punta Cana, Dominican Republic",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2021.emnlp-main.629",
    pages = "7979--7996",
}
```
