---
{}
---
This model provides a MobileBERT [(Sun et al., 2020)](https://arxiv.org/abs/2004.02984) fine-tuned on the SST data with three sentiments (0 -- negative, 1 -- neutral, and 2 -- positive). 

## Example Usage

Below, we provide illustrations on how to use this model to make sentiment predictions. 


```python
import torch
from transformers import AutoTokenizer, AutoConfig, MobileBertForSequenceClassification
# load model
model_name = r'cambridgeltl/sst_mobilebert-uncased'
tokenizer = AutoTokenizer.from_pretrained(model_name)
config = AutoConfig.from_pretrained(model_name)
model = MobileBertForSequenceClassification.from_pretrained(model_name, config=config)
model.eval()
'''
    labels: 
        0 -- negative
        1 -- neutral
        2 -- positive
'''

# prepare exemplar sentences
batch_sentences = [
    "in his first stab at the form , jacquot takes a slightly anarchic approach that works only sporadically .",
    "a valueless kiddie paean to pro basketball underwritten by the nba .",
    "a very well-made , funny and entertaining picture .",
]

# prepare input
inputs = tokenizer(batch_sentences, max_length=256, truncation=True, padding=True, return_tensors='pt')
input_ids, attention_mask = inputs.input_ids, inputs.attention_mask

# make predictions
outputs = model(input_ids=input_ids, attention_mask=attention_mask)
predictions = torch.argmax(outputs.logits, dim = -1)
print (predictions)
# tensor([1, 0, 2])
``` 

## Citation:
If you find this model useful, please kindly cite our model as

```bibtex
@misc{susstmobilebert,
  author = {Su, Yixuan},
  title = {A MobileBERT Fine-tuned on SST},
  howpublished = {\url{https://huggingface.co/cambridgeltl/sst_mobilebert-uncased}},
  year = 2022
}
```